package com.tzh.campushelper.ui.communityinfo;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.QueryCommunityInfoResult.CommunityInfo;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface CommunityInfoContract {

    interface View extends BaseView<Presenter> {
        void setLoadingIndicator(boolean active);

        void setLoadingMoreIndicator(boolean active);

        void showNoMoreIndicator();

        void showCommunityInfo(List<CommunityInfo> infoList);

        void insertCommunityInfo(List<CommunityInfo> infoList);

        void showDetails(String html);

        boolean isActive();

        void showError(String error);
    }

    interface Presenter extends BasePresenter {
        void loadCommunityInfo();

        void loadMoreCommunityInfo(String lastId);

        void loadDetails(CommunityInfo info);
    }
}
