package com.tzh.campushelper.ui.communityinfo;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.QueryCommunityInfoResult.CommunityInfo;
import com.tzh.campushelper.util.CastUtils;
import com.tzh.campushelper.util.ListUtils;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;
import com.tzh.common.common.logger.Log;

import java.util.Collections;
import java.util.Comparator;

import rx.Observable;
import rx.Observer;
import rx.Subscription;
import rx.functions.Func1;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link CommunityInfoFragment}), retrieves the data and updates the
 * UI as required.
 */
public class CommunityInfoPresenter implements CommunityInfoContract.Presenter {

    @NonNull
    private final CommunityInfoContract.View mCommunityInfoView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private final CompositeSubscription mSubscriptions;

    private final Func1<ApiService.QueryCommunityInfoResult, Observable<ApiService.QueryCommunityInfoResult>> mSortMapFun = new Func1<ApiService.QueryCommunityInfoResult, Observable<ApiService.QueryCommunityInfoResult>>() {
        @Override
        public Observable<ApiService.QueryCommunityInfoResult> call(ApiService.QueryCommunityInfoResult queryCommunityInfoResult) {
            if (queryCommunityInfoResult != null && queryCommunityInfoResult.communityinfo != null) {
                Collections.sort(queryCommunityInfoResult.communityinfo, new Comparator<CommunityInfo>() {
                    @Override
                    public int compare(ApiService.QueryCommunityInfoResult.CommunityInfo info1, ApiService.QueryCommunityInfoResult.CommunityInfo info2) {
                        return CastUtils.toInt(info2.id) - CastUtils.toInt(info1.id);
                    }
                });
            }
            return Observable.just(queryCommunityInfoResult);
        }
    };


    public CommunityInfoPresenter(@NonNull CommunityInfoContract.View view,
                                  @NonNull BaseSchedulerProvider schedulerProvider,
                                  @NonNull ApiService apiService) {
        mCommunityInfoView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mCommunityInfoView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        loadCommunityInfo();
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

    @Override
    public void loadCommunityInfo() {
        mSubscriptions.clear();
        mCommunityInfoView.setLoadingMoreIndicator(false);
        mCommunityInfoView.setLoadingIndicator(true);
        Subscription subscription = mApiService.getCommunityInfo()
                .flatMap(mSortMapFun)
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.QueryCommunityInfoResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mCommunityInfoView.setLoadingIndicator(false);
                        mCommunityInfoView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.QueryCommunityInfoResult queryCommunityInfoResult) {
                        mCommunityInfoView.setLoadingIndicator(false);
                        if (queryCommunityInfoResult.isOk()) {
                            mCommunityInfoView.showCommunityInfo(queryCommunityInfoResult.communityinfo);
                        } else {
                            mCommunityInfoView.showError(queryCommunityInfoResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    private static final String TAG = "CommunityInfoPresenter";

    @Override
    public void loadMoreCommunityInfo(String lastId) {
        mSubscriptions.clear();
        mCommunityInfoView.setLoadingIndicator(false);
        mCommunityInfoView.setLoadingMoreIndicator(true);
        Subscription subscription = mApiService.queryCommunityInfo(new ApiService.QueryCommunityInfoParam(lastId))
                .flatMap(mSortMapFun)
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.QueryCommunityInfoResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mCommunityInfoView.setLoadingMoreIndicator(false);
                        mCommunityInfoView.showError("网络错误");
                    }

                    @Override
                    public void onNext(ApiService.QueryCommunityInfoResult queryCommunityInfoResult) {
                        mCommunityInfoView.setLoadingMoreIndicator(false);
                        if (queryCommunityInfoResult.isOk()) {
                            if (ListUtils.isEmpty(queryCommunityInfoResult.communityinfo)) {
                                mCommunityInfoView.showNoMoreIndicator();
                            } else {
                                mCommunityInfoView.insertCommunityInfo(queryCommunityInfoResult.communityinfo);
                            }
                        } else {
                            mCommunityInfoView.showError(queryCommunityInfoResult.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    @Override
    public void loadDetails(CommunityInfo info) {
        mCommunityInfoView.showDetails(info.content);
    }
}