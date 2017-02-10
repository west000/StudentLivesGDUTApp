package com.tzh.campushelper.ui.edu.login;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.edu.EduSystemNavigationActivity;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the education_system_login screen.
 */
public class EducationSystemLoginFragment extends Fragment implements EducationSystemLoginContract.View {

    private EducationSystemLoginContract.Presenter mPresenter;

    private TextView mUsrView;
    private EditText mPwdView;

    private View mProgressView;
    private View mLoginFormView;

    public static EducationSystemLoginFragment newInstance() {
        Bundle arguments = new Bundle();
        EducationSystemLoginFragment fragment = new EducationSystemLoginFragment();
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
        View root = inflater.inflate(R.layout.education_system_login_fragment, container, false);
        mProgressView = root.findViewById(R.id.login_progress);
        mLoginFormView = root.findViewById(R.id.login_form);

        mUsrView = ((TextView) root.findViewById(R.id.user));
        mPwdView = ((EditText) root.findViewById(R.id.password));
        mPwdView.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int id, KeyEvent keyEvent) {
                if (id == R.id.login || id == EditorInfo.IME_NULL) {
                    mPresenter.login(mUsrView.getText().toString(), mPwdView.getText().toString());
                    return true;
                }
                return false;
            }
        });

        root.findViewById(R.id.login_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPresenter.login(mUsrView.getText().toString(), mPwdView.getText().toString());
            }
        });

        return root;
    }

    @Override
    public void setPresenter(@NonNull EducationSystemLoginContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void clearError() {
        mUsrView.setError(null);
        mPwdView.setError(null);
    }

    @Override
    public void showUsrError(String error) {
        mUsrView.setError(error);
    }

    @Override
    public void showPwdError(String error) {
        mPwdView.setError(error);
    }

    @Override
    public void showNavigation(String studentId) {
        EduSystemNavigationActivity.start(getContext(), studentId);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }


    @Override
    public void setLoadingIndicator(final boolean active) {
        int shortAnimTime = getResources().getInteger(android.R.integer.config_shortAnimTime);

        mLoginFormView.setVisibility(active ? View.GONE : View.VISIBLE);
        mLoginFormView.animate().setDuration(shortAnimTime).alpha(
                active ? 0 : 1).setListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                mLoginFormView.setVisibility(active ? View.GONE : View.VISIBLE);
            }
        });

        mProgressView.setVisibility(active ? View.VISIBLE : View.GONE);
        mProgressView.animate().setDuration(shortAnimTime).alpha(
                active ? 1 : 0).setListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                mProgressView.setVisibility(active ? View.VISIBLE : View.GONE);
            }
        });
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

}