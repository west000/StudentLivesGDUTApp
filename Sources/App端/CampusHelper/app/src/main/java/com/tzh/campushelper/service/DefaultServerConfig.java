package com.tzh.campushelper.service;

public class DefaultServerConfig {
    private static final String HOST = "10.30.19.141";
    private static final int PORT = 3333;

    public static String getHost() {
        return HOST;
    }

    public static int getPort() {
        return PORT;
    }

    public static String getUrl() {
        return "http://" + HOST + ":" + PORT + "/";
    }
}
