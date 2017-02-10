package com.tzh.campushelper.ui.repair.repairstate;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.user.User;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link RepairStateFragment}), retrieves the data and updates the
 * UI as required.
 */
public class RepairStatePresenter implements RepairStateContract.Presenter {

    @NonNull
    private final RepairStateContract.View mRepairStateView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    public RepairStatePresenter(@NonNull RepairStateContract.View view,
                                @NonNull BaseSchedulerProvider schedulerProvider,
                                @NonNull ApiService apiService) {
        mRepairStateView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mRepairStateView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadReportStates();
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadReportStates() {
        mSubscriptions.clear();
        Subscription subscription = mApiService.getDormRepairState(new ApiService.UserNameParam(User.getInstance().getUsername()))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.DormRepairStateResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mRepairStateView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.DormRepairStateResult dormRepairStateResult) {
                        if (dormRepairStateResult.isOk()) {
                            mRepairStateView.showRepairStates(dormRepairStateResult.repairstate);
                        } else {
                            mRepairStateView.showError(dormRepairStateResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    @Override
    public void reportRepair() {
        mRepairStateView.showReportRepair();
    }
}