package com.tzh.campushelper.service;

import android.content.Context;
import android.support.annotation.NonNull;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.util.GsonProvider;
import com.tzh.campushelper.util.SharedPreferencesUtils;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

public class RemoteApiServiceProvider {

    private ApiService mApiService;

    private static RemoteApiServiceProvider sInstance;

    private RemoteApiServiceProvider(@NonNull Context context) {
        createService(context, SharedPreferencesUtils.getInstance(context).getServerUrl());
    }

    private void createService(@NonNull Context context, @NonNull String baseUrl) {
        context = checkNotNull(context, "Context cannot be null!");
        baseUrl = checkNotNull(baseUrl, "Base url cannot be null!");
        OkHttpClient httpClient = new OkHttpClient.Builder()
                .connectTimeout(10, TimeUnit.SECONDS)
                .readTimeout(15, TimeUnit.SECONDS)
                .writeTimeout(15, TimeUnit.SECONDS)
                .cookieJar(Injection.provideCookieJar(context))
                .addInterceptor(Injection.provideLogInterceptor())
                .build();
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create(GsonProvider.create()))
                .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
                .client(httpClient)
                .build();
        mApiService = retrofit.create(ApiService.class);
    }

    public static RemoteApiServiceProvider getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new RemoteApiServiceProvider(context);
        }
        return sInstance;
    }

    public void changeBaseUrl(@NonNull Context context, @NonNull String baseUrl) {
        // Recreate service.
        createService(context, baseUrl);
    }

    public ApiService service() {
        return mApiService;
    }
}
