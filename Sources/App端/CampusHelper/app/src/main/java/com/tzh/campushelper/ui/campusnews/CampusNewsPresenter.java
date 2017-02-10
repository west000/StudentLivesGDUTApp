package com.tzh.campushelper.ui.campusnews;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.util.CastUtils;
import com.tzh.campushelper.util.ListUtils;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import java.util.Collections;
import java.util.Comparator;

import rx.Observable;
import rx.Observer;
import rx.Subscription;
import rx.functions.Func1;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link CampusNewsFragment}), retrieves the data and updates the
 * UI as required.
 */
public class CampusNewsPresenter implements CampusNewsContract.Presenter {

    @NonNull
    private final CampusNewsContract.View mCampusNewsView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    private final Func1<ApiService.QueryCampusNewsResult, Observable<ApiService.QueryCampusNewsResult>> mSortMapFun = new Func1<ApiService.QueryCampusNewsResult, Observable<ApiService.QueryCampusNewsResult>>() {
                    @Override
                    public Observable<ApiService.QueryCampusNewsResult> call(ApiService.QueryCampusNewsResult queryCampusNewsResult) {
                        if (queryCampusNewsResult != null && queryCampusNewsResult.news != null) {
                            Collections.sort(queryCampusNewsResult.news, new Comparator<ApiService.QueryCampusNewsResult.News>() {
                                @Override
                                public int compare(ApiService.QueryCampusNewsResult.News news1, ApiService.QueryCampusNewsResult.News news2) {
                                    return CastUtils.toInt(news2.id) - CastUtils.toInt(news1.id);
                                }
                            });
                        }
                        return Observable.just(queryCampusNewsResult);
                    }
                };

    public CampusNewsPresenter(@NonNull CampusNewsContract.View view,
                               @NonNull BaseSchedulerProvider schedulerProvider,
                               @NonNull ApiService apiService) {
        mCampusNewsView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mCampusNewsView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadCampusNews();
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadCampusNews() {
        mSubscriptions.clear();
        mCampusNewsView.setLoadingIndicator(true);
        Subscription subscription = mApiService.getCampusNews()
                .flatMap(mSortMapFun)
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.QueryCampusNewsResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mCampusNewsView.setLoadingIndicator(false);
                        mCampusNewsView.showError("网络异常");
                    }

                    @Override
                    public void onNext(ApiService.QueryCampusNewsResult queryCampusNewsResult) {
                        mCampusNewsView.setLoadingIndicator(false);
                        if (queryCampusNewsResult.isOk()) {
                            mCampusNewsView.showCampusNews(queryCampusNewsResult.news);
                        } else {
                            mCampusNewsView.showError(queryCampusNewsResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    @Override
    public void loadMoreCampusNews(String lastId) {
        mSubscriptions.clear();
        mCampusNewsView.setLoadingMoreIndicator(true);
        Subscription subscription = mApiService.queryCampusNews(new ApiService.QueryCampusNewsParam(lastId))
                .flatMap(mSortMapFun)
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.QueryCampusNewsResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mCampusNewsView.setLoadingMoreIndicator(false);
                        mCampusNewsView.showError("网络异常");
                    }

                    @Override
                    public void onNext(ApiService.QueryCampusNewsResult queryCampusNewsResult) {
                        mCampusNewsView.setLoadingMoreIndicator(false);
                        if (queryCampusNewsResult.isOk()) {
                            if (ListUtils.isEmpty(queryCampusNewsResult.news)) {
                                mCampusNewsView.showNoMoreIndicator();
                            } else {
                                mCampusNewsView.insertCampusNews(queryCampusNewsResult.news);
                            }
                        } else {
                            mCampusNewsView.showError(queryCampusNewsResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    @Override
    public void loadDetails(ApiService.QueryCampusNewsResult.News news) {
        mCampusNewsView.showDetails(news.content);
    }


}