package com.tzh.campushelper.ui.repair.reportrepair;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.BaseFragment;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the report_repair screen.
 */
public class ReportRepairFragment extends BaseFragment implements ReportRepairContract.View {

    private ReportRepairContract.Presenter mPresenter;
    TextView mRealName;
    TextView mTelephone;
    TextView mProject;
    TextView mDormitory;
    TextView mDescription;

    public static ReportRepairFragment newInstance() {
        Bundle arguments = new Bundle();
        ReportRepairFragment fragment = new ReportRepairFragment();
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
        View v = inflater.inflate(R.layout.report_repair_fragment, container, false);

        mRealName = fv(v, R.id.real_name);
        mTelephone = fv(v, R.id.telephone);
        mProject = fv(v, R.id.project);
        mDormitory = fv(v, R.id.dormitory);
        mDescription = fv(v, R.id.description);
        // Set up floating action button
        FloatingActionButton fab =
                (FloatingActionButton) getActivity().findViewById(R.id.fab_report_repair);

        fab.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                mPresenter.reportRepair(
                        mRealName.getText().toString(),
                        mTelephone.getText().toString(),
                        mProject.getText().toString(),
                        mDormitory.getText().toString(),
                        mDescription.getText().toString());
            }
        });

        return v;
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void showReportSuccess() {
        Toast.makeText(getContext(), "报修成功", Toast.LENGTH_SHORT).show();
        getActivity().finish();
    }

    @Override
    public void setPresenter(@NonNull ReportRepairContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }
}