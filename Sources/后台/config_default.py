# -*- coding: utf-8 -*-

'''
Default configurations.
'''

__author__ = 'West'

configs = {
    'debug': True,
    'db': {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': '******',
        'db': 'app'
    },
    'session': {
        'secret': 'WeSt'
    },
    'es': {
        'esurl': r'http://jwgldx.gdut.edu.cn'
    },
    'news':{
        'originurl' : r'http://news.gdut.edu.cn/',
        'newsurl': r'http://news.gdut.edu.cn/ArticleList.aspx?category=4',
        'maxnews': 20
    },
    'Server':{
        'ip' : '192.168.43.141',
        'port' : 3333
    }
}
