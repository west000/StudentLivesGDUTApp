package com.tzh.campushelper.ui.edu;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.ui.edu.examtime.ExamTimeActivity;
import com.tzh.campushelper.ui.edu.gradeexam.GradeExamActivity;
import com.tzh.campushelper.ui.edu.score.ScoreActivity;
import com.tzh.campushelper.ui.edu.timetable.TimeTableActivity;

public class EduSystemNavigationActivity extends BaseActivity implements View.OnClickListener {

    private String mStudentId;

    public static void start(Context context, String studentId) {
        Intent starter = new Intent(context, EduSystemNavigationActivity.class);
        starter.putExtra(Constants.EXTRA_ID, studentId);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.edu_system_navigation_activity);
        mStudentId = getIntent().getStringExtra(Constants.EXTRA_ID);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.exam_time:
                ExamTimeActivity.start(this, mStudentId);
                break;
            case R.id.grade_exam:
                GradeExamActivity.start(this, mStudentId);
                break;
            case R.id.query_score:
                ScoreActivity.start(this, mStudentId);
                break;
            case R.id.time_table:
                TimeTableActivity.start(this, mStudentId);
                break;
        }
    }
}
