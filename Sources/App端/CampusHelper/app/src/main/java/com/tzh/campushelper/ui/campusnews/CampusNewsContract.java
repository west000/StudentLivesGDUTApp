package com.tzh.campushelper.ui.campusnews;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.QueryCampusNewsResult.News;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface CampusNewsContract {

    interface View extends BaseView<Presenter> {
        void setLoadingIndicator(boolean active);

        void setLoadingMoreIndicator(boolean active);

        void showNoMoreIndicator();

        void showCampusNews(List<News> newsList);

        void insertCampusNews(List<News> newsList);

        void showDetails(String details);

        boolean isActive();

        void showError(String error);
    }

    interface Presenter extends BasePresenter {
        void loadCampusNews();

        void loadMoreCampusNews(String lastId);

        void loadDetails(News news);
    }
}
