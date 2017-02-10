package com.tzh.campushelper.util;

import android.content.Context;
import android.content.SharedPreferences;

import com.tzh.campushelper.service.DefaultServerConfig;

public class SharedPreferencesUtils {
    private static final String SERVER_IP = "serverIP";
    private static final String SERVER_PORT = "serverPort";

    private static SharedPreferencesUtils sInstance = new SharedPreferencesUtils();

    public static SharedPreferencesUtils getInstance(Context context) {
        if (sInstance.mSharedPreferences == null) {
            context = context.getApplicationContext();
            sInstance.mSharedPreferences = context.getSharedPreferences(context.getPackageName(), Context.MODE_PRIVATE);
        }
        return sInstance;
    }

    private SharedPreferences mSharedPreferences;

    private SharedPreferencesUtils() {
    }


    public void setServer(String ip, int port) {
        mSharedPreferences.edit().putString(SERVER_IP, ip).putInt(SERVER_PORT, port).apply();
    }

    public String getServerIP() {
        return mSharedPreferences.getString(SERVER_IP, DefaultServerConfig.getHost());
    }

    public int getServerPort() {
        return mSharedPreferences.getInt(SERVER_PORT, DefaultServerConfig.getPort());
    }

    public void setString(String key, String value, String... kvs) {
        SharedPreferences.Editor edit = mSharedPreferences.edit();
        edit.putString(key, value);
        for (int i = 0; i + 1 < kvs.length; i += 2) {
            edit.putString(kvs[i], kvs[i + 1]);
        }
        edit.apply();
    }

    public String getString(String key, String def) {
        return mSharedPreferences.getString(key, def);
    }

    public String getServerUrl() {
        return "http://" + getServerIP() + ":" + getServerPort() + "/";
    }
}
