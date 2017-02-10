package com.tzh.campushelper.ui.tools;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.campusnews.CampusNewsActivity;
import com.tzh.campushelper.ui.communityinfo.CommunityInfoActivity;
import com.tzh.campushelper.ui.edu.login.EducationSystemLoginActivity;
import com.tzh.campushelper.ui.repair.repairstate.RepairStateActivity;

/**
 * Main UI for the tools screen.
 */
public class ToolsFragment extends Fragment implements View.OnClickListener {

    public static ToolsFragment newInstance() {
        Bundle arguments = new Bundle();
        ToolsFragment fragment = new ToolsFragment();
        fragment.setArguments(arguments);
        return fragment;
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
        View root = inflater.inflate(R.layout.tools_fragment, container, false);

        root.findViewById(R.id.education_system).setOnClickListener(this);
        root.findViewById(R.id.campus_news).setOnClickListener(this);
        root.findViewById(R.id.community_info).setOnClickListener(this);
        root.findViewById(R.id.dormitory_repair).setOnClickListener(this);

        return root;
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.education_system:
                EducationSystemLoginActivity.start(getContext());
                break;
            case R.id.campus_news:
                CampusNewsActivity.start(getContext());
                break;
            case R.id.community_info:
                CommunityInfoActivity.start(getContext());
                break;
            case R.id.dormitory_repair:
                RepairStateActivity.start(getContext());
                break;
        }

    }
}