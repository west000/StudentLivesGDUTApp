package com.tzh.campushelper.util;

import java.util.regex.Pattern;

public class FormatChecker {

    private static boolean match(String str, String pattern) {
        return str != null
                && Pattern.compile(pattern).matcher(str).matches();
    }

    public static boolean checkUserName(String username) {
        return match(username, "^\\w{8,32}$");
    }

    public static boolean checkPassword(String password) {
        return match(password, "^\\w{8,32}$");
    }


    public static boolean checkStudentId(String id) {
        return match(id, "^\\w{1,}$");
    }

    public static boolean checkStudentPwd(String pwd) {
        return pwd != null && pwd.length() > 0;
    }
}
