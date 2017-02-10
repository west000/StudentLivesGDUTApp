package com.tzh.campushelper.service;

import com.tzh.campushelper.util.GsonProvider;

import java.util.concurrent.TimeUnit;

import retrofit2.http.Body;
import rx.Observable;

//public class DummyApiService implements ApiService {
//
//    private static final DummyApiService INSTANCE = new DummyApiService();
//
//    private DummyApiService() {
//
//    }
//
//    public static DummyApiService getInstance() {
//        return INSTANCE;
//    }
//
//    @Override
//    public Observable<RegisterResult> register(@Body RegisterParam param) {
//        return Observable.just(new RegisterResult()).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<LoginResult> login(@Body LoginParam param) {
//        return Observable.just(new LoginResult()).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<LoginEducationSystemResult> loginEducationSystem(@Body LoginEducationSystemParam param) {
//        return Observable.just(new LoginEducationSystemResult()).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<ExamTimeResult> queryExamTime(@Body IdParam param) {
//        String json = "{\n" +
//                "\t'message': '查询成功',\n" +
//                "\t'status': '0',\n" +
//                "\t'examtime': \n" +
//                "\t[\n" +
//                "\t\t{'campus': '大学城校园', 'classroom': '教3-209', 'mode': '&nbsp;', 'seat': '7', 'cname': '算法设计与分析', 'time': '第9周周2(2016-10-25)第8,9节', 'cno': '(2016-2017-1)-24102920-00006199-2', 'sname': '黄伟塨'}, \n" +
//                "\t\t{'campus': '大学城校园', 'classroom': '教3-206', 'mode': '&nbsp;', 'seat': '7', 'cname': '软件需求分析', 'time': '第13周周4(2016-11-24)第6,7节', 'cno': '(2016-2017-1)-24122015-00005625-2', 'sname': '黄伟塨'}, \n" +
//                "\t\t{'campus': '大学城校园', 'classroom': '教5-207', 'mode': '&nbsp;', 'seat': '7', 'cname': '信息安全概论', 'time': '第16周周5(2016-12-16)第6,7节', 'cno': '(2016-2017-1)-24106420-00006484-3', 'sname': '黄伟塨'}, \n" +
//                "\t\t{'campus': '大学城校园', 'classroom': '教5-205', 'mode': '&nbsp;', 'seat': '7', 'cname': '操作系统', 'time': '2016年12月22日(09:30-11:30)', 'cno': '(2016-2017-1)-24121030-00002609-2', 'sname': '黄伟塨'}, \n" +
//                "\t\t{'campus': '大学城校园', 'classroom': '教5-204', 'mode': '&nbsp;', 'seat': '7', 'cname': '数据库系统', 'time': '2016年12月26日(09:30-11:30)', 'cno': '(2016-2017-1)-20100930-00005661-2', 'sname': '黄伟塨'}\n" +
//                "\t]\n" +
//                "}";
//        ExamTimeResult value = getResult(json, ExamTimeResult.class);
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<GradeExamResult> queryGradeExam(@Body IdParam param) {
//        String json = "{\n" +
//                "\t'status': '0',\n" +
//                "\t'message': '查询成功',\n" +
//                "\t'gradeexam': \n" +
//                "\t[\n" +
//                "\t\t{'writeS': '161', 'complexS': '&nbsp;', 'year': '2014-2015', 'totalS': '505', 'semester': '2', 'examname': '英语四级', 'listenS': '162', 'id': '440380151105219', 'time': '&nbsp;', 'readS': '182'}, \n" +
//                "\t\t{'writeS': '114', 'complexS': '&nbsp;', 'year': '2015-2016', 'totalS': '409', 'semester': '1', 'examname': '英语六级', 'listenS': '123', 'id': '440380152231325', 'time': '20151219', 'readS': '172'}, \n" +
//                "\t\t{'writeS': '124', 'complexS': '&nbsp;', 'year': '2015-2016', 'totalS': '430', 'semester': '2', 'examname': '英语六级', 'listenS': '131', 'id': '440380161216014', 'time': '20160618', 'readS': '175'}\n" +
//                "\t]  \n" +
//                "}";
//        GradeExamResult value = getResult(json, GradeExamResult.class);
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<CurriculumResult> queryCurriculum(@Body SemesterParam param) {
//        String json = "{\n" +
//                "\t'message': '查询成功', \n" +
//                "\t'status': '0', \n" +
//                "\t'courses': \n" +
//                "\t[\n" +
//                "\t\t{'tname': '吴绍辉', 'time': '第1,2节{第6-19周}', 'classroom': '教2-527', 'weekday': '周一', 'cname': '大学英语（1）'}, \n" +
//                "\t\t{'tname': '李丽娜', 'time': '第1,2节{第5-19周}', 'classroom': '2号大教室', 'weekday': '周二', 'cname': '中国近现代史纲要'}, \n" +
//                "\t\t{'tname': '王琳', 'time': '第1,2节{第5-19周}', 'classroom': '教1-337', 'weekday': '周三', 'cname': '线性代数'}, \n" +
//                "\t\t{'tname': '吴绍辉', 'time': '第1,2节{第5-19周|单周}', 'classroom': '实3-513', 'weekday': '周五', 'cname': '大学英语（1）'}, \n" +
//                "\t\t{'tname': '吴绍辉', 'time': '第1,2节{第6-18周|双周}', 'classroom': '教2-527', 'weekday': '周五', 'cname': '大学英语（1）'}, \n" +
//                "\t\t{'tname': '肖存涛', 'time': '第3,4节{第6-19周}', 'classroom': '教1-330', 'weekday': '周一', 'cname': '高等数学A（1）'}, \n" +
//                "\t\t{'tname': '肖存涛', 'time': '第1,2节{第5-19周}', 'classroom': '教1-330', 'weekday': '周三', 'cname': '高等数学A（1）'}, \n" +
//                "\t\t{'tname': '肖存涛', 'time': '第3,4节{第5-19周}', 'classroom': '教1-330', 'weekday': '周五', 'cname': '高等数学A（1）'}, \n" +
//                "\t\t{'tname': '何萍/柯婷', 'time': '第3,4节{第11-11周}', 'classroom': '1号大教室', 'weekday': '周六', 'cname': '大学生职业规划与创业教育'},\n" +
//                "\t\t{'tname': '何萍/柯婷', 'time': '第3,4节{第13-14周}', 'classroom': '1号大教室', 'weekday': '周六', 'cname': '大学生职业规划与创业教育'}, \n" +
//                "\t\t{'tname': '谢光强', 'time': '第6,7节{第6-17周}', 'classroom': '教1-331', 'weekday': '周一', 'cname': '程序设计（1）'}, \n" +
//                "\t\t{'tname': '吴绍辉', 'time': '第6,7节{第17-19周}', 'classroom': '教2-527', 'weekday': '周三', 'cname': '大学英语（1）'}, \n" +
//                "\t\t{'tname': '李丽娜', 'time': '第6,7节{第19-19周|单周}', 'classroom': '4号大教室', 'weekday': '周五', 'cname': '中国近现代史纲要'}, \n" +
//                "\t\t{'tname': '王琳', 'time': '第6,7节{第5-5周|单周}', 'classroom': '教1-337', 'weekday': '周五', 'cname': '线性代数'}, \n" +
//                "\t\t{'tname': '谢光强', 'time': '第8,9节{第6-17周}', 'classroom': '教1-326', 'weekday': '周一', 'cname': '计算机系统导论'}\n" +
//                "\t]\n" +
//                "}";
//        CurriculumResult value = getResult(json, CurriculumResult.class);
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<ScoreResult> queryScore(@Body SemesterParam param) {
//        String json = "{\n" +
//                "\t'message': '查询成功', \n" +
//                "\t'status': '0', \n" +
//                "\t'score': \n" +
//                "\t[\n" +
//                "\t\t{'cno': '03100A01', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '83', 'minor': '0', 'attribute': '&nbsp;', 'credit': '5.5', 'cname': '高等数学A（1）'}, \n" +
//                "\t\t{'cno': '02131010', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '84', 'minor': '0', 'attribute': '&nbsp;', 'credit': '1.0', 'cname': '大学生职业规划与创业教育'}, \n" +
//                "\t\t{'cno': '05102020', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '92', 'minor': '0', 'attribute': '&nbsp;', 'credit': '2.0', 'cname': '军事理论'}, \n" +
//                "\t\t{'cno': '05100111', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '90', 'minor': '0', 'attribute': '&nbsp;', 'credit': '2.0', 'cname': '体育（1）'}, \n" +
//                "\t\t{'cno': '01112020', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '88', 'minor': '0', 'attribute': '&nbsp;', 'credit': '2.0', 'cname': '中国近现代史纲要'}, \n" +
//                "\t\t{'cno': '01118715', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '82', 'minor': '0', 'attribute': '&nbsp;', 'credit': '1.5', 'cname': '大学生心理健康教育'}, \n" +
//                "\t\t{'cno': '02100116', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '85', 'minor': '0', 'attribute': '&nbsp;', 'credit': '4.0', 'cname': '大学英语（1）'}, \n" +
//                "\t\t{'cno': '04100620', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '公共基础课', 'score': '优秀', 'minor': '0', 'attribute': '&nbsp;', 'credit': '2.0', 'cname': '计算机文化基础'}, \n" +
//                "\t\t{'cno': '05200120', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '实验实习实训', 'score': '良好', 'minor': '0', 'attribute': '&nbsp;', 'credit': '2.0', 'cname': '军训'}, \n" +
//                "\t\t{'cno': '24225911', 'bukao': '&nbsp;', 'chongxiu': '&nbsp;', 'kind': '实验实习实训', 'score': '优秀', 'minor': '0', 'attribute': '&nbsp;', 'credit': '1.0', 'cname': '程序设计实验（1）'}\n" +
//                "\t]\n" +
//                "}";
//        ScoreResult value = getResult(json, ScoreResult.class);
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<QueryCommunityInfoResult> getCommunityInfo() {
//        String json = "" +
//                "{\n" +
//                "\t'status': '0',\n" +
//                "\t'message': '成功获取社团信息', \n" +
//                "\t'communityinfo': \n" +
//                "\t\t[\n" +
//                "\t\t\t{\n" +
//                "\t\t\t\t'contentimgurl': 'http://img5.imgtn.bdimg.com/it/u=3342747550,1041219101&fm=21&gp=0.jpg', \n" +
//                "\t\t\t\t'createtime': '2016.11.11', \n" +
//                "\t\t\t\t'id': 1, \n" +
//                "\t\t\t\t'title': '你好广工', \n" +
//                "\t\t\t\t'content': '<html><head><title>欢迎来到广工第一社团</title></head><body>你好,这里是广工第一社团！</body></html>', \n" +
//                "\t\t\t\t'headimgurl': 'http://img4.imgtn.bdimg.com/it/u=1876538948,1307669552&fm=11&gp=0.jpg', \n" +
//                "\t\t\t\t'communityname': '广东工业大学第一社团'\n" +
//                "\t\t\t}, \n" +
//                "\t\t\t{\n" +
//                "\t\t\t\t'contentimgurl': 'http://img3.imgtn.bdimg.com/it/u=2744129126,100553083&fm=21&gp=0.jpg', \n" +
//                "\t\t\t\t'createtime': '2016.11.18',\n" +
//                "\t\t\t\t'id': 2, \n" +
//                "\t\t\t\t'title': '广工社团招新', \n" +
//                "\t\t\t\t'content': '<html><head><title>欢迎来到广工第二社团</title></head><body>你好,这里是广工第二社团！</body></html>', \n" +
//                "\t\t\t\t'headimgurl': 'http://img0.imgtn.bdimg.com/it/u=2627828869,1070682005&fm=21&gp=0.jpg', \n" +
//                "\t\t\t\t'communityname': '广东工业大学第二社团'\n" +
//                "\t\t\t}\n" +
//                "\t\t] \n" +
//                "}\n";
//
//
//        QueryCommunityInfoResult value = getResult(json, QueryCommunityInfoResult.class);
//        String content = "<img src=\"http://img05.tooopen.com/images/20150201/sl_109938035874.jpg\" onerror=\"javascript:this.src='http://resource.tooopen.com/image/no-img-192.gif';this.onerror=null;\" alt=\"高清雪山背景画面\" class=\"imgItem\">";
//        value.communityinfo.add(new QueryCommunityInfoResult.CommunityInfo("3", "", "", content, "", "", ""));
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<QueryCommunityInfoResult> queryCommunityInfo(@Body QueryCommunityInfoParam param) {
//        return getCommunityInfo();
//    }
//
//    private Observable<QueryCampusNewsResult> getCampusNews1() {
//        String json = "\n" +
//                "{\n" +
//                "\t'status': '0',\n" +
//                "\t'message': '成功获取校内新闻',  \n" +
//                "\t'news': \n" +
//                "\t\t[\n" +
//                "\t\t\t{\n" +
//                "\t\t\t\t'date': '2016/11/23', \n" +
//                "\t\t\t\t'weekday': '星期三', \n" +
//                "\t\t\t\t'id': 1, \n" +
//                "\t\t\t\t'title': '关于召开“两学一做”学习教育党支部专题组织生活会的通知', \n" +
//                "\t\t\t\t'department': '组织部',\n" +
//                "\t\t\t\t'content': '<div class=\"articleBody\" id=\"articleBody\" style=\" margin-top:30px; margin-left:25px; margin-right:25px; margin-bottom:30px;\">\n" +
//                "               \n" +
//                "               <center><span style=\"font-size:38px; font-weight:bold; line-height:40px;\">关于召开“两学一做”学习教育党支部专题组织生活会的通知</span></center>\n" +
//                "               <br>\n" +
//                "                单 位：组织部\n" +
//                "               <br>\n" +
//                "               二级党委、党总支,各党支部：<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据学校《关于在全体党员中开展“学党章党规、学系列讲话,做合格党员”学习教育方案》以及《中共广东工业大学委员会关于认真学习宣传贯彻党的十八届六中全会精神的通知》（广工大党字〔2016〕25号）的相关工作安排,定于11月下旬至12月上旬，召开党支部专题组织生活会，学习党的十八届六中全会精神，开展民主评议党员活动。具体要求如下：<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一、学习党的十八届六中全会精神</strong><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党的十八届六中全会是在我国进入全面建成小康社会决胜阶段召开的一次十分重要的会议。会议审议通过《关于新形势下党内政治生活的若干准则》（以下简称《准则》）和修订后的《中国共产党党内监督条例》（以下简称《条例》）。学习宣传全会精神,是当前和今后一个时期一项重大政治任务,各级党组织要切实把思想和行动统一到中央的决策部署上来。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在本次专题组织生活会上,每位党员要联系自身的实际,谈思想认识，谈学习的体会。要做到“四个深刻领会”：一要深刻领会十八届六中全会的重大意义，二要深刻领会全会明确习近平总书记核心地位的重大意义，三深刻领会习近平总书记在全会上的重要讲话精神，四要深刻领会《准则》和《条例》的重大意义。<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 二、开展民主评议党员活动</strong><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp; （一）评议范围<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 组织关系在学校的正式党员和预备党员。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp; （二）方法步骤<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. </strong><strong>学习教育：</strong>内容上,围绕“两学一做”学习教育,紧密结合党的十八届六中全会精神学习。学习方法上，可以多种多样，要讲求实效。<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. </strong><strong>个人自评和党员互评</strong>：在学习讨论的基础上,以党支部或党小组为单位,组织召开党员大会。党员个人对照“四讲四有”党员标准，对照入党誓词、联系个人实际进行党性分析，开展批评与自我批评。会上，要认真查摆问题、深刻剖析根源、明确整改方向。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;3. </strong><strong>民主测评</strong>：党支部发放测评表（附件1）,对每名党员进行民主测评,并汇总统计测评表提出初步意见报上级党组织。要对民主测评结果进行分析研究，支部班子成员要与每名党员谈心谈话。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;4. </strong><strong>组织评定</strong>：各二级党组织综合民主测评情况和党员日常表现,确定评议等次,对有不合格表现的党员，按照党章和党内有关规定，区别不同情况，提出意见，报学校党委组织部，稳妥慎重给予组织处置。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 三、时间安排和相关要求<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12月9日前,各党支部召开专题组织生活会,在专题组织生活会上，完成学习党的十八届六中全会精神和民主评议党员两项内容。12月13日前，各二级党组织将有关材料的电子版报党委组织部（<a href=\"mailto:zzbzzk@gdut.edu.cn\">zzbzzk@gdut.edu.cn</a>）。报送材料包括：<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （1）学习党的十八届六中全会精神报告。报告包含以下内容：所属各党支部学习计划、学习内容和党员参与情况、具体做法、学习体会摘要、学习效果等,字数不少于2000字。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)党员民主测评统计表（附件2）。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人：汤老师；&nbsp;&nbsp;&nbsp; 电话：39322626。<br>\n" +
//                "&nbsp;<br>\n" +
//                "&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;附件：1.<a href=\"http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件1：党员民主测评表.doc\">党员民主测评表</a><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2.<a href=\"http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件2：党员民主测评统计表(1).doc\">党员民主测评统计表</a><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党委组织部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2016年11月23日<br>\n" +
//                "\n" +
//                "                   <br>\n" +
//                "               </div>'\n" +
//                "\t\t\t},\n" +
//                "\t\t\t\n" +
//                "\t\t\t{\n" +
//                "\t\t\t\t'date': '2016/11/23', \n" +
//                "\t\t\t\t'weekday': '星期三', \n" +
//                "\t\t\t\t'id': 2, \n" +
//                "\t\t\t\t'title': '关于召开“两学一做”学习教育党支部专题组织生活会的通知', \n" +
//                "\t\t\t\t'department': '组织部',\n" +
//                "\t\t\t\t'content': '<div class=\"articleBody\" id=\"articleBody\" style=\" margin-top:30px; margin-left:25px; margin-right:25px; margin-bottom:30px;\">\n" +
//                "               \n" +
//                "               <center><span style=\"font-size:38px; font-weight:bold; line-height:40px;\">关于召开“两学一做”学习教育党支部专题组织生活会的通知</span></center>\n" +
//                "               <br>\n" +
//                "                单 位：组织部\n" +
//                "               <br>\n" +
//                "               二级党委、党总支,各党支部：<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据学校《关于在全体党员中开展“学党章党规、学系列讲话,做合格党员”学习教育方案》以及《中共广东工业大学委员会关于认真学习宣传贯彻党的十八届六中全会精神的通知》（广工大党字〔2016〕25号）的相关工作安排,定于11月下旬至12月上旬，召开党支部专题组织生活会，学习党的十八届六中全会精神，开展民主评议党员活动。具体要求如下：<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一、学习党的十八届六中全会精神</strong><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党的十八届六中全会是在我国进入全面建成小康社会决胜阶段召开的一次十分重要的会议。会议审议通过《关于新形势下党内政治生活的若干准则》（以下简称《准则》）和修订后的《中国共产党党内监督条例》（以下简称《条例》）。学习宣传全会精神,是当前和今后一个时期一项重大政治任务,各级党组织要切实把思想和行动统一到中央的决策部署上来。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在本次专题组织生活会上,每位党员要联系自身的实际,谈思想认识，谈学习的体会。要做到“四个深刻领会”：一要深刻领会十八届六中全会的重大意义，二要深刻领会全会明确习近平总书记核心地位的重大意义，三深刻领会习近平总书记在全会上的重要讲话精神，四要深刻领会《准则》和《条例》的重大意义。<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 二、开展民主评议党员活动</strong><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp; （一）评议范围<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 组织关系在学校的正式党员和预备党员。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp; （二）方法步骤<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. </strong><strong>学习教育：</strong>内容上,围绕“两学一做”学习教育,紧密结合党的十八届六中全会精神学习。学习方法上，可以多种多样，要讲求实效。<br>\n" +
//                "<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. </strong><strong>个人自评和党员互评</strong>：在学习讨论的基础上,以党支部或党小组为单位,组织召开党员大会。党员个人对照“四讲四有”党员标准，对照入党誓词、联系个人实际进行党性分析，开展批评与自我批评。会上，要认真查摆问题、深刻剖析根源、明确整改方向。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;3. </strong><strong>民主测评</strong>：党支部发放测评表（附件1）,对每名党员进行民主测评,并汇总统计测评表提出初步意见报上级党组织。要对民主测评结果进行分析研究，支部班子成员要与每名党员谈心谈话。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;4. </strong><strong>组织评定</strong>：各二级党组织综合民主测评情况和党员日常表现,确定评议等次,对有不合格表现的党员，按照党章和党内有关规定，区别不同情况，提出意见，报学校党委组织部，稳妥慎重给予组织处置。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 三、时间安排和相关要求<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12月9日前,各党支部召开专题组织生活会,在专题组织生活会上，完成学习党的十八届六中全会精神和民主评议党员两项内容。12月13日前，各二级党组织将有关材料的电子版报党委组织部（<a href=\"mailto:zzbzzk@gdut.edu.cn\">zzbzzk@gdut.edu.cn</a>）。报送材料包括：<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （1）学习党的十八届六中全会精神报告。报告包含以下内容：所属各党支部学习计划、学习内容和党员参与情况、具体做法、学习体会摘要、学习效果等,字数不少于2000字。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)党员民主测评统计表（附件2）。<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系人：汤老师；&nbsp;&nbsp;&nbsp; 电话：39322626。<br>\n" +
//                "&nbsp;<br>\n" +
//                "&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;附件：1.<a href=\"http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件1：党员民主测评表.doc\">党员民主测评表</a><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2.<a href=\"http://news.gdut.edu.cn/DepartmentUploadFiles/组织部/files/附件2：党员民主测评统计表(1).doc\">党员民主测评统计表</a><br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 党委组织部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\n" +
//                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2016年11月23日<br>\n" +
//                "\n" +
//                "                   <br>\n" +
//                "               </div>'\n" +
//                "\t\t\t}\n" +
//                "\t\t\t\n" +
//                "\t\t]\n" +
//                "}";
//        QueryCampusNewsResult value = getResult(json, QueryCampusNewsResult.class);
//        for (int i = 0; i < 10; i++) {
//            QueryCampusNewsResult.News e = new QueryCampusNewsResult.News();
//            e.id = "" + i;
//            e.title = "title" + i;
//            e.content = "content" + i;
//            e.date = "2016/12/1" + i;
//            e.deparment = "广工" + i + "部";
//            e.weekday = "周三";
//            value.news.add(e);
//        }
//        return Observable.just(value).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<QueryCampusNewsResult> getCampusNews() {
//        a = 0;
//        return getCampusNews1();
//    }
//
//    private int a = 0;
//
//    @Override
//    public Observable<QueryCampusNewsResult> queryCampusNews(@Body QueryCampusNewsParam param) {
//        if (a >= 3) {
//            return Observable.just(new QueryCampusNewsResult()).delay(1, TimeUnit.SECONDS);
//        }
//        a++;
//        return getCampusNews1();
//    }
//
//    @Override
//    public Observable<UserInfoResult> getUserInfo(@Body UserNameParam param) {
//        String json = "{\n" +
//                "  \"status\": 0,\n" +
//                "  \"message\": \"成功获取用户个人信息\",\n" +
//                "\"personinfo\": {}\n" +
//                "}\n";
//        return Observable.just(getResult(json, UserInfoResult.class)).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<ModifyUserInfoResult> modifyUserInfo(@Body ModifyUserInfoParam param) {
//        return Observable.just(new ModifyUserInfoResult()).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<ReportDormRepairResult> reportDormRepair(@Body ReportDormRepairParam param) {
//        return Observable.just(new ReportDormRepairResult()).delay(1, TimeUnit.SECONDS);
//    }
//
//    @Override
//    public Observable<DormRepairStateResult> getDormRepairState(@Body UserNameParam param) {
//        String json = "{\n" +
//                "\t'message': '成功获取宿舍维修信息', \n" +
//                "\t'status': '0',\n" +
//                "\t'repairstate': \n" +
//                "\t[\n" +
//                "\t\t{'time': '2016.11.1', 'description': '风扇坏了', 'telephone': '1591464561', 'username': 'woshiweiye', 'dormitory': '西三521', 'project': '电风扇', 'realname': '你好世界', 'state': 0}, \t# 此外的state==0，表示未维修\n" +
//                "\t\t{'time': '2016.11.12', 'description': '空调坏了', 'telephone': '1591464561', 'username': 'woshiweiye', 'dormitory': '西三521', 'project': '空调', 'realname': '你好世界', 'state': 1}\t\t# 此外的state==1，表示已维修\n" +
//                "\t] \n" +
//                "}";
//        return Observable.just(getResult(json, DormRepairStateResult.class)).delay(1, TimeUnit.SECONDS);
//    }
//
//    private <T extends Result> T getResult(String json, Class<T> cls) {
//        return GsonProvider.create().fromJson(json, cls);
//    }
//
//}
