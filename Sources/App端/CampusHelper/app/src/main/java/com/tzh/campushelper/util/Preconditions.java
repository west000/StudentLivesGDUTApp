package com.tzh.campushelper.util;

import android.support.annotation.Nullable;

public class Preconditions {

    private Preconditions() {}

    public static <T> T checkNotNull(T reference) {
        if (reference == null) {
            throw new NullPointerException();
        } else {
            return reference;
        }
    }

    public static <T> T checkNotNull(T reference, @Nullable Object errorMessage) {
        if(reference == null) {
            throw new NullPointerException(String.valueOf(errorMessage));
        } else {
            return reference;
        }
    }

    public static <T> T checkNotNull(T reference, @Nullable String errorMessageTemplate, @Nullable Object... errorMessageArgs) {
        if(reference == null) {
            throw new NullPointerException(format(errorMessageTemplate, errorMessageArgs));
        } else {
            return reference;
        }
    }

    private static String format(@Nullable String template, @Nullable Object... args) {
        template = String.valueOf(template);
        if (args == null) {
            args = new Object[0];
        }
        return String.format(template, args);
    }

}
