package com.tzh.campushelper.ui.edu.score;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface ScoreContract {

    interface View extends BaseView<Presenter> {
        void showScores(List<ApiService.ScoreResult.Course> courseList);

        boolean isActive();

        void showError(String error);
    }

    interface Presenter extends BasePresenter {
        void loadScores(String year, String semester);
    }
}
