package com.tzh.campushelper.service;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.util.GsonProvider;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

import java.io.IOException;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Actions;
import rx.functions.Func1;
import rx.internal.util.ActionSubscriber;
import rx.internal.util.InternalObservableUtils;
import rx.observers.TestSubscriber;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

public class ApiServiceTest {

    private ApiService mApiService;

    @Mock
    public SharedPreferences mSharedPreference = Mockito.mock(SharedPreferences.class);

    @Mock
    SharedPreferences.Editor mEditor = Mockito.mock(SharedPreferences.Editor.class);

    @Mock
    Context context = Mockito.mock(Context.class);

    String username = "test123456";
    String password = "test123456";
    String eduId = "3114006532";
    String eduPwd = "3695147asd++";

    @Before
    public void setup() {
        mApiService = Injection.provideApiService(context);
    }

    @Ignore
    @Test
    public void connectionTest() throws IOException {
        TestSubscriber<ApiService.RegisterResult> subscriber = TestSubscriber.create(new Subscriber<ApiService.RegisterResult>() {
            @Override
            public void onCompleted() {
                System.out.println("complete");
            }

            @Override
            public void onError(Throwable e) {
                System.out.println("error");
                System.out.println("-----");
                e.printStackTrace();
                System.out.println("-----");
            }

            @Override
            public void onNext(ApiService.RegisterResult result) {
                System.out.println(GsonProvider.create().toJson(result));
            }
        });
        Observable<ApiService.RegisterResult> register = mApiService.register(new ApiService.RegisterParam(username, password));
        register.subscribe(subscriber);
        subscriber.assertError(CookieOutOfDateException.class);
//        subscriber.assertValueCount(1);
    }

    @Test
    public void nullTest() {
        mApiService.register(new ApiService.RegisterParam(null, null))
                .subscribe(MyTestSubscriber.create(
                        new Subscriber<ApiService.RegisterResult>() {
                            @Override
                            public void onCompleted() {
                                System.out.printf("completed");
                            }

                            @Override
                            public void onError(Throwable e) {
                                System.out.printf("error");
                            }

                            @Override
                            public void onNext(ApiService.RegisterResult registerResult) {
                            }
                        }
                ));
    }

    @Test
    public void loginTest() throws IOException {
        ApiService.LoginResult exceptResult = new ApiService.LoginResult();
        exceptResult.status = 0;
        exceptResult.message = "";

        mApiService.login(new ApiService.LoginParam(username, password))
                .subscribe(MyTestSubscriber.create(new Action1<ApiService.LoginResult>() {
                    @Override
                    public void call(ApiService.LoginResult loginResult) {
                        System.out.println(GsonProvider.create().toJson(loginResult));
                    }
                }));
    }

    public static class MyTestSubscriber<T> extends TestSubscriber<T> {


        public static <T> MyTestSubscriber<T> create() {
            Action1<T> onNext = new Action1<T>() {
                @Override
                public void call(T t) {
                    System.out.println(GsonProvider.create().toJson(t));
                }
            };
            Action1<Throwable> onError = InternalObservableUtils.ERROR_NOT_IMPLEMENTED;
            Action0 onCompleted = Actions.empty();
            return new MyTestSubscriber<>(new ActionSubscriber<T>(onNext, onError, onCompleted));
        }

        MyTestSubscriber(Subscriber<T> delegate) {
            super(delegate);
        }

        @NonNull
        public static <T> MyTestSubscriber<T> create(Subscriber<T> delegate) {
            return new MyTestSubscriber<>(delegate);
        }

        static <T> MyTestSubscriber<T> create(final Action1<T> onNext) {
            Action1<T> onNextAction = new Action1<T>() {
                @Override
                public void call(T t) {
                    System.out.println(GsonProvider.create().toJson(t));
                    onNext.call(t);
                }
            };
            Action1<Throwable> onError = InternalObservableUtils.ERROR_NOT_IMPLEMENTED;
            Action0 onCompleted = Actions.empty();
            return new MyTestSubscriber<>(new ActionSubscriber<>(onNextAction, onError, onCompleted));
        }
    }

    @Test
    public void loginEducationSystemTest() {
        ApiService.LoginResult exceptResult = new ApiService.LoginResult();
        exceptResult.status = 0;
        exceptResult.message = "";

        mApiService.login(new ApiService.LoginParam(username, password))
                .flatMap(new Func1<ApiService.LoginResult, Observable<ApiService.LoginEducationSystemResult>>() {
                    @Override
                    public Observable<ApiService.LoginEducationSystemResult> call(ApiService.LoginResult loginResult) {
                        return mApiService.loginEducationSystem(new ApiService.LoginEducationSystemParam(eduId, eduPwd));
                    }
                })
                .flatMap(new Func1<ApiService.LoginEducationSystemResult, Observable<?>>() {
                    @Override
                    public Observable<?> call(ApiService.LoginEducationSystemResult loginEducationSystemResult) {
                        return mApiService.queryExamTime(new ApiService.IdParam(eduId));
                    }
                })
                .subscribe(MyTestSubscriber.create(new Action1<Object>() {
                    @Override
                    public void call(Object o) {
                        System.out.println(GsonProvider.create().toJson(o));
                    }
                }));
    }

    @Test
    public void getCommunityInfoTest() {
        TestSubscriber<Object> subscriber = MyTestSubscriber.create();
        ApiService apiService = mApiService;
        apiService.getCommunityInfo()
                .subscribe(subscriber);
        subscriber.assertNoErrors();
        subscriber.assertValueCount(1);
    }

    @Test
    public void getNewsTest() {
        TestSubscriber<Object> subscriber = MyTestSubscriber.create();
        ApiService apiService = mApiService;
        apiService.getCampusNews()
                .subscribe(subscriber);
        subscriber.assertNoErrors();
        subscriber.assertValueCount(1);

        apiService.queryCampusNews(new ApiService.QueryCampusNewsParam("50"))
                .subscribe(MyTestSubscriber.create(new Action1<ApiService.QueryCampusNewsResult>() {
                    @Override
                    public void call(ApiService.QueryCampusNewsResult queryCampusNewsResult) {
                        assertTrue(queryCampusNewsResult.news.size() <= 10);
                    }
                }));
    }

    @Ignore
    @Test
    public void getCommunityInfoDummyTest() {
        TestSubscriber<Object> subscriber = MyTestSubscriber.create();
        ApiService apiService = mApiService;
        apiService.getCommunityInfo()
                .subscribe(subscriber);
        subscriber.assertNoErrors();
        subscriber.assertValueCount(1);
    }

    @Ignore
    @Test
    public void getNewsDummyTest() {
        TestSubscriber<Object> subscriber = TestSubscriber.create();
        ApiService apiService = mApiService;
        apiService.getCampusNews()
                .subscribe(subscriber);
        subscriber.assertNoErrors();
        subscriber.assertValueCount(1);
    }
}
