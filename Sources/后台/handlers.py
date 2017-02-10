# -*- coding: utf-8 -*-

__author__ = 'West'

' url handlers '

import re, time, json, logging, hashlib, base64, asyncio, orm
from config import configs
from apis import APIValueError, APIError, APIResourceNotFoundError

from aiohttp import web
from coroweb import get, post
from models import User, Message, PersonalInfo, DormRepair, Community, CommunityInfo, CampusNews
from models import dict2PersonalInfo
from educationsystem import EducationSystem

COOKIE_NAME = 'appsession'
COOKIE_KEY = configs.session.secret

# 登录教务系统的学生列表
LoginESList = {}

# 生成SHA1密码
def password_transfrom(username, password):
    salt = "WeSt"  # 加盐
    sha1_password = '%s:%s:%s' % (username, password, salt)  # SHA1密码
    result = hashlib.sha1(sha1_password.encode('utf-8')).hexdigest()
    return result

# 根据用户信息生成cookie
def user2cookie(user, max_age):
    expires = str(int(time.time() + max_age))
    s = '%s-%s-%s-%s' % (user.name, user.password, expires, COOKIE_KEY)
    L = [user.name, expires, hashlib.sha1(s.encode('utf-8')).hexdigest()]
    return '-'.join(L)

# 根据cookie生成User实例
@asyncio.coroutine
def cookie2user(cookie_str):
    if not cookie_str:
        return None
    try:
        L = cookie_str.split('-')
        if len(L) != 3:
            return None
        uname, expires, sha1 = L
        if int(expires) < time.time():
            return None
        # 判断用户是否存在，防止伪造
        user = yield from User.find(uname)
        if user is None:
            return None
        s = '%s-%s-%s-%s' % (uname, user.password, expires, COOKIE_KEY)
        if sha1 != hashlib.sha1(s.encode('utf-8')).hexdigest():
            logging.info('invalid sha1')
            return None
        user.password = "*******"
        return user
    except Exception as e:
        logging.exception(e)
        return None

# 测试连通性
@get('/')
async def index(request):
    print('测试连通性')
    return 10

_RE_NAME = re.compile(r'[0-9a-zA-Z]{1,32}')
_RE_PSW = re.compile(r'[0-9a-zA-Z]{8,32}')

# APP模块
# ----------------------------------------------------------------
# 注册
def register_response(status, message):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    body = json.dumps(msg, default = Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

@post('/register')
def register(*, username, password):
    print('注册')
    print(username)
    print(password)

    # 判断用户名的合法性
    if not username or not _RE_NAME.match(username) or len(username) > 32:
        return register_response('2', '用户名不符合要求')
    # 判断密码的合法性
    if not password or not _RE_PSW.match(password) or len(username) > 32:
        return register_response('2', '密码不符合要求')
    # 判断用户是否已经存在
    users = yield from User.findAll('name=?', [username])
    if len(users) > 0:
        return register_response('1', '用户名已存在')
    # 将用户信息保存到数据库
    usr = User(name=username, password=password_transfrom(username, password))
    yield from usr.save()
    perInfo = PersonalInfo(username = username, nickname = username,
    signature='',sex='',telephone='',faculty='',specialty='',grade='',dormitory='')
    yield from perInfo.save()
    return register_response('0', '成功')

# 登录
# 登录应答
def login_response(status, message):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    body = json.dumps(msg, default = Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

@post('/login')
def login(*, username, password):
    print('登录')
    print(username)
    print(password)

    # 判断用户名是否存在
    if not username or not _RE_NAME.match(username) or len(username) > 32:
        return login_response('1', '用户名错误')
    users = yield from User.findAll('name=?', [username])
    if len(users) == 0:
        return login_response('1', '用户名错误')
    # 判断密码是否正确
    if users[0].password == password_transfrom(username, password):
        resp = web.Response()
        resp.set_cookie(COOKIE_NAME, user2cookie(users[0], 604800), max_age=604800, httponly=True)
        resp.content_type = 'application/json'
        msg = Message('0', '成功登录')
        body = json.dumps(msg, default=Message.Message2Dict)
        resp.body = body.encode('utf-8')
        return resp
    else:
        return login_response('1','密码错误')
# ----------------------------------------------------------------


# 教务系统模块
# ----------------------------------------------------------------
# 登录教务系统
def login_es_response(status, message):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    body = json.dumps(msg, default=Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

_RE_STUDENTID = re.compile(r'[0-9]{10}')
@post('/educationSystem/login')
def login_education_system(*, id, password):
    print('登录教务系统')
    print(id)
    print(password)

    global LoginESList
    # 判断学号是否正确
    if not id or not _RE_STUDENTID.match(id):
        return login_es_response('1','学号不正确')
    # 判断密码是否正确
    if not password:
        return login_es_response('2', '密码不正确')
    # 通过正方教务系统进行登录
    es = EducationSystem()
    state = es.login(id, password)
    if state == 0:
        LoginESList[es.userID] = es      # 成功登录，将学生加入已登录教务系统列表中
        return login_es_response('0', '成功登录教务系统')
    elif state == 1:
        return login_es_response('1', '学号不正确')
    elif state == 3:
        return login_es_response('2', '密码不正确')
    elif state == 4:
        return login_es_response('3', '教务系统奔溃')

# 学生考试时间查询
def exam_time_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['examtime'] = result
    body = json.dumps(r)
    resp.body = body.encode('utf-8')
    return resp

@post('/educationSystem/examtime')
def get_examtime(*, id):
    global LoginESList
    print('查询考试时间')

    if not id or not _RE_STUDENTID.match(id):
        return exam_time_response('1', '查询失败', '')
    if id in LoginESList:
        es = LoginESList[id]
        result = es.searchExamTime()
        return exam_time_response('0', '查询成功', result)
    else:
        return exam_time_response('2', '学号未登录', '')

# 等级考试查询
def grade_exam_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['gradeexam'] = result
    body = json.dumps(r)
    resp.body = body.encode('utf-8')
    return resp

@post('/educationSystem/gradeExam')
def get_grade_exam(*, id):
    global LoginESList
    print('等级考试成绩')
    print(id)
    if not id or not _RE_STUDENTID.match(id):
        return grade_exam_response('1', '查询失败', '')
    if id in LoginESList:
        es = LoginESList[id]
        result = es.searchGradeExam()
        return grade_exam_response('0', '查询成功', result)
    else:
        return grade_exam_response('2', '学号未登录', '')

# 学生个人课表
def course_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['courses'] = result
    body = json.dumps(r)
    resp.body = body.encode('utf-8')
    return resp

@post('/educationSystem/courses')
def get_course(*, id, schoolyear, semester):
    global LoginESList
    print('个人课表')
    print(id)
    if not id or not _RE_STUDENTID.match(id):
        return course_response('1', '查询失败', '')
    if schoolyear != "" and not __RE_YEAR.match(schoolyear):
        return course_response('1', '查询失败', '')
    if semester != "" and not __RE_SEMESTER.match(semester):
        return course_response('1', '查询失败', '')
    if id in LoginESList:
        es = LoginESList[id]
        result = es.searchCourse(xnd=schoolyear, xqd=semester)
        return course_response('0', '查询成功', result)
    else:
        return course_response('2', '学号未登录', '')

# 学生成绩查询
def exam_score_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['score'] = result
    body = json.dumps(r, ensure_ascii=False)
    resp.body = body.encode('utf-8')
    return resp

__RE_YEAR = re.compile(r'[0-9]{4}\-[0-9]{4}')
__RE_SEMESTER = re.compile(r'[1|2|3]')
@post('/educationSystem/score')
def get_exam_score(*, id, schoolyear, semester):
    global LoginESList
    print('个人成绩')
    print(id)
    if not id or not _RE_STUDENTID.match(id):
        return exam_score_response('1', '查询失败', '')
    if schoolyear != "" and not __RE_YEAR.match(schoolyear):
        return exam_score_response('1', '查询失败', '')
    if semester != "" and not __RE_SEMESTER.match(semester):
        return exam_score_response('1', '查询失败', '')
    if id in LoginESList:
        es = LoginESList[id]
        result = es.searchScore(xn = schoolyear, xq = semester)
        return exam_score_response('0', '查询成功', result)
    else:
        return exam_score_response('2', '学号未登录', '')
# ----------------------------------------------------------------

# 个人信息管理模块
# ----------------------------------------------------------------
# 获取个人信息
def personal_info_response(status, message, result=''):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['personinfo'] = result
    body = json.dumps(r, ensure_ascii=False)
    resp.body = body.encode('utf-8')
    return resp

@post('/personalInfo/information')
def get_personal_info(*, username):
    print('获取个人信息')
    print('用户名', username)
    if not username or not _RE_NAME.match(username):
        return personal_info_response('1', '用户名不正确')
    # 判断用户是否存在
    info = yield from PersonalInfo.find(username)
    if not info:
        return personal_info_response('2', '用户名不存在')
    result = info.personalInfo2Dict()
    return personal_info_response('0', '成功获取个人信息', result=result)

# 修改个人信息
def modify_personal_info_response(status, message):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    body = json.dumps(msg, default = Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

@post('/personalInfo/modify')
def modify_personal_info(*, personalinfo):
    print('修改个人信息')
    print(personalinfo)

    if not isinstance(personalinfo, dict):
        personalinfo = json.loads(personalinfo, object_hook=dict2PersonalInfo)
    if not personalinfo:
        return modify_personal_info_response('1', '用户名不正确')
    username = personalinfo.username
    if not username or not _RE_NAME.match(username):
        return modify_personal_info_response('1', '用户名不正确')
    # 判断用户是否存在
    info = yield from PersonalInfo.find(username)
    if not info:
        return modify_personal_info_response('2', '用户名不存在')
    print('用户名', info.username)
    info.modify(personalinfo)
    yield from info.update()
    return modify_personal_info_response('0', '成功修改个人信息')

# 宿舍报修模块
# ----------------------------------------------------------------
def get_dormrepair_id(username, realname, project, time):
    s = '%s:%s:%s:%s' % (username, realname, project, time)
    result = hashlib.sha1(s.encode('utf-8')).hexdigest()
    return result

def report_dormrepair_response(status, message):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    body = json.dumps(msg, default = Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

# 提交报修信息
@post('/dormitoryrepair/report')
def report_dormitory_repair(*, username, realname, telephone, project, dormitory, time, description):
    print('提交报修信息')
    print(username)
    if not username or not _RE_NAME.match(username):
        return report_dormrepair_response('1', '用户名不正确')
    # 判断用户是否存在
    users = yield from User.findAll('name=?', [username])
    if len(users) == 0:
        return report_dormrepair_response('2', '用户名不存在')
    # 判断项目是否已经报修
    id = get_dormrepair_id(username, realname, project, time)
    repairs = yield from DormRepair.findAll('id=?', [id])
    if len(repairs) > 0:
        return report_dormrepair_response('3', '该项目已经报修，不能重复报修')
    dr = DormRepair(id=id, username=username,realname=realname,
                    telephone=telephone,project=project,dormitory=dormitory,
                    time=time,description=description,state=False)
    yield from dr.save()
    return report_dormrepair_response('0', '报修成功')

# 获取报修状况
def get_dormrepair_response(status, message, result=''):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['repairstate'] = result
    body = json.dumps(r)
    resp.body = body.encode('utf-8')
    return resp

@post('/dormitoryrepair/repairstate')
def get_dormrepair_state(*, username):
    print('获取宿舍维修信息')
    print('用户名', username)
    if not username or not _RE_NAME.match(username):
        return get_dormrepair_response('1', '用户名不正确')
    # 判断用户是否存在
    users = yield from User.findAll('name=?', [username])
    if len(users) == 0:
        return get_dormrepair_response('2', '用户名不存在')
    # 获取报修列表
    repairs = yield from DormRepair.findAll('username=?', [username])
    return get_dormrepair_response('0', '成功获取宿舍维修信息', result=repairs)

# 社团信息模块
# ----------------------------------------------------------------
def get_communityinfo_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['communityinfo'] = result
    body = json.dumps(r, ensure_ascii=False)
    resp.body = body.encode('utf-8')
    return resp

# 下拉获取社团信息
@get('/community/getcommunityinfo')
def get_community_information(request):
    result = yield from CommunityInfo.findAll(orderBy='id desc', limit=10)
    return get_communityinfo_response('0','成功获取社团信息',result)

# 上拉获取社团信息，带最后一条信息的id
@post('/community/getcommunityinfo')
def get_communityinfo_with_id(*, lastid):
    id = None
    if isinstance(lastid, int):
        id = lastid
    elif lastid.isdigit():
        id = int(lastid)
    else:
        return get_communityinfo_response('1','获取社团信息失败，lastid不合法', '')

    result = yield from CommunityInfo.findAll(where='id < %d' % id, orderBy='id desc', limit=10)
    return get_communityinfo_response('0', '成功获取社团信息', result)

# 校内新闻模块
# ----------------------------------------------------------------
def get_campusnews_response(status, message, result):
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message(status, message)
    r = msg.Message2Dict()
    r['news'] = result
    body = json.dumps(r, ensure_ascii=False)
    resp.body = body.encode('utf-8')
    return resp

# 下拉获取校内新闻
@get('/campusnews/news')
def get_campusnews(request):
    result = yield from CampusNews.findAll(orderBy='id desc', limit=10)
    print(result)
    return get_campusnews_response('0', '成功获取校内新闻', result)

# 上拉获取校内新闻，带最后一条新闻的id
@post('/campusnews/news')
def get_campusnews_with_id(*, lastid):
    id = None
    if isinstance(lastid, int):
        id = lastid
    elif lastid.isdigit():
        id = int(lastid)
    else:
        return get_campusnews_response('1','获取校内新闻失败，lastid不合法', '')

    result = yield from CampusNews.findAll(where='id < %d' % id, orderBy='id desc', limit=10)
    return get_campusnews_response('0', '成功获取校内新闻', result)