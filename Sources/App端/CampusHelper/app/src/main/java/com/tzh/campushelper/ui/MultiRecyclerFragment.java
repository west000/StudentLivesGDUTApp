package com.tzh.campushelper.ui;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.View;

import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.widget.MultiRecyclerView;
import com.tzh.campushelper.ui.widget.MultiSwipeRefreshLayout;
import com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter;

public class MultiRecyclerFragment extends Fragment {

    private SwipeRefreshLayout mSwipeRefreshLayout;
    private View mEmptyView;
    private MultiRecyclerView mMultiRecyclerView;

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        trySetupRecyclerView(view);

        trySetupSwipeRefresh(view);

    }

    private void trySetupSwipeRefresh(View v) {
        mSwipeRefreshLayout = (SwipeRefreshLayout) v.findViewById(R.id.swipe_refresh_layout);
        if (mSwipeRefreshLayout != null) {
            mSwipeRefreshLayout.setColorSchemeResources(
                    R.color.colorPrimary);
            mSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
                @Override
                public void onRefresh() {
                    setLoadingMore(false);
                    requestDataRefresh();
                }
            });

            if (mSwipeRefreshLayout instanceof MultiSwipeRefreshLayout) {
                MultiSwipeRefreshLayout mswrl = (MultiSwipeRefreshLayout) mSwipeRefreshLayout;
                mswrl.setSwipeableChildren(swipeableChildrenIds());
            }
        }
    }

    private void trySetupRecyclerView(View v) {
        mEmptyView = v.findViewById(android.R.id.empty);
        mMultiRecyclerView = (MultiRecyclerView) v.findViewById(R.id.list);
        if (mMultiRecyclerView != null) {
            if (mEmptyView != null) {
                mMultiRecyclerView.setEmptyView(mEmptyView);
            }
            mMultiRecyclerView.getAdapter().setOnLoadingMoreListener(new SuperRecyclerViewAdapter.OnLoadingMoreListener() {
                @Override
                public void onLoad() {
                    requestMoreData();
                }
            });
        }
    }

    protected void setRefreshing(final boolean refreshing) {
        if (mSwipeRefreshLayout == null) {
            return;
        }
        if (mSwipeRefreshLayout.isRefreshing() == refreshing) {
            return;
        }
        if (mSwipeRefreshLayout != null) {
            mSwipeRefreshLayout.post(new Runnable() {
                @Override
                public void run() {
                    mSwipeRefreshLayout.setRefreshing(refreshing);
                }
            });
        }
    }

    protected void setLoadingMore(boolean loading) {
        if (mMultiRecyclerView != null) {
            if (loading) {
                mMultiRecyclerView.getAdapter().showFooterProgress();
            } else {
                mMultiRecyclerView.getAdapter().removeFooter();
            }
        }
    }

    protected void showNoMore() {
        if (mMultiRecyclerView != null) {
            mMultiRecyclerView.getAdapter().showFooterNoMoreView();
        }
    }

    protected int[] swipeableChildrenIds() {
        return new int[]{R.id.list, android.R.id.empty};
    }

    protected void requestDataRefresh() {
    }

    protected void requestMoreData() {
    }
}
