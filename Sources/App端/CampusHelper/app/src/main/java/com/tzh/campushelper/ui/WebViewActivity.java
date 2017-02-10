package com.tzh.campushelper.ui;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.webkit.WebSettings;
import android.webkit.WebView;

import com.tzh.campushelper.R;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

public class WebViewActivity extends BaseActivity {

    private static final String EXTRA_TITLE = "EXTRA_TITLE";
    private static final String EXTRA_HTML = "EXTRA_HTML";

    public static void start(Context context, String title, String html) {
        Intent starter = new Intent(context, WebViewActivity.class);
        starter.putExtra(EXTRA_TITLE, title);
        starter.putExtra(EXTRA_HTML, html);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web_view);

        // Set up the toolbar.
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        String title = getIntent().getStringExtra(EXTRA_TITLE);
        if (title != null) {
            checkNotNull(getSupportActionBar()).setTitle(title);
        }

        // Set up the web view.
        WebView webView = (WebView) findViewById(R.id.webview);
        WebSettings settings = webView.getSettings();
        settings.setDefaultTextEncodingName("utf-8");
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);

        String stringExtra = getIntent().getStringExtra(EXTRA_HTML);
        webView.loadData(stringExtra, "text/html; charset=utf-8", "UTF-8");
    }
}
