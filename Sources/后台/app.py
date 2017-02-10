# -*- coding: utf-8 -*-

__author__ = 'Michael Liao'

'''
async web application.
'''

import logging; logging.basicConfig(level=logging.INFO)
import asyncio, os, json, time
from aiohttp import web

import orm, orc
from coroweb import add_routes
from handlers import cookie2user, COOKIE_NAME

from config import configs
ServerIP = configs.Server.ip
ServerPort = configs.Server.port

from models import Message
@asyncio.coroutine
def cookie_illegal():
    resp = web.Response()
    resp.content_type = 'application/json'
    msg = Message('10', 'cookie不合法')
    body = json.dumps(msg, default=Message.Message2Dict)
    resp.body = body.encode('utf-8')
    return resp

async def logger_factory(app, handler):
    async def logger(request):
        logging.info('Request: %s %s' % (request.method, request.path))
        # await asyncio.sleep(0.3)
        return (await handler(request))
    return logger

@asyncio.coroutine
def auth_factory(app, handler):
    @asyncio.coroutine
    def auth(request):
        logging.info('check user: %s %s' % (request.method, request.path))
        request.__user__ = None
        cookie_str = request.cookies.get(COOKIE_NAME)
        logging.info('cookie_str: %s' % cookie_str)
        if cookie_str:
            user = yield from cookie2user(cookie_str)
            if user:
                logging.info('set current user: %s' % user.name)
                request.__user__ = user
        else:
            # 管理员是不用cookie的
            if request.path.startswith('/manage/') and (request.__user__ is None or not request.__user__.admin):
                pass    #return web.HTTPFound('/manage/login')
            # 注册时也不用cookie
            elif request.path.startswith('/register'):
                pass
            # 登录也是不用cookie的，登录成功后才给个cookie
            elif request.path.startswith('/login'):
                pass
            # 教务系统要用cookie？有待商榷
            elif request.path.startswith('/educationSystem'):
                pass
            elif request.path.startswith('/community'):
                pass
            elif request.path.startswith('/campusnews'):
                pass
            # 其他情况，cookie不合法，直接返回cookie不合法
            else:
                return (yield from cookie_illegal())
        return (yield from handler(request))
    return auth

async def response_factory(app, handler):
    async def response(request):
        logging.info('Response handler...')
        r = await handler(request)
        if isinstance(r, web.StreamResponse):
            return r
        if isinstance(r, bytes):
            resp = web.Response(body=r)
            resp.content_type = 'application/octet-stream'
            return resp
        if isinstance(r, str):
            if r.startswith('redirect:'):
                return web.HTTPFound(r[9:])
            resp = web.Response(body=r.encode('utf-8'))
            resp.content_type = 'text/html;charset=utf-8'
            return resp
        if isinstance(r, dict):
            template = r.get('__template__')
            if template is None:
                resp = web.Response(body=json.dumps(r, ensure_ascii=False, default=lambda o: o.__dict__).encode('utf-8'))
                resp.content_type = 'application/json;charset=utf-8'
                return resp
            else:
                resp = web.Response(body=app['__templating__'].get_template(template).render(**r).encode('utf-8'))
                resp.content_type = 'text/html;charset=utf-8'
                return resp
        if isinstance(r, int) and r >= 100 and r < 600:
            return web.Response(r)
        if isinstance(r, tuple) and len(r) == 2:
            t, m = r
            if isinstance(t, int) and t >= 100 and t < 600:
                return web.Response(t, str(m))
        # default:
        resp = web.Response(body=str(r).encode('utf-8'))
        resp.content_type = 'text/plain;charset=utf-8'
        return resp
    return response

async def init(loop):
    # 加载验证码识别模块
    orc.initOrc()
    # 创建数据库连接池
    await orm.create_pool(loop=loop, host=configs.db.host, port=configs.db.port,
                          user=configs.db.user, password=configs.db.password, db=configs.db.db)
    # 添加中间件
    app = web.Application(loop=loop, middlewares=[
        logger_factory, auth_factory, response_factory
    ])
    # 添加处理函数
    add_routes(app, 'handlers')
    # 创建服务器
    srv = await loop.create_server(app.make_handler(), ServerIP, ServerPort)
    str = "server started at http://" + ServerIP + ":" + ServerPort + "..."
    logging.info(str)
    print(str)
    return srv

from gdutnews import updateTodayNewsList

loop = asyncio.get_event_loop()
tasks = [init(loop), updateTodayNewsList(loop)]
loop.run_until_complete(asyncio.wait(tasks))
loop.run_forever()
