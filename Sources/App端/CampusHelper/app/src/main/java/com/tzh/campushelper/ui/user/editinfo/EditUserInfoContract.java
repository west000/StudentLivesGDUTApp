package com.tzh.campushelper.ui.user.editinfo;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface EditUserInfoContract {

    interface View extends BaseView<Presenter> {
        boolean isActive();

        void showInfo(ApiService.PersonInfo personInfo);

        void showError(String error);

        void showModifySuccess();
    }

    interface Presenter extends BasePresenter {
        void modifyInfo(String nickName,
                        String signature,
                        String sex,
                        String telephone,
                        String faculty,
                        String specialty,
                        String grade,
                        String dormitory);
    }
}
