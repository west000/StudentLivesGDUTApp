package com.tzh.campushelper.data.source;

import android.support.annotation.NonNull;

import com.tzh.campushelper.service.ApiService.QueryCommunityInfoResult.CommunityInfo;

import java.util.List;

import rx.Observable;

public interface InfoDataSource {

    Observable<List<CommunityInfo>> getCommunityInfos();

    void insertCommunityInfos(@NonNull List<CommunityInfo> infoList);

    void clearCommunityInfos();
}
