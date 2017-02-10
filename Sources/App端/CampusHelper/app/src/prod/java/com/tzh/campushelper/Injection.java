package com.tzh.campushelper;

import android.content.Context;

import com.franmontiel.persistentcookiejar.PersistentCookieJar;
import com.franmontiel.persistentcookiejar.cache.SetCookieCache;
import com.franmontiel.persistentcookiejar.persistence.SharedPrefsCookiePersistor;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.RemoteApiServiceProvider;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;
import com.tzh.campushelper.util.schedulers.SchedulerProvider;

import okhttp3.CookieJar;
import okhttp3.Interceptor;
import okhttp3.logging.HttpLoggingInterceptor;

public class Injection {
    public static BaseSchedulerProvider provideBaseSchedulerProvider() {
        return SchedulerProvider.getInstance();
    }

    public static ApiService provideApiService(Context context) {
        return RemoteApiServiceProvider.getInstance(context).service();
    }

    public static CookieJar provideCookieJar(Context context) {
        return new PersistentCookieJar(new SetCookieCache(), new SharedPrefsCookiePersistor(context));
    }

    public static Interceptor provideLogInterceptor() {
        HttpLoggingInterceptor loggingInterceptor = new HttpLoggingInterceptor();
        loggingInterceptor.setLevel(HttpLoggingInterceptor.Level.HEADERS);
        return loggingInterceptor;
    }
}
