package com.tzh.campushelper.ui.widget;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;

/**
 * A {@link RecyclerView.Adapter} with FooterView.
 */
public abstract class RecyclerArrayAdapter<T> extends RecyclerBaseAdapter {

    private List<T> mItems;


    public RecyclerArrayAdapter(Context context, @LayoutRes int layoutResource) {
        this(context, layoutResource, new ArrayList<T>());
    }

    public RecyclerArrayAdapter(Context context, @LayoutRes int layoutResource, ArrayList<T> items) {
        super(context, layoutResource);
        mItems = items;
    }

    protected abstract void onBind(CommonViewHolder holder, T item);

    @Override
    public void onBindViewHolder(CommonViewHolder holder, int position) {
        onBind(holder, getItem(position));
    }

    public void setList(List<T> list) {
        mItems = list;
        notifyDataSetChanged();
    }

    public void insert(List<T> list) {
        int size = mItems.size();
        mItems.addAll(list);
        notifyItemRangeInserted(size, list.size());
    }

    public T getItem(int position) {
        return mItems.get(position);
    }

    public int getItemCount() {
        return mItems.size();
    }

}
