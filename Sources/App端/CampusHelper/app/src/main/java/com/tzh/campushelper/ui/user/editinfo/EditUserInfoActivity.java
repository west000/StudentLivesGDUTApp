package com.tzh.campushelper.ui.user.editinfo;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.BaseActivity;
import com.tzh.campushelper.util.ActivityUtils;


/**
 * Displays edit_user_info screen.
 */
public class EditUserInfoActivity extends BaseActivity {
    public static final String EXTRA_INFO = "EXTRA_INFO";

    public static void start(final Context context, final ApiService.PersonInfo info) {
        Intent starter = new Intent(context, EditUserInfoActivity.class);
        starter.putExtra(EXTRA_INFO, info);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.edit_user_info_activity);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        EditUserInfoFragment fragment = (EditUserInfoFragment) getSupportFragmentManager()
                .findFragmentById(R.id.contentFrame);

        if (fragment == null) {
            fragment = EditUserInfoFragment.newInstance();

            ActivityUtils.addFragmentToActivity(getSupportFragmentManager(),
                    fragment, R.id.contentFrame);
        }

        // Create the presenter
        ApiService.PersonInfo extra = (ApiService.PersonInfo) getIntent().getSerializableExtra(EXTRA_INFO);
        new EditUserInfoPresenter(
                extra,
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
