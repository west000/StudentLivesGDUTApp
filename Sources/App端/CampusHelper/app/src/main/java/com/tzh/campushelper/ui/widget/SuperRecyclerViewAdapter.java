package com.tzh.campushelper.ui.widget;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;

import com.tzh.campushelper.R;

import static com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter.FootViewHolder.STATE_HIDE;
import static com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter.FootViewHolder.STATE_NO_MORE;
import static com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter.FootViewHolder.STATE_PROGRESS;

/**
 * A {@link RecyclerView.Adapter} with FooterView.
 */
public abstract class SuperRecyclerViewAdapter<T> extends RecyclerBaseAdapter {

    private static final int VIEW_TYPE_ITEM = 0;
    private static final int VIEW_TYPE_FOOTER = 4;

    private OnItemClickListener<T> mOnItemClickListener;

    private int mFooterState = STATE_HIDE;

    private static final int CLOSING_THRESHOLD = 5;

    private OnLoadingMoreListener mOnLoadingMoreListener;

    private RecyclerView.OnScrollListener mOnScrollListener = new RecyclerView.OnScrollListener() {

        @Override
        public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
            super.onScrolled(recyclerView, dx, dy);

            if (dy <= 0) {
                // On scrolling down.
                return;
            }

            int totalItemCount = getItemCount();
            // The RecycleView must use LinearLayoutManager.
            int lastVisibleItem = ((LinearLayoutManager) recyclerView.getLayoutManager()).findLastVisibleItemPosition();

            if (totalItemCount <= (lastVisibleItem + CLOSING_THRESHOLD)) {
                showFooterProgress();
            }
        }
    };
    private RecyclerView mRecyclerView;

    public void setOnLoadingMoreListener(OnLoadingMoreListener onLoadingMoreListener) {
        mOnLoadingMoreListener = onLoadingMoreListener;
    }

    protected abstract CommonViewHolder onCreateVH(ViewGroup parent);

    protected abstract void onBindVH(CommonViewHolder holder, int position);

    public abstract T getItem(int position);

    public abstract int getCount();

    public boolean isEmpty() {
        return getCount() == 0;
    }

    public SuperRecyclerViewAdapter(Context context, @LayoutRes int layoutResource) {
        super(context, layoutResource);
    }

    public FootViewHolder onCreateFooterVH(ViewGroup parent) {
        return new FootViewHolder(LayoutInflater.from(getContext()).inflate(R.layout.footer_progress, parent, false));
    }

    @Override
    public final CommonViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == VIEW_TYPE_FOOTER) {
            return onCreateFooterVH(parent);
        } else if (viewType == VIEW_TYPE_ITEM) {
            return onCreateVH(parent);
        }
        return null;
    }

    @Override
    public void onBindViewHolder(CommonViewHolder holder, int position) {
        if (!(holder instanceof FootViewHolder)) {
            final T element = getItem(position);
            holder.getRoot().setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    mOnItemClickListener.onItemClick(element);
                }
            });
            onBindVH(holder, position);
        } else {
            if (!canScroll() && mFooterState == STATE_HIDE) {
                mFooterState = STATE_PROGRESS;
            }
            // Footer view show.
            ((FootViewHolder) holder).setState(mFooterState);
            if (mFooterState == STATE_PROGRESS) {
                mOnLoadingMoreListener.onLoad();
            }
        }
    }

    public void setOnItemClickListener(OnItemClickListener<T> onItemClickListener) {
        mOnItemClickListener = onItemClickListener;
    }

    /**
     * @deprecated Don't use this method
     */
    @Override
    public final int getItemCount() {
        return getCount() + 1;
    }

    @Override
    public final int getItemViewType(int position) {
        T item = null;
        try {
            item = getItem(position);
        } catch (Exception e) {
            // do nothing.
        }
        return item == null ? VIEW_TYPE_FOOTER : VIEW_TYPE_ITEM;
    }


    @Override
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        recyclerView.addOnScrollListener(mOnScrollListener);
        mRecyclerView = recyclerView;
    }

    @Override
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        mRecyclerView = null;
        recyclerView.removeOnScrollListener(mOnScrollListener);
        super.onDetachedFromRecyclerView(recyclerView);
    }

    private boolean canScroll() {
        return ViewCompat.canScrollVertically(mRecyclerView, -1);
    }

    public static class FootViewHolder extends CommonViewHolder {

        public static final int STATE_HIDE = 0;
        public static final int STATE_NO_MORE = 1;
        public static final int STATE_PROGRESS = 2;

        private View mItemView;
        private ProgressBar mProgressBar;
        private View mNoMoreView;

        public FootViewHolder(View itemView) {
            super(itemView);
            mItemView = itemView;
            mProgressBar = (ProgressBar) itemView.findViewById(R.id.progress);
            mNoMoreView = itemView.findViewById(R.id.no_more);
        }

        public void setState(int state) {
            switch (state) {
                case STATE_HIDE:
                    mItemView.setVisibility(View.GONE);
                    mNoMoreView.setVisibility(View.GONE);
                    mProgressBar.setVisibility(View.GONE);
                    break;
                case STATE_NO_MORE:
                    mItemView.setVisibility(View.VISIBLE);
                    mNoMoreView.setVisibility(View.VISIBLE);
                    mProgressBar.setVisibility(View.GONE);
                    break;
                case STATE_PROGRESS:
                    mItemView.setVisibility(View.VISIBLE);
                    mProgressBar.setVisibility(View.VISIBLE);
                    mNoMoreView.setVisibility(View.GONE);
                    break;
            }
        }
    }

    private void showFooter(int state) {
        int preState = mFooterState; // Save previous state.

        if (state == mFooterState) {
            return;
        }
        if (state == STATE_PROGRESS
                && preState == STATE_NO_MORE) {
            return;
        }

        mFooterState = state;

        mRecyclerView.post(new Runnable() {
            @Override
            public void run() {
                notifyItemChanged(getItemCount() - 1);
            }
        });
    }

    public void showFooterNoMoreView() {
        showFooter(STATE_NO_MORE);
    }


    public void showFooterProgress() {
        showFooter(STATE_PROGRESS);
    }

    public void removeFooter() {
        showFooter(STATE_HIDE);
    }

    public interface OnLoadingMoreListener {
        void onLoad();
    }

    public interface OnItemClickListener<T> {
        void onItemClick(T item);
    }

}
