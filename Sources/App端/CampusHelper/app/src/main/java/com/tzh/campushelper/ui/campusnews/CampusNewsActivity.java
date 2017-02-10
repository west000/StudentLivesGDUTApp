package com.tzh.campushelper.ui.campusnews;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.util.ActivityUtils;
import com.tzh.campushelper.util.schedulers.SchedulerProvider;


/**
 * Displays campus_news screen.
 */
public class CampusNewsActivity extends BaseActivity {

    public static void start(final Context context) {
        context.startActivity(new Intent(context, CampusNewsActivity.class));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.campus_news_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        CampusNewsFragment fragment = (CampusNewsFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = CampusNewsFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        new CampusNewsPresenter(
                fragment,
                SchedulerProvider.getInstance(),
                Injection.provideApiService(this));
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }

}
