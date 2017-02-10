package com.tzh.campushelper.ui.widget;

import android.content.Context;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;

public class MultiRecyclerView extends RecyclerView {

    private SuperRecyclerViewAdapter mAdapter;

    private View mEmptyView;

    private AdapterDataObserver mEmptyObserver = new AdapterDataObserver() {
        @Override
        public void onChanged() {
            super.onChanged();
            checkIfEmpty();
        }

        @Override
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            super.onItemRangeRemoved(positionStart, itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeInserted(int positionStart, int itemCount) {
            super.onItemRangeInserted(positionStart, itemCount);
            checkIfEmpty();
        }
    };

    public MultiRecyclerView(Context context) {
        super(context);
    }

    public MultiRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public MultiRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /**
     * Set a new adapter to provide child views on demand.
     * <p>
     * When adapter is changed, all existing views are recycled back to the pool. If the pool has
     * only one adapter, it will be cleared.
     *
     * @param adapter The new adapter to set, or null to set no adapter.
     * @see RecyclerView#setAdapter(Adapter)
     */
    public void setAdapter(SuperRecyclerViewAdapter adapter) {
        if (mAdapter != null) {
            mAdapter.unregisterAdapterDataObserver(mEmptyObserver);
        }
        super.setAdapter(adapter);
        mAdapter = adapter;
        mAdapter.registerAdapterDataObserver(mEmptyObserver);
    }

    /**
     * @deprecated Use {@link #setAdapter(SuperRecyclerViewAdapter)} instead.
     */
    @Deprecated
    @Override
    public void setAdapter(Adapter adapter) {
        if (!(adapter instanceof SuperRecyclerViewAdapter)) {
            throw new IllegalArgumentException("MultiRecycleView only support SuperRecyclerViewAdapter");
        }
        setAdapter((SuperRecyclerViewAdapter) adapter);
    }

    @Override
    public SuperRecyclerViewAdapter getAdapter() {
        return mAdapter;
    }

    public void setEmptyView(View emptyView) {
        mEmptyView = emptyView;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            // If not explicitly specified this view is important for accessibility.
            if (emptyView != null
                    && emptyView.getImportantForAccessibility() == IMPORTANT_FOR_ACCESSIBILITY_AUTO) {
                emptyView.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
            }
        }

        checkIfEmpty();
    }

    private void checkIfEmpty() {
        final SuperRecyclerViewAdapter adapter = getAdapter();
        final boolean empty = ((adapter == null) || adapter.isEmpty());
        updateEmptyStatus(empty);
    }

    private void updateEmptyStatus(boolean empty) {
        if (mEmptyView != null) {
            mEmptyView.setVisibility(empty ? View.VISIBLE : View.GONE);
            setVisibility(empty ? View.GONE : View.VISIBLE);
        }
    }
}
