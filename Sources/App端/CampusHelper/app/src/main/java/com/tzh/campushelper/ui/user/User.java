package com.tzh.campushelper.ui.user;

public class User {

    private String userName;

    public User() {
    }

    private static final User USER = new User();
    public static User getInstance() {
        return USER;
    }

    public String getUsername() {
        return userName;
    }

    public void setUserName(String userId) {
        this.userName = userId;
    }

}
