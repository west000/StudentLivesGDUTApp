package com.tzh.campushelper.ui;

import android.os.Bundle;

import com.tzh.campushelper.ui.login.LoginActivity;

/**
 * 启动过渡页
 */
public class SlashActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LoginActivity.start(this);
        finish();
    }
}
