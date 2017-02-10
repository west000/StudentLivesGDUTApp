package com.tzh.campushelper.ui.user.info;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.ui.BaseFragment;
import com.tzh.campushelper.ui.user.editinfo.EditUserInfoActivity;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the user_info screen.
 */
public class UserInfoFragment extends BaseFragment implements UserInfoContract.View {

    private UserInfoContract.Presenter mPresenter;
    private TextView mNickNameView;
    private TextView mSignatureView;
//    private ImageView mAvatar;

    public static UserInfoFragment newInstanceWithPresenter(@NonNull BaseSchedulerProvider schedulerProvider,
                                                            @NonNull ApiService apiService) {
        Bundle arguments = new Bundle();
        UserInfoFragment fragment = new UserInfoFragment();
        fragment.setArguments(arguments);
        new UserInfoPresenter(fragment, schedulerProvider, apiService);
        return fragment;
    }

    @Override
    public void onResume() {
        super.onResume();
        if (mPresenter == null) {
            new UserInfoPresenter(this, Injection.provideBaseSchedulerProvider(), Injection.provideApiService(getContext()));
        }
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
        View v = inflater.inflate(R.layout.user_info_fragment, container, false);

//        mAvatar = fv(v, R.id.avatar);
        mNickNameView = fv(v, R.id.nick_name);
        mSignatureView = fv(v, R.id.signature);

        fv(v, R.id.fab_edit).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPresenter.editInfo();
            }
        });

        return v;
    }

    @Override
    public void setPresenter(@NonNull UserInfoContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void showUserInfo(ApiService.PersonInfo info) {
        mNickNameView.setText(info.nickname);
        mSignatureView.setText(info.signature);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void showEditInfo(ApiService.PersonInfo info) {
        EditUserInfoActivity.start(getContext(), info);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }
}