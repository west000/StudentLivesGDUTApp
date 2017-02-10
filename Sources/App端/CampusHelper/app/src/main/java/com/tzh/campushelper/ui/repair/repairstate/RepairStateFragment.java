package com.tzh.campushelper.ui.repair.repairstate;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService.DormRepairStateResult.RepairState;
import com.tzh.campushelper.ui.BaseFragment;
import com.tzh.campushelper.ui.repair.reportrepair.ReportRepairActivity;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.RecyclerArrayAdapter;

import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the repair_state screen.
 */
public class RepairStateFragment extends BaseFragment implements RepairStateContract.View {

    private RepairStateContract.Presenter mPresenter;
    private Adapter mAdapter;

    public static RepairStateFragment newInstance() {
        Bundle arguments = new Bundle();
        RepairStateFragment fragment = new RepairStateFragment();
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
        View root = inflater.inflate(R.layout.repair_state_fragment, container, false);

        RecyclerView recyclerView = fv(root, R.id.list);
        mAdapter = new Adapter(getContext());
        recyclerView.setAdapter(mAdapter);

        // Set up floating action button
        FloatingActionButton fab =
                (FloatingActionButton) getActivity().findViewById(R.id.fab_repair_state);

        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mPresenter.reportRepair();
            }
        });

        return root;
    }

    @Override
    public void showReportRepair() {
        ReportRepairActivity.start(getContext());
    }

    @Override
    public void showRepairStates(List<RepairState> states) {
        mAdapter.setList(states);
    }

    @Override
    public void setPresenter(@NonNull RepairStateContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    class Adapter extends RecyclerArrayAdapter<RepairState> {

        Adapter(Context context) {
            super(context, R.layout.repair_state_item_layout);
        }

        @Override
        protected void onBind(CommonViewHolder holder, RepairState item) {
            holder.setText(R.id.project, item.project);
            holder.setText(R.id.time, item.time);
            TextView stateView = holder.get(R.id.state);
            stateView.setText(item.state == 1 ? "已维修" : "未维修");
            stateView.setTextColor(item.state == 1 ? Color.GREEN : Color.RED);
        }
    }
}