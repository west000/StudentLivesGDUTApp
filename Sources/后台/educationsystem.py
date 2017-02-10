# -*- coding: utf-8 -*-
__author__ = 'West'

import urllib.request
import urllib.error
import http.cookiejar
import re, os
import orc
from models import GradeExam, ExamTime, ExamResult, Course
from config import configs

SaveHTMLPath = os.path.abspath('.') + r'\html\\'
ESURL = configs.es.esurl

class EducationSystem(object):
    baseURL = ESURL + r'/xs_main.aspx?xh='
    checkcodeURL = ESURL + r'/CheckCode.aspx'
    def __init__(self):
        self.cookie = http.cookiejar.CookieJar()
        handler = urllib.request.HTTPCookieProcessor(self.cookie)
        self.opener = urllib.request.build_opener(handler)
        self.mainHTML = None
        self.userID = None
        self.name = None

    # 获取验证码
    def getCheckCode(self):
        path = os.path.abspath('.') + r'\orc\checkCodeImg.jpg'
        checkcodePicture = self.opener.open(self.checkcodeURL).read()
        with open(path, 'wb') as f:
            f.write(checkcodePicture)
        checkcode = orc.getAllOcr(path)
        return checkcode

    # 获取__VIEWSTATE
    def getView(self, html):
        pattern = re.compile(r'name="__VIEWSTATE" value="(.*?)"', re.S)
        items = re.findall(pattern, html)
        return items[0]

    # 获得Request实例
    def getRequest(self, url, postData=None, headers=None):
        request = None
        if postData:
            postData = urllib.parse.urlencode(postData).encode('gb2312')
            request = urllib.request.Request(url, postData)
        else:
            request = urllib.request.Request(url)
        if headers:
            for header in headers:
                request.add_header(header, headers[header])
        return request

    # 获得登陆页面HTML
    def getMainHTML(self):
        url = ESURL + r'/default2.aspx'
        request = self.getRequest(url)
        response = urllib.request.urlopen(request)
        html = response.read().decode('gb2312')
        return html

    # 判断是否登录成功
    # 用户名不存在或未按照要求参加教学活动、验证码不正确、密码错误
    # <script language="javascript" defer="">alert('用户名不存在或未按照要求参加教学活动！！');document.getElementById('txtUserName').focus();</script>
    # <script language="javascript" defer="">alert('验证码不正确！！');document.getElementById('TextBox2').focus();</script>
    # <script language="javascript" defer="">alert('密码错误！！');document.getElementById('TextBox2').focus();</script>
    def loginState(self, html):
        if re.search('用户名不存在或未按照要求参加教学活动', html):
            return 1
        elif re.search('验证码不正确', html) or re.search('验证码不能为空', html):
            return 2
        elif re.search('密码错误', html):
            return 3
        elif re.search('欢迎您', html):
            return 0
        else:
            return -1

    # 模拟登陆
    def login(self, userID, pwd):
        button = '学生'.encode('gb2312')
        postURL = ESURL + r'/default2.aspx'
        headers = {
            'Referer': postURL,
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36'
        }
        postData = {
            '__VIEWSTATE': self.getView(self.getMainHTML()),
            'txtUserName': userID,
            'TextBox2': pwd,
            'txtSecretCode': '',
            'RadioButtonList1': button,
            "Button1": '',
            "lbLanguage": ''
        }
        try:
            html = None
            while True:
                checkcode = self.getCheckCode()
                postData['txtSecretCode'] = checkcode
                request = self.getRequest(postURL, postData, headers)
                response = self.opener.open(request)
                html = response.read().decode('gbk')
                state = self.loginState(html)
                if state == 0:
                    # 保存学生学号、姓名
                    self.saveStudentInfo(html)
                    print('成功登录教务系统')
                elif state == 1:
                    print('学号不存在')
                elif state == 2:
                    print('验证码不正确')
                    continue
                elif state == 3:
                    print('密码错误')
                elif state == -1:
                    print('正方教务系统奔溃')
                    return 4
                return state
                '''
                if state == 0:
                    # 保存学生学号、姓名
                    self.saveStudentInfo(html)
                    print('成功登录教务系统')
                    break
                elif state == 1:
                    print('用户名不存在或未按照要求参加教学活动')
                    userID = input('重新输入学号: ')
                    pwd = input('重新输入密码：')
                    postData['txtUserName'] = userID
                    postData['TextBox2'] = pwd
                elif state == 2:
                    print('验证码不正确')
                elif state == 3:
                    print('密码错误')
                    pwd = input('重新输入密码：')
                    postData['TextBox2'] = pwd
                '''
            '''
            # print(html)
            path = SaveHTMLPath + 'main.txt'
            with open(path, 'w+') as f:
                f.write(html)
                '''
        except urllib.error.URLError as e:
            if hasattr(e, 'code'):
                print('code:', e.code)
                if e.code == '503':
                    return 4
            if hasattr(e, 'reason'):
                print('reason:', e.reason)

    # 保存学号、姓名
    def saveStudentInfo(self, html):
        pattern = re.compile(r'<a href="xscj.aspx\?(.*?)".*?>成绩查询</a>', re.S)
        items = re.findall(pattern, html)
        m = re.match(r'xh=(\d+)&xm=([\u4e00-\u9fa5]+)&gnmkdm=(N\d+)', items[0])
        self.userID = m.group(1)
        self.name = m.group(2)
        self.baseURL += self.userID

    # ###########################################################
    # 查询
    # ###########################################################
    '''
    成绩查询 xscj.aspx?xh=3114006506&xm=黄伟塨&gnmkdm=N121605
    等级考试查询 xsdjkscx.aspx?xh=3114006506&xm=黄伟塨&gnmkdm=N121606
    学生考试查询 xskscx.aspx?xh=3114006506&xm=黄伟塨&gnmkdm=N121604
    学生个人课表 xskbcx.aspx?xh=3114006506&xm=黄伟塨&gnmkdm=N121603
    '''

    def getSearchURL(self, project):
        SearchDict = {
            'xskbcx': 'N121603',
            'xskscx': 'N121604',
            'xscj': 'N121605',
            'xsdjkscx': 'N121606'
        }
        gnmkdm = SearchDict[project]
        url = 'http://jwgldx.gdut.edu.cn/' + project + '.aspx?xh=' + self.userID + '&xm=' + urllib.parse.quote(
            self.name.encode('gbk')) + '&gnmkdm=' + gnmkdm
        return url

    # 得到查询页面
    def getSearchHTML(self, project, ref=None, postData=None):
        referer = None
        if ref:
            referer = ref
        else:
            referer = self.baseURL
        headers = {
            'Referer': referer,
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36'
        }
        url = self.getSearchURL(project)
        request = self.getRequest(url, headers=headers, postData=postData)
        response = self.opener.open(request)
        html = response.read().decode('gbk')
        return html

    # 等级考试查询
    def searchGradeExam(self):
        html = self.getSearchHTML('xsdjkscx')
        pattern = re.compile(
            r'<td>([0-9\-]+)</td><td>(\d)</td><td>(.*?)</td><td>(\d+)</td><td>(.*?)</td><td>(.*?)</td><td>(\d+)</td><td>(\d+)</td><td>(\d+)</td><td>(.*?)</td>',
            re.S)
        items = re.findall(pattern, html)
        # 年度			学期  考试名称		准考证号		考试时间  总分	 听力	阅读	写作	综合
        # ('2014-2015', '2', '英语四级', '440380151105219', '&nbsp;', '505', '162', '182', '161', '&nbsp;')
        result = []
        for item in items:
            grade = GradeExam(item[0],item[1],item[2],item[3],item[4],item[5],item[6],item[7],item[8],item[9])
            grade = grade.gradeExam2Dict()
            result.append(grade)
        return result
        '''
        filename = SaveHTMLPath + self.name + '-' + self.userID + '-' + '等级考试.txt'
        with open(filename, 'w+') as f:
            f.write(html)
        #print(html)
        '''

    # 学生考试查询
    def searchExamTime(self):
        html = self.getSearchHTML('xskscx')
        pattern = re.compile(
            '<td>([\(\)\d\-]+)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(\d+)</td><td>(.*?)</td>',
            re.S)
        items = re.findall(pattern, html)
        # 		选课课号							课程名称		姓名			考试时间				考试地点	考试形式 座位号 校区
        # ('(2016-2017-1)-24102920-00006199-2', '算法设计与分析', '黄伟塨', '第9周周2(2016-10-25)第8,9节', '教3-209', '&nbsp;', '7', '大学城校园')
        result = []
        for item in items:
            exam = ExamTime(item[0],item[1],item[2],item[3],item[4],item[5],item[6],item[7])
            exam = exam.examTime2Dict()
            result.append(exam)
        return result
        '''
        filename = SaveHTMLPath + self.name + '-' + self.userID + '-' + '考试时间.txt'
        with open(filename, 'w+') as f:
            f.write(html)
        #print(html)
        '''

    # 学生个人课表
    def searchCourse(self, xnd='', xqd='1'):
        xqkbhtml = ""
        if not xnd or xnd == "":
            xqkbhtml = self.getSearchHTML('xskbcx')
        else:
            html = self.getSearchHTML('xskbcx')
            __VIEWSTATE = self.getView(html)
            referer = self.getSearchURL('xskbcx')
            if not xqd:
                xqd = ""
            postData = {'__VIEWSTATE': __VIEWSTATE,
                        'xnd': xnd,
                        'xqd': xqd
                        }
            xqkbhtml = self.getSearchHTML('xskbcx', referer, postData)
        pattern = re.compile(r'<table id="Table1".*?>(.*?)</table>', re.S)
        items = re.findall(pattern, xqkbhtml)
        coursetable = items[0]
        # 1-10节即可
        pattern = re.compile(
            r'<td.*?>(第[1|3|5|6|8]0*节)</td><td align.*?>(.*?)</td><td align.*?>(.*?)</td><td align.*?>(.*?)</td><td align.*?>(.*?)</td><td align.*?>(.*?)</td><td class.*?>(.*?)</td><td class.*?>(.*?)</td>',
            re.S)
        items = re.findall(pattern, coursetable)
        pattern = re.compile(r'([\u4e00-\u9fa5]+[A-Z]*[\（\d\）]*)<br>(周.*?)(第.*?)<br>(.*?)<br>(.*?)<br>',
                             re.S)  # [\u4e00-\u9fa5]
        result = []
        for item in items:
            for courses in item:
                courseList = re.findall(pattern, courses)
                for c in courseList:
                    course = Course(c[0],c[1],c[2],c[3],c[4])
                    course = course.course2Dict()
                    result.append(course)
        return result
        '''
        for item in items:
            print('-------------------------------------------------------------')
            count = 1
            for courses in item:
                # print(count, '--', courses)
                count += 1
                courseList = re.findall(pattern, courses)
                for course in courseList:
                    print('-------', course)
            print('-------------------------------------------------------------')

        filename = SaveHTMLPath + self.name + '-' + self.userID + '-' + '个人课表.txt'
        with open(filename, 'w+') as f:
            f.write(html)
        #print(html)
        '''

    # 按学期查询个人课表
    def searchCourseByXueQi(self, xnd='', xqd='1'):
        html = self.getSearchHTML('xskbcx')
        __VIEWSTATE = self.getView(html)
        referer = self.getSearchURL('xskbcx')
        postData = {'__VIEWSTATE': __VIEWSTATE,
                    'xnd' : xnd,
                    'xqd' : xqd
                    }
        xqkbhtml = self.getSearchHTML('xskbcx', referer, postData)
        filename = SaveHTMLPath + self.name + '-'+self.userID + '-' + xnd + '学年第'+ xqd + '学期学生个人课程表.txt'
        with open(filename, 'w+') as f:
            f.write(xqkbhtml)

    # 成绩查询
    def searchScoreByXueQi(self, xn='', xq=''):
        html = self.getSearchHTML('xscj')
        __VIEWSTATE = self.getView(html)
        button = urllib.parse.quote('按学期查询'.encode('gbk'))
        referer = self.getSearchURL('xscj')
        postData = {'__VIEWSTATE': __VIEWSTATE,
                    'ddlXN': xn,  # 学年区间
                    'ddlXQ': xq,  # 学期
                    'txtQSCJ': '0',
                    'txtZZCJ': '100',
                    'Button1': button  # 按键
                    }
        xqcjhtml = self.getSearchHTML('xscj', referer, postData)
        filename = SaveHTMLPath + self.name + '-' + self.userID + '-' + xn + '年度' + '第' + xq + '学期成绩表.txt'
        with open(filename, 'w+') as f:
            f.write(xqcjhtml)
        #print(xqcjhtml)

    def searchScoreByXueNian(self, xn=''):
        html = self.getSearchHTML('xscj')
        __VIEWSTATE = self.getView(html)
        button = urllib.parse.quote('按学年查询'.encode('gbk'))
        referer = self.getSearchURL('xscj')
        postData = {'__VIEWSTATE': __VIEWSTATE,
                    'ddlXN': xn,  # 学年区间
                    'ddlXQ': '',  # 学期
                    'txtQSCJ': '0',
                    'txtZZCJ': '100',
                    'Button1': button  # 按键
                    }
        xncjhtml = self.getSearchHTML('xscj', referer, postData)
        filename = SaveHTMLPath + self.name + '-' + self.userID + '-' + xn + '年度' + '成绩表.txt'
        with open(filename, 'w+') as f:
            f.write(xncjhtml)
        #print(xncjhtml)

    # 成绩查询
    def searchScore(self, xn='', xq=''):
        html = self.getSearchHTML('xscj')
        __VIEWSTATE = self.getView(html)
        button = ""
        if not xq or xq == "":
            button = urllib.parse.quote('按学年查询'.encode('gbk'))
        else:
            button = urllib.parse.quote('按学期查询'.encode('gbk'))
        referer = self.getSearchURL('xscj')
        postData = {'__VIEWSTATE': __VIEWSTATE,
                    'ddlXN': xn,  # 学年区间
                    'ddlXQ': xq,  # 学期
                    'txtQSCJ': '0',
                    'txtZZCJ': '100',
                    'Button1': button  # 按键
                    }
        xqcjhtml = self.getSearchHTML('xscj', referer, postData)
        pattern = re.compile(
            r'<td>([A-Z0-9]{8})</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(\d)</td>',
            re.S)
        items = re.findall(pattern, xqcjhtml)
        # 	课程代码		课程名称		课程性质	成绩 课程归属  补考成绩  重修成绩  学分  辅修标记
        # ('03101B02', '大学物理B（2）', '公共基础课', '90', '&nbsp;', '&nbsp;', '&nbsp;', '2.0', '0')
        result = []
        for item in items:
            exam = ExamResult(item[0], item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8])
            exam = exam.examResult2Dict()
            result.append(exam)
        return result

if __name__ == '__main__':
    orc.initOrc()
    # 输入学号: 3114006532
    # 输入密码: 3695147asd++
    userID = input('输入学号: ')  # '3114006506'
    pwd = input('输入密码: ')  # 'Westlife705312'
    userID = '3114006532'
    pwd = '3695147asd++'
    userID = '3114006506'
    pwd = 'Westlife705312'
    userID = '3114006507'
    pwd = 'unique82512'
    gdut = EducationSystem()
    gdut.login(userID, pwd)
    gdut.searchCourseByXueQi('2014-2015','2')
    #gdut.searchCourse()
    #gdut.searchExamTime()
    #gdut.searchGradeExam()
    #gdut.searchScoreByXueQi('2014-2015', '1')
    #gdut.searchScoreByXueQi('2014-2015', '2')
    #gdut.searchScoreByXueQi('2015-2016', '1')
    #gdut.searchScoreByXueQi('2015-2016', '2')
    #gdut.searchScoreByXueNian('2014-2015')
    #gdut.searchScoreByXueNian('2015-2016')

