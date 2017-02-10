package com.tzh.campushelper.ui.edu.examtime;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.ExamTimeResult.ExamTime;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.RecyclerArrayAdapter;

import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the exam_time screen.
 */
public class ExamTimeFragment extends Fragment implements ExamTimeContract.View {

    private ExamTimeContract.Presenter mPresenter;
    private Adapter mAdapter;

    public static ExamTimeFragment newInstance() {
        Bundle arguments = new Bundle();
        ExamTimeFragment fragment = new ExamTimeFragment();
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
        View root = inflater.inflate(R.layout.exam_time_fragment, container, false);

        RecyclerView recyclerView = (RecyclerView) root.findViewById(R.id.list);
        mAdapter = new Adapter(getContext());
        recyclerView.setAdapter(mAdapter);

        return root;
    }

    @Override
    public void setPresenter(@NonNull ExamTimeContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void showExamTime(List<ExamTime> examTimeList) {
        mAdapter.setList(examTimeList);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    public class Adapter extends RecyclerArrayAdapter<ExamTime> {

        Adapter(Context context) {
            super(context, R.layout.exam_time_item_layout);
        }

        @Override
        protected void onBind(CommonViewHolder holder, ExamTime examTime) {
            holder.setText(R.id.courseName, examTime.cname);
            holder.setText(R.id.campus, examTime.campus);
            holder.setText(R.id.classroom, examTime.classroom);
            holder.setText(R.id.seatNumber, examTime.seat);
            holder.setText(R.id.examTime, examTime.time);
            holder.setText(R.id.name, examTime.sname);
        }
    }
}