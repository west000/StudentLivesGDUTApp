package com.tzh.campushelper.ui.communityinfo;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.squareup.picasso.Picasso;
import com.tzh.campushelper.R;
import com.tzh.campushelper.service.ApiService.QueryCommunityInfoResult.CommunityInfo;
import com.tzh.campushelper.ui.MultiRecyclerFragment;
import com.tzh.campushelper.ui.WebViewActivity;
import com.tzh.campushelper.ui.widget.CommonViewHolder;
import com.tzh.campushelper.ui.widget.MultiRecyclerView;
import com.tzh.campushelper.ui.widget.SuperRecyclerArrayAdapter;
import com.tzh.campushelper.ui.widget.SuperRecyclerViewAdapter;

import java.util.List;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Main UI for the community_info screen.
 */
public class CommunityInfoFragment extends MultiRecyclerFragment implements CommunityInfoContract.View {

    private CommunityInfoContract.Presenter mPresenter;
    private Adapter mAdapter;

    public static CommunityInfoFragment newInstance() {
        Bundle arguments = new Bundle();
        CommunityInfoFragment fragment = new CommunityInfoFragment();
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
        View root = inflater.inflate(R.layout.community_info_fragment, container, false);

        MultiRecyclerView mrv = (MultiRecyclerView) root.findViewById(R.id.list);
        mAdapter = new Adapter(getContext());
        mAdapter.setOnItemClickListener(new SuperRecyclerViewAdapter.OnItemClickListener<CommunityInfo>() {
            @Override
            public void onItemClick(CommunityInfo item) {
                mPresenter.loadDetails(item);
            }
        });
        mrv.setAdapter(mAdapter);

        return root;
    }

    @Override
    public void setPresenter(@NonNull CommunityInfoContract.Presenter presenter) {
        mPresenter = checkNotNull(presenter);
    }

    @Override
    public void setLoadingIndicator(boolean active) {
        setRefreshing(active);
    }

    @Override
    public void showNoMoreIndicator() {
        showNoMore();
    }

    @Override
    public void setLoadingMoreIndicator(boolean active) {
        setLoadingMore(active);
    }

    @Override
    public void showCommunityInfo(List<CommunityInfo> infoList) {
        mAdapter.setList(infoList);
    }

    @Override
    public void insertCommunityInfo(List<CommunityInfo> infoList) {
        mAdapter.insert(infoList);
    }

    @Override
    public void showDetails(String html) {
        WebViewActivity.start(getContext(), getString(R.string.title_community_info), html);
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
        mPresenter.loadCommunityInfo();
    }

    @Override
    protected void requestMoreData() {
        mPresenter.loadMoreCommunityInfo(mAdapter.getItem(mAdapter.getCount() - 1).id);
    }

    class Adapter extends SuperRecyclerArrayAdapter<CommunityInfo> {
        Adapter(Context context) {
            super(context, R.layout.community_info_item_layout);
        }

        @Override
        public void onBind(CommonViewHolder holder, CommunityInfo info) {
            holder.getTextView(R.id.community_name).setText(info.communityname);
            holder.getTextView(R.id.create_time).setText(info.createtime);
            holder.getTextView(R.id.title).setText(info.title);
            if (!TextUtils.isEmpty(info.headimgurl)) {
                Picasso.with(getContext())
                        .load(info.headimgurl)
                        .into(holder.getImageView(R.id.community_icon));
            } else {
                holder.getImageView(R.id.community_icon).setImageDrawable(null);
            }
            if (!TextUtils.isEmpty(info.contentimgurl)) {
                Picasso.with(getContext())
                        .load(info.contentimgurl)
                        .into(holder.getImageView(R.id.img));
            } else {
                holder.getImageView(R.id.img).setImageDrawable(null);
            }
        }
    }
}
