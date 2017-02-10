package com.tzh.campushelper.ui.edu.examtime;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface ExamTimeContract {

    interface View extends BaseView<Presenter> {
        void showExamTime(List<ApiService.ExamTimeResult.ExamTime> examTimeList);

        void showError(String error);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void loadExamTime(boolean forceUpdate);
    }
}
