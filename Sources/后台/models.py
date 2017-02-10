# -*- coding: utf-8 -*-

__author__ = 'West'

from orm import Model, StringField, BooleanField, FloatField, TextField, IntegerField

# 普通用户
class User(Model):
    __table__ = 'users'

    name = StringField(primary_key=True, ddl='varchar(50)')
    password = StringField(ddl='varchar(50)')

# 应答消息
class Message(object):
    def __init__(self, status, message):
        self.status = status
        self.message = message

    def Message2Dict(self):
        return {
            'status':self.status,
            'message':self.message
        }

    def Dict2Message(d):
        return Message(d['status'], d['message'])

# 教务系统模块
# ----------------------------------------------------------------
# 学生类
class Student(object):
    def __init__(self, id, password):
        self.id = id
        self.password = password

# 等级考试成绩
class GradeExam(object):
    def __init__(self, year, semester, examname, id, time, totalS, listenS, readS, writeS, complexS):
        self.year = year
        self.semester = semester
        self.examname = examname
        self.id = id
        self.time = time
        self.totalS = totalS
        self.listenS = listenS
        self.readS = readS
        self.writeS = writeS
        self.complexS = complexS

    def gradeExam2Dict(self):
        return {
            "year" : self.year,
            "semester" : self.semester,
            "examname" : self.examname,
            "id" : self.id,
            "time" : self.time,
            "totalS": self.totalS,
            "listenS": self.listenS,
            "readS": self.readS,
            "writeS": self.writeS,
            "complexS": self.complexS,
        }

# 考试时间
class ExamTime(object):
    def __init__(self, cno, cname, sname, time, classroom, mode, seatnum, campus):
        self.cno = cno
        self.cname = cname
        self.sname = sname
        self.time = time
        self.classroom = classroom
        self.mode = mode
        self.seat = seatnum
        self.campus = campus

    def examTime2Dict(self):
        return {
            "cno" : self.cno,
            "cname" : self.cname,
            "sname" : self.sname,
            "time" : self.time,
            "classroom" : self.classroom,
            "mode" : self.mode,
            "seat" : self.seat,
            "campus" : self.campus
        }

# 考试成绩
class ExamResult(object):
    def __init__(self, cno, cname, kind, score, attr, bukao, chongxiu, credit, isMinor):
        self.cno = cno
        self.cname = cname
        self.kind = kind
        self.score = score
        self.attribute = attr
        self.bukao = bukao
        self.chongxiu = chongxiu
        self.credit = credit
        self.minor = isMinor

    def examResult2Dict(self):
        return {
            "cno" : self.cno,
            "cname" : self.cname,
            "kind": self.kind,
            "score": self.score,
            "attribute": self.attribute,
            "bukao": self.bukao,
            "chongxiu": self.chongxiu,
            "credit": self.credit,
            "minor": self.minor,
        }

# 个人课表
class Course(object):
    def __init__(self, cname, weekday, time, tname, classroom):
        self.cname = cname
        self.weekday = weekday
        self.time = time
        self.tname = tname
        self.classroom = classroom

    def course2Dict(self):
        return {
            "cname" : self.cname,
            "weekday": self.weekday,
            "time": self.time,
            "tname": self.tname,
            "classroom": self.classroom,
        }
# ----------------------------------------------------------------


# 个人信息模块
# ----------------------------------------------------------------
class PersonalInfo(Model):
    __table__ = 'personalinfo'

    username = StringField(primary_key=True, ddl='varchar(50)')
    nickname = StringField(ddl='varchar(50)')
    signature = StringField(ddl='varchar(300)',default='')
    sex = StringField(ddl='varchar(4)',default='')
    telephone = StringField(ddl='varchar(20)',default='')
    faculty = StringField(ddl='varchar(50)',default='')
    specialty = StringField(ddl='varchar(50)',default='')
    grade = StringField(ddl='varchar(10)',default='')
    dormitory = StringField(ddl='varchar(24)',default='')

    def personalInfo2Dict(self):
        return {
            "username": self.username,
            "nickname": self.nickname,
            "signature": self.signature,
            "sex": self.sex,
            "telephone": self.telephone,
            "faculty": self.faculty,
            "specialty": self.specialty,
            "grade": self.grade,
            "dormitory": self.dormitory,
        }

    def modify(self, info):
        self.username = info.username
        self.nickname = info.nickname
        self.signature = info.signature
        self.sex = info.sex
        self.telephone = info.telephone
        self.faculty = info.faculty
        self.specialty = info.specialty
        self.grade = info.grade
        self.dormitory = info.dormitory

def dict2PersonalInfo(d):
    return PersonalInfo(username=d['username'], nickname=d['nickname'],
                        signature=d['signature'], sex=d['sex'], telephone=d['telephone'],
                        faculty=d['faculty'], specialty=d['specialty'], grade=d['grade'],
                        dormitory=d['dormitory'])

# 宿舍报修模块
# ----------------------------------------------------------------
class DormRepair(Model):
    __table__ = 'dormrepair'

    id = StringField(primary_key=True, ddl='varchar(50)')
    username = StringField(ddl='varchar(50)')
    realname = StringField(ddl='varchar(50)')
    telephone = StringField(ddl='varchar(24)')
    project = StringField(ddl='varchar(50)')
    dormitory = StringField(ddl='varchar(20)')
    time = StringField(ddl='varchar(20)')
    description = StringField(ddl='varchar(300)')
    state = BooleanField(default=False)

    def dormrepair2dict(self):
        return {
            'username': self.username,
            'realname': self.realname,
            'telephone': self.telephone,
            'project': self.project,
            'dormitory': self.dormitory,
            'time': self.time,
            'description': self.description,
            'state': self.state
        }

def dict2Dormrepair(d):
    return DormRepair(username=d['username'],realname=d['realname'],
                      telephone= d['telephone'],project=d['project'],dormitory=d['dormitory'],
                      time= d['time'],description=d['description'],state=d['state'])

# 社团信息模块
# ----------------------------------------------------------------
class Community(Model):
    __table__ = 'community'

    name = StringField(primary_key=True, ddl='varchar(50)')

class CommunityInfo(Model):
    __table__ = 'communityinfo'

    id = IntegerField(primary_key=True)
    title = StringField(ddl='varchar(256)')
    communityname = StringField(ddl='varchar(50)')
    content = TextField()
    createtime = StringField(ddl='varchar(20)')
    modifytime = StringField(ddl='varchar(20)')
    headimgurl = StringField(ddl='varchar(1024)')
    contentimgurl = StringField(ddl='varchar(1024)')

    def communityinfo2dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'communityname': self.communityname,
            'content': self.content,
            'createtime': self.createtime,
            'modifytime': self.modifytime,
            'headimgurl': self.headimgurl,
            'contentimgurl': self.contentimgurl
        }

def dict2CommunityInfo(d):
    return CommunityInfo(id=d['id'], title=d['title'],communityname=d['communityname'],content= d['content'],
                         createtime=d['createtime'],headimgurl= d['headimgurl'],contentimgurl=d['contentimgurl'])

# 校内新闻模块
# ----------------------------------------------------------------
class CampusNews(Model):
    __table__ = 'campusnews'

    id = IntegerField(primary_key=True)
    title = StringField(ddl='varchar(256)')
    department = StringField(ddl='varchar(50)')
    date = StringField(ddl='varchar(20)')
    weekday = StringField(ddl='varchar(20)')
    url = StringField(ddl='varchar(50)')            # 新闻的url
    content = TextField(default='')                           # 新闻的内容

    def campusnews2dict(self):
        return {
            'id':self.id,
            'title': self.title,
            'department': self.department,
            'date': self.date,
            'weekday': self.weekday,
            'content': self.content
        }
