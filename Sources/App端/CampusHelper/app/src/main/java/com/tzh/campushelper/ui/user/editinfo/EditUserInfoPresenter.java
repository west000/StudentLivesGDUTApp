package com.tzh.campushelper.ui.user.editinfo;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.GsonProvider;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link EditUserInfoFragment}), retrieves the data and updates the
 * UI as required.
 */
public class EditUserInfoPresenter implements EditUserInfoContract.Presenter {

    @NonNull
    private final EditUserInfoContract.View mEditUserInfoView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    private ApiService.PersonInfo mPersonInfo;

    public EditUserInfoPresenter(@NonNull ApiService.PersonInfo personInfo,
                                 @NonNull EditUserInfoContract.View view,
                                 @NonNull BaseSchedulerProvider schedulerProvider,
                                 @NonNull ApiService apiService) {
        mPersonInfo = checkNotNull(personInfo);
        mEditUserInfoView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mEditUserInfoView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        mEditUserInfoView.showInfo(mPersonInfo);
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void modifyInfo(String nickName, String signature, String sex, String telephone, String faculty, String specialty, String grade, String dormitory) {
        mSubscriptions.clear();
        ApiService.ModifyUserInfoParam param = new ApiService.ModifyUserInfoParam(new ApiService.PersonInfo(
                mPersonInfo.username,
                nickName,
                signature,
                sex,
                telephone,
                faculty,
                specialty,
                grade,
                dormitory
        ));
        String s = GsonProvider.create().toJson(param);
        System.out.println(s);
        Subscription subscription = mApiService.modifyUserInfo(
                param)
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.ModifyUserInfoResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mEditUserInfoView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.ModifyUserInfoResult modifyUserInfoResult) {
                        if (modifyUserInfoResult.isOk()) {
                            mEditUserInfoView.showModifySuccess();
                        } else {
                            mEditUserInfoView.showError(modifyUserInfoResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }
}