package com.tzh.campushelper.ui.repair.reportrepair;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.ui.user.User;
import com.tzh.campushelper.util.ActivityUtils;


/**
 * Displays report_repair screen.
 */
public class ReportRepairActivity extends BaseActivity {

    public static void start(final Context context) {
        context.startActivity(new Intent(context, ReportRepairActivity.class));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.report_repair_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        ReportRepairFragment fragment = (ReportRepairFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = ReportRepairFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        new ReportRepairPresenter(
                User.getInstance().getUsername(),
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
