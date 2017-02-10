package com.tzh.campushelper.ui.repair.reportrepair;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface ReportRepairContract {

    interface View extends BaseView<Presenter> {
        void showError(String error);

        void showReportSuccess();

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void reportRepair(String realname,
                          String telephone,
                          String project,
                          String dormitory,
                          String description);
    }
}
