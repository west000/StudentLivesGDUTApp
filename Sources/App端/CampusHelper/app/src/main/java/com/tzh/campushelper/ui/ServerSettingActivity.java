package com.tzh.campushelper.ui;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.RemoteApiServiceProvider;
import com.tzh.campushelper.util.SharedPreferencesUtils;

public class ServerSettingActivity extends BaseActivity {

    public static void start(Context context) {
        Intent starter = new Intent(context, ServerSettingActivity.class);
        context.startActivity(starter);
    }

    private EditText mHostEditText;
    private EditText mPortEditText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_server_setting);
        mHostEditText = ((EditText) findViewById(R.id.host));
        mPortEditText = ((EditText) findViewById(R.id.port));
        mHostEditText.setText(SharedPreferencesUtils.getInstance(this).getServerIP());
        mPortEditText.setText(String.valueOf(SharedPreferencesUtils.getInstance(this).getServerPort()));
        View okView = findViewById(R.id.ok);
        if (okView != null) {
            okView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    String host = mHostEditText.getText().toString();
                    int port = Integer.valueOf(mPortEditText.getText().toString());
                    SharedPreferencesUtils.getInstance(ServerSettingActivity.this)
                            .setServer(
                                    host,
                                    port);
                    RemoteApiServiceProvider.getInstance(ServerSettingActivity.this)
                            .changeBaseUrl(ServerSettingActivity.this,
                                    "http://" + host + ":" + port + "/");
                    finish();
                }
            });
        }
    }
}
