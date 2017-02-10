package com.tzh.campushelper.ui.repair.reportrepair;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.Utils;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link ReportRepairFragment}), retrieves the data and updates the
 * UI as required.
 */
public class ReportRepairPresenter implements ReportRepairContract.Presenter {

    @NonNull
    private final ReportRepairContract.View mReportRepairView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;
    private String mUsername;

    public ReportRepairPresenter(@NonNull String id,
                                 @NonNull ReportRepairContract.View view,
                                 @NonNull BaseSchedulerProvider schedulerProvider,
                                 @NonNull ApiService apiService) {
        mUsername = checkNotNull(id);
        mReportRepairView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mReportRepairView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        // do nothing
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void reportRepair(String realname, String telephone, String project, String dormitory, String description) {
        mSubscriptions.clear();
        Subscription subscription = mApiService.reportDormRepair(
                new ApiService.ReportDormRepairParam(
                        mUsername,
                        realname,
                        telephone,
                        project,
                        dormitory,
                        Utils.currentDateString(),
                        description))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.ReportDormRepairResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mReportRepairView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.ReportDormRepairResult reportDormRepairResult) {
                        if (reportDormRepairResult.isOk()) {
                            mReportRepairView.showReportSuccess();
                        } else {
                            mReportRepairView.showError(reportDormRepairResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }
}