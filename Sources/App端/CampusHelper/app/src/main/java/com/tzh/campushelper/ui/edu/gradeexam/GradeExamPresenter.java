package com.tzh.campushelper.ui.edu.gradeexam;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;
import com.tzh.common.common.logger.Log;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link GradeExamFragment}), retrieves the data and updates the
 * UI as required.
 */
public class GradeExamPresenter implements GradeExamContract.Presenter {

    @NonNull
    private final GradeExamContract.View mGradeExamView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    @NonNull
    private String mId;

    public GradeExamPresenter(@NonNull String id,
                              @NonNull GradeExamContract.View view,
                              @NonNull BaseSchedulerProvider schedulerProvider,
                              @NonNull ApiService apiService) {
        mId = checkNotNull(id);
        mGradeExamView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mGradeExamView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadGradeExam(false);
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    private static final String TAG = "GradeExamPresenter";
    @Override
    public void loadGradeExam(boolean forceUpdate) {
        mSubscriptions.clear();
        mGradeExamView.setLoadingIndicator(true);
        Subscription subscription = mApiService.queryGradeExam(new ApiService.IdParam(mId))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.GradeExamResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mGradeExamView.setLoadingIndicator(false);
                        mGradeExamView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.GradeExamResult gradeExamResult) {
                        mGradeExamView.setLoadingIndicator(false);
                        if (gradeExamResult.isOk()) {
                            mGradeExamView.showGradeExam(gradeExamResult.gradeexam);
                        } else {
                            mGradeExamView.showError(gradeExamResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }
}