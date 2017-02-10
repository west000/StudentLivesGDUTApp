package com.tzh.campushelper.ui.user.info;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface UserInfoContract {

    interface View extends BaseView<Presenter> {
        void showUserInfo(ApiService.PersonInfo info);

        void showError(String error);

        void showEditInfo(ApiService.PersonInfo info);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void loadUserInfo();

        void editInfo();
    }
}
