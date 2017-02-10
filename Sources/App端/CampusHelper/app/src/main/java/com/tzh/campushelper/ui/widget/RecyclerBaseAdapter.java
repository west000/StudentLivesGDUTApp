package com.tzh.campushelper.ui.widget;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;

public abstract class RecyclerBaseAdapter extends RecyclerView.Adapter<CommonViewHolder> {
    @LayoutRes
    private int mLayoutResource;

    private LayoutInflater mLayoutInflater;
    private Context mContext;

    public RecyclerBaseAdapter(Context context, @LayoutRes int layoutResource) {
        mContext = context;
        mLayoutResource = layoutResource;
        mLayoutInflater = LayoutInflater.from(context);
    }

    @Override
    public CommonViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new CommonViewHolder(mLayoutInflater.inflate(mLayoutResource, parent, false));
    }

    public LayoutInflater getLayoutInflater() {
        return mLayoutInflater;
    }

    public Context getContext() {
        return mContext;
    }
}
