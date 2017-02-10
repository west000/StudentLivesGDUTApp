package com.tzh.campushelper.ui.widget;

import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class CommonViewHolder extends RecyclerView.ViewHolder {
    private SparseArray<View> mViews;

    private View mRoot;

    public CommonViewHolder(View itemView) {
        super(itemView);
        mViews = new SparseArray<>();
        mRoot = itemView;
    }

    @SuppressWarnings("unchecked")
    public <V extends View> V get(int id) {
        V v = (V) mViews.get(id);
        if (v == null) {
            v = (V) mRoot.findViewById(id);
            mViews.put(id, v);
        }
        return v;
    }

    public View getRoot() {
        return mRoot;
    }

    public TextView getTextView(int id) {
        return get(id);
    }

    public Button getButton(int id) {
        return get(id);
    }

    public ImageView getImageView(int id) {
        return get(id);
    }

    public void setText(int id, String text) {
        getTextView(id).setText(text);
    }
}
