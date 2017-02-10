package com.tzh.campushelper.ui.edu.examtime;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link ExamTimeFragment}), retrieves the data and updates the
 * UI as required.
 */
public class ExamTimePresenter implements ExamTimeContract.Presenter {

    @NonNull
    private final ExamTimeContract.View mExamTimeView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    @NonNull
    private final String mId;

    public ExamTimePresenter(@NonNull String id,
                             @NonNull ExamTimeContract.View view,
                             @NonNull BaseSchedulerProvider schedulerProvider,
                             @NonNull ApiService apiService) {
        mId = checkNotNull(id);
        mExamTimeView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mExamTimeView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadExamTime(false);
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadExamTime(boolean forceUpdate) {
        mSubscriptions.clear();
        Subscription subscription = mApiService.queryExamTime(new ApiService.IdParam(mId))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.ExamTimeResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mExamTimeView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.ExamTimeResult examTimeResult) {
                        if (examTimeResult.isOk()) {
                            mExamTimeView.showExamTime(examTimeResult.examtime);
                        } else {
                            mExamTimeView.showError(examTimeResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

}