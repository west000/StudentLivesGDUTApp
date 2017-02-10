package com.tzh.campushelper.ui.edu.gradeexam;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;


import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.ui.edu.Constants;
import com.tzh.campushelper.util.ActivityUtils;

import static com.tzh.campushelper.ui.edu.Constants.EXTRA_ID;


/**
 * Displays grade_exam screen.
 */
public class GradeExamActivity extends BaseActivity {

    public static void start(Context context, String studentId) {
        Intent starter = new Intent(context, GradeExamActivity.class);
        starter.putExtra(EXTRA_ID, studentId);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.grade_exam_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        GradeExamFragment fragment = (GradeExamFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = GradeExamFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        new GradeExamPresenter(
                getIntent().getStringExtra(EXTRA_ID),
                fragment,
                Injection.provideBaseSchedulerProvider(),
                Injection.provideApiService(this));
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }

}
