package com.tzh.campushelper.ui.edu.timetable;

import com.tzh.campushelper.BasePresenter;
import com.tzh.campushelper.BaseView;
import com.tzh.campushelper.ui.widget.TimeTableEntry;
import com.tzh.campushelper.ui.widget.TimetableView;

import java.util.List;

/**
 * This specifies the contract between the view and the presenter.
 */
public interface TimeTableContract {

    interface View extends BaseView<Presenter> {
        void showTimeTable(TimeTableEntry entry);

        void showError(String errMessage);

        boolean isActive();
    }

    interface Presenter extends BasePresenter {
        void loadTimeTable(String year, String semester);

        void selectWeek(int week);
    }
}
