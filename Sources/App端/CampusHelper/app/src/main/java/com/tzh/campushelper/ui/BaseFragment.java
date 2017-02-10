package com.tzh.campushelper.ui;

import android.support.annotation.IdRes;
import android.support.v4.app.Fragment;
import android.view.View;
import android.widget.TextView;

public class BaseFragment extends Fragment {
    @SuppressWarnings("unchecked")
    protected <T extends View> T fv(View v, @IdRes int id) {
        return (T) v.findViewById(id);
    }
}
