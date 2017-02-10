package com.tzh.campushelper.ui.user.editinfo;

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
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.BaseFragment;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the edit_user_info screen.
 */
public class EditUserInfoFragment extends BaseFragment implements EditUserInfoContract.View {

    private EditUserInfoContract.Presenter mPresenter;

    private TextView mNickName;
    private TextView mSignature;
    private TextView mSex;
    private TextView mTelephone;
    private TextView mFaculty;
    private TextView mSpecialty;
    private TextView mGrade;
    private TextView mDormitory;

    public static EditUserInfoFragment newInstance() {
        Bundle arguments = new Bundle();
        EditUserInfoFragment fragment = new EditUserInfoFragment();
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
        View v = inflater.inflate(R.layout.edit_user_info_fragment, container, false);

        mNickName = fv(v, R.id.nick_name);
        mSignature = fv(v, R.id.signature);
        mSex = fv(v, R.id.sex);
        mTelephone = fv(v, R.id.telephone);
        mFaculty = fv(v, R.id.faculty);
        mSpecialty = fv(v, R.id.specialty);
        mGrade = fv(v, R.id.grade);
        mDormitory = fv(v, R.id.dormitory);

        // Set up floating action button
        FloatingActionButton fab =
                (FloatingActionButton) getActivity().findViewById(R.id.fab_edit_user_info);

        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mPresenter.modifyInfo(
                        mNickName.getText().toString(),
                        mSignature.getText().toString(),
                        mSex.getText().toString(),
                        mTelephone.getText().toString(),
                        mFaculty.getText().toString(),
                        mSpecialty.getText().toString(),
                        mGrade.getText().toString(),
                        mDormitory.getText().toString()
                );
            }
        });

        return v;
    }

    @Override
    public void showInfo(ApiService.PersonInfo personInfo) {
        mNickName.setText(personInfo.nickname);
        mSignature.setText(personInfo.signature);
        mSex.setText(personInfo.sex);
        mTelephone.setText(personInfo.telephone);
        mFaculty.setText(personInfo.faculty);
        mSpecialty.setText(personInfo.specialty);
        mGrade.setText(personInfo.grade);
        mDormitory.setText(personInfo.dormitory);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void showModifySuccess() {
        Toast.makeText(getContext(), "修改成功", Toast.LENGTH_SHORT).show();
        getActivity().finish();
    }

    @Override
    public void setPresenter(@NonNull EditUserInfoContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }
}