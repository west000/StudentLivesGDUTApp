package com.tzh.campushelper.ui.edu.score;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link ScoreFragment}), retrieves the data and updates the
 * UI as required.
 */
public class ScorePresenter implements ScoreContract.Presenter {

    @NonNull
    private final ScoreContract.View mScoreView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    @NonNull
    private final String mId;

    public ScorePresenter(@NonNull String id,
                          @NonNull ScoreContract.View view,
                          @NonNull BaseSchedulerProvider schedulerProvider,
                          @NonNull ApiService apiService) {
        mId = checkNotNull(id);
        mScoreView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mScoreView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        // Load default semester scores.
        loadScores("", "");
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadScores(String year, String semester) {
        mSubscriptions.clear();
        Subscription subscription = mApiService.queryScore(new ApiService.SemesterParam(mId, year, semester))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.ScoreResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mScoreView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.ScoreResult scoreResult) {
                        if (scoreResult.isOk()) {
                            mScoreView.showScores(scoreResult.score);
                        } else {
                            mScoreView.showError(scoreResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }
}