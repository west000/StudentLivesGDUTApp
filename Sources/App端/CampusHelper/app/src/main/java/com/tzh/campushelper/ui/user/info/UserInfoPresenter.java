package com.tzh.campushelper.ui.user.info;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.user.User;
import com.tzh.campushelper.util.GsonProvider;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link UserInfoFragment}), retrieves the data and updates the
 * UI as required.
 */
public class UserInfoPresenter implements UserInfoContract.Presenter {

    @NonNull
    private final UserInfoContract.View mUserInfoView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    @Nullable
    private ApiService.PersonInfo mPersonInfo;

    public UserInfoPresenter(@NonNull UserInfoContract.View view,
                             @NonNull BaseSchedulerProvider schedulerProvider,
                             @NonNull ApiService apiService) {
        mUserInfoView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mUserInfoView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadUserInfo();
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadUserInfo() {
        mSubscriptions.clear();
        mApiService.getUserInfo(new ApiService.UserNameParam(User.getInstance().getUsername()))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.UserInfoResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mUserInfoView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.UserInfoResult userInfoResult) {
                        if (userInfoResult.isOk()) {
                            mPersonInfo = userInfoResult.personinfo;
                            System.out.println(GsonProvider.create().toJson(mPersonInfo));
                            mUserInfoView.showUserInfo(userInfoResult.personinfo);
                        } else {
                            mUserInfoView.showError(userInfoResult.getMessage());
                        }
                    }
                });
    }

    @Override
    public void editInfo() {
        if (mPersonInfo != null) {
            mUserInfoView.showEditInfo(mPersonInfo);
        }
    }
}