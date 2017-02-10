package com.tzh.campushelper.ui.edu.gradeexam;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService.GradeExamResult.GradeExam;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.RecyclerArrayAdapter;

import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the grade_exam screen.
 */
public class GradeExamFragment extends Fragment implements GradeExamContract.View {

    private GradeExamContract.Presenter mPresenter;
    private Adapter mAdapter;

    public static GradeExamFragment newInstance() {
        Bundle arguments = new Bundle();
        GradeExamFragment fragment = new GradeExamFragment();
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
        View root = inflater.inflate(R.layout.grade_exam_fragment, container, false);

        RecyclerView recyclerView = ((RecyclerView) root.findViewById(R.id.list));
        mAdapter = new Adapter(getContext());
        recyclerView.setAdapter(mAdapter);

        return root;
    }

    @Override
    public void setPresenter(@NonNull GradeExamContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void setLoadingIndicator(boolean active) {

    }

    @Override
    public void showGradeExam(List<GradeExam> list) {
        mAdapter.setList(list);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    public class Adapter extends RecyclerArrayAdapter<GradeExam> {

        Adapter(Context context) {
            super(context, R.layout.grade_exam_item_layout);
        }

        @Override
        protected void onBind(CommonViewHolder holder, GradeExam gradeExam) {
            holder.setText(R.id.gradeScoreYear, gradeExam.year);
            holder.setText(R.id.gradeScoreSemester, gradeExam.semester);
            holder.setText(R.id.gradeScoreName, gradeExam.examname);
            holder.setText(R.id.gradeScoreCardNumber, gradeExam.id);
            holder.setText(R.id.gradeExamDate, gradeExam.time);
            holder.setText(R.id.gradeScore, gradeExam.totalS);
            holder.setText(R.id.gradeListenScore, gradeExam.listenS);
            holder.setText(R.id.gradeReadScore, gradeExam.readS);
            holder.setText(R.id.gradeWriteScore, gradeExam.writeS);
            holder.setText(R.id.gradeSynthesizeScore, gradeExam.complexS);
        }
    }
}