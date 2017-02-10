package com.tzh.campushelper.service;

import android.text.TextUtils;

import com.tzh.campushelper.util.GsonProvider;
import com.tzh.campushelper.util.Objects;

import java.io.Serializable;
import java.util.List;
import java.util.Locale;

import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import rx.Observable;

import static com.tzh.campushelper.util.CastUtils.toDouble;

public interface ApiService {

    // ---------- Http apis -----------------

    @POST("/register")
    Observable<RegisterResult> register(@Body RegisterParam param);

    @POST("/login")
    Observable<LoginResult> login(@Body LoginParam param);

    @POST("/educationSystem/login")
    Observable<LoginEducationSystemResult> loginEducationSystem(@Body LoginEducationSystemParam param);

    @POST("/educationSystem/examtime")
    Observable<ExamTimeResult> queryExamTime(@Body IdParam param);

    @POST("/educationSystem/gradeExam")
    Observable<GradeExamResult> queryGradeExam(@Body IdParam param);

    @POST("/educationSystem/courses")
    Observable<CurriculumResult> queryCurriculum(@Body SemesterParam param);

    @POST("/educationSystem/score")
    Observable<ScoreResult> queryScore(@Body SemesterParam param);

    @GET("/community/getcommunityinfo")
    Observable<QueryCommunityInfoResult> getCommunityInfo();

    @POST("/community/getcommunityinfo")
    Observable<QueryCommunityInfoResult> queryCommunityInfo(@Body QueryCommunityInfoParam param);

    @GET("/campusnews/news")
    Observable<QueryCampusNewsResult> getCampusNews();

    @POST("/campusnews/news")
    Observable<QueryCampusNewsResult> queryCampusNews(@Body QueryCampusNewsParam param);

    @POST("/personalInfo/information")
    Observable<UserInfoResult> getUserInfo(@Body UserNameParam param);

    @POST("/personalInfo/modify")
    Observable<ModifyUserInfoResult> modifyUserInfo(@Body ModifyUserInfoParam param);

    @POST("/dormitoryrepair/report")
    Observable<ReportDormRepairResult> reportDormRepair(@Body ReportDormRepairParam param);

    @POST("/dormitoryrepair/repairstate")
    Observable<DormRepairStateResult> getDormRepairState(@Body UserNameParam param);

    // ---------- Parameters and results -----------------

    class Param {
    }

    class Result {
        public int status;
        public String message = "";

        public boolean isOk() {
            return status == 0;
        }

        public String getMessage() {
            if (!TextUtils.isEmpty(message)) {
                return message;
            } else {
                return otherErrMsg();
            }
        }

        protected String otherErrMsg() {
            if (status == 10) {
                return "登录过期，请重新登录";
            } else {
                return "未知错误";
            }
        }

        @Override
        public boolean equals(Object obj) {
            return obj instanceof Result
                    && this.status == ((Result) obj).status
                    && Objects.equals(this.message, ((Result) obj).message);
        }
    }

    class RegisterParam extends Param {

        private String username;
        private String password;

        public RegisterParam(String username, String password) {
            this.username = username;
            this.password = password;
        }

    }

    class RegisterResult extends Result {

        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "用户名已存在";
                case 2:
                    return "用户名或密码不符合要求";
                default:
                    return "注册失败";
            }
        }
    }


    class LoginParam extends Param {

        private String username;
        private String password;

        public LoginParam(String username, String password) {
            this.username = username;
            this.password = password;
        }
    }

    class LoginResult extends Result {
        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "用户名或密码错误";
                default:
                    return super.otherErrMsg();
            }
        }
    }

    class LoginEducationSystemParam extends Param {

        private String id;
        private String password;

        public LoginEducationSystemParam(String id, String password) {
            this.id = id;
            this.password = password;
        }
    }

    class LoginEducationSystemResult extends Result {
        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "学号不正确";
                case 2:
                    return "密码不正确";
                case 3:
                    return "正方教务系统崩溃";
                default:
                    return super.otherErrMsg();
            }
        }
    }

    class IdParam extends Param {
        private String id;

        public IdParam(String id) {
            this.id = id;
        }
    }

    class EduSystemQueryResult extends Result {
        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "查询失败，正方教务系统崩溃";
                case 2:
                    return "学号未登录";
                default:
                    return super.otherErrMsg();
            }
        }
    }

    class GradeExamResult extends EduSystemQueryResult {

        public List<GradeExam> gradeexam;

        public static class GradeExam {
            public String id;
            public String year;
            public String semester;
            public String examname;
            public String listenS;
            public String writeS;
            public String complexS;
            public String totalS;
            public String time;
            public String readS;
        }
    }

    class ExamTimeResult extends EduSystemQueryResult {

        public List<ExamTime> examtime;

        public static class ExamTime {
            public String campus;
            public String classroom;
            public String mode;
            public String seat;
            public String cname;
            public String time;
            public String cno;
            public String sname;
        }
    }

    class SemesterParam extends Param {
        private String id;
        private String schoolyear;
        private String semester;

        public SemesterParam(String id, String schoolyear, String semester) {
            this.id = id;
            this.schoolyear = schoolyear;
            this.semester = semester;
        }
    }

    class CurriculumResult extends EduSystemQueryResult {

        public List<Course> courses;

        public static class Course {
            public String tname;
            public String time;
            public String classroom;
            public String weekday;
            public String cname;
        }

    }

    class ScoreResult extends EduSystemQueryResult {

        public List<Course> score;

        public static class Course {
            public String cno;
            public String bukao;
            public String chongxiu;
            public String kind;
            public String score;
            public String minor;
            public String attribute;
            public String credit;
            public String cname;

            public String getAveragePoint() {
                return String.format(Locale.CHINA, "%.2f", (double) (toDouble(score) * toDouble(credit)));
            }

            public double getGradePoint() {
                if ("优秀".equals(score)) {
                    return 4.5;
                } else if ("良好".equals(score)) {
                    return 3.5;
                } else if ("中等".equals(score)) {
                    return 2.5;
                } else if ("及格".equals(score)) {
                    return 1.5;
                } else {
                    double v = (toDouble(score) / 10 - 5);
                    return v < 0 ? 0 : v;
                }
            }
        }
    }

    class QueryCommunityInfoParam extends Param {
        public String lastid;

        public QueryCommunityInfoParam(String lastid) {
            this.lastid = lastid;
        }
    }

    class QueryCommunityInfoResult extends Result {

        public List<CommunityInfo> communityinfo;

        public static class CommunityInfo {
            //#'id': 社团信息id
            //#'title': 标题
            //#'communityname': 社团名称
            //#'content': 信息内容(html)
            //#'createtime': 创建时间
            //#'headimgurl': 社团头像url
            //#'contentimgurl': 正文图片url
            public String id;
            public String title;
            public String communityname;
            public String content;
            public String createtime;
            public String headimgurl;
            public String contentimgurl;

            public CommunityInfo(String id, String title, String communityname, String content, String createtime, String headimgurl, String contentimgurl) {
                this.id = id;
                this.title = title;
                this.communityname = communityname;
                this.content = content;
                this.createtime = createtime;
                this.headimgurl = headimgurl;
                this.contentimgurl = contentimgurl;
            }
        }
    }

    class QueryCampusNewsParam extends Param {
        public String lastid;

        public QueryCampusNewsParam(String lastId) {
            this.lastid = lastId;
        }
    }

    class QueryCampusNewsResult extends Result {

        public List<News> news;

        public static class News {
            //# 校内新闻
            //#'id': 新闻编号
            //#'title': 新闻标题
            //#'department': 发布单位
            //#'date': 发布日期
            //#'weekday': 星期
            //#'content': 内容(html)
            public String id;
            public String title;
            public String deparment;
            public String date;
            public String weekday;
            public String content;
        }
    }

    class UserNameParam extends Param {
        public String username;

        public UserNameParam(String username) {
            this.username = username;
        }
    }

    class PersonInfo implements Serializable {
        //app用户名username
        public String username;
        //昵称nickname
        public String nickname;
        //个性签名signature（140字）
        public String signature;
        //性别sex
        public String sex;
        //手机号telephone
        public String telephone;
        //学院faculty
        public String faculty;
        //专业specialty
        public String specialty;
        //年级grade
        public String grade;
        //宿舍号dormitory
        public String dormitory;

        public PersonInfo(String username, String nickname, String signature, String sex, String telephone, String faculty, String specialty, String grade, String dormitory) {
            this.username = username;
            this.nickname = nickname;
            this.signature = signature;
            this.sex = sex;
            this.telephone = telephone;
            this.faculty = faculty;
            this.specialty = specialty;
            this.grade = grade;
            this.dormitory = dormitory;
        }
    }

    class UserInfoResult extends Result {
        public PersonInfo personinfo;
    }

    class ModifyUserInfoParam extends Param {
        public String personalinfo;

        public ModifyUserInfoParam(PersonInfo personinfo) {
            this.personalinfo = GsonProvider.create().toJson(personinfo);
        }
    }

    class ModifyUserInfoResult extends Result {
        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "用户名不正确";
                case 2:
                    return "用户不存在";
                default:
                    return super.otherErrMsg();
            }
        }
    }

    class ReportDormRepairParam extends Param {
        //"username" : "app用户名",
        //"realname" : "真实姓名",
        //"telephone" : "手机号",
        //"project" : "报修项目",（如电风扇）
        //"dormitory" : "宿舍",（如西三701）
        //"time" : "报修时间",（如2016.11.23）
        //"description" : "报修描述"（140字）
        public String username;
        public String realname;
        public String telephone;
        public String project;
        public String dormitory;
        public String time;
        public String description;

        public ReportDormRepairParam(String username, String realname, String telephone, String project, String dormitory, String time, String description) {
            this.username = username;
            this.realname = realname;
            this.telephone = telephone;
            this.project = project;
            this.dormitory = dormitory;
            this.time = time;
            this.description = description;
        }
    }

    class ReportDormRepairResult extends Result {
        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "用户名不正确";
                case 2:
                    return "用户不存在";
                case 3:
                    return "该项目已报修，不能重复报修";
                default:
                    return super.otherErrMsg();
            }
        }
    }

    class DormRepairStateResult extends Result {
        public List<RepairState> repairstate;

        @Override
        protected String otherErrMsg() {
            switch (status) {
                case 1:
                    return "用户名不正确";
                case 2:
                    return "用户不存在";
                default:
                    return super.otherErrMsg();
            }
        }

        public class RepairState {
            public String username;
            public String realname;
            public String telephone;
            public String project;
            public String dormitory;
            public String time;
            public String description;
            //0:未维修, 1:已维修
            public int state;
        }
    }
}
