# -*- coding: utf-8 -*-

__author__ = 'West'

import sys
import asyncio, logging
# [0] aiomysql为MySQL数据库提供了异步IO的驱动!!
import aiomysql


def log(sql, args=()):
    logging.info('SQL: %s' % sql)

# [0] 创建一个全局的连接池，每个HTTP请求都可以从连接池中直接获取数据库连接。使用连接池的好处是不必频繁地打开和关闭数据库连接，而是能复用就尽量复用。
async def create_pool(loop, **kw):
    logging.info('create database connection pool...')
	# [1] 连接池由全局变量__pool存储，缺省情况下将编码设置为utf8，自动提交事务
    global __pool
	# [2] 适用aiomysql.create_pool创建一个支持异步的连接池
    __pool = await aiomysql.create_pool(
        host=kw.get('host', 'localhost'),
        port=kw.get('port', 3306),
        user=kw['user'],
        password=kw['password'],
        db=kw['db'],
        charset=kw.get('charset', 'utf8'),
        autocommit=kw.get('autocommit', True),
        maxsize=kw.get('maxsize', 10),
        minsize=kw.get('minsize', 1),
        loop=loop
    )

async def select(sql, args, size=None):
    log(sql, args)
    global __pool
    async with __pool.get() as conn:		# [0] 创建数据库连接conn
        async with conn.cursor(aiomysql.DictCursor) as cur:		# [1] 创建游标
			# [2] SQL语句的占位符是?，而MySQL的占位符是%s
			# [3] 注意要始终坚持使用带参数的SQL，而不是自己拼接SQL字符串，这样可以防止SQL注入攻击。
            await cur.execute(sql.replace('?', '%s'), args or ())
            if size:
                rs = await cur.fetchmany(size)			# [4] 通过fetchmany()获取最多指定数量的记录
            else:
                rs = await cur.fetchall()				# [5] 通过fetchall()获取所有记录
        logging.info('rows returned: %s' % len(rs))
        return rs										# [6] 返回结果集

# [0] 要执行INSERT、UPDATE、DELETE语句，可以定义一个通用的execute()函数，因为这3种SQL的执行都需要相同的参数，以及返回一个整数表示影响的行数
# [1] execute()函数和select()函数所不同的是，cursor对象不返回结果集，而是通过rowcount返回结果数。
# [2] INSERT、UPDATE、DELETE会改变数据库中的数据，因此执行完之后需要提交(commit)
# [3] 事务：在事务操作中，要么全部执行，要么全部不执行，这样可以保证数据的完整性
# [4] commit()和rollback()只有在事务中才会起作用
async def execute(sql, args, autocommit=True):
    log(sql)
    async with __pool.get() as conn:	# __pool.get()返回一个连接对象
        if not autocommit:
            await conn.begin()			# 在python连接对象开始一个事务
        try:
            async with conn.cursor(aiomysql.DictCursor) as cur:
                await cur.execute(sql.replace('?', '%s'), args)
                affected = cur.rowcount
            if not autocommit:
                await conn.commit()		# 如果要求非自动提交，则要在执行完操作后提交
        except BaseException as e:
            if not autocommit:
                await conn.rollback()	# 出现异常，如果要求非自动提交，则要回滚数据
            raise
        return affected					# 返回受影响的行数

def create_args_string(num):
    L = []
    for n in range(num):
        L.append('?')
    return ', '.join(L)		# 返回的是'?, ?, ?, ?'形式，注意mysql的通配符为?

# 字段类Field
class Field(object):

    def __init__(self, name, column_type, primary_key, default):
        self.name = name					# 类型名称
        self.column_type = column_type		# 行的类型，实际类型
        self.primary_key = primary_key		# 是否为主键
        self.default = default				# 默认值

    def __str__(self):
        return '<%s, %s:%s>' % (self.__class__.__name__, self.column_type, self.name)

class StringField(Field):
	# StringField映射varchar，即StringField实际就是varchar类型
    def __init__(self, name=None, primary_key=False, default=None, ddl='varchar(100)'):
        super().__init__(name, ddl, primary_key, default)

class BooleanField(Field):

    def __init__(self, name=None, default=False):
        super().__init__(name, 'boolean', False, default)

class IntegerField(Field):

    def __init__(self, name=None, primary_key=False, default=0):
        super().__init__(name, 'bigint', primary_key, default)

class FloatField(Field):

    def __init__(self, name=None, primary_key=False, default=0.0):
        super().__init__(name, 'real', primary_key, default)

class TextField(Field):

    def __init__(self, name=None, default=None):
        super().__init__(name, 'text', False, default)

# 通过ModelMetaclass类可以将具体的子类(如User)的映射信息读取出来
# Model类是ModelMetaclass的子类
# 任何继承自Model的类(如User)，会自动通过ModelMetaclass扫描映射关系，并存储到自身的类属性如__table__、__mappings__中
class ModelMetaclass(type):

	# [0] 每个类都有一个__new__函数，通常我们不override它
	# [1] __new__的作用是创建一个实例(为一个实例开辟空间)，并且返回该实例(未初始化)
	# [2] __init__的作用是初始化__new__返回的那个未初始化的实例
	# [3] 因此，创建并初始化一个实例分为两步：__new__和__init__
    def __new__(cls, name, bases, attrs):
		# [1] 排除Model类本身
        if name=='Model':
            return type.__new__(cls, name, bases, attrs)
		# [2] 获取table名称
        tableName = attrs.get('__table__', None) or name
        logging.info('found model: %s (table: %s)' % (name, tableName))
		# [3] 获取所有的Field和主键名
        mappings = dict()		# 保存类型属于Field的列名和类型，即(ColumnName : XXXField)
        fields = []				# 保存非主键的列名
        primaryKey = None
        for k, v in attrs.items():			# 按廖老师的这种套路，这是一个不支持(属性1, 属性2)这种表级主键，只能支持列级主键，可见性能确实比较弱。
            if isinstance(v, Field):		# 注意这里：判断v是否为Field类型，如果v是(属性1, 属性2)类型，那么显然v是一个tuple，不是Field，isinstance(v, Field)返回False。
											# 不过想要支持表级主键也是比较容易的，只要创建一个新的Field子类(class column1_column2_Field(Field): ...)，然后把实际类型(column_type)设置为'tuple'即可，
                logging.info('  found mapping: %s ==> %s' % (k, v))
                mappings[k] = v
                if v.primary_key:
                    # [4] 找到主键:
                    if primaryKey:
                        raise Exception('Duplicate primary key for field: %s' % k)		# primary_key 重复！！
                    primaryKey = k
                else:
                    fields.append(k)
        if not primaryKey:
            raise Exception('Primary key not found.')		# 没有主键！！
        for k in mappings.keys():
            attrs.pop(k)				# 去掉那些类型为XXXField的列名
        escaped_fields = list(map(lambda f: '`%s`' % f, fields))			# escaped_fields保存了所有非主键的属性，这些属性都转换为字符串形式 '属性名'
        attrs['__mappings__'] = mappings 		# 保存属性和列的映射关系
        attrs['__table__'] = tableName
        attrs['__primary_key__'] = primaryKey 	# 主键属性名
        attrs['__fields__'] = fields 			# 除主键外的属性名
		# 构造默认的SELECT, INSERT, UPDATE和DELETE语句:
        attrs['__select__'] = 'select `%s`, %s from `%s`' % (primaryKey, ', '.join(escaped_fields), tableName)
        attrs['__insert__'] = 'insert into `%s` (%s, `%s`) values (%s)' % (tableName, ', '.join(escaped_fields), primaryKey, create_args_string(len(escaped_fields) + 1))
        attrs['__update__'] = 'update `%s` set %s where `%s`=?' % (tableName, ', '.join(map(lambda f: '`%s`=?' % (mappings.get(f).name or f), fields)), primaryKey)
        attrs['__delete__'] = 'delete from `%s` where `%s`=?' % (tableName, primaryKey)
        return type.__new__(cls, name, bases, attrs)

# 所有ORM映射的基类Model
class Model(dict, metaclass=ModelMetaclass):

    def __init__(self, **kw):
        super(Model, self).__init__(**kw)

    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' object has no attribute '%s'" % key)

    def __setattr__(self, key, value):
        self[key] = value

    def getValue(self, key):
        return getattr(self, key, None)		# None的作用：如果没有key属性，就返回None

    def getValueOrDefault(self, key):
        value = getattr(self, key, None)
        if value is None:
            field = self.__mappings__[key]
            if field.default is not None:
                value = field.default() if callable(field.default) else field.default
                logging.debug('using default value for %s: %s' % (key, str(value)))
                setattr(self, key, value)
        return value

	# async是@asyncio.coroutine的简写模式，从Python3.5.1开始适用
	# 加上@classmethod，表示该方法为类方法
	# 没有加@classmethod，则为实例的方法
    @classmethod
    @asyncio.coroutine
    def findAll(cls, where=None, args=None, **kw):
        ' find objects by where clause. '
        sql = [cls.__select__]
        if where:
            sql.append('where')
            sql.append(where)
        if args is None:
            args = []
        orderBy = kw.get('orderBy', None)
        if orderBy:
            sql.append('order by')
            sql.append(orderBy)
        limit = kw.get('limit', None)
        if limit is not None:
            sql.append('limit')
            if isinstance(limit, int):
                sql.append('?')
                args.append(limit)
            elif isinstance(limit, tuple) and len(limit) == 2:
                sql.append('?, ?')
                args.extend(limit)
            else:
                raise ValueError('Invalid limit value: %s' % str(limit))
        rs = yield from select(' '.join(sql), args)
        return [cls(**r) for r in rs]			# 返回多个实例，存放在list中

	# findNumber() 根据WHERE条件查找，但返回的是整数，适用于select count(*)类型的SQL
    @classmethod
    @asyncio.coroutine
    def findNumber(cls, selectField, where=None, args=None):
        ' find number by select and where. '
        sql = ['select %s _num_ from `%s`' % (selectField, cls.__table__)]
        if where:
            sql.append('where')
            sql.append(where)
        rs = yield from select(' '.join(sql), args, 1)
        if len(rs) == 0:
            return None
        return rs[0]['_num_']

    @classmethod
    @asyncio.coroutine
    def find(cls, pk):
        ' find object by primary key. '
        rs = yield from select('%s where `%s`=?' % (cls.__select__, cls.__primary_key__), [pk], 1)
        if len(rs) == 0:
            return None
        return cls(**rs[0])		# **表示键值可变长参数列表。cls表示类，cls()创建一个实例，即创建一个Model实例。rs[0]表示返回的第一条结果，包含所有字段！(详见ModelMetaclass的__new__中的attrs['__select__'])

    @asyncio.coroutine
    def save(self):
        args = list(map(self.getValueOrDefault, self.__fields__))
        args.append(self.getValueOrDefault(self.__primary_key__))
        rows = yield from execute(self.__insert__, args)
        if rows != 1:
            logging.warn('failed to insert record: affected rows: %s' % rows)

    @asyncio.coroutine
    def update(self):
        args = list(map(self.getValue, self.__fields__))
        args.append(self.getValue(self.__primary_key__))
        rows = yield from execute(self.__update__, args)
        if rows != 1:
            logging.warn('failed to update by primary key: affected rows: %s' % rows)
    @asyncio.coroutine
    def remove(self):
        args = [self.getValue(self.__primary_key__)]
        rows = yield from execute(self.__delete__, args)
        if rows != 1:
            logging.warn('failed to remove by primary key: affected rows: %s' % rows)
