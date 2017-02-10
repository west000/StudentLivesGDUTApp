package com.tzh.campushelper.ui.edu.timetable;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.widget.TimeTableEntry;
import com.tzh.campushelper.ui.widget.TimetableView;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;
import com.tzh.common.common.logger.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import rx.Observer;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Listens to user actions from the UI ({@link TimeTableFragment}), retrieves the data and updates the
 * UI as required.
 */
public class TimeTablePresenter implements TimeTableContract.Presenter {

    @NonNull
    private final TimeTableContract.View mTimeTableView;

    @NonNull
    private final BaseSchedulerProvider mSchedulerProvider;

    @NonNull
    private final ApiService mApiService;

    @NonNull
    private CompositeSubscription mSubscriptions;

    @NonNull
    private String mStudentId;

    @Nullable
    private TimeTableEntry mTimeTableEntry;

    private int mSelectedWeek;

    public TimeTablePresenter(@NonNull String studentId,
                              @NonNull TimeTableContract.View view,
                              @NonNull BaseSchedulerProvider schedulerProvider,
                              @NonNull ApiService apiService) {
        mStudentId = checkNotNull(studentId);
        mTimeTableView = checkNotNull(view, "view cannot be null!");
        mSchedulerProvider = checkNotNull(schedulerProvider, "schedulerProvider cannot be null");
        mApiService = checkNotNull(apiService, "apiService cannot be null");

        mSubscriptions = new CompositeSubscription();
        mTimeTableView.setPresenter(this);
    }

    @Override
    public void subscribe() {
        // Load default timetable.
        loadTimeTable("", "");
    }

    private static final String TAG = "TimeTablePresenter";

    @Override
    public void loadTimeTable(String year, String semester) {
        mSubscriptions.clear();
        Subscription subscription = mApiService.queryCurriculum(new ApiService.SemesterParam(mStudentId, year, semester))
                .subscribeOn(mSchedulerProvider.io())
                .observeOn(mSchedulerProvider.ui())
                .subscribe(new Observer<ApiService.CurriculumResult>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        mTimeTableView.showError("网络错误");
                        Log.e(TAG, "onError: ", e);
                    }

                    @Override
                    public void onNext(ApiService.CurriculumResult result) {
                        if (result.isOk()) {
                            mTimeTableEntry = TimeTableEntry.from(result.courses);
                            if (mSelectedWeek != 0) {
                                mTimeTableEntry.setWeekFilter(mSelectedWeek);
                            }
                            mTimeTableView.showTimeTable(mTimeTableEntry);
                        } else {
                            mTimeTableView.showError(result.getMessage());
                        }
                    }
                });
        mSubscriptions.add(subscription);
    }

    @Override
    public void selectWeek(int week) {
        mSelectedWeek = week;
        if (mTimeTableEntry != null) {
            mTimeTableEntry.setWeekFilter(week);
            mTimeTableView.showTimeTable(mTimeTableEntry);
        }
    }

    @Override
    public void unsubscribe() {
        mSubscriptions.clear();
    }

}