package com.tzh.campushelper.ui.edu.gradeexam;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface GradeExamContract {

    interface View extends BaseView<Presenter> {
        void setLoadingIndicator(boolean active);

        void showGradeExam(List<ApiService.GradeExamResult.GradeExam> list);

        void showError(String error);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void loadGradeExam(boolean forceUpdate);
    }
}
