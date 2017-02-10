# -*- coding: utf-8 -*-

__author__ = 'West'

import urllib.request
import urllib.error
import http.cookiejar
import re, asyncio, orm, sys
import logging; logging.basicConfig(level=logging.INFO)

from datetime import date, datetime, timedelta
from config import configs
from models import CampusNews

NewsURL = configs.news.newsurl
OriginURL = configs.news.originurl
MaxNewsNum = configs.news.maxnews

class GDUTNews(object):
    def __init__(self):
        self.cookie = http.cookiejar.CookieJar()
        handler = urllib.request.HTTPCookieProcessor(self.cookie)
        self.opener = urllib.request.build_opener(handler)
        self.viewstate = ''
        self.eventvalidation = ''
        self.curPage = 1
        self.newsList = []

    def setViewState(self, html):
        pattern = re.compile(r'name="__VIEWSTATE" id="__VIEWSTATE" value="(.*?)"', re.S)
        items = re.findall(pattern, html)
        self.viewstate = items[0]

    def setEventValidation(self, html):
        pattern = re.compile(r'name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="(.*?)"', re.S)
        items = re.findall(pattern, html)
        self.eventvalidation = items[0]

    # 从html中获取新闻的简要信息，每条新闻存放在一个CampusNews实例中，包括标题、单位、日期、星期、新闻的url
    def getArticlesInfoList(self, html, lastNews):
        # 从页面中获取包含所有新闻简要信息的标签
        pattern = re.compile(r'<div id="ContentPlaceHolder1_ListView1_ItemPlaceHolderContainer">(.*?)</div>', re.S)
        items = re.findall(pattern, html)
        html = items[0]
        # 从新闻简要信息列表中提取每一条新闻
        pattern = re.compile(r'<a href="./(.*?)".*?title="(.*?)">.*?<span title=(.*?)>.*?</span><span>&nbsp;(.*?)&nbsp;(.*?)]</span>', re.S)
        items = re.findall(pattern, html)
        '''
        for item in items:
            print('url:',item[0])
            print('title:',item[1])
            print('department:',item[2])
            print('date:',item[3])
            print('weekday:',item[4])
            print('---------------------------------------------')
        '''
        finished = False
        for item in items:
            if lastNews is not None and item[1] == lastNews.title and item[3] == lastNews.date:
                finished = True
                break
            onenews = CampusNews(id=0, url=item[0], title=item[1],
                                 department=item[2], date=item[3], weekday=item[4])
            self.newsList.append(onenews)
            if len(self.newsList) > MaxNewsNum:
                return True
        return finished

    # 从html中解析出新闻的内容
    def getArticlesContent(self, html):
        pattern = re.compile(r'(<div class="articleBody" id="articleBody".*?</div>)', re.S)
        items = re.findall(pattern, html)
        if items:
            return items[0]
        return None

    # 根据url获取一条新闻的内容
    def getOneArticale(self, url):
        # url = 'http://news.gdut.edu.cn/viewarticle.aspx?articleid=117559'
        req = urllib.request.Request(url)
        resp = self.opener.open(req)
        html = resp.read().decode('utf-8')
        content = self.getArticlesContent(html)
        return content

    # 下一页
    def getNextPage(self):
        postData = {
            '__VIEWSTATE':self.viewstate,
            '__EVENTVALIDATION':self.eventvalidation,
            'ctl00$username': '',
            'ctl00$password':'',
            'ctl00$CheckBox1':'on',
            'ctl00$ContentPlaceHolder1$keyword':'',
            'ctl00$ContentPlaceHolder1$searchDepartments':2147483647,
            'ctl00$ContentPlaceHolder1$searchCategories':4,
            'ctl00$ContentPlaceHolder1$startDate':'',
            'ctl00$ContentPlaceHolder1$endDate':'',
            'ctl00$ContentPlaceHolder1$TextBox1':self.curPage,
            'ctl00$ContentPlaceHolder1$Button_next1':'下一页',
        }
        headers = {
            'Referer': NewsURL,
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36'
        }
        data = urllib.parse.urlencode(postData).encode('utf-8')
        req = urllib.request.Request(NewsURL, data)
        for header in headers:
            req.add_header(header, headers[header])
        resp = self.opener.open(req)
        html = resp.read().decode('utf-8')
        #print(html)
        self.curPage += 1
        return html

    # 首页
    def getFirstPage(self):
        req = urllib.request.Request(NewsURL)
        resp = self.opener.open(req)
        html = resp.read().decode('utf-8')
        self.setViewState(html)
        self.setEventValidation(html)
        return html

    # 更新新闻列表
    def updateNewsList(self, beginID, lastNews):
        firstPageHTML = self.getFirstPage()
        isFinished = self.getArticlesInfoList(html=firstPageHTML, lastNews=lastNews)
        while not isFinished:
            nextPageHTML = self.getNextPage()
            isFinished = self.getArticlesInfoList(html=nextPageHTML, lastNews=lastNews)
            if len(self.newsList) > MaxNewsNum:
                print(">MaxNewsNum")
                break
        # 更新每条新闻的ID
        newsListLen = len(self.newsList) - 1
        for news in self.newsList:
            news.id = beginID + newsListLen
            newsListLen -= 1
        # 获取到每条新闻的内容
        for news in self.newsList:
            url = OriginURL + news.url
            news.content = self.getOneArticale(url=url)
        print('update news list finished')

@asyncio.coroutine
def updateTodayNewsList(loop):
    while True:
        now_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S ')
        logging.info(now_str + 'update news list...')
        yield from orm.create_pool(loop=loop, host=configs.db.host, port=configs.db.port,
                                   user=configs.db.user, password=configs.db.password, db=configs.db.db)
        result = yield from CampusNews.findAll(orderBy='id desc', limit=1)
        beginID = 1
        if result:
            result = result[0]
            beginID = result.id + 1
        gn = GDUTNews()
        gn.updateNewsList(beginID=beginID, lastNews=result)
        for news in gn.newsList:
            yield from news.save()
        # 每6个小时更新一次 3600*6=21600
        yield from asyncio.sleep(21600)

@asyncio.coroutine
def test(loop):
    yield from orm.create_pool(loop=loop, user='root', host='127.0.0.1', port=3306, password='westlife312', db='app')
    result = yield from CampusNews.findAll(orderBy='id desc', limit=1)
    beginID = 1
    if result:
        result = result[0]
        beginID = result.id + 1

    gn = GDUTNews()
    gn.updateNewsList(beginID=beginID, lastNews=result)
    for news in gn.newsList:
        yield from news.save()

    #t = date.today()
    #today_str = r'%s/%s/%s' % (t.year, t.month, t.day)

if __name__ == '__main__':
    """
    #gn = GDUTNews()
    #gn.getFirstPage()
    #gn.getOneArticale()
    t = date.today()
    today_str = r'%s/%s/%s' % (t.year, t.month, t.day)
    print(today_str)

    n = datetime.now()
    hour, minute = n.hour, n.minute
    print(hour, minute)

    today = datetime.today()
    tommorow = today + timedelta(days=1)
    print(today)
    print(tommorow)
    string = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(string)
    """
    loop = asyncio.get_event_loop()
    loop.run_until_complete(updateTodayNewsList(loop))
    loop.close()
    if loop.is_closed():
        sys.exit(0)


