package com.tzh.campushelper.ui.campusnews;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService.QueryCampusNewsResult.News;
import com.tzh.campushelper.ui.MultiRecyclerFragment;
import com.tzh.campushelper.ui.WebViewActivity;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.SuperRecyclerArrayAdapter;
import com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter;

import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the campus_news screen.
 */
public class CampusNewsFragment extends MultiRecyclerFragment implements CampusNewsContract.View {

    private CampusNewsContract.Presenter mPresenter;
    private Adapter mAdapter;

    public static CampusNewsFragment newInstance() {
        Bundle arguments = new Bundle();
        CampusNewsFragment fragment = new CampusNewsFragment();
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
        View root = inflater.inflate(R.layout.campus_news_fragment, container, false);

        RecyclerView recyclerView = (RecyclerView) root.findViewById(R.id.list);
        mAdapter = new Adapter(getContext());
        mAdapter.setOnItemClickListener(new SuperRecyclerViewAdapter.OnItemClickListener<News>() {
            @Override
            public void onItemClick(News item) {
                mPresenter.loadDetails(item);
            }
        });
        recyclerView.setAdapter(mAdapter);

        return root;
    }

    @Override
    public void setPresenter(@NonNull CampusNewsContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void setLoadingIndicator(boolean active) {
        setRefreshing(active);
    }

    @Override
    public void setLoadingMoreIndicator(boolean active) {
        setLoadingMore(active);
    }

    @Override
    public void showNoMoreIndicator() {
        showNoMore();
    }

    @Override
    public void showCampusNews(List<News> newsList) {
        mAdapter.setList(newsList);
    }

    @Override
    public void insertCampusNews(List<News> newsList) {
        mAdapter.insert(newsList);
    }

    @Override
    public void showDetails(String html) {
        WebViewActivity.start(getContext(), getString(R.string.title_campus_news), html);
    }

    @Override
    public boolean isActive() {
        return isAdded();
    }

    @Override
    public void showError(String error) {
        Toast.makeText(getContext(), error, Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void requestDataRefresh() {
        mPresenter.loadCampusNews();
    }

    @Override
    protected void requestMoreData() {
        mPresenter.loadMoreCampusNews(mAdapter.getItem(mAdapter.getCount() - 1).id);
    }

    class Adapter extends SuperRecyclerArrayAdapter<News> {

        Adapter(Context context) {
            super(context, R.layout.campus_news_item_layout);
        }

        @Override
        protected void onBind(CommonViewHolder holder, News news) {
            holder.getTextView(R.id.title).setText(news.title);
            holder.getTextView(R.id.department).setText(news.deparment);
            holder.getTextView(R.id.date).setText(getString(R.string.news_date, news.date, news.weekday));
        }

    }
}