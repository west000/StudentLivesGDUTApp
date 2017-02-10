package com.tzh.campushelper.data.source;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.support.annotation.NonNull;
import android.text.TextUtils;

import com.squareup.sqlbrite.BriteDatabase;
import com.squareup.sqlbrite.SqlBrite;
import com.tzh.campushelper.data.source.InfoDbHelper.CommunityInfoColumns;
import com.tzh.campushelper.service.ApiService.QueryCommunityInfoResult.CommunityInfo;
import com.tzh.campushelper.util.schedulers.BaseSchedulerProvider;

import java.util.List;

import rx.Observable;
import rx.functions.Func1;

import static android.database.sqlite.SQLiteDatabase.CONFLICT_REPLACE;
import static com.tzh.campushelper.util.Preconditions.checkNotNull;

/**
 * Concrete implementation to load orders from the data sources into the memory.
 */
public class InfoRepository implements InfoDataSource {
    private static final String TAG = "InfoRepository";

    private static InfoRepository INSTANCE;

    private BriteDatabase mDbHelper;

    // Prevent direct instantiation.
    private InfoRepository(@NonNull Context context,
                           @NonNull BaseSchedulerProvider schedulerProvider) {
        checkNotNull(context);
        init(context, schedulerProvider);
    }

    public void init(Context context, BaseSchedulerProvider schedulerProvider) {
        InfoDbHelper dbHelper = new InfoDbHelper(context);
        SqlBrite sqlBrite = new SqlBrite.Builder().build();
        mDbHelper = sqlBrite.wrapDatabaseHelper(dbHelper, schedulerProvider.io());
    }

    public void deleteDatabase(Context context, BaseSchedulerProvider schedulerProvider) {
        mDbHelper.close();
        InfoDbHelper.deleteDatabase(context);
        init(context, schedulerProvider);
    }

    public static InfoRepository getInstance(@NonNull Context context,
                                             @NonNull BaseSchedulerProvider schedulerProvider) {
        if (INSTANCE == null) {
            INSTANCE = new InfoRepository(context, schedulerProvider);
        }
        return INSTANCE;
    }

    @Override
    public Observable<List<CommunityInfo>> getCommunityInfos() {
        String[] projection = {
                CommunityInfoColumns.INFO_ID,
                CommunityInfoColumns.TITLE,
                CommunityInfoColumns.COMMUNITY_NAME,
                CommunityInfoColumns.CONTENT,
                CommunityInfoColumns.CREATE_TIME,
                CommunityInfoColumns.HEAD_IMG_URL,
                CommunityInfoColumns.CONTENT_IMG_URL
        };

        String sql = String.format("SELECT %s FROM %s", TextUtils.join(",", projection), InfoDbHelper.Tables.COMMUNITY_INFO);
        return mDbHelper.createQuery(InfoDbHelper.Tables.COMMUNITY_INFO, sql)
                .mapToList(new Func1<Cursor, CommunityInfo>() {
                    @Override
                    public CommunityInfo call(Cursor c) {
                        String id = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.INFO_ID));
                        String title = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.TITLE));
                        String communityname = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.COMMUNITY_NAME));
                        String content = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.CONTENT));
                        String createtime = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.CREATE_TIME));
                        String headimgurl = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.HEAD_IMG_URL));
                        String contentimgurl = c.getString(c.getColumnIndexOrThrow(CommunityInfoColumns.CONTENT_IMG_URL));

                        return new CommunityInfo(id, title, communityname, content, createtime, headimgurl, contentimgurl);
                    }
                });
    }

    @Override
    public void insertCommunityInfos(@NonNull List<CommunityInfo> infoList) {
        checkNotNull(infoList);
        BriteDatabase.Transaction transaction = mDbHelper.newTransaction();
        try {
            for (CommunityInfo info : infoList) {
                ContentValues values = new ContentValues();
                values.put(CommunityInfoColumns.INFO_ID, info.id);
                values.put(CommunityInfoColumns.TITLE, info.title);
                values.put(CommunityInfoColumns.COMMUNITY_NAME, info.communityname);
                values.put(CommunityInfoColumns.CONTENT, info.content);
                values.put(CommunityInfoColumns.CREATE_TIME, info.createtime);
                values.put(CommunityInfoColumns.HEAD_IMG_URL, info.headimgurl);
                values.put(CommunityInfoColumns.CONTENT_IMG_URL, info.contentimgurl);
                mDbHelper.insert(InfoDbHelper.Tables.COMMUNITY_INFO, values, CONFLICT_REPLACE);
            }
            transaction.markSuccessful();
        } finally {
            transaction.close();
        }
    }

    @Override
    public void clearCommunityInfos() {
        mDbHelper.delete(InfoDbHelper.Tables.COMMUNITY_INFO, null);
    }

}
