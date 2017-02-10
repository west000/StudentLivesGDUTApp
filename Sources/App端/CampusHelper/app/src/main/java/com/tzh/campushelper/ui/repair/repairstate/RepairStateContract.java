package com.tzh.campushelper.ui.repair.repairstate;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.service.ApiService;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface RepairStateContract {

    interface View extends BaseView<Presenter> {

        void showReportRepair();

        void showRepairStates(List<ApiService.DormRepairStateResult.RepairState> states);

        boolean isActive();

        void showError(String error);
    }

    interface Presenter extends BasePresenter {

        void loadReportStates();

        void reportRepair();
    }
}
