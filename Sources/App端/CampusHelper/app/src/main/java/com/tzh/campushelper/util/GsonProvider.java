package com.tzh.campushelper.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Provide the same Gson object for this project.
 */
public class GsonProvider {

    public static Gson create() {
        return new GsonBuilder()
                .create();
    }

}
