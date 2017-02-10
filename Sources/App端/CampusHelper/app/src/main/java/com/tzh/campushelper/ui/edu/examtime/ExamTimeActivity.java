package com.tzh.campushelper.ui.edu.examtime;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.ui.edu.Constants;
import com.tzh.campushelper.util.ActivityUtils;


/**
 * Displays exam_time screen.
 */
public class ExamTimeActivity extends BaseActivity {

    public static void start(Context context, String studentId) {
        Intent starter = new Intent(context, ExamTimeActivity.class);
        starter.putExtra(Constants.EXTRA_ID, studentId);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.exam_time_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        ExamTimeFragment fragment = (ExamTimeFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = ExamTimeFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        new ExamTimePresenter(
                getIntent().getStringExtra(Constants.EXTRA_ID),
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
