package com.tzh.campushelper.ui.edu.login;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.FormatChecker;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link EducationSystemLoginFragment}), retrieves the data and updates the
 * UI as required.
 */
public class EducationSystemLoginPresenter implements EducationSystemLoginContract.Presenter {

    @NonNull
    private final EducationSystemLoginContract.View mView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    public EducationSystemLoginPresenter(@NonNull EducationSystemLoginContract.View view,
                                         @NonNull BaseSchedulerProvider schedulerProvider,
                                         @NonNull ApiService apiService) {
        mView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        // Do nothing.
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void login(final String id, String password) {
        if (!checkFormat(id, password)) {
            return;
        }
        mSubscriptions.clear();
        mView.setLoadingIndicator(true);
        Subscription subscription = mApiService.loginEducationSystem(new ApiService.LoginEducationSystemParam(id, password))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.LoginEducationSystemResult>() {
                    @Override
                    public void onCompleted() {
                        mView.setLoadingIndicator(false);
                    }

                    @Override
                    public void onError(Throwable e) {
                        mView.setLoadingIndicator(false);
                        mView.showError("网络异常");
                    }

                    @Override
                    public void onNext(ApiService.LoginEducationSystemResult loginResult) {
                        if (loginResult.isOk()) {
                            mView.showNavigation(id);
                        } else {
                            mView.showPwdError(loginResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }


    private boolean checkFormat(String id, String password) {
        mView.clearError();
        if (!FormatChecker.checkStudentId(id)) {
            mView.showUsrError("用户名有误");
            return false;
        }
        if (!FormatChecker.checkStudentPwd(password)) {
            mView.showPwdError("密码输入有误");
            return false;
        }
        return true;
    }
}