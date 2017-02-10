package com.tzh.campushelper.data.source;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;

/**
 * InfoDbHelper
 */
public class InfoDbHelper extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "Information.db";

    // If you change the database schema, you must increment the database version.
    private static final int DATABASE_VERSION = 3;

    interface Tables {
        String COMMUNITY_INFO = "community_info";
        String CAMPUS_NEWS = "campus_news";
    }

    interface CommunityInfoColumns extends BaseColumns {
        String INFO_ID = "info_id";
        String TITLE = "title";
        String COMMUNITY_NAME = "community_name";
        String CONTENT = "content";
        String CREATE_TIME = "create_time";
        String HEAD_IMG_URL = "head_img_url";
        String CONTENT_IMG_URL = "content_img_url";
    }

    interface CampusNewsColumns extends BaseColumns {
        String NEWS_ID = "news_id";
        String TITLE = "title";
        String DEPARTMENT = "department";
        String DATE = "date";
        String WEEKDAY = "weekday";
        String CONTENT = "content";
    }

    InfoDbHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE " + Tables.COMMUNITY_INFO + "(" +
                CommunityInfoColumns._ID + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                CommunityInfoColumns.INFO_ID + " TEXT NOT NULL," +
                CommunityInfoColumns.TITLE + " TEXT NOT NULL," +
                CommunityInfoColumns.COMMUNITY_NAME + " TEXT NOT NULL," +
                CommunityInfoColumns.CONTENT + " TEXT NOT NULL," +
                CommunityInfoColumns.CREATE_TIME + " TEXT NOT NULL," +
                CommunityInfoColumns.HEAD_IMG_URL + " TEXT NOT NULL," +
                CommunityInfoColumns.CONTENT_IMG_URL + " TEXT NOT NULL)");

        db.execSQL("CREATE TABLE " + Tables.CAMPUS_NEWS + "(" +
                CampusNewsColumns._ID + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                CampusNewsColumns.NEWS_ID + " TEXT NOT NULL," +
                CampusNewsColumns.TITLE + " TEXT NOT NULL," +
                CampusNewsColumns.DEPARTMENT + " TEXT NOT NULL," +
                CampusNewsColumns.DATE + " TEXT NOT NULL," +
                CampusNewsColumns.WEEKDAY + " TEXT NOT NULL," +
                CampusNewsColumns.CONTENT + " TEXT NOT NULL)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + Tables.CAMPUS_NEWS);
        db.execSQL("DROP TABLE IF EXISTS " + Tables.COMMUNITY_INFO);
        onCreate(db);
    }

    static void deleteDatabase(Context context) {
        context.deleteDatabase(DATABASE_NAME);
    }

}


