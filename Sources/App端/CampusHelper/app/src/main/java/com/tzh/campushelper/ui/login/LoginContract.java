package com.tzh.campushelper.ui.login;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface LoginContract {

    interface View extends BaseView<Presenter> {
        void clearError();

        void showUsrError(String error);

        void showPwdError(String error);

        void showMain();

        void showError(String error);

        void showRegisterSuccess();

        void setLoadingIndicator(boolean active);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {

        void login(String username, String password);

        void register(String username, String password);
    }
}
