package com.tzh.campushelper.util;

public class CastUtils {

    public static double toDouble(String s) {
        return fromString(s, 0.0);
    }

    public static float toFloat(String s) {
        return fromString(s, 0.0f);
    }
    public static int toInt(String s) {
        return fromString(s, 0);
    }

    public static double fromString(String s, double def) {
        try {
            return Double.valueOf(s);
        } catch (NumberFormatException e) {
            return def;
        }
    }

    public static float fromString(String s, float def) {
        try {
            return Float.valueOf(s);
        } catch (NumberFormatException e) {
            return def;
        }
    }

    public static int fromString(String s, int def) {
        try {
            return Integer.valueOf(s);
        } catch (NumberFormatException e) {
            return def;
        }
    }

}
