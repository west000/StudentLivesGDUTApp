-- drop database if exists app;

-- create database app;

create table users(
	name varchar(50) not null,
    password varchar(50) not null,
    primary key(name)
);

insert users(name, password) values('West', 'helloworld');
delete
from users
where name='West';

SET SQL_SAFE_UPDATES = 0;
delete from users;
select * from users;

create table personalinfo(
	username varchar(50) not null,
    nickname varchar(50) not null,
    signature varchar(300),
    sex varchar(4),
    telephone varchar(20),
    faculty varchar(50),
    specialty varchar(50),
    grade varchar(10),
    dormitory varchar(24),
    primary key(username),
    foreign key(username) references users(name) on delete cascade
);
insert personalinfo(username, nickname) values('West', 'fsal');

select * from personalinfo;
delete from personalinfo;
drop table personalinfo;

create table dormrepair(
	id varchar(50) not null,
    username varchar(50) not null,
    realname varchar(50),
    telephone varchar(24),
    project varchar(50),
    dormitory varchar(20),
    time varchar(20),
    description varchar(300),
    state boolean,
    primary key(id),
    foreign key(username) references users(name) on delete cascade
);

select * from dormrepair;
delete from dormrepair;
drop table dormrepair;


-- 社团信息管理
-- 社团
create table community(
	name varchar(50) not null,
    primary key(name)
);

insert community(name) values('广东工业大学第一社团');
insert community(name) values('广东工业大学第二社团');
insert community(name) values('广东工业大学第三社团');
insert community(name) values('广东工业大学第四社团');
insert community(name) values('广东工业大学第五社团');
select * from community;
delete from community;
drop table community; 

-- 社团信息
create table communityinfo(
	id integer,				-- 社团信息的id
    title varchar(256) not null,			-- 社团信息的标题
    communityname varchar(50) not null,		-- 社团名称
    content text(65536) not null,			-- 社团信息内容
    createtime varchar(20),					-- 信息创建时间
    modifytime varchar(20),					-- 信息修改时间
    headimgurl varchar(1024),				-- 社团头像url
    contentimgurl varchar(1024),				-- 信息内容的图片url
    primary key(id),
    foreign key(communityname) references community(name) on delete cascade
);

insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(1, '你好广工', '广东工业大学第一社团', '<html><head><title>欢迎来到广工第一社团</title></head><body>你好，这里是广工第一社团！</body></html>', 
			'2016.11.11', '2016.11.11', 
            'http://img4.imgtn.bdimg.com/it/u=1876538948,1307669552&fm=11&gp=0.jpg', 
			'http://img5.imgtn.bdimg.com/it/u=3342747550,1041219101&fm=21&gp=0.jpg');
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(2, '广工社团招新', '广东工业大学第二社团', '<html><head><title>欢迎来到广工第二社团</title></head><body>你好，这里是广工第二社团！</body></html>', 
			'2016.11.18', '2016.11.18', 
            'http://img0.imgtn.bdimg.com/it/u=2627828869,1070682005&fm=21&gp=0.jpg', 
			'http://img3.imgtn.bdimg.com/it/u=2744129126,100553083&fm=21&gp=0.jpg');
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(3,'市场营销协会招','广东工业大学第一社团','
<section>
    <section>
        <section>
            <section>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(250, 7, 7);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; line-height: 19.04px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">市场营销协会招（kai）新（che）啦~~还在等什么，快来加（shang）入（车）吧</strong></span></span>&nbsp;
            </section>
        </section>
    </section>
</section>
<p>
    <br/>
</p>
<section>
    <section>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tTBAQtDicohEwib7icQMB0IgUwmjTr2FFAExSRSuqN20mrWW4311ibdfWxQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>

    <section>
        <img class=" __bg_gif" src="http://mmbiz.qpic.cn/mmbiz_gif/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tlD18fI4UnESprHHvsryL1FiczicsKhibbGf23YaEnxLSxtjCKPHibfMK4A/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">市协招新啦！</strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">市协招新啦！</strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">市协招新啦！</strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong></span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);">没错，一年一度的招新又要来了！小鲜肉们还在等什么</span>
            </p>
            <p>
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; background-color: rgb(254, 255, 255);"><br/></span>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tJjFfrFc11pibAsQ0dacMofBk3Azv67E7EOowfLI0XYMT05KbwbNHicXw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <br/>
            <section>
                <p>
                    <br/>
                </p>
                <p>
                    社团情况介绍
                </p>
            </section>
        </section><img class="" src="http://mmbiz.qpic.cn/mmbiz_png/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tBPibAThdGZNJawZWOx7n1mzHo8E9mGOMeMhuibDzJpdMXAGaFxK3ux5Q/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
        <section></section>
    </section>
</section>

<section>
    
        <p>
            <br/>
         </p>
      <p>    社团简介
         </p>
        <p>
         <br/>
            </p>
                                    
</section>

<section>
    <p>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tTNNFnhHPbNTVlYyMYCibW0BcmKSTQG43aZPJNrBZtJ87hPFKmmCrMgA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
    
        
            <p>
                市场营销协会根据管理学院有关专业特点和市场营销爱好者发展寻求发展需要，为广大的同学朋友们提供了一个展现自我、提高自身能力的空间。市场营销协会将尽可能地为学生朋友们提供一个理论与实践相结合的机会，为市场营销爱好者创造一个良好的交流环境和学习锻炼的平台。
            </p>
            <p>
                <br/>
            </p>
       
   
</section>
<section>
    <p>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tjEFypRs8LOeTEQJyNXLVV7VnC2oceTXvvibHFSMRPthI3HrTur822Xw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
   
                                        <p>
                                            社团活动
                                        </p>
                                        <p>
                                            <br/>
                                        </p>
                                   
</section>
<section>
   
                <p>
                    内部营销大赛
                </p>
                <p>
                    <br/>
                </p>
           
</section>
<section>
    <p>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04ticNk3dib9ZSoHKvX0icYY569lDzTj2KPLEURTmr4ibHjster4qicQ1TQeXg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
    
                &nbsp;&nbsp;内部营销大赛作为市场营销协会的品牌活动之一，已经举办了好多届。作为一个旨在为社团内部人员提供营销实践的比赛，它可以给我们的社团人员提供一个平台去体验营销。通过这个内部比赛，可以让社员们积累经验，懂得营销，学会营销。
           
</section>
<section>
    
                <p>
                    广告创意大赛
                </p>
                <p>
                    <br/>
                </p>
            
</section>
<section>
    <p>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tl5JeTH7wduJ24hxuNSIvicn0a4Mlt5xO6hyXnbVkUCQqk2x2EKgwIaw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
    
            <p>
                广告创意大赛作为市协主打的面向全校学生的比赛，主要目的在于通过让同学们在实践中学会如何创作和策划一个品牌的广告，进而学会怎么样将广告与营销结合起来。在上一年中，我们的比赛受到了许多学生追捧，并且挖掘出了许多不错的idea喔~~
            </p>
            <p>
                <br/>
            </p>
        
</section>
<section>
    <section>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tROYicLYhX7FGJcWDPVps6pKqoibVYAxfdicGIolL2Er8v8npoNWsFHluA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p>
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tCa8bFKjKySy9kBXaobtu6AcTHEaEqCX6zNhuKicTMYHgqvJGRic1yeyA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>&nbsp;
            </p>
            <p>
                <br/>
            </p>
            <section>
                <p>
                    社团人员介绍
                </p>
                <p>
                    <br/>
                </p>
            </section>
        </section>
        <p>
            <br/>
        </p>
        <section></section>
    </section>
</section>
<section>
    <section>
        <section>
            <p>
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">主席团</strong>
            </p>
            <p>
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong>
            </p>
        </section><img class="" src="http://mmbiz.qpic.cn/mmbiz_png/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tDgEKdp1GaU6rXibobU2KXOJX4V0iaQWoHgJPcNgz7zP7eXaBcVKRshFQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
        <section></section>
    </section>
</section>
<section>
    <p>
        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tJibzRrSgozszp8GooNgicCRvTRFVdUYdnoB6g9PIBEYSxFUkdVMhNW0Q/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
    <section>
        <section>
            <p>
                &nbsp; 会长团是市场营销协会的决策层。它负责社团活动的策划，决定社团的发展方向。对外代表社团，对内协调各个部门。
            </p>
            <p>
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <p>
        <img class=" __bg_gif" src="http://mmbiz.qpic.cn/mmbiz_gif/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tXIvDiaiaVV0SB3uw0ECLEwHzvupgTkJDYicK9ycWnglhicHMGZAeERkfsA/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p>
        <br/>
    </p>
</section>
<section>
    
                        <p>
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">部门介绍</strong>
                        </p>
                   
</section>

<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p>
                            1
                        </p>
                        <p>
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">宣技部</strong>
                    </p>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong>
                    </p>
                </section>
            </section>
            <section></section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <p>
                                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tHxGV1D5jKLh5JYnSVGpJ9A3NlLtsUJI65tkl9nRRtQqia2p8ZU98H1Q/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                            </p>
                            <p>
                                <br/>
                            </p>
                        </section>
                        <section>
                            <section>
                                <section>
                                    <p>
                                        &nbsp; 负责各项活动传单喷画等宣传品的设计，以摄影、摄像等方式记录活动。设计、制作活动的宣传资料，负责舞台摆设、场地布置，反映市场营销协会的文化和风采。
                                    </p>
                                    <p>
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p>
                            2
                        </p>
                        <p>
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">外联部</strong>
                    </p>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong>
                    </p>
                </section>
            </section>
            <section></section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <p>
                                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tGHqfLhhBZUgDnVhPLiaAsb9AVUVJZqpZsk4MhwQtw8nerD6gcur2S1g/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                            </p>
                            <p>
                                <br/>
                            </p>
                        </section>
                        <section>
                            <section>
                                <section>
                                    <p>
                                        &nbsp; 负责信息，用我们的口才，交际，思维，耐心，颜（lian）值（pi）等来让有宣传需求的商家和有宣传渠道的我们平等对接是我们的职责。主要负责为我们的活动寻找尽可能最大有益我们的商家，为活动的成功举办提供必要的资金和物资。
                                    </p>
                                    <p>
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p>
                            3
                        </p>
                        <p>
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">学术部</strong>
                    </p>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong>
                    </p>
                </section>
            </section>
            <section></section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tCcSx7yeK5ACQ67LNaGGQadiaPHTJMjyp4mUC8l1s0rfIFf28BUGa3nA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                            </section>
                        </section>
                        <section>
                            <section>
                                <section>
                                    <p>
                                        &nbsp; 负责策划书的写作，策划社团活动，以及担负日常运营管理社团公众号的工作，进行社团各类活动的推文宣传。并协助其他部门完成比赛的布场与物资搬运的工作。
                                    </p>
                                    <p>
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p>
                            4
                        </p>
                        <p>
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">秘书部</strong>
                    </p>
                    <p>
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong>
                    </p>
                </section>
            </section>
            <section></section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <p>
                                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tfel94RaibVYmS5lbbia75SicPibziaSM7MicDGSHUfQKWgR8keR9ic2npRLVQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                            </p>
                            <p>
                                <br/>
                            </p>
                        </section>
                        <section>
                            <section>
                                <section>
                                    <section>
                                        &nbsp;&nbsp;是社团各项信息的集散中心，同时也是社团部门间交流的纽带。在这里，你可以学到如何申请活动场地，如何开展文书工作，如何与其他部门沟通哦。高颜值、还很会玩的师兄师姐在这等着你，你还在犹豫什么？！
                                    </section>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<p>
    <br/>
</p>
<p style="text-align: center;">
    <br/>
</p>',
			'2016.11.28', '2016.11.28', 
            'http://img4.imgtn.bdimg.com/it/u=1876538948,1307669552&fm=11&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/USxK2GlnIjSicyjiaY9on0gESH0JPzg04tTNNFnhHPbNTVlYyMYCibW0BcmKSTQG43aZPJNrBZtJ87hPFKmmCrMgA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(4,'演讲比赛','广东工业大学第一社团','<section>
    <section>
        <p style="margin-top: 10px; margin-bottom: 10px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbZxpThfD74PA6Mly4QuddhSckdZXgGibFtA852RMbl7SoJX4vliaM2sRA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
        </p>
    </section>
    <p>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                        曾有人说
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                        人啊，过的<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">平凡</strong>就好
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                        但我却渴望着
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">不平凡</strong></span>的生活
                    </p>
                </section>
            </section>
        </section>
        <section>
            <section>
                <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb2LKF0NchNvpKpJniadsfMVibuARaT8icoIibqibib3BtgT7Ficbqs81jbRPZw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">我想象着自己挥枪舞剑</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">站在武林之巅<br/></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">你说那是幻想</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">是<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">不可能</strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">但是</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">谁的人生不是一场</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 12px;">挑战不可能</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">的旅途呢</span>
                    </p>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <section></section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; text-indent: 2em; word-wrap: break-word !important;">
                                    战帖
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">12.3</strong>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">一号大教室</strong>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin: 0px 0.2em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: none; min-height: 1em; white-space: pre-wrap; width: 1em; float: right; display: inline-block; word-wrap: break-word !important; text-align: left;">
                                    武林大会
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 0; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    12.3
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">广工演说家</strong>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">最后一战</strong>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">挑战不可能！</strong>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">出战门派导师</strong>
                    </p>
                </section>
            </section>
        </section>
    </p>
    <p style="margin-top: 10px; margin-bottom: 10px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; word-wrap: break-word !important;">
        <br/>
    </p>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb0b9UghVDrsmo2c09II4sUyhGQxMAssnmbxEscO9d3CVAPD91OTGjUA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbnibj5jFvb1Zz2tCqbmsRdWVicm2UNYTlSzUDYBz22E5rTgQYM7fBPUuQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_png/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbiaEHKEngfjGpPN4tDQJWLAFySEIjibQwKeIH1gsiboqep93wdtCiblwFWQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbJdhlnBzC8XJic91yxcsuHGmLGYkoPYYUx9laFDdLZjl06PsAlgJJzSg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbYJQquKpYeIAW7PcqmHbKtyXX7jicnyJGb8W2LCQMsHgUUUtLd8HSBUw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBboEB5uvY6zb83Tic0aIK8PnBy7sWwFWHEQj96F49wqMyIp70eZvfUBQw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbHfQCYawrGG6PNSF4D3p75cRzwcesHvntDIhJ3OOWf685ohCibYw7RbA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbbhtY1CcoRoXtbNyObnVN6qToNWNAZcAfFzFh3IiaURmIRKyibKqbvpYw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">出战学员</strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">春秋争霸队</strong></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">谭丽老师门派</span><br/>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                        <section>
                            <section>
                                <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbze1n5DU69sqTdYWadyIicmPibAYsYZz0NswfEg7VWkqA87D9s7d9LxLQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <section>
                                <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb39GWlMyNdbV45c4bLSvOOoDeGvoWR4EQqrzprYsVfgG8Wx32R2XOJQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbpR8qZPj4fnlVEXUYZzAbzC93IxCwJ6rjzgVNAEoYd8WFG470tB3jhQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbjPkNYSUQNTgydh9q3WdC1E7Ktdn9ubRJuUoBj88kXicaPbyhOfLLzRQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbuLiaRe39pes4ZIoEGG68LcFiaSSLk4DUeG7J4wmSbVMZpia3PfbichRjew/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbkj5yD6ljaEhiaAdBxicMPg6mk9bUpaAvxqwEHG6BLFa0XHylOhPHMXicQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbp7SAXHicbGY2N9r4sndpA3H2h2icLenfz797N09GLhX9BMUrLAaRiaV6g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbVPJKTQQn1mQTCcAXF6hL8CmcFdD7vYC7WMxUTYlCkG2UFuksiaKN0pg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">鸣镝队</strong></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">张少慧老师门派</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb9jWNXaCC7EeI0AVy1Jx0nsTdsE1tgQ2M3pDZeEGCNbaxqo1VM8y02A/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbXqiaB2jD9mJscBz1ElWApGver2AUtbpUluPBBV0NI9PibUAkMc9ibg3Ew/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbkHAEAI2Shbj47JkgWvM5TicNWnftpEta5K7JsOicNfBtEUDaYJvk5bVA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbZI8EeXtcwYC4mJZ58qWgO0cFpDiaIs6IsBuLL9yN9tdRJ3F14seR8tg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbzUoxJJb0np4n2xgFm2k4S3njajWzq7iadPwfficCGF78YLkuGvVEaRmQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbOOmLbsGhmxVYbsyMzYeSgmNOyt8RNcIb3YQFrAiadkfcKUHkniaxJHuQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBblKH0yxqTibHMK50jQBicc4H2d7MvNibLbia5VHWb1LcQZBvduNHf1lktmQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBboamJD4h97V0MVhq72dMegqMwTKMIUPjVwzCewgrZRVM0amDxUdfHxw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">傲骨邶风队</strong></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">曹凤霞老师门派</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 12px;">由陈可唯老师出席决赛</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb0hrAclx6FdaNRVeMK8NKrjZb2ia2jKWsm52kXfwRWFEnbsrRYN5ADQg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb0EjcqsAyMMXpz4cO7dA3dVCgdny3NnrZJmPHnAO7dRdu6WicOshqVHg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb7nYDysjyibWU27p5gicEv6H4loP65jbBdIvWaMNrDvYhYJ8QTc1zp3lg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbO1G00VbS60iaoUaBaWRvYqHvI1fcTheUalcIPLLn93L7Qxgaib5ia57kg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb4CLicWibXicAalvibBIqViaoyiaqHk8JvTo3ib78yl0jDxWic1UKhKicEXE8Xiag/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbqxnqhtb6HVhD5E5jI1gETKu3wMpZiayr9GtcqqTn3YV8H0dz9HgKyeA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbvINWgXviaTibg4bPQ0YiaQaIMv7Q38RUsL0BPQwicOnn4z7WY6ryqJVRtQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb7mePrgWfHX7KjCHRRLe3aXa9jdic90P0MBClLN0icNANnqw8jcTXcpfA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;"><br/></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">▼▼▼</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">选手们需要你的支持！</span></strong>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">点击文末<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(213, 15, 37);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">“阅读原文”</strong></span></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">为你心仪的选手<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(213, 15, 37);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">投上一票</strong></span></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">截止时间为<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(213, 15, 37);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">周五下午16:00</strong></span></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">最后几个小时</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(213, 15, 37);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">“最佳人气奖”</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">最终花落谁家？</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 15px;">就差你这一票！</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">特邀嘉宾</strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="80%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbzsDtFFKicCj7eDlHb5I4AVB7d0ohxEiakf5K8clqfyibc4nuDPMk9z2Cw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbEYxWk5DNUPjyoViamt0ianDqxp4ZD1HibjzzHQe8xzicQlVamoiasKDHNXg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">评委嘉宾</strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="80%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb0KM0I0F95C2r6cVdyMOIert2ORDM1HgTiava80KD6XZQTztlb1kcibYA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbDq0XW5zkKJeffia22re4rRqSHtwJroz2ib6hO7Jv6Wg3KPwibtT88txBA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="80%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbqLkkibEh1uDNz9rg9TBCQTyPcVD0icUmBTzd6dE2SDfbNRk0kQjWHk0g/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb1ztCxydFvOF3EUBd0QSiagDrznkC4eSdADqV9W0pH1yExvas6gX6sKw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="80%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb3Kzn1N91zLyKSs6oumhFqOcdgrjByxqSjVKgNqSVTe14RcTt8M4niaA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbQibbbxWfNbGC40zpLn75ekX5NlqibekVF5YJJV6lxQRLibnXiaTibFv1Qsg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img width="80%" src="http://mmbiz.qpic.cn/mmbiz_png/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbBiaQBoaibqyateJwrLibKIoibywGmkkYhWdzgq2M679ic8fzr7bW54G9nvA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbDkWt2ZFZdCwW1NibfIXxiaictc9PSZyOY8B8eqVb11JBEczIpTz2o7N4g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">表演嘉宾</strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <img width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbSR8f71U8zJRs97jmibgkFugZ13icwKSbRiaExibmdB0NmY3yjqiamdPvDaw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <img width="85%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb2EtvuIQHSn3Z9BzVA6U0nl33m0EThVz7tahjOcrvcRic4niceweIRbPQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbvBIvFuDicGKXicuR9Zp8PUIH6CWHxJt58oh9atP3z0tfKLiayN14f2fzg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <img width="85%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbX2FnZialZrf4icDd62NWibFNP9ibB6mlD3icc6IoEicGyPhr2mm34t4VzTnA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb2MTmpO5tSEPJN31ENIK9vaG6tAHrEuUXsHnicRic6HfpCPplc7Ef9oibQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <img width="85%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbEOy0OZsl0Ytd2QLmkfksowxQMT5MErAEYahDqQzbTylqaFJXjIfOLg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <img class="__bg_gif" src="http://mmbiz.qpic.cn/mmbiz_gif/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbfRXxswrEq3WSZ6oUZybsHpCjDRHtWB666HG5R0MIbhQpWTTwnnrZmw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            还有
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            超级丰厚的
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">观众奖品</strong>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <section>
                <section>
                    <img class="__bg_gif" src="http://mmbiz.qpic.cn/mmbiz_gif/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbfRXxswrEq3WSZ6oUZybsHpCjDRHtWB666HG5R0MIbhQpWTTwnnrZmw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    &nbsp;1&nbsp;
                </p>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">进场就送！</strong>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <img width="70%" src="http://mmbiz.qpic.cn/mmbiz_png/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb6cOmTBwmqhFQ15k5qTaR6qn9XGDtnELUxlA4ynWPZgia1UlnTkz8dHA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                1.<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">百威魅夜鸡尾酒</strong></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                2.时长条
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    &nbsp;2&nbsp;
                </p>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">现场抽奖~</strong>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: center; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                一等奖：<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">iPadmini2</strong></span>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <img width="60%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBb9WfNGvGnGEeqsA4dqKjLFiaQ5DZhEfn7SgO4pGzkzJVJZzTwiakYB73Q/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                二等奖：<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85);">拍立得富士mini8</span></strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <img width="60%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbgFoeN4wLQYR8ibibtZAuGrW0Qo3I4WvibL5k4z30SE5W0znTPLtqhdETw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; text-align: left; word-wrap: break-word !important;">
                三等奖：<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85);">贴心早餐机</span></strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <img width="60%" src="http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbrskibYUw4GfltdCtrTdfEdsa02GE3ThwIulWFktt1Fdf8nDmC6ZNyXQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    &nbsp;3&nbsp;
                </p>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">神秘大奖？</strong>
                </p>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">海马体照相体验券</strong>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(160, 160, 160);">（这个绝对是惊喜哟~）</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; word-wrap: break-word !important; text-align: left;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(160, 160, 160);"><br/></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">▼<br/></strong></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">抢抽奖券</strong></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">方式1：</strong>在“<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">广东工业大学广播台</strong>”公众号页面回复“<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">抽奖</strong>”，即有机会获取“抽奖券”哦。（仅剩200张抽奖券，快来行动吧！）</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><br/></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">方式2：</strong>在推文下方留言区留言，说说你对“广工演说家”决赛的期待，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">进入留言区</strong>的宝宝，即可凭借“<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">留言通知页面</strong>”于<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">周六17:30前在一号大教室</strong>领取“抽奖券”。</span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(160, 160, 160);"><br/></span></span>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(123, 104, 238);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(160, 160, 160);">（越多抽奖券，中奖几率就越大哦，快来抢券吧！）</span></span></strong>
            </p>
        </section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section></section>
            </section>
        </section>
        <section></section>
        <section></section>
    </section>
</section>
<section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 19px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">12 月 3 日晚 19 点</strong></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgba(38, 38, 38, 0.941176); font-size: 19px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">广东工业大学大学城校园</strong></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 19px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">一号大课室</strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 19px;"></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 19px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><br/></strong></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">“我与高水平大学建设”系列活动</strong></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">&nbsp;——广工演说家决赛</strong></span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px;">巅峰对决，一睹为快！</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; word-wrap: break-word !important; text-align: left;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px;">快来支持你心中的武林盟主吧！</span>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(240, 65, 85); letter-spacing: 0px;">演说武林霸主的诞生</strong><br/>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; text-align: left; word-wrap: break-word !important;">
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">等你见证！</strong>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</section>
<section>
    <section>
        <img class="__bg_gif" src="http://mmbiz.qpic.cn/mmbiz_gif/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbBVp5eYwLlL466AD1mibFdNQDBooFfml2563WpdiantzTdTzzVldVTFAQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
    </section>
</section>
<p>
    <br/>
</p>
<p>
    <br/>
</p>',
			'2016.11.28', '2016.11.28', 
            'http://img4.imgtn.bdimg.com/it/u=1876538948,1307669552&fm=11&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/vqAA6phy77ibwSTQQzjZAibgputYDtsPBbZxpThfD74PA6Mly4QuddhSckdZXgGibFtA852RMbl7SoJX4vliaM2sRA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(5,'新媒体足球赛','广东工业大学第三社团','<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/yS0Sq4VRmIOMwSPNnN6JI3f5fCZjibibNcMv3RmoCqexnFVjfHAYN609LPIDtkJZezMRwe9xzETECyNhM7NXEomA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <section></section>
                </section>
                <section>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 24px; color: inherit; border-color: rgb(117, 117, 118); box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; font-weight: inherit; text-decoration: inherit; line-height: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">破门乏术，总射正</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 24px; color: inherit; border-color: rgb(117, 117, 118); box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; font-weight: inherit; text-decoration: inherit; line-height: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">握手言和</span>
                            </p>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
    <section>
        <section>
            <section>
                <section>
                    <section></section>
                </section>
                <section>
                    <section></section>
                    <section></section>
                </section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 2em; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 104, 39);">北京时间11月30日16:30</span>，广工大校园足球联赛第九轮一场焦点战在大学城校区国防生训练场展开较量，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机学院</strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 104, 39);">0比0</span>战平老牌劲旅<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物理学院</strong>。
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 2em; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
                    本场较量可谓势均力敌。上半场两队拼抢激烈但都未能创造出太好的破门良机。
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 2em; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
                    下半场计算机<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">宋伟航</strong>主导一次反击，传中后可惜没人能跟上接应，物理学院<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">梁文滔</strong>接队友传中头球攻门被<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">刘懿涛</strong>扑出。
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 2em; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
                    最终，双方<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 104, 39);">0比0</span>握手言和。
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;">本场首发</span></strong><br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
                本轮比赛计算机全主力出征。校队主力门将<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">刘懿涛</strong>因伤病轮休两轮后本轮复出，后防线继续由<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">崔志德</strong>领衔，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">李光辉</strong>、<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">杨坚新</strong>左右护法；中场<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">宋伟航</strong>、<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">周润琨</strong>组织扫荡；前场<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">王镜荃</strong>突前。
            </p>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: inherit; font-size: 30px;">REVIEW</span>
            </p>
        </section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-color: rgb(33, 33, 34); color: inherit;">◆</span>
                        </section>
                        <section>
                            <section>
                                <section></section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-color: rgb(33, 33, 34); color: inherit;">◆</span>
                    </section>
                    <section>
                        <section>
                            <section></section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
        <section>
            精彩回顾
        </section>
    </section>
    <section>
        <section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; letter-spacing: 6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
        <section></section>
        <section>
            <section>
                <section>
                    <section>
                        1
                    </section>
                </section>
            </section>
        </section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
        <section>
            <section>
                <section>
                    <section></section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;">第6分钟 <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">王镜荃</strong>中场拿球，抬头观察后，<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">斜传左路</span>，李光辉左路跟上<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">右脚打门</span>，皮球偏出球门。</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <img src="http://mmbiz.qpic.cn/mmbiz_gif/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImfFZyPUwNxQ8MicX1jBYXsOsiciaxhMpR5icb6pbccpL2kemQLc8GMntxS6Q/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
                        </p>
                    </section>
                </section>
            </section>
        </section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <br/>
            </p>
        </section>
    </section>
    <section>
        <section>
            <section>
                <section>
                    2
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section></section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;">第36分钟 物理学院曾达中场摆脱计算机两名队员的防守后，带球至禁区前沿倚着防守队员大力远射，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">刘懿涛</strong><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">倒地扑救</span>，皮球<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">滚出底线</span>。</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img src="http://mmbiz.qpic.cn/mmbiz_gif/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImfffJkNGarR2CDbaUWialiaBHAmRpWcCQbsey2zv8Y35CcGibAOxqHxhgcg/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    3
                </section>
            </section>
        </section>
    </section>
    <section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
    </section>
    <section>
        <section>
            <section>
                <section></section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;">第40分钟 计算机打出反击，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">李光辉</strong>送出直传，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">宋伟航</strong>边路突破<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">下底横传门前</span>，可惜球的线路过于靠近门将。物理门将将球保护下来。</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img src="http://mmbiz.qpic.cn/mmbiz_gif/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImflmHnWSpfobicwWTkul6ksWAueSL12rS2CVtgePkhy2ch210JrDmomiag/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    4
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section></section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;">第54分钟&nbsp;<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">李光辉</strong>后场左路送出长传，前场<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">周润琨</strong>在对方禁区内拼抢下皮球后<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">一脚捅射</span>。皮球滑门而过。</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img src="http://mmbiz.qpic.cn/mmbiz_gif/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImfD1UicqB1lL2L5nOtibzpv7917Esm10RNg52znvIYtHU3hqlgGRa35uMQ/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    5
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section></section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;">第58分钟 物理学院前场右路送出高球传中，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">梁文滔</strong>禁区内力压计算机防守队员抢点头球攻门，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">刘懿涛</strong>倒地将球<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">扑出底线</span>。物理学院错过本场比赛改写比分的最佳机会。</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img src="http://mmbiz.qpic.cn/mmbiz_gif/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImfhFg2QI8ejhEEv7HVP8icAUunFABGcOB6P7dUAu8zSsfhDGZnWbryltQ/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    最终
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    主裁判一声哨响结束了全场比赛
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    两队在一场激烈的白刃战之后
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 104, 39);">互交了白卷</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    END
                </section>
            </section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img src="http://mmbiz.qpic.cn/mmbiz_jpg/yS0Sq4VRmINDk3KZHg2kcMhUGHo4gImfJTg3eRPO3S8ettTbkY0j1tgQlXOFqILP6WSvpyPEpOqhR8ygggZwtQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
            </p>
        </section>
    </section>
    <section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
    </section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 255, 255);">战绩及赛事预告</span>
                    </section>
                    <section></section>
                    <section></section>
                </section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 20.48px; text-align: justify; text-indent: 32px; color: rgb(0, 0, 0); background-color: rgb(252, 252, 252); box-sizing: border-box !important; word-wrap: break-word !important;"></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: Calibri; box-sizing: border-box !important; word-wrap: break-word !important;">这轮比赛结束后</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体; box-sizing: border-box !important; word-wrap: break-word !important;">计算机学院以</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体; font-size: 14px;">6<span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">胜</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; font-family: Calibri;">2</span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">平</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; font-family: Calibri;">1</span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">负积</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; font-family: Calibri;">20</span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">分</span></span></span></strong>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 104, 39);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体; box-sizing: border-box !important; word-wrap: break-word !important;">位居第三</span></strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">落后排名第一目前少赛一场但仍旧保持全胜的管理学院</span>4<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">分</span></span></strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 20.48px; text-align: justify; text-indent: 32px; color: rgb(0, 0, 0); background-color: rgb(252, 252, 252); box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span></strong>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 20.48px; text-align: justify; text-indent: 32px; color: rgb(0, 0, 0); background-color: rgb(252, 252, 252); box-sizing: border-box !important; word-wrap: break-word !important;">预告</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); line-height: 20.48px; text-align: justify; text-indent: 32px; background-color: rgb(252, 252, 252); box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 104, 39); box-sizing: border-box !important; word-wrap: break-word !important;">12月4日 星期日 14:30</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px;">计算机学院VS研究生院</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(0, 0, 0);">大学城校区</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(255, 104, 39);">国防生训练场</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: 25.6px; text-align: right; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: 25.6px; text-align: right; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">计算机学院宣委会</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: 25.6px; text-align: right; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">二O一六年十二月三号</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/yS0Sq4VRmIMYqf7BLKWiblWwfJPicUTqQqZm56hZVbBRXy1axTTEhG6lrHiaXuou3gxB2W55P7uVKPlUjehKBdicMw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="text-indent: 2em;">
    <br/>
</p>',
			'2016.11.28', '2016.11.28', 
            'http://img1.imgtn.bdimg.com/it/u=3282153924,887064031&fm=21&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz/yS0Sq4VRmIOMwSPNnN6JI3f5fCZjibibNcMv3RmoCqexnFVjfHAYN609LPIDtkJZezMRwe9xzETECyNhM7NXEomA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1');           
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(6,'女生节','广东工业大学第四社团','<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">11月25日晚，广东工业大学第一届女生节闭幕式在大学城校园3号大教室顺利举行，为期一周的第26届女生节“<span style=";padding: 0px;max-width: 100%;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important"><strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">芳华待展，卓越生知</strong></span>”也在此圆满落下帷幕。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">出席本次闭幕式的嘉宾有校团委书记张育广、校学生会指导老师张超、计算机学院学生会指导老师周彬、</span><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">校学生会主席团、校级、院级学生组织代表等。</span><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;text-indent: 0em;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupiaiajxdokzCG8MUQF68JA91uXYlhkoREic55cicMic7tGoz8j3sqia0UGZ6A/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;text-indent: 0em;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupuAoR0S2mE26kplMvIm6uGFg3ribUBcX8oPur5hTes9bDRDz9Uibws17Q/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0);font-size: 14px">首先，由校拉拉队带来精彩的开场表演</span><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0)">“</span>worthit ＆ daddy”</span><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0);font-size: 14px">，掀起了全场观众的热情。</span><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0)"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;text-indent: 0em;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0);font-size: 14px"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupabYtAwZ8YF3pcgxd40NBxMe45AVPdByRmBrYLntUbMCpLJzFqtHDgw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0);font-size: 14px">整场晚会以<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important"><span style=";padding: 0px;max-width: 100%;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important">“芳华待展”、“卓越生知”</span></strong>两大板块为主题，邀请<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important"><span style=";padding: 0px;max-width: 100%;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important">”最美女生“</span></strong>评选活动中获奖的女生进行<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important"><span style=";padding: 0px;max-width: 100%;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important">&quot;最美女生分享会&quot;</span></strong>。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            <br/>
                        </p>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;box-sizing: border-box !important;word-wrap: break-word !important">
                            <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">“创新创业”得奖者<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">方艺晓</strong>:</span>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupq2SWzo7sJJbDf5ticZu0m2LcgtOytvWhC7VRWnIn5xMk2QoSYvr6hHw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(136, 136, 136)">“不要怕梦想太遥远，只要有了想法，你就尽自己所能去尝试”</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(136, 136, 136)">“种一棵树最好的两个时机一个是十年前，另一个就是现在”</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(0, 0, 0)"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            “博学多才”得奖者<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">莫海媚</strong>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHuprpb24pCpFvRRkg1ZnpGubHrzzp08F7OwfrX0MlJyjkOA6WYKOUKxVQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(136, 136, 136)">“好好珍惜自己的大学生活，不要等到结束才想要好好开始，</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(136, 136, 136)">努力前进，克服不自信，坦坦荡荡走下去。”</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            “志愿公益类”获奖者<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">蓝露璐</strong>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;font-family: 宋体;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHup3OJS3s8lPxKp8JxvPWgyAic7dHKTI87fjP84dt1yHruHJHny61sx3iag/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style=";padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);line-height: 25px;text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(136, 136, 136);font-size: 14px"><span style=";padding: 0px;max-width: 100%;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important">“</span>不要自卑，也不要吝啬你的那颗志愿心，而应该为此感到骄傲。<span style=";padding: 0px;max-width: 100%;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important">”</span></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;box-sizing: border-box;clear: both;min-height: 1em;white-space: pre-wrap;word-wrap: break-word !important">
                            “道德弘扬类”获奖者<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">谢冰倩</strong>
                        </p>
                    </section>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupMtIwiazLUBtkdzibyRsIFz7rfVPZ824moGNkd7J4n5n01WDQBjC9NJTA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(136, 136, 136);font-size: 14px">“集体的常绿源于个人的萌新。”</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;font-family: 宋体;color: rgb(0, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">在女生节闭幕式中，穿插着许多精彩纷呈的表演，一次又一次掀起了观众的热情，赢得阵阵掌声。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style=";padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);line-height: 25px;text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">第21届校园十大歌手比赛的亚军<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">罗子廉</strong>进行返场演出，一首《雾之恋》，悦耳清新，让全场沉浸歌曲的雾中、雨中、风中。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHup1Hb5GZlJY3foMfDchsCfQicD02n21yX63YNUzqIrNPQB3aaY55s1V2A/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important"><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">天籁歌友会</span></strong><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">进行演唱，High翻了全场，每一首曲目都表达着对女生最美好的祝福。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;text-indent: 0em;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupv7pQCU2w3R3VE6mjsRnsAk0GB72dwfSIRIOXvickKccNseN1vH7GDAQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHup0n9gpiaOA1xdwToCZFZ81ZgibTQrNqssYd3t7uiaDgxl18vyL65cjgsgA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">一场名为“魔幻魅影”的魔术表演以魔术师出神入化的技法吸引了观众们的目光。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;text-indent: 0em;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupy9ysKFoBzIHntEa1fBtwkup1frk6Uk6pv0P5oPCXHz30VWGFfLamicQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHup8dOOQumwdhBt1ich7jAkxP4XdiaQFsIlhvDJbJJK1SKeicdVwdicQLvBYQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">最后，十大歌手冠军<strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">曾宗彦</strong>进行压轴演唱，一曲《花开那年》，细腻、富有层次感的声色，勾勒出我们都共同拥有的花开记忆。</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHuputvUz4LLIa4UIbicwlKGKaro1E74p91GOib7FQBoknbqKXoA9Wwy4mqg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-indent: 2em;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px">晚会期间还穿插这生动有趣的抽奖环节，昨晚，最美的你，拿到<span style=";padding: 0px;max-width: 100%;color: rgb(171, 25, 66);box-sizing: border-box !important;word-wrap: break-word !important"><strong style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important">彩虹蛋糕</strong></span>了吗？</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(178, 178, 178)"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupQEa6YI8icXibaBoIgiaYHsqsdepp5ZGibESsm23XXwtHlvBHJD86NrMAibg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important">
    <br/>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(178, 178, 178)">图｜校学生会　信息技术部</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: pre-wrap;color: rgb(62, 62, 62);font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important">
    <span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;color: rgb(178, 178, 178)">文｜校学生会　秘书部</span>
</p>
<p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;max-width: 100%;clear: both;min-height: 1em;white-space: normal;color: rgb(62, 62, 62);background-color: rgb(255, 255, 255);font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmPdGic6icvo17kyFRKuV6pwYJibwpTB2micD2BPNk8jTDzwmzrT4u7RFTDKJMiauicLOAjZxReiaJFv12jQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p>
    <br/>
</p>',
			'2016.11.28', '2016.11.28', 
            'http://awb.img.xmtbang.com/img/uploadnew/201510/23/3d56e2012b0c4cb691e2c7d605f56a1f.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmUiaXPwN8ACncYP4zptyHupiaiajxdokzCG8MUQF68JA91uXYlhkoREic55cicMic7tGoz8j3sqia0UGZ6A/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');           
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(7,'第十届女生节淘宝街微创业风采展示大赛','广东工业大学第三社团','<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; text-indent: 0em; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_png/eggPLbdx4ElicoZMugNSm6pxC1ewHpD0Yu5PbOe2fuRPywEUTNfykn7Zm1vJUoknD0iapUl9MdE5pgxKYicuF2bpA/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">2016年11月27日19：00，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 122, 170); box-sizing: border-box !important; word-wrap: break-word !important;">第十届女生节淘宝街微创业风采展示大赛</span></strong>于大学城校园教四-301成功举行！接下来请跟随雁阵菌的步伐，看看这场大赛都有什么亮点吧！</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p></p>
<section>
    <section>
        <section>
            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑; line-height: 25.6px; white-space: pre-wrap; font-size: 20px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong>
        </section>
        <section>
            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;">现场回顾</span>
        </section>
    </section>
    <p style="text-indent: 2em;">
        <br/>
    </p>
</section>
<section>
    <section>
        <section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <section>
                <section>
                    <section>
                        <img class="" height="auto" title="" width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfoIrhkXOgOK614WcjnA8zsMicuZoufiayV6uXnbpPicWicFRIuzfAL7MXvQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </section>
                    <section>
                        <section>
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px;">教四202｜店主与嘉宾在前往现场的路上</span></strong>
                        </section>
                        <section>
                            <br/>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <img class="" height="auto" title="" width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfuVPianIbWnFCyImGSo0hyKvrR6OtnyRWEFbPoIJzmchTmumYiadoZkvw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </section>
                    <section>
                        <section>
                            <section></section>
                            <section>
                                <section>
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px;">进场｜工作人员指导店主签到入场</span></strong>
                                </section>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <br/>
                            </p>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section></section>
                    <section>
                        <section>
                            <section></section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px;">开场｜主持人登场</span></strong>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 1.6;"><br/></span>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">微创业大赛的帷幕拉开</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">他们亭亭直立</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">显示出大赛的磅礴气势</span>
                            </p>
                        </section>
                    </section>
                </section>
            </section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <br/>
            </p>
            <section>
                <section>
                    <section>
                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfLIdlsrl0oDUnXySQ9pN3ohY23OXILWicHsJaDQuJ4AEOFQQWmvG9HmQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </section>
                    <section>
                        <section>
                            <section></section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px;">嘉<span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 1.6; box-sizing: border-box !important; word-wrap: break-word !important;">宾｜四位神秘嘉宾莅临现场</span></span></strong>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 1.6;"><br/></span>
                                </p>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">作为评委的他们<br/></span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">会给选手带来怎样的挑战？</span>
                            </p>
                        </section>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <section>
                        <section>
                            <section>
                                <section></section>
                            </section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">下面让雁阵菌来介绍一下四位<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(27, 121, 178);">神秘嘉宾</span></strong>吧！</span>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <section></section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <img class="" height="" title="undefined" width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfmxECOAPbiaDttEzTsYDYIpdx3Ght63GhickGVQXpBPZic7dNE0sMSpvcg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(84, 141, 212);">廖渤峰</span></strong></span>&nbsp;| 创凡文化传播有限公司CMO
                            </p>
                        </section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <section>
                            <img class="" height="" title="undefined" width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mf2SugoGfIU9GUhOeHV0rFbev1YsrTiangreXKwtsRO4EaxCBnZ60vJ9g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(84, 141, 212); font-size: 18px;">叶日成</span></strong>&nbsp;| 小贝科技CEO
                            </p>
                        </section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(84, 141, 212);">黄辉</span></strong>&nbsp;| 九元航空公关部总经理
                            </p>
                        </section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                    <section>
                        <section>
                            <img class="" height="" title="undefined" width="100%" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfFlpApTic11MsIqHmibNCe5rhyNqk2OYFvKSduKXWrIu2Iy087hVqeSmQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(84, 141, 212);">崔其荣</span></strong>&nbsp;|&nbsp;<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: inherit;">广州聚爱文化传播有限公司市场经理</span>
                            </p>
                        </section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <section>
                <section>
                    <section>
                        <br/>
                    </section>
                    <section>
                        <section></section>
                    </section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">好了，神秘嘉宾登场完毕！</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">接下来就是入选店主们的舞台啦</span>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <img title="undefined" class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfOVPwCsQHtk80v9fQ8OxhNofEskhCoGwmcnVDndKFMCar4hfUicWBJicQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </section>
                    <section>
                        <section>
                            <section></section>
                            <section>
                                <section>
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">比拼｜听众们做好准备</span></strong>
                                </section>
                            </section>
                        </section>
                    </section>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">店主们将在舞台上展示风采</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">回眸那一段淘宝街的时光</span>
                            </p>
                        </section>
                    </section>
                </section>
            </section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; font-size: 20px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong>
                                </section>
                                <p style="margin-right: 1em; margin-left: 1em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64); word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;">店主展示</span>
                                </p>
                                <p style="margin-right: 1em; margin-left: 1em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64); word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;"><br/></span>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfUQVQXq7mZzsthf5sMiaQicmgGDtATggkh5CN7MbJRygs78H2HRCptmBQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">▲戴着可爱小帽子的店主</span></strong>
                    </p>
                </section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfnBIElfjcleaffiaVmwEk8ckricAHoeszhr3xsHeo93OPu3bI5OpW6xxQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">▲强强三剑客</span></strong>
                    </p>
                </section>
            </section><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;"></span></strong>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mf5EhSNo9AaRCycVe30o6lnRgbqZgU0IzW9UBwibPFLtK8NO3Yv3Diceaw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">▲&nbsp;穿上正装正气凛然的店主们</span></strong>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <br/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfVJ8nUiakfpgUHvwmTbOWSUAPiaEbShpsXmF9hWGahl5ukrN9IPkq6o8g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">▲这是属于店主们的舞台</span></strong><br/>
            </p>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfjZeRtlZaG3GCMYecGNavZZhmNjZsytqHxtMrc7GHLN7mSqr31yjvtg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px; line-height: 1.6;">▲气势昂然的五人阵容</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 1.6;"><br/></span>
            </p>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">看到这里</span>
                    </p>
                    <section>
                        <section></section>
                    </section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">评委肯定有很多话想问店主们</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">让我们进入下一环节吧！</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                </section>
            </section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <br/>
            </p>
            <section>
                <section>
                    <section>
                        <p style="margin-top: 0.2em; margin-bottom: 0px; padding: 0px 0.5em 5px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom: 1px solid rgb(107, 77, 64); border-top-color: rgb(107, 77, 64); border-right-color: rgb(107, 77, 64); border-left-color: rgb(107, 77, 64); box-sizing: border-box !important; word-wrap: break-word !important;">
                            <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; line-height: 25.6px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong><br/>
                        </p>
                        <p style="margin-right: 1em; margin-left: 1em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64); word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;">评委提问</span>
                        </p>
                        <p style="margin-right: 1em; margin-left: 1em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64); word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;"><br/></span>
                        </p>
                    </section>
                </section>
            </section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfuOBRgkM51LRnRGyloAqNgc6xicCXFeibnMnl2HHvjsgrs7VkBOiaSeJSQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfhnHghyP27wTPWM456HpwBbT2rlzVIwAialYJx27Les6reZBDCbulwTg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfKlHXnAzT3vkz3Lib6P4sPHnr93mkrHugCRibgibW52PZ3CYVt5dyhcTIg/0?tp=webp&wxfrom=5&wx_lazy=1"/>
            </p>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">你问我答<br/></span>
            </p>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">传达的不是回应</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">而是<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 122, 170); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">收获</strong>、<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">分享</strong>、<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">共赢</strong></span></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
            <section>
                <section>
                    <section>
                        <section></section>
                    </section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">嘉宾的提问发言</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">可以说让我们受益匪浅</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">店主们也学到一点小技巧，</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">不过，嘉宾们还准备了丰富的历练</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">一场<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 122, 170); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">微创业沙龙</strong></span>要开始了！</span>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                        </p>
                    </section>
                </section>
            </section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; font-size: 20px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong>
                                </section>
                                <p style="margin-right: 1em; margin-left: 1em; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 1em; border-color: rgb(107, 77, 64); word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">微创业沙龙</span>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 8px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-size: 12px; height: 32px; border-bottom: 1px solid rgb(227, 227, 227); line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <strong class="" style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-bottom: 2px solid rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); color: rgb(0, 0, 0); display: block; float: left; font-size: 16px; line-height: 28px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(27, 121, 178);">创凡文化传播有限公司</span></strong>
                                </p>
                            </section><br/>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfldkr9c2lsBz62vZXLqVkoicZ7POzOpq54bKkFTCQjIUxhOt3cWMiaqrw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(0, 122, 170);">廖渤峰</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">为我们介绍了创凡文化传播有限公司</span>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">为我们介绍了他的创业经历与成长历程</span>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">由四处实习与实践，到今天的成功</span>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">是一个漫长的过程</span>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <section>
                                        <p style="margin-top: 8px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-size: 12px; height: 32px; border-bottom: 1px solid rgb(227, 227, 227); line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
                                            <strong class="" style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-bottom: 2px solid rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); color: rgb(0, 0, 0); display: block; float: left; font-size: 16px; line-height: 28px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(27, 121, 178);">小贝科技</span></strong>
                                        </p>
                                    </section><br/>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mf2SugoGfIU9GUhOeHV0rFbev1YsrTiangreXKwtsRO4EaxCBnZ60vJ9g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">叶日成</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">以简洁形式向我们分享他的创业道路经历</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">毕业于广工的他</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">有过辛酸有过喜悦</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">如今的他以一名成功者站在我们面前</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">以一名导师指导我们如何走向成功</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <p style="margin-top: 8px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-size: 12px; height: 32px; border-bottom: 1px solid rgb(227, 227, 227); line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <strong class="" style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-bottom: 2px solid rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); color: rgb(0, 0, 0); display: block; float: left; font-size: 16px; line-height: 28px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; color: rgb(27, 121, 178);">九元航空公司</span></strong>
                                    </p>
                                </section><br/>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfTl4w39NtXxdz2ncURtTZELTDxwOQgYA2UeXfgiazLC8hVo1hhC20PrQ/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                                <section>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(0, 122, 170);">黄辉</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">作为九元航空公司的公关部总经理登陆广工</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">向我们介绍九元航空公司的发展前景与强大的商业背景</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">他们的特色服务理念</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 1.6;">启发我们如何在服务行业上取得优势</span>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <br/>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <br/>
                                    </p>
                                </section>
                            </section>
                            <section>
                                <section>
                                    <p style="margin-top: 8px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-size: 12px; height: 32px; border-bottom: 1px solid rgb(227, 227, 227); line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <strong class="" style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-bottom: 2px solid rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); color: rgb(0, 0, 0); display: block; float: left; font-size: 16px; line-height: 28px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; color: rgb(27, 121, 178);">聚爱文化传播有限公司</span></strong>
                                    </p>
                                </section><br/>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <img class="" src="http://mmbiz.qpic.cn/mmbiz_png/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfsRAvkcAANwcuUlzxtUlxxfOOQfC4gxSWVcVl6QnmibaoQp5icKPyp7Dw/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                                </p>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                                <section>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(0, 122, 170);">崔其荣</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">是聚爱文化传播有限公司的市场部经理</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">他向我们分享名言“<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 122, 170); box-sizing: border-box !important; word-wrap: break-word !important;">不忘初心，方得始终</span></strong>”</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">一句简单不过的话却蕴含着他的历练与精华</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">他也强调过</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">合适的团队有多么重要</span>
                                    </p>
                                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                        <br/>
                                    </p>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <br/>
                        </section>
                        <section>
                            <section></section>
                        </section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">四位嘉宾各有风采</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">他们的经验分享可以说是我们的宝典</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">实在是“<span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 122, 170); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">听君一席言，胜读十年书</strong></span>”！</span>
                            </p>
                        </section>
                    </section>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <section>
                    <section>
                        <section>
                            <section>
                                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; font-size: 20px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong>
                            </section>
                            <section>
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;">抽奖环节</span>
                            </section>
                        </section>
                    </section>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfgRgRIBvZqt0F3APy41XvBjUGyZeTIGHELZH6uoQp8dMqHVDyFl7J5g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </p>
                </section><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">&nbsp;四个电话只有一个是正确的</span>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">恭喜幸运观众拨通主持人的电话！</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">一台蓝牙小音箱</span>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">一台美的电磁炉</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">属于两位小幸运星！</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                        </p>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0.2em; margin-bottom: 0px; padding: 0px 0.5em 5px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom: 1px solid rgb(107, 77, 64); border-top-color: rgb(107, 77, 64); border-right-color: rgb(107, 77, 64); border-left-color: rgb(107, 77, 64); box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; line-height: 25.6px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong><br/>
                                </p>
                                <section>
                                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">颁奖环节</span>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
                <section>
                    <section>
                        <section>
                            <br/>
                        </section>
                        <section>
                            <section></section>
                        </section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">激烈的比拼过后，</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">就到了评选三名优胜店主的时候了，</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">到底谁才是最后胜者呢？</span>
                            </p>
                        </section>
                    </section>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfefiafcicnPFJm7hVheseaqib6SJ6iaXsXrXVzgqbeULm2aNpMUdjNDsF1A/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </p>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">一等奖获得者：<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">M相馆</strong></span><br/>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">二等奖获得者：<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">地震屋</span></strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfpTE4xGxN8oQibwXSKuaahroTuKeM107oLo3EnlmIIquynOSMibAI99NA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(136, 136, 136); font-size: 14px;">三等奖获得者：<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">陪你走过广工大</strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px;"><br/></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px;"><br/></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
                <section>
                    <section>
                        <section>
                            <section>
                                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; white-space: pre-wrap; font-size: 20px; color: rgb(27, 121, 178);">微创业风采展示大赛</span></strong>
                            </section>
                            <section>
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; color: rgb(0, 0, 0); font-size: 14px;">圆满结束</span>
                            </section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; font-size: 14px;"><br/></span>
                            </p>
                        </section>
                    </section>
                </section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 0; word-wrap: break-word !important;">
                        <img class="" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfZhrgyWHpkZY1AKkefGsoGpAANzhWN4GlZM9VE65Vnz0vdcTsWVT8WA/0?tp=webp&wxfrom=5&wx_lazy=1"/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6; font-size: 12px; color: rgb(136, 136, 136);">落幕｜最后三名胜者腾空出世</span>
                    </p>
                    <section>
                        <section>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <br/>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">大赛得以圆满结束</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">店主们也受益良多</span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">这里没有失败者，只有<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(27, 121, 178);">收获者</span></strong></span>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <br/>
                            </p>
                            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                <br/>
                            </p>
                        </section>
                    </section>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <img class="" title="金属质感分割线" src="http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfAcTicUDqWiasfTQctpFyvKTx9VRnIFiciczII7AzYvUW59NJ6a5DVlevPA/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                        </p>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(227, 108, 9);"><br/></span></strong></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">淘宝街已经过去了</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">许愿树也会离去</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">但是，我们仍然会在这里</span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">明年，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">我们还会再见</span></span>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; font-weight: inherit; line-height: 1.4; box-sizing: border-box !important; word-wrap: break-word !important;">记住，这是我们的约定</span>
                    </p>
                    <section>
                        <section>
                            <section>
                                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                                    <br/>
                                </p>
                            </section>
                        </section>
                    </section>
                    <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: normal; font-family: sans-serif; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important; overflow-wrap: break-word !important;">
                        <img src="http://mmbiz.qpic.cn/mmbiz/eggPLbdx4EkZIvmibf8dnpFoGqIPxniaSGtE1rkev59v1jXU7Um4OQcwCyP8AaR2nn3c2eAR1YI2rnia58TEMSD7g/0?tp=webp&wxfrom=5&wx_lazy=1"/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</section>
<p></p>
<p style="text-align: center;">
    <br/>
</p>',
			'2016.11.29', '2016.11.29', 
            'http://img1.imgtn.bdimg.com/it/u=3282153924,887064031&fm=21&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/gac9NGV2BHFPEsPf2oNzjbJNt15G49mfoIrhkXOgOK614WcjnA8zsMicuZoufiayV6uXnbpPicWicFRIuzfAL7MXvQ/0?tp=webp&wxfrom=5&wx_lazy=1');            
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(8,'第三届“感动广工大”人物致敬盛典','广东工业大学第三社团','<p>
    <br/>
</p>
<section>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89);">11月28日，我校<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(172, 29, 16);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">第三届“感动广工大”人物致敬盛典</strong></span>在大学城校园举行。</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89);">校党委书记苏一凡，校党委副书记米银俊，副校长章云、张力、王成勇、陈卓武，副校级干部张学理，广州日报政文中心副主任、广州日报数据和数字化研究院负责人刘旦等领导嘉宾出席，并为“感动广工大”人物颁奖。学生代表一一向他们献花致敬。</span>
            </p>
        </section>
    </section>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBwXpRtpibNuSNqFlgiaRyZJbcmY3gMMuKiamibPcexL6KMibNPbiaqRsbWmYw/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(172, 29, 16);">苏一凡</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89);">为致敬盛典讲话。他代表学校党委行政，代表全校师生向十大“感动广工大”人物致以崇高的敬意和衷心的感谢！他说，在我校努力建设高水平大学的征程中，需要一种大学的精神和道德的力量作为强大的动力支撑。“感动广工大”人物评选活动就是对我们大学精神的再洗礼和核心价值观的再塑造。他就“感动广工大”人物评选谈了自己的体会和感受，一是大学的存在和发展需要一种精神支撑和道德信仰。一所大学会因道德的彰显和精神的勃发而兴盛。二是大学的精神和道德需要一代又一代广工大人去传扬、创新和丰富发展。三是大学所富有的精神和道德与对社会的责任和贡献是相辅相成的。他希望全校师生和全体校友以“感动广工大”人物为榜样，向他们学习，向他们致敬，共同形成推动高水平大学建设的强大精神动力。</span>
            </p>
        </section>
    </section>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-align: justify; text-shadow: rgb(255, 255, 255) 2px 2px 10px; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-align: justify; text-shadow: rgb(255, 255, 255) 2px 2px 10px; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBicyRPdeicUj3bbpTgpSd6c1SHejWJHdwVbW42ynUCbskU8onKoprEfoA/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">现场气氛热烈，只为等待感动之门的开启！</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-align: justify; text-shadow: rgb(255, 255, 255) 2px 2px 10px; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-align: justify; text-shadow: rgb(255, 255, 255) 2px 2px 10px; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyButibsg1wnC4dbwYiaDUMBbV7q0bf1DfAeiaPB2WnC0VCUwq3cibk5D4DjQ/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBj6Yjtd4OzNGoKN6byctc9tv6iaeS09eSuIczia2C6hRO3yhj4kn6qHqw/640?tp=webp&wxfrom=5&wx_lazy=1"/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体; font-size: 14px; line-height: 25.6px; white-space: pre-wrap; text-align: justify; color: rgb(89, 89, 89);"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">感动之门缓缓打开，一位老教师以及一位年轻人先后登上舞台，来到舞台中央，接受全场的的致敬。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; text-align: justify; text-indent: 2em; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyB8wkRoyibKD8IbX64FbDaQth0J3MqD3ibuyhah6ic0MySBHzzbI3a3Rymg/640?tp=webp&wxfrom=5&wx_lazy=1"/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: 宋体; font-size: 14px; text-align: justify; white-space: pre-wrap; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">一位老教师，视教育为心中的那片土地，把教书育人作为自己一生的志业。一位年轻人，怀揣着创新创业的激情与梦想，在打造演艺灯光民族品牌的目标中不断</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">前行。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; text-align: justify; text-indent: 2em; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyByt3hJmjjCaticpQe1p00TfRsKibOiaZNaTWPDmibEpB9Nn4UKQNlvVAwyA/640?tp=webp&wxfrom=5&wx_lazy=1"/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: 宋体; font-size: 14px; text-align: justify; white-space: pre-wrap; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">一位是在退出领导岗位和退休后，仍然主动热忱地担起了本科教学督导组组长，一干就是十余年的教授——</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; text-align: justify; text-indent: 2em; line-height: 25.6px;"><span style="margin: 0px; padding: 0px; max-width: 100%; text-indent: 2em; line-height: 25.6px; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">黄慧民</strong></span>。</span><br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; text-align: justify; text-indent: 2em; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBfM8JFSZqYdWicjqQaorwhWAHsYup6iagt7JGbPkhdmuP5yMxE2ooI3tw/640?tp=webp&wxfrom=5&wx_lazy=1"/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-size: 14px; line-height: 25.6px; font-family: 宋体;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">一位是将自己倾力打造的演艺灯光，照亮了杭州G20峰会、北京奥运、伦敦奥运等国际活动舞台的创客——</span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; text-indent: 2em; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">蒋伟楷</span></strong>。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">老教授的坚守，年轻人的追求，这是一种</span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; text-indent: 2em; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">新的传承</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">，带给广工大生生不息的精神财富，让莘莘学子充满奋斗的热情。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-shadow: rgb(255, 255, 255) 2px 2px 10px; color: rgb(89, 89, 89); box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体; font-size: 14px; letter-spacing: 1px; line-height: 25.2px; text-shadow: rgb(255, 255, 255) 2px 2px 10px; color: rgb(89, 89, 89); box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBR4VKAuh1IDwXoT6X9qdCAbTiamT344JuibAzK6MyRw1ibNnhPfxRmfobw/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">此刻，由校广播台语言艺术队表演的朗诵节目《少年中国说》带给在场的每个人气势磅礴的感觉，展示了当代大学生最具精气神的一面。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);">&nbsp;</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 0em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"></span><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBwecSypR02IeiaSOOAuDSr3szEJGHAtUpUzDQBtUdqqBl1D0qInia9Zcg/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">富有气势的朗诵还萦绕在现场，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑; font-size: 14px; line-height: 25.6px; text-align: justify; text-indent: 2em;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">自动化学院智慧医疗团队</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">攻坚克难的事迹便映入眼帘。从懵懂无知的新生到攻克技术硬骨头的“挑战者”，变不可能为可能；从校赛、省赛、国赛到登上“挑战杯”的最高领奖台，实现广工大人问鼎“挑战杯”的梦想。他们是广工大莘莘学子的代表，用行动去追梦的合伙人。</span><br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: 宋体; font-size: 14px; line-height: 25.6px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBuPCXYnHOtXPFqozuazqDKLia0zJbViamfpTiczhcSEXbaGfcYEicrCicyEA/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">从毕业时的“广东省优秀学生干部”到如今的“广东省向上向善好青年”，十七年间，高配人生的脚步从来没有停止：用己所学破解国土资源难题，服务城乡建设，促进绿色、协调发展；热心公益捐资助学济困，身体力行改善乡村治理，倡导公平和共享。他，就是</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">周裕丰</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">，一个出色的教授级专业技术人才，一个执着地把谋生职业变为创新事业的创业者，一个优质的具有高度责任和担当意识的社会公民。<br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBOGDmPLFXgpVTRkZ1VWzVFpTvw1icRzNR6pf8n6uXKL7AxNJYbmC20Qg/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        &nbsp;
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBYxonCZwkPQ8tBes9Vj8ia96Iyq8QjURVzJp9zE2KpeR7yqicR6HWp1ug/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">那天，他挺身而出、追截偷车贼，而英勇牺牲！他就是</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">吴宏宇</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">，同学眼中的热心人，父母眼中的孝顺孩子，大家眼中的正义英雄，社会主义核心价值观最好的代言人。今天，见义勇为者的离去不会阻挡我们追求勇敢和正义的脚步。明天，见义勇为的行动为广工大人铸就了人生理想的丰碑，激励与感染更多的青年学生坚守正义、勇于担当、温暖向善！&nbsp;</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 25.6px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBTl56ZzG0k9LBQgQNow0mZuST0ichjKzOJuccqtjneMOa8j6c6rjib4zA/640?tp=webp&wxfrom=5&wx_lazy=1"/></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">（右一、右二为吴宏宇父母）&nbsp;</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 0em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBhR9JsC2agdub3cLUibEpYH0sBDtkGB7oEAJfMCYEgLY5QicesKGeQ8kQ/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">吴宏宇的事迹让无数人动容，一曲娓娓道来的《感动》，更营造了一种近乎催泪的气氛，校学生合唱团的深情演绎，让人沉醉在那一幕幕感人的事迹中。其实，最触动人心的事，就在你我身边。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><br/><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBMhqLfibQ6saiccVYMrBhG0zMul8EDCXXFNZttmseeshRzO7s8ic1p1G3A/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">他们，在赛场上顽强拼搏，勇攀高峰，在赛场下不畏艰辛，刻苦训练，他们传承了老队友易建联、杜峰、朱芳雨等篮球国手的精神，三次问鼎大超联赛全国总冠军，两次代表中国参加世界大学生运动会，为广工大取得了一个个闪耀荣光！这就是广工大的骄傲——</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">广东工业大学高水平男子篮球队</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-family: 宋体;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBgsNa0Zg44dtLDtDaHcrWE64XWicWuHCdYYkU4WCTuvYG6mh9ExFNxDg/640?tp=webp&wxfrom=5&wx_lazy=1"/></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);"><br/></span></span><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; color: rgb(89, 89, 89); font-family: Calibri, sans-serif; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyB810kiaqCu6Rr0aUpnMqojM7AR7Qbu3x5h0vN8DFH0rqJ7aZpj3XKdag/640?tp=webp&wxfrom=5&wx_lazy=1"/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">无论走多远，都勿忘母校的栽培。他一直对学校饱含深情，以实际行动诠释了一名校友对母校的感恩与回报，有力地支持了学校各项事业的发展。作为牵头人及发起人，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">曾红卫</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">不辞劳苦，先后组织和参与了惠州校友分会、校友总会的筹建工作，他心念学校教育事业的发展，捐资助学，支持学校的教学、科研及学生培养工作。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><br/><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBAgSLwWk8RB5N7HKicRlrPl6EBsmb0zyC0ibfOVzX9KQibRwhuUbOiaQfPg/640?tp=webp&wxfrom=5&wx_lazy=1"/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">与时间赛跑，本身就足够感人，但一直坚守，更难能可贵，作为建筑与规划方面的专家学者，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(172, 29, 16);">朱雪梅</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(136, 136, 136);">教授长期致力于岭南古村落保护，对散落乡野趋于凋蔽的古村落建筑倾注了无限的爱与热力，她走出书斋，深入乡村，向各方陈情、劝说，并通过勘测、比对、规划、修复等艰辛努力，使众多颓废沉寂的古村落奇迹般重获生机活力，为独具魅力的岭南建筑文化存续作出卓越奉献，堪称岭南古村落文化的“守护女神”，也生动诠释了广工大人学术报国、服务社会的精神品质。</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span></span><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyB6xu6kNzld5icSUSdsMSn8Xk4Nh4Zonylfwcbhf3KgicHqaaV7ialzAAlg/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 0em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: Calibri, sans-serif; font-size: 14px; line-height: 25.6px; white-space: pre-wrap;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBHJPUE9ibibBgKsldt7XtBL6tZyLLJvk18OJ43GT4riahJRdVLMQQkWW2w/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;">与时间赛跑久了，以至于忘了时间都去哪了，一首曾让无数人感概的《时间都去哪了》悠然飘来，校<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑;">Crystal人声合唱团的动听歌喉，触动了每一个人的泪点。</span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);"><span style="margin: 0px; padding: 0px; max-width: 100%; font-family: Calibri, sans-serif; box-sizing: border-box !important; word-wrap: break-word !important;"><br/><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBJtmXWfnq4qWjTwXUjBVKibicFQowmLtZrjgfy6IQOonDJQ1AfkDe1Klw/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 32px; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">一代“天之骄子”、恢复高考后第一批大学生的杰出代表——我校博士生导师，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">谢胜利</span></strong>教授的名字出现在了屏幕上<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑;">。三十三年，不论外面的世界多精彩，他始终坚守教育战线这块阵地，他始终牢记中国共产党的信仰，忠诚党的教育事业，爱生如子，教书育人，甘当人梯，先后培养130多名硕士、博士和博士后（本科生数不胜数）；他刻苦钻研，努力拼搏，勇攀科学高峰，获得“全国优秀科技工作者”“广东省师德标兵”等荣誉称号。</span></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-family: 宋体;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBaB3OvG8S6JAMfQO0fFnib06ibznK1eVHYIZtSauHOZvCOyFiaMHI2tRrw/640?tp=webp&wxfrom=5&wx_lazy=1"/></span><br/></span></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: Calibri, sans-serif;"></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);">（谢胜利教授因事缺席</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(89, 89, 89);">由学院党委副书记史育群（右一）代领）</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: Calibri, sans-serif;"><br/><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBickuSI1JVTNjaS5dCEdD0z1cY8eCfwAK3h9RVelWGXOIELB5gCgn5tw/640?tp=webp&wxfrom=5&wx_lazy=1"/></span><br/></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 32px; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">工科院校工科可以很强，音乐方面也很可以很棒。八年坚持，识谱、发声、用气，水杯、龙洗、石磨，工大学子唱响国际，岭南男声时尚新颖，他就是让工科院校插上音乐翅膀的师者——<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; color: rgb(172, 29, 16); box-sizing: border-box !important; word-wrap: break-word !important;">梁为</span></strong>。<br/></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-indent: 32px; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); font-family: 宋体; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBibtoDh34R7GHLhLWfNRTP2JWA8dj9YmGR6KkZPYyEZmiaBz9djz7InuQ/640?tp=webp&wxfrom=5&wx_lazy=1"/></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; font-family: Calibri, sans-serif;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBdEdN9AkZG01YgRJmLtcmXgho51dLbeaQfibp2B1sWyVmAooc7SIkpvA/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">十位感动广工大人物带给我们的感动、信念各不相同却同样蕴含着巨大的力量，在我们低落、难过的时候鼓励着我们，继续前行，You raise me up！由校合唱团领唱的You raise me up唱出了我们此刻的心声，多少感动让我们难忘，多少感动鼓舞着我们抬头向前。</span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(89, 89, 89); font-family: 宋体; font-size: 14px; line-height: 25.6px; text-align: justify;"><br/></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBgkf0YRNDSFepicho1RkIsBIXWeVtT34CZ7clA6Q8EI6aZqj7Rgr56Ow/640?tp=webp&wxfrom=5&wx_lazy=1"/>
    </p><br/>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">让我们回味这一个个感动的瞬间，让我们铭记这一股股感动的力量，让我们播种这一颗颗感动的种子，让感动常伴你我，让感动流淌心田！</span></span></span>
    </p><br/>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(172, 29, 16);">十大感动人物，站在一起就是广工大</span></strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px; color: rgb(172, 29, 16);">。</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;">十大感动人物，焕发着新时代广工大的精神力量。与感动同行，让感动常在，让精神永驻，让信念永存。一代代的精神力量凝聚，激励着每一位广工人奋发向上的决心，书写着广工大的壮丽篇章。</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px 8px 0px 18px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 24px; display: block; float: left; color: rgb(89, 89, 89); font-size: 16px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 微软雅黑; font-size: 14px; line-height: 25.6px; text-align: center; text-indent: 28px;">特辑｜新媒体联盟的工作人员们</span></strong></span>
        </section>
    </section>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 25.6px; font-family: 微软雅黑; text-align: justify; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 25.6px; text-indent: 2em; font-size: 14px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; text-indent: 2em; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmOpsXqh2tRFKvKOpcZGPNQUm0GLGXZZKoB5AWlTcdBRxLKldtZrRTHjH57vG1ghmNJkACARvRZJw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/></span></span></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 12px; color: rgb(136, 136, 136);">▲新媒体联盟代表于典礼前试拍</span></strong>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmOpsXqh2tRFKvKOpcZGPNQQGmibbyP4D9zDKKSBZ77icy5dicDzeCdLI1cVdvOhzTRibrEEjicP2H8ewQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <strong style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 12px; color: rgb(136, 136, 136);">▲录像中</span></strong>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmOpsXqh2tRFKvKOpcZGPNQUZkVc5m3TNLpoJwvfQqeBYWYnIL58YIZ3ROaZWicPiczx7TgW8BGCx3w/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <strong style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 12px; color: rgb(136, 136, 136);">▲拍下那些感动工大的人物</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4EmOpsXqh2tRFKvKOpcZGPNQrzLcN0HtCLlHicAib348MhShacQAWQSzQIvZUlGicJlwbJBfuZ12ahdFQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 12px; color: rgb(136, 136, 136);">▲半蹲是为了拍出更好的角度</span></strong>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
        <br/>
    </p>
</section>
<section>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(2, 30, 170);"></span>
    </p>
    <hr/>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(2, 30, 170); font-size: 14px; line-height: 25.6px;">文章转载自&nbsp;<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">广东工业大学</strong></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(2, 30, 170); font-size: 14px; line-height: 25.6px;">图片来源：谢婉婷 韩崇智&nbsp;刘嘉兴 罗志尉</span><br/><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(2, 30, 170);"></span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(2, 30, 170);">微信编辑：郑明慧 林铭葳 罗宏威</span>
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
        <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(2, 30, 170);">责任编辑：詹 &nbsp; 勇</span>
    </p>
</section>',
			'2016.11.30', '2016.11.30', 
            'http://img1.imgtn.bdimg.com/it/u=3282153924,887064031&fm=21&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/98u1hVibibkpicZbOQQibpNAYuFLOh0QFCyBwXpRtpibNuSNqFlgiaRyZJbcmY3gMMuKiamibPcexL6KMibNPbiaqRsbWmYw/640?tp=webp&wxfrom=5&wx_lazy=1');
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(9,'篮球联赛第十三轮','广东工业大学第四社团','<h2 style="margin: 8px 0px 0px; padding: 0px; font-size: 12px; max-width: 100%; color: rgb(62, 62, 62); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(227, 227, 227); height: 32px; line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); display: block; float: left; line-height: 28px; border-bottom: 2px solid rgb(0, 122, 170); border-top-color: rgb(0, 122, 170); border-left-color: rgb(0, 122, 170); border-right-color: rgb(0, 122, 170); font-size: 14px;">第十三轮赛况</span>
</h2>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<table width="670">
    <tbody style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
        <tr class="firstRow" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 30px;">
            <td width="413" valign="top" colspan="2" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-color: windowtext; max-width: 100%; box-sizing: border-box; background-color: rgb(189, 214, 238); word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">篮</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">球</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">联</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">赛</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">第</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;十 三&nbsp;</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">轮</strong></span>
                </p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 28px;">
            <td width="207" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">应数学院-建筑学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">48 ：28</strong></span>
                </p>
            </td>
            <td width="206" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-left-style: none; border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">经贸学院-政法学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">56 ：37</strong></span>
                </p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 24px;">
            <td width="207" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; max-width: 100%; box-sizing: border-box; background-color: rgb(222, 235, 246); word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">外国语学院-管理学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">53 ：29</strong></span>
                </p>
            </td>
            <td width="206" valign="center" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-left-style: none; border-right-color: windowtext; border-bottom-color: windowtext; max-width: 100%; box-sizing: border-box; background-color: rgb(222, 235, 246); word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; vertical-align: middle; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">环境学院-艺设学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; vertical-align: middle; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">28 ：33</strong></span>
                </p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 40px;">
            <td width="207" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">计算机学院-轻化学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">29 ：32</strong></span>
                </p>
            </td>
            <td width="206" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-left-style: none; border-right-color: windowtext; border-bottom-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">材能学院-国际学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">41 ：15</strong></span>
                </p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 36px;">
            <td width="207" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; max-width: 100%; box-sizing: border-box; background-color: rgb(222, 235, 246); word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">机电学院-自动化学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">37 ：27</strong></span>
                </p>
            </td>
            <td width="206" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-left-style: none; border-right-color: windowtext; border-bottom-color: windowtext; max-width: 100%; box-sizing: border-box; background-color: rgb(222, 235, 246); word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">信工学院-研究生学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">40 ：33</strong></span>
                </p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; height: 23px;">
            <td width="207" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">土木学院-物理学院</span>
                </p>
                <p style="max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">29 ：37</strong></span>
                </p>
            </td>
            <td width="206" valign="top" style="margin: 0px; padding: 0px 7px; word-break: break-all; border-top-style: none; border-left-style: none; border-right-color: windowtext; border-bottom-color: windowtext; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"></td>
        </tr>
    </tbody>
</table>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); line-height: 25.6px; widows: 1; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<h2 style="margin: 8px 0px 0px; padding: 0px; font-size: 12px; max-width: 100%; color: rgb(62, 62, 62); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(227, 227, 227); height: 32px; line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); display: block; float: left; line-height: 28px; border-bottom: 2px solid rgb(0, 122, 170); border-top-color: rgb(0, 122, 170); border-left-color: rgb(0, 122, 170); border-right-color: rgb(0, 122, 170); font-size: 14px;">第十三轮精彩镜头</span>
</h2>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaVfer4v42U2qm7UicWyxB1xQKOUB1onAncTZ4gMGria4Sg5kYB8FXZddQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(127, 127, 127); font-size: 14px;">▲经贸学院对阵政法学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiayzeah2NYSYAsicvsVVRvgOf0B3icL9iccrfCCdDyTafGAz9lkIS9ODJ3Q/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(127, 127, 127); font-size: 14px;">▲建筑学院对阵应数学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);">艺设--环境</span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">11月29日，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>客场征战<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>，首节比赛，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>先拨头筹以18:5的优势<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">领先</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>，可以说能够取得<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">十一连胜</strong></span>的队伍首发实力不容置疑！次节回来<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>有些松懈，在换上替补的情况下<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>连续发力<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">单节狂砍13分</strong></span>，单节比分13:2紧追<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>。半场结束<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>以20:18的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">微弱优势</strong></span>领先并进入下半场。第三节<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>内线连续发力，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">前锋突破上篮</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">将比分追平</strong></span>。感受到压力的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>再次<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">换上了首发</strong></span>，但是尽管如此，已经热身的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>已经不输<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">环境</strong></span>首发。最终<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">艺设</strong></span>以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">两个关键罚球全中</strong></span>奠定胜局，全场比分<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">33:28</strong></span>获胜。</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_png/61uouytYvs95Jof7jkCK6ficzObDyuCQiaIuPbkXZ8TlIhYzYHiciabCB5iaqs1svdLjFD9YWOq6U16dpHZNKtu3kwQ/640?tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲艺设学院<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; white-space: pre-wrap;">对阵环境学院</span></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机--轻化</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">刚开始也许是天气微凉，两队状态还没上来，场上气氛较压抑，接着，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机</strong></span>首先夺分，以5:0领先，接着<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">轻化</strong></span>慢慢找到感觉，，首节结束时将<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">比分追平</strong></span>。第二节，一开头场面就相当激烈，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">轻化</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">连夺4分</strong></span>取得领先优势，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机</strong></span>通过暂停和战略调整，将比分再次追上，这时<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);">轻化</span></strong>请求暂停，再次调整。两支强队间的拉锯开始了，第三节结束9:5<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">领先</strong></span>！末节开始，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">轻化</strong></span>一个<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">3分球</strong></span>气势上来了！后面越来越激烈了，离结束还剩3分钟26:26，接着离整场比赛结束还剩3秒<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">计算机院两罚</strong></span>！这时场面紧张！可惜，两罚不中~最终，比赛以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">32:29</strong></span>结束，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">轻化学院</strong></span>取得胜利！</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaFKev8S6tKKOibHpvZvAoBhWdHoQLGhrtcbqURHWk9Sg2x3eiboWiaHBug/640?tp=webp&wxfrom=5&wx_lazy=1"/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲计算机学院对阵轻化学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">外国语--管理</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">今天<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">外国语学院</strong></span>主场迎战<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">管理学院</strong></span>，但作为客场的<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);">管理学院</span></strong>并未受到非主场因素影响，一开场就以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">默契的团队配合</strong></span>抢先进球并在第一节把比分锁定在13:6，进行调整后的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">外国语</strong></span>穷追猛打，甚至把比分追回到差距2分。经过暂停调整后的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">管理学院</strong></span>也迅速展开了猛烈的进攻，在第四节砍下了23分的高分，最终<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">管理学院</strong></span>以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">53:29</strong></span>战胜了<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">外国语学院<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(102, 102, 102); white-space: pre-wrap;">。</span></strong></span></span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电--自动化</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">今天下午的比赛由<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>对阵<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">自动化学院</strong></span>。首节开始双方球员就展现了<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">高强度的防守和进攻</strong></span>。<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>球员的进攻能力虽强，但得分率不高。而<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">自动化学院</strong></span>的球员<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">精彩的团队配合和防守</strong></span>让场下观众为之赞叹。可以说，刚开场<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>是处于下风的。但首节最后三分钟，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>球员渐入佳境，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">分球突破</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">篮下强攻</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">稳扎稳打</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">逆转局势</strong></span>。比赛第二节，双方比分死死咬住，互不相让。到了第三节，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>打出了14:1的小高潮，着实令人惊叹。最后一节，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">自动化学院</strong></span>球员在比分大大落后的情况下依然保持冷静，而<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>球员<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">频频失误</strong></span>，让<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">自动化学院</strong></span>将比分拉到十分，但比赛就剩下两分钟，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>加强防守，让<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">自动化</strong></span>球员很难进攻。比赛结束，双方比分<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">37:27</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">机电学院</strong></span>胜出。</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaF9MV6sSCBVGl1QSUiaOzDgp4sQLQAR2j3LYRr4TqhGSicHvWdBTQZPRA/640?tp=webp&wxfrom=5&wx_lazy=1"/></span><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲机电学院对阵自动化学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能--国际</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">一开场，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>和<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">国际教育学院</strong></span>打得难解难分，两队的运球节奏很快，第一节<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>以9:5领先。第二节，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>3号球员林尤钊从外面冲出重围，实现突破取下不少分。第三节，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>3号球员林尤钊和33号球员肖子昊各自在<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">外线和内线合作</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">国际学院</strong></span>23号球员也表现不俗，带领球队抢了不少球，但在投篮时遗憾没投中。最后一节，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>24号球员在<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">国际</strong></span>的严密防守下<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">惊险得分</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">国际学院</strong></span>也不甘示弱，最后一节<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">连得6分</strong></span>，最后<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">材能学院</strong></span>以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">41:15</strong></span>的赢得比赛的胜利。</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaibO92OUr69M3byccBbACjS5QyRyLGac0CQgGSrasynVrPPSuPXficvZQ/640?tp=webp&wxfrom=5&wx_lazy=1"/></span><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲材能学院对阵国际学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工--研究生</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">比赛刚开场，状态满满的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>就配合相当默契，步步紧逼<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>也不甘落后，双方在第一节就打得难舍难分，以10比7结束第一节，稍作休息后的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>攻势愈发猛烈，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>也是严防不让，试图挡拆，可惜事情总是不尽人意，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>11号一个<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">转身突破上篮</strong></span>把比分拉到21:14结束了第二节！拉开比分的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>在第三节手感愈发的好，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生院</strong></span>的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">221联防</strong></span>也挡不住6号的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">交叉步突破</strong></span>，心急的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生院</strong></span>防人时犯规多次让<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>多了罚球得分的机会，加上<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">神准的三分球助力</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>在第三节得分12把比分拉开到33比19！第四节的角逐中<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>仿佛被点燃，奋力追平比分，局面大有逆转之势，到最后一分钟<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">连续抢断</strong></span>使<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>无法得分，正当大家都以为<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>可能逆转时<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>又以鬼魅的速度<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">上篮</strong></span>成功，此后连续得分，成功阻止<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">研究生</strong></span>逆袭，最终<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">信工</strong></span>以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">40:33</strong></span>取得比赛的胜利！</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaj7mmtkH6FHo970yicicicGPIa431QfwKnMOlprv5mZIOcC9aBKeZ3icYzw/640?tp=webp&wxfrom=5&wx_lazy=1"/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲信工学院对阵研究生学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物理--土木</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <blockquote style="margin: 5px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; border-left: 5px solid rgb(0, 122, 170); line-height: 25px; color: rgb(102, 102, 102); word-wrap: break-word !important;">
            <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">第一节刚开始，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木学院</strong></span>就<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">先发制人强悍进攻</strong></span>打出6比0给<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物理学院</strong></span>一个下马威，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物院</strong></span>也穷追不舍，但可惜几次投篮失误，第一节结束，比分拉到11:4，稍作修整后，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物院</strong></span>开始<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">火力全开</strong></span>， 1号唐思兴先是在队友的助攻下<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">三步上篮得分</strong></span>，中场队友<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);">抢断</span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木学院</strong></span>后唐思兴再一个<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">三分球</strong></span>几乎追平比分，正当大家为<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木</strong></span>捏一把汗时<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">控卫</strong></span>一个<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">欧洲步</strong></span>晃过对手<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">上篮得分</strong></span>又再次把比分拉开，比赛可谓你追我赶打得难舍难分，进入了小高潮。第三节<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木学院</strong></span>的命中率开始变低，反之<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物院</strong></span>节奏越来越快，队员手感也越来越好，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物院</strong></span>以迅雷不及掩耳之势<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">反超</strong></span>了<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木</strong></span>，士气振奋的<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物理学院</strong></span>更是<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">连续抢断土木</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">进攻速度越来越快</strong></span>，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">比分也越拉越大</strong></span>，第四节<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">土木</strong></span>捉住机会进攻，可惜节奏太急，几次错失良机，场边观众也发出了惋惜的叹息声，机会再次降临！10号在三分线外投出一个可能扭转局势的球，大家的视线随着球划过一道弧线，球打中了篮筐，在一片遗憾声中落地。在<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物院</strong></span>越来越猛的攻势下，比赛以<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">29:37</strong></span>落幕，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">物理学院</strong></span>取得了胜利！</span>
            </p>
        </blockquote>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQia17LD9ibgAbOjK237OHoib9LlicNnNhTgP08ibxxk6jS2sDfDMa08Sw6Dlw/640?tp=webp&wxfrom=5&wx_lazy=1"/></span><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(127, 127, 127);">▲物理学院对阵土木学院</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<h2 style="margin: 8px 0px 0px; padding: 0px; font-size: 12px; max-width: 100%; color: rgb(62, 62, 62); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(227, 227, 227); height: 32px; line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); display: block; float: left; line-height: 28px; border-bottom: 2px solid rgb(0, 122, 170); border-top-color: rgb(0, 122, 170); border-left-color: rgb(0, 122, 170); border-right-color: rgb(0, 122, 170); font-size: 14px;">各学院排名</span>
</h2>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiapn1uicDHBhyomTdjMicib727XAJm9mSb803yG3mwg6P8wmuC1eYCD4ysg/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<h2 style="margin: 8px 0px 0px; padding: 0px; font-size: 12px; max-width: 100%; color: rgb(62, 62, 62); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(227, 227, 227); height: 32px; line-height: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px 2px 3px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 122, 170); display: block; float: left; line-height: 28px; border-bottom: 2px solid rgb(0, 122, 170); border-top-color: rgb(0, 122, 170); border-left-color: rgb(0, 122, 170); border-right-color: rgb(0, 122, 170); font-size: 14px;">第十四轮赛事预告</span>
</h2>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/61uouytYvs95Jof7jkCK6ficzObDyuCQiaR9OZrtnWCWUicoNZCEp9pBlZ2mhaSXaJibaviaxqwJKocKqQOzdJK19VQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 微软雅黑; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/eggPLbdx4Ekjul5EhSejQRIWvxQqIumf76yrCFu6xyGoVwjHubsBgsyOu6rdQb2qQdoVO1a2ib3pP663DicArPag/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p>
    <br/>
</p>',
			'2016.11.30', '2016.11.30', 
            'http://awb.img.xmtbang.com/img/uploadnew/201510/23/3d56e2012b0c4cb691e2c7d605f56a1f.jpg',
            'http://mmbiz.qpic.cn/mmbiz_png/61uouytYvs95Jof7jkCK6ficzObDyuCQiaIuPbkXZ8TlIhYzYHiciabCB5iaqs1svdLjFD9YWOq6U16dpHZNKtu3kwQ/640?tp=webp&wxfrom=5&wx_lazy=1');   
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(10,'学生社团联合会介绍','广东工业大学第五社团','<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbiavRgQxiamcwczLVp7y9UcM92zsnrtob80GaV3vh3MQrPTSkwG3C0PpbETeyQXiayxXoQIvLU9iafBg/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-size: 16px; line-height: 30px; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">广工校社联</strong></span>
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbiavRgQxiamcwczLVp7y9UcMCzsCvDkFrKllNuIEOsTeAibTdmLqRQjeEkNochiaWvw4ib5h414v7Vxag/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUZGiazPq0odDwBwZAJTqJ1SqibicVIsgicCCumofHTdMGT5WoqzNsyKoGXZlzyUFvKDicm9xj1AOA81rAw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="margin: 0px auto; padding: 9px 4px 14px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(0, 187, 236); font-size: 20px; letter-spacing: 3px; text-align: center; border: 4px solid rgb(0, 187, 236); border-radius: 8px;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(0, 128, 255);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">部门职能介绍</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 12px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255); font-size: 18px;">（按首字母排序）</strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255); font-size: 18px;"></strong></span>
                </p>
                <section></section>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    策
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    策划部
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体, SimSun; line-height: normal; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">以策划、组织活动为基础，以培养高素质管理策划型人才为目标！部门主要负责策划组织活动、社联活动的内部人事安排以及统筹跟进活动进度等工作，确保社团联合会活动顺利进行，是锻炼组织策划等综合能力、表现自我的宽广平台。</span>
        </p>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    常
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    常务部
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体, SimSun; line-height: normal; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">站在社团交流的最前线，是社联和社团沟通的桥梁和纽带。密切联系各社团负责人，向各社团传达社联有关通知以及工作安排；时刻关注社团动态和跟进社团活动，并及时向社联反映社团情况，帮助社团解决问题，保障社团成员权益。提供了一个拓宽社交，增长见识的平台。</span>
        </p>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    秘
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    秘书处
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: left; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体, SimSun; color: rgb(136, 136, 136);">以培养打造全方位、高素质管理型人才，提升高校学生综合能力为目标！秘书处下设办公室组、财务组、文档组和物资组四个专职小组，主要负责社联的办公室管理、社联财务审计、社联文档资料管理、物资管理以及社团活动审批等日常工作。</span>
            </p>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    外
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    外联部
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 宋体, SimSun; line-height: normal; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">作为社联的外交部门，以“引进来，走出去”为口号，对外与其他高校社联密切联系，走访各大高校，引进其成功管理经验；直面商家，为社联的各个活动拉取赞助。努力树立起本部门对内沟通和对外交流的形象。</span>
        </p>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    网
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    网编部
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: normal; text-align: left; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体, SimSun; color: rgb(136, 136, 136);">对社联品牌提供重要的技术支持的职能部门，由平面组、视频组和采风摄影组组成。主要职能由活动摄影、网站管理、博客管理、采访报道、文学创作、利用photoshop、power point、Flash、Corel Draw、Dreamweaver等软件对社联社团进行宣传等。</span>
            </p>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"></span></strong>
</p>
<p>
    <section>
        <section>
            <span class="" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 50%; overflow: hidden; vertical-align: bottom; display: inline-block; background-color: rgb(197, 63, 70);"><section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    宣
                </p>
            </section></span><span style="margin: 0px 0px -26px -19px; padding: 0px; max-width: 100%; height: 74px; width: 19px; border-left: 1px solid gray; display: inline-block; box-sizing: border-box !important; word-wrap: break-word !important; transform: rotate(38deg) !important;"></span>
            <section>
                <p class="" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; font-weight: 700; color: rgb(197, 63, 70); box-sizing: border-box !important; word-wrap: break-word !important;">
                    宣传部
                </p>
            </section>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: normal; text-align: left; box-sizing: border-box !important; word-wrap: break-word !important;">
                <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 宋体, SimSun; color: rgb(136, 136, 136);">主要负责活动前期宣传方案的设计和宣传海报、手工装饰、横幅等制作，以及活动场地布置与安排；利用Photoshop等软件对大赛、晚会的舞台背景幕、电子海报和邀请函进行设计；对官方微博、微信公众平台进行开发和管理。广泛吸纳大量对平面设计、美术绘画、书法和手工等方面感兴趣的人才。部门注重团队互作意识，同时重视灵感思维的培养，对外树立社联形象并形成影响力。</span>
            </p>
        </section>
    </section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋;">来来来，看看咱的校社联举办的精彩活动</span></strong></span>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋;"><br/></span></strong></span>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;">社联大招新</span>
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">这个就是新学期开头最重要的社联活动了</span>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">看看咱的师兄师姐是如何在竞争中</span>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">用脸和实力成功撩到小鲜肉们的呢</span>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUYzl0Nf9JrlHctTCbtNsS95SFDXs0Phc76GGibuzNFoxAE62XHaz8iclBR4FDpiao7mdNwdzrgmZqFEA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbiavRgQxiamcwczLVp7y9UcMlu3vwHqbAJJNvKCh3zwickJc1KPS38miaLP1SBXtZr62MWlGVXU8lPOw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbjsRibzQTfYU0EXDAFDSPBuyKAl7BbficElEtBLCGBsR6UySBic2IW4GiajxTg2UTDzicXodkJnrUeRkA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋;"><br/></span></strong></span><img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbjsRibzQTfYU0EXDAFDSPBuLoBmJwqrFT4gDc5RGUyrqoY9HkQhj1iarQaCk1V5x8NnvNEw9653tnw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋; font-size: 14px;"><br/></span></strong><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">dang dang dang~</span><br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">想不想来试一试呢？</span>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋;"><br/></span></strong></span>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    百团大战
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">百团大招新也是社联的一个品牌活动之一</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">相信大一的小鲜肉对兴趣社团颇有兴趣</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">那一定要多多关注社联的百团招新活动哦~</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/ZibPliazwIIUYbD2j8yvnWOQjsyKq2PVbqBwgvEaatXpTMe1iaIUzU3ZCTiahyJnaMLh3TQPibZ4ykAEV347AyYcGvQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">啥？你说还要看表演？</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">说来就来！</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(120, 172, 254);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;">百团招新系列活动之社团体验夜</span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUZWtebkdLwIh0q6cvehbVtSZcmo7iasofUMYsIfS9ib69sgiaVCNNUGMSXHkOAxrFR4rics1ia4Dr0nhYQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbra398zFonrCQDXlYpJ0htGicOucRWc4YOI0ian3Eh2ZdRN29LlBhfZPQNDKhk0uceyia7fDUGwoMdQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUajsZ97tmQ7yJpSegNEFj8Hewc3uuXJTkdAHmfjy4LuAJIKyibjux1HkyApddx6HOOTdj27tic0Q0Lg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">结束之后，当然是大合影~</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUZWtebkdLwIh0q6cvehbVtS6DgibicdePl6NmaUJicUXn1dWwgPC0TkAibJgRiczatKkqZHO9bXfUlTtpQ/640?tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">还是没看够？</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">阿联再给你献上一场</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; color: rgb(120, 172, 254);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">社团魅力夜晚会</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUYJU7dKw9Um3uySWhhSL6iaSflhiaulOJS0hibg6mBwGhwXIicvs5Ux0CQ2ZHjB4g5mOrcYJgbDDmjayA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUYV0mGQj7U5eATgWft1yPuseTyl3FOjKibwNWO1uvGpBic2DydBhwyFT1mTtWXqjsaYoL9p9O3iaUxVw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(249, 35, 3); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">社联出品，</strong></span><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(249, 35, 3); line-height: 1.6;">必属精品！</strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; line-height: normal; text-align: center; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: 仿宋;"></span></strong></span>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    女生节
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section></section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">不行</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">谈到这里</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">阿联已经控制不住体内的洪荒之力了</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">广工的特别节日</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);">女生节 = </span></strong></span><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(249, 35, 3); font-size: 18px;">女神节</span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(249, 35, 3); font-size: 18px;"><br/></span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">没错</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 22.4px;">一周内广工内所有女生进化为女神</span></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 22.4px;">不信？我们来瞧瞧~</span></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">女生节最后一天</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">男生豁出身体为女神们奉献一场视觉盛宴</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 12px;">（有些污得惨不忍睹呢）</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">女生们是否正在蠢蠢欲动呢？</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">还是那句老话，</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">心动不如行动！！！</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    社联内建
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section></section>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 41, 65); font-size: 20px; line-height: 32px; box-sizing: border-box !important; word-wrap: break-word !important;">社联内建party隆重开场！</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 41, 65); font-size: 20px; line-height: 32px; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">走心的布场</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">诱人的零食</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">新奇的游戏</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">游戏环节：小两口互踩气球</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">来张自拍~</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">看镜头，剪刀手，耶耶耶！</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    社联三校区全体大会
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">社联一年一度的三校区全体大会</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">小伙伴们忍着严寒来到大学城一聚</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbwgTicJdqOeFuG1NjDlHedJBdJanUqylRHsGFLibTibwmxcwl1e9omXnuelszIlbU4dsaRfQVQUYvzQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbwgTicJdqOeFuG1NjDlHedJkUpVKicH96KFGr5Qb9k6A43JXTLIYv0GuMeyC0vjbtVeOhn9mrrjgtQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(64, 118, 0); font-family: 宋体; line-height: 22.4px; box-sizing: border-box !important; word-wrap: break-word !important;"><br/></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUbwgTicJdqOeFuG1NjDlHedJUHmbnjzPXELQ52NwGKp4zfxtKbouPzxM9Ez5KnCXPJRsWgSicuM8ZVA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">不论如何</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">社联一家人心连心</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">我们的口号是？<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(64, 118, 0); font-family: 宋体; line-height: 22.4px;">无社联，不青春！</span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); font-size: 16px; text-align: center; font-weight: bold; box-sizing: border-box !important; word-wrap: break-word !important;">
                    社团文化节
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">接下来</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">社联重磅活动</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">之</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);">社团文化节</span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136); font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"><br/></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"><br/></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">偷偷告诉你，上面两只萌萌哒就是社联的吉祥物<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(120, 172, 254);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255); line-height: 1.6;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;">阿联</span></strong></span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255); line-height: 1.6;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"></span></strong><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255); line-height: 1.6;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"></span></strong></span><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"><br/></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"></span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">咦~</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">这么精彩</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">当然要来一场说办就办的</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(120, 172, 254);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;">社团文化节晚会</span></strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUZS34tsSib7HvSnwedwibJSy88cgVvs1y6Ct987dkibfSIiaGqrdibiatBUv1m0eM0z2rGIRxOj6ibZg7dSw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUazSGaT30f50NF5kwGLia6B21QNNich5TdMXA7olYe4ujPs1Q8opb6vG2mdzgH2dk8AceUiahejXnW6w/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUazSGaT30f50NF5kwGLia6B2Ay8mvXpU5EMUDCgrlxIYWibvkng6DuTFiaKibHA7cpkLibZN7Js31JOUicg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">社团文化节是社联的一个招牌活动</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">小鲜肉们千万千万不要错过</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUZx2S9icia4O7FS1ZRUUtcMPUcqqObjKlUibkAypjFUQicRDUGZSpH6Ra8cibU1icDyevftyzCAic9Pib1GTA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section></section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);">看完这些</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);">你还没满足？</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);">那是因为你没真心体验过</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);"><br/></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(249, 35, 3);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;">加入广工校社联</span></strong></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(249, 35, 3);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><br/></span></strong></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);">抱紧阿联大腿</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(136, 136, 136);">咱把这番大事都干一遍</span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 128, 255);"><br/></span>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 57, 31); word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
        </section>
    </section>
</p>
<p style="padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); background-color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; line-height: normal; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; color: rgb(120, 172, 254);">彩蛋</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; color: rgb(0, 128, 255);"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">（广工的人颜值高的都堆这）</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">（你一定不要错过！）</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; color: rgb(136, 136, 136);">（单身的一定要来社联）</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px; color: rgb(120, 172, 254);">认准一句话</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;">社联出品，</span></strong></span><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65); line-height: 1.6;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 24px;">必属精品！</span></strong>
</p>
<p>
    <br/>
</p>',
			'2016.11.30', '2016.11.30', 
            'http://awb.img.xmtbang.com/img/uploadnew/201510/23/30140ddc41a74ff6861c76a249656218.jpg',
            'http://mmbiz.qpic.cn/mmbiz/ZibPliazwIIUYzl0Nf9JrlHctTCbtNsS95SFDXs0Phc76GGibuzNFoxAE62XHaz8iclBR4FDpiao7mdNwdzrgmZqFEA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');    
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(11,'寻人启事','广东工业大学第二社团','<section>
    <section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_gif/Iw1nMhDqWZj4z98uWegNKSTkW1D6dNoakHR8cgicJvhOnYhUrJeiaMCbONNnExDbryE85ITv4zEiavrYkdv6wkOYw/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">寻人启事</strong></span>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            所列消息均已证实，家属目前已经报案，但也希望通过朋友圈的力量，获得更多有用的信息提供给警方。
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
        <blockquote style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-left: 3px solid rgb(219, 219, 219);">
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                卢爱华，男，广工一院06级11届校友，失联前刚辞去广工校医工作准备返乡之际失去联系。身高178cm左右，体形偏瘦，脸型偏瘦长，戴黑色眼镜，潮汕口音。于2016年11月26日20:16，从大学城广东工业大学校医院离开后失去联系，手机关机。失踪时，身穿浅绿色皮质外套，可能有戴帽子。现家人在焦急寻找中，恳请各地派出所，大学城师生及好心朋友留心，如有知情者，请与卢小姐联系，家人感激不尽，联系方式18664488870，现家人已报警，恳请大家帮忙。
            </p>
        </blockquote>
    </section>
</section>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p>
    <section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            下面是天纷户外团队了解到的事情经过：
        </p>
    </section>
    <section>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
    </section>
    <section>
        <section>
            <section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">11月24日晚上</strong>
                </p>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    卢爱华和天纷领队聚餐，告知大家11月27日离开广州返回汕头
                </p>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">11月26日中午</strong>
                    </p>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            卢爱华朋友圈回复朋友，确认今晚将行李寄回老家
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">11月26日20点</strong>
                    </p>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            从大学城广工校医院出来，之后失去联系，电话、微信均无法联系上本人。
                        </p>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <br/>
                    </p>
                </section>
                <section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">11月28日</strong>
                    </p>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            已经报案，家人了解到爱华回汕头的车票还没有打印出来，其本人的贵重物品还留在宿舍<br/>
                        </p>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            <br/>
                        </p>
                    </section>
                    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                        <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">11月29日</strong>
                    </p>
                    <section>
                        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                            仍未联系上爱华本人，欢迎提供与他有关的信息，特别是11月26日晚上20:16以后的信息。
                        </p>
                    </section>
                </section>
                <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                    <br/>
                </p>
            </section>
        </section>
    </section>
    <section>
        <blockquote style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left: 3px solid rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
                卢爱华，微信名Edward，也叫稻草人，是广工的校医，也是是天纷的领队，<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">据家人和朋友证实，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">Edward并没有搭上高铁回到汕头，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">车票没有打出，宿舍行李也没有打包寄走。</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">从那晚开始，就失联，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">家人好友正焦急地寻找，</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">人海茫茫，一个人的力量是有限的。</span><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 1.6;">希望大家帮忙，寻找和提供有效线索。</span>
            </p>
        </blockquote>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            <br/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            卢爱华近照
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_jpg/IwqDjbv57cFtvDR3CmqkgeyhPHaLODBLibDubiaFtWrfa3wibQ8QNsDUS0bB1Qa4HTDHHPibceFNOJMMCMGfibzOujg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_jpg/IwqDjbv57cFtvDR3CmqkgeyhPHaLODBLvEO5NibiaUNiajZ0GcPj0AG27P7E0gIVWibN41xeLqARsXnSe5jCv4BWDw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_jpg/IwqDjbv57cFtvDR3CmqkgeyhPHaLODBLkM5H2VIU7m61GUZKA4O0Wlyfxs2wCvuTy0WykhMBmhN4XUTTPSbjtA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
        </p>
        <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
            <img src="http://mmbiz.qpic.cn/mmbiz_jpg/IwqDjbv57cFtvDR3CmqkgeyhPHaLODBLfU26CKUjdHibPFib6vjnpghKnicWicdgKW0UOuAicZ75OKB8ZQYWk91OLAQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/><br/>
        </p>
    </section>
</p>
<p>
    <br/>
</p>',
			'2016.12.01', '2016.12.01', 
            'http://img0.imgtn.bdimg.com/it/u=2627828869,1070682005&fm=21&gp=0.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/IwqDjbv57cFtvDR3CmqkgeyhPHaLODBLibDubiaFtWrfa3wibQ8QNsDUS0bB1Qa4HTDHHPibceFNOJMMCMGfibzOujg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');    
insert communityinfo(id, title, communityname, content, createtime, modifytime, headimgurl, contentimgurl)
	values(12,'体侧通知','广东工业大学第五社团','<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_gif/Iw1nMhDqWZj4z98uWegNKSTkW1D6dNoakHR8cgicJvhOnYhUrJeiaMCbONNnExDbryE85ITv4zEiavrYkdv6wkOYw/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif"/><br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">这个周末</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">广工大学城很不一般</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">在体育馆惊现排队壮观</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">搞事情？<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px; line-height: 1.6;">排队排出新境界<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">竟是因为<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 41, 65); text-decoration: underline;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">体测</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">W型队伍</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/Iw1nMhDqWZiaqib1vogsfib1haKLNMd0Lr0YZfmdA4TFfUclrkUqGD7iczdvLNicLEwd0P1V2SVGyrJlwISbPPMfcBw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">V型队伍</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">汤勺型队伍</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">生无可恋型</strong></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">今年学校的体测<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">全面采用机器测量</strong>，力求测量的准确与方便，然而由于这个周末是体测的最后日期，而且大一体测也安排在周末而不随堂测，导致出现了这等排队壮观现象。从上周末开始，体测的人数开始疯狂上涨。</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">器材室门口排满了人，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">特别是立定跳远项目</strong>，因为只有两个机器在测，那队伍简直是让人望而却步。据悉，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">起码要排半个小时以上才能测立定跳远</strong>。<br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">在跑道那边，1000米和50米更是可怕，<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">从早上不到八点开始，就有人在排队</strong>，直到晚上9点结束才消停。当然，都是男生，一望无际的男生。</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">从昨天开始，有很多人在抱怨，朋友圈有很多关于体测的调侃。</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"></p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/Iw1nMhDqWZiaqib1vogsfib1haKLNMd0Lr0H9YxSbl7b4PGOe5MDpoZsd242U5FicwXoqu16CoK188DJpaiaYYSoQGg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">体测让我怀疑人生，现在流行早起？</span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">体测的第一个项目：排队</span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">体测给了我一个难忘的周末<br/></span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">体测比校运会还要有气氛</span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">更是有同学做起了小本生意</span></strong>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <img src="http://mmbiz.qpic.cn/mmbiz_jpg/Iw1nMhDqWZiaqib1vogsfib1haKLNMd0Lr0D0iac8kibn0YGd5lz1hjlZTRzkiaXewMGAuSQygACETib1DMofnDkTo3xA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">今天是体测的最后一天，人挤到爆，有些同学不得已便放弃了队伍很长的项目，还有很多同学没测完所有的项目。而就在今晚，各班的体委都发了这么一条通知：</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<blockquote style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left: 3px solid rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        【紧急】
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        体测项目缺少任何一项都无法合成成绩！
    </p>
    <p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">
        所以，没测完的下周末要去龙洞校区补测，有身体原因的要申请免测
    </p>
</blockquote>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">心疼还没测完的宝宝n秒</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">城里的宝宝体测很心累</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">龙洞的宝宝也要做好准备了</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">虽然</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">我一点也不怕体侧排的长龙队伍</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">因为</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;">我已经测完了</span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><br/></span>
</p>
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">
    <span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 14px;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/Iw1nMhDqWZh71mjvcKeaD4ia9ialv9Fib4XSZpjUQ5Shk8dRicx26xiaic7Nut6WUcgibVGEkpzKJfBePfch4U4tT8Y3g/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1"/></span>
</p>
<p>
    <br/>
</p>',
			'2016.12.02', '2016.12.02',  
            'http://awb.img.xmtbang.com/img/uploadnew/201510/23/30140ddc41a74ff6861c76a249656218.jpg',
            'http://mmbiz.qpic.cn/mmbiz_jpg/Iw1nMhDqWZiaqib1vogsfib1haKLNMd0Lr0YZfmdA4TFfUclrkUqGD7iczdvLNicLEwd0P1V2SVGyrJlwISbPPMfcBw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1');
    
SET SQL_SAFE_UPDATES = 0;
select * from communityinfo;
delete from communityinfo;
drop table communityinfo; 


-- 校内新闻管理
create table campusnews(
	id integer not null,
    title varchar(256) not null,
    department varchar(50) not null,
    date varchar(20),
    weekday varchar(20),
    url varchar(50),
    content text(16384),
    primary key(id)
);

insert campusnews(id, title, department, date, weekday, content)
	values(1, '关于召开“两学一做”学习教育党支部专题组织生活会的通知', '组织部', '2016/11/23', '星期三', '<div class="articleBody" id="articleBody" style=" margin-top:30px; margin-left:25px; margin-right:25px; margin-bottom:30px;">
               
               <center><span style="font-size:38px; font-weight:bold; line-height:40px;">关于召开“两学一做”学习教育党支部专题组织生活会的通知</span></center>
               <br>
                单 位：组织部
               <br>
               二级党委、党总支，各党支部：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据学校《关于在全体党员中开展“学党章党规、学系列讲话，做合格党员”学习教育方案》以及《中共广东工业大学委员会关于认真学习宣传贯彻党的十八届六中全会精神的通知》（广工大党字〔2016〕25号）的相关工作安排，定于11月下旬至12月上旬，召开党支部专题组织生活会，学习党的十八届六中全会精神，开展民主评议党员活动。具体要求如下：<br>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一、学习党的十八届六中全会精神</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党的十八届六中全会是在我国进入全面建成小康社会决胜阶段召开的一次十分重要的会议。会议审议通过《关于新形势下党内政治生活的若干准则》（以下简称《准则》）和修订后的《中国共产党党内监督条例》（以下简称《条例》）。学习宣传全会精神，是当前和今后一个时期一项重大政治任务，各级党组织要切实把思想和行动统一到中央的决策部署上来。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在本次专题组织生活会上，每位党员要联系自身的实际，谈思想认识，谈学习的体会。要做到“四个深刻领会”：一要深刻领会十八届六中全会的重大意义，二要深刻领会全会明确习近平总书记核心地位的重大意义，三深刻领会习近平总书记在全会上的重要讲话精神，四要深刻领会《准则》和《条例》的重大意义。<br>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 二、开展民主评议党员活动</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp; （一）评议范围<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 组织关系在学校的正式党员和预备党员。<br>
&nbsp;&nbsp;&nbsp;&nbsp; （二）方法步骤<br>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. </strong><strong>学习教育：</strong>内容上，围绕“两学一做”学习教育，紧密结合党的十八届六中全会精神学习。学习方法上，可以多种多样，要讲求实效。<br>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. </strong><strong>个人自评和党员互评</strong>：在学习讨论的基础上，以党支部或党小组为单位，组织召开党员大会。党员个人对照“四讲四有”党员标准，对照入党誓词、联系个人实际进行党性分析，开展批评与自我批评。会上，要认真查摆问题、深刻剖析根源、明确整改方向。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;3. </strong><strong>民主测评</strong>：党支部发放测评表（附件1），对每名党员进行民主测评，并汇总统计测评表提出初步意见报上级党组织。要对民主测评结果进行分析研究，支部班子成员要与每名党员谈心谈话。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;4. </strong><strong>组织评定</strong>：各二级党组织综合民主测评情况和党员日常表现，确定评议等次，对有不合格表现的党员，按照党章和党内有关规定，区别不同情况，提出意见，报学校党委组织部，稳妥慎重给予组织处置。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 三、时间安排和相关要求<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12月9日前，各党支部召开专题组织生活会，在专题组织生活会上，完成学习党的十八届六中全会精神和民主评议党员两项内容。12月13日前，各二级党组织将有关材料的电子版报党委组织部（<a href="mailto:zzbzzk@gdut.edu.cn">zzbzzk@gdut.edu.cn</a>）。报送材料包括：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （1）学习党的十八届六中全会精神报告。报告包含以下内容：所属各党支部学习计划、学习内容和党员参与情况、具体做法、学习体会摘要、学习效果等，字数不少于2000字。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)党员民主测评统计表（附件2）。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人：汤老师；&nbsp;&nbsp;&nbsp; 电话：39322626。<br>
&nbsp;<br>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;附件：1.<a href="http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件1：党员民主测评表.doc">党员民主测评表</a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2.<a href="http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件2：党员民主测评统计表(1).doc">党员民主测评统计表</a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党委组织部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2016年11月23日<br>

                   <br>
               </div>');
               
insert campusnews(id, title, department, date, weekday, content)
	values(2, '龙洞校区预停电通知', '基建处', '2016/11/09', '星期三',
    '<div class="articleBody" id="articleBody" style=" margin-top:30px; margin-left:25px; margin-right:25px; margin-bottom:30px;">
               
               <center><span style="font-size:38px; font-weight:bold; line-height:40px;">龙洞校区预停电通知</span></center>
               <br>
                单 位：基建处
               <br>
               &nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 接供电局通知，龙洞校区供电增容工程需进行更换高压计量设备的工作，现定于2016年11月19日（星期六）上午7:30至下午7:30，对龙洞校区内区学生宿舍和内区食堂进行停电，期间电梯停运。请各用户单位、教职员工及在校学生提前做好相应准备。不便之处请谅解，多谢支持！<br>&nbsp;&nbsp;&nbsp;&nbsp; （联系人：张老师，13380039029）<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 基建处<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2016年11月9日<br>
                   <br>
               </div>');
               
insert campusnews(id, title, department, date, weekday, content)
	values(3,' 校运会开幕式预演通知','工会','2016/11/18','星期五',
    '<div class="articleBody" id="articleBody" style=" margin-top:30px; margin-left:25px; margin-right:25px; margin-bottom:30px;">
               
               <center><span style="font-size:38px; font-weight:bold; line-height:40px;"> 校运会开幕式预演通知</span></center>
               <br>
                单 位：工会
               <br>
               <span style="font-size: 18px">各部门工会：<br>&nbsp;&nbsp;&nbsp; 接体育部通知，11月22日晚上7时进行开幕式预演，请各部门工会组织好参加太极拳表演的教职工准时到位。预演后请集中到体育馆进行赛前熟悉。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 校工会</span>
                   <br>
               </div>');

SET SQL_SAFE_UPDATES = 0;
select * from campusnews;
delete from campusnews;
drop table campusnews; 

