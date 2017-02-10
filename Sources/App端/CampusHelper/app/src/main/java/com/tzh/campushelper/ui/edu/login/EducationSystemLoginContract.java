package com.tzh.campushelper.ui.edu.login;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface EducationSystemLoginContract {

    interface View extends BaseView<Presenter> {
        void clearError();

        void showUsrError(String error);

        void showPwdError(String error);

        void showNavigation(String studentId);

        void showError(String error);

        void setLoadingIndicator(boolean active);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void login(String id, String password);
    }
}
