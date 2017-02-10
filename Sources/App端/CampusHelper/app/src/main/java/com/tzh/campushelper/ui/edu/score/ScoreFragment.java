package com.tzh.campushelper.ui.edu.score;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.ScoreResult.Course;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.RecyclerArrayAdapter;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the score screen.
 */
public class ScoreFragment extends Fragment implements ScoreContract.View {

    private ScoreContract.Presenter mPresenter;
    private Spinner mYearSpinner;
    private Spinner mSemesterSpinner;
    private Adapter mAdapter;

    public static ScoreFragment newInstance() {
        Bundle arguments = new Bundle();
        ScoreFragment fragment = new ScoreFragment();
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
        View root = inflater.inflate(R.layout.score_fragment, container, false);

        mYearSpinner = ((Spinner) root.findViewById(R.id.year));
        ArrayAdapter<String> spinnerArrayAdapter = new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, generateYears());
        spinnerArrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mYearSpinner.setAdapter(spinnerArrayAdapter);

        mSemesterSpinner = ((Spinner) root.findViewById(R.id.semester));

        root.findViewById(R.id.query_by_semester_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPresenter.loadScores(
                        mYearSpinner.getSelectedItem().toString(),
                        mSemesterSpinner.getSelectedItem().toString()
                );
            }
        });
        root.findViewById(R.id.query_by_year_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPresenter.loadScores(
                        mYearSpinner.getSelectedItem().toString(),
                        ""
                );
            }
        });

        mAdapter = new Adapter(getContext());
        ((RecyclerView) root.findViewById(R.id.list)).setAdapter(mAdapter);

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
    public void setPresenter(@NonNull ScoreContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void showScores(List<Course> courseList) {
        mAdapter.setList(courseList);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    class Adapter extends RecyclerArrayAdapter<Course> {

        Adapter(Context context) {
            super(context, R.layout.score_item_layout);
        }

        @Override
        protected void onBind(CommonViewHolder holder, Course course) {
            holder.setText(R.id.courseName, course.cname);
            holder.setText(R.id.courseScore, course.score);
            holder.setText(R.id.courseNumber, course.cno);
            holder.setText(R.id.courseCredit, course.credit);
            holder.setText(R.id.courseNature, course.kind);
        }
    }

}