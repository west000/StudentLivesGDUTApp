package com.tzh.common.common.logger;

import android.os.Environment;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.Date;

public class FileLogNode extends LogWrapper {
    private static final String TAG = "FileLogNode";

    private static final String LOG_DIR = Environment
            .getExternalStorageDirectory().getPath()
            + "QGProjects"
            + "/"
            + "SmartPrinter"
            + "/"
            + "/log"
            + "/";

    /**
     * SD卡是否加载
     */
    private static final boolean IS_SDCARD_MOUNTED;
    private static final int LOG_LEVEL = Log.DEBUG;

    static {
        if (!Environment.MEDIA_MOUNTED.equals(Environment
                .getExternalStorageState())) {
            IS_SDCARD_MOUNTED = false;
        } else {
            String pathName = LOG_DIR;
            File path = new File(pathName);
            if (!path.exists()) {
                android.util.Log.d(TAG, "Create the path:" + pathName);
                IS_SDCARD_MOUNTED = path.mkdirs();
            } else {
                IS_SDCARD_MOUNTED = false;
            }
        }

    }

    @Override
    public void println(int priority, String tag, String msg, Throwable tr) {

        // Filter the low level log
        if (priority >= LOG_LEVEL && IS_SDCARD_MOUNTED) {
            writeFileToSD(priority + "/TAG: tag:" + tag + "     " + msg + "\n");
        }

        // If this isn't the last node in the chain, move things along.
        if (getNext() != null) {
            getNext().println(priority, tag, msg, tr);
        }
    }


    private void writeFileToSD(String str) {
        String sdStatus = Environment.getExternalStorageState();
        if (!sdStatus.equals(Environment.MEDIA_MOUNTED)) {
            android.util.Log.d(TAG, "SD card is not available/writable right now.");
            return;
        }
        try {
            String pathName = LOG_DIR;
            String fileName = getFileName();
            File path = new File(pathName);
            File file = new File(pathName + fileName);
            if (!path.exists()) {
                android.util.Log.d(TAG, "Create the path:" + pathName);
                path.mkdirs();
            }
            if (!file.exists()) {
                android.util.Log.d(TAG, "Create the file:" + fileName);
                file.createNewFile();
            }
            FileOutputStream stream = new FileOutputStream(file, true);
            byte[] buf = str.getBytes();
            stream.write(buf);
            stream.close();

        } catch (Exception e) {
            android.util.Log.e(TAG, "Error on writeFilToSD.");
            e.printStackTrace();
        }
    }

    public static String getFileName() {
        Date now = new Date();
        DateFormat d1 = DateFormat.getDateInstance();
        String str = d1.format(now);
        return (str == null ? "log.txt" : str + ".txt");
    }
}
