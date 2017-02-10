package com.tzh.campushelper.ui.edu.timetable;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.widget.TimeTableEntry;
import com.tzh.campushelper.ui.widget.TimetableView;
import com.tzh.campushelper.util.CastUtils;
import com.tzh.common.common.logger.Log;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the time_table screen.
 */
public class TimeTableFragment extends Fragment implements TimeTableContract.View {

    private TimeTableContract.Presenter mPresenter;
    private TimetableView mTimeTableView;
    private Spinner mYearSpinner;
    private Spinner mSemesterSpinner;
    private Spinner mWeekSpinner;

    public static TimeTableFragment newInstance() {
        Bundle arguments = new Bundle();
        TimeTableFragment fragment = new TimeTableFragment();
        fragment.setArguments(arguments);
        return fragment;
    }

    @Override
    public void onResume() {
        super.onResume();
        mPresenter.subscribe();
    }

    @Override
    public void onPause() {
        super.onPause();
        mPresenter.unsubscribe();
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.time_table_fragment, container, false);

        mTimeTableView = (TimetableView) root.findViewById(R.id.time_table_view);

        mYearSpinner = ((Spinner) root.findViewById(R.id.year));
        ArrayAdapter<String> spinnerArrayAdapter = new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, generateYears());
        spinnerArrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mYearSpinner.setAdapter(spinnerArrayAdapter);

        mSemesterSpinner = ((Spinner) root.findViewById(R.id.semester));

        root.findViewById(R.id.query_by_semester_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPresenter.loadTimeTable(
                        mYearSpinner.getSelectedItem().toString(),
                        mSemesterSpinner.getSelectedItem().toString()
                );
            }
        });

        // Set up week spinner.
        mWeekSpinner = (Spinner) getActivity().findViewById(R.id.weeks);
        mWeekSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                mPresenter.selectWeek(0);
            }

            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                mPresenter.selectWeek(CastUtils.toInt(mWeekSpinner.getSelectedItem().toString()));
            }
        });

        return root;
    }

    private ArrayList<String> generateYears() {
        ArrayList<String> years = new ArrayList<>();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        final int range = 8;
        for (int i = 0; i < range; i++) {
            int y = year - i;
            years.add(y + "-" + (y + 1));
        }
        return years;
    }

    @Override
    public void setPresenter(@NonNull TimeTableContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void showTimeTable(TimeTableEntry entry) {
        mTimeTableView.setTimeTableEntry(entry);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    @Override
    public void showError(String errMessage) {
        Toast.makeText(getContext(), errMessage, Toast.LENGTH_SHORT).show();
    }
}