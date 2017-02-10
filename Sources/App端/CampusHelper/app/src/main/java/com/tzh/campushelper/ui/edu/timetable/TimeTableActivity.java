package com.tzh.campushelper.ui.edu.timetable;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.util.ActivityUtils;

import static com.tzh.campushelper.ui.edu.Constants.EXTRA_ID;


/**
 * Displays time_table screen.
 */
public class TimeTableActivity extends BaseActivity {

    public static void start(Context context, String id) {
        Intent starter = new Intent(context, TimeTableActivity.class);
        starter.putExtra(EXTRA_ID, id);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.time_table_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        TimeTableFragment fragment = (TimeTableFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = TimeTableFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        new TimeTablePresenter(
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
