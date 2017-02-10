package com.tzh.campushelper.util;


import android.text.format.DateFormat;

import java.util.Date;

public class Utils {

    public static String currentDateString() {
        return DateFormat.format("yyyy-MM-dd", new Date()).toString();
    }
}
