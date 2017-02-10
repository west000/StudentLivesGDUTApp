package com.tzh.campushelper.ui.login;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.user.User;
import com.tzh.campushelper.util.FormatChecker;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;
import com.tzh.common.common.logger.Log;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link LoginFragment}), retrieves the data and updates the
 * UI as required.
 */
public class LoginPresenter implements LoginContract.Presenter {

    @NonNull
    private final LoginContract.View mLoginView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    public LoginPresenter(@NonNull LoginContract.View view,
                          @NonNull BaseSchedulerProvider schedulerProvider,
                          @NonNull ApiService apiService) {
        mLoginView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mLoginView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        // Do nothing.
    }

    private static final String TAG = "LoginPresenter";
    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void login(final String username, String password) {
        if (!checkFormat(username, password)) {
            return;
        }
        mSubscriptions.clear();
        mLoginView.setLoadingIndicator(true);
        Subscription subscription = mApiService.login(new ApiService.LoginParam(username, password))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.LoginResult>() {
                    @Override
                    public void onCompleted() {
                        mLoginView.setLoadingIndicator(false);
                    }

                    @Override
                    public void onError(Throwable e) {
                        mLoginView.setLoadingIndicator(false);
                        mLoginView.showError("网络异常");
                        Log.e(TAG, "onError: ", e);
                    }

                    @Override
                    public void onNext(ApiService.LoginResult loginResult) {
                        if (loginResult.isOk()) {
                            User.getInstance().setUserName(username);
                            mLoginView.showMain();
                        } else {
                            mLoginView.showPwdError(loginResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }


    @Override
    public void register(String username, String password) {
        if (!checkFormat(username, password)) {
            return;
        }
        mSubscriptions.clear();
        mLoginView.setLoadingIndicator(true);
        Subscription subscription = mApiService.register(new ApiService.RegisterParam(username, password))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.RegisterResult>() {
                    @Override
                    public void onCompleted() {
                        mLoginView.setLoadingIndicator(false);
                    }

                    @Override
                    public void onError(Throwable e) {
                        mLoginView.setLoadingIndicator(false);
                        mLoginView.showError("网络异常");
                        Log.e(TAG, "onError: ", e);
                    }

                    @Override
                    public void onNext(ApiService.RegisterResult registerResult) {
                        if (registerResult.isOk()) {
                            mLoginView.showRegisterSuccess();
                        } else {
                            mLoginView.showError(registerResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    private boolean checkFormat(String username, String password) {
        mLoginView.clearError();
        if (!FormatChecker.checkUserName(username)) {
            mLoginView.showUsrError("用户名有误");
            return false;
        }
        if (!FormatChecker.checkPassword(password)) {
            mLoginView.showPwdError("密码输入有误");
            return false;
        }
        return true;
    }
}