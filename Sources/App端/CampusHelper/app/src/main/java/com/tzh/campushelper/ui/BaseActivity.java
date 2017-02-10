package com.tzh.campushelper.ui;

import android.support.v7.app.AppCompatActivity;
import android.view.MotionEvent;

import com.tzh.campushelper.util.ActivityUtils;
import com.tzh.common.common.logger.Linkable;
import com.tzh.common.common.logger.Log;
import com.tzh.common.common.logger.LogWrapper;

import rx.subjects.PublishSubject;
import rx.subjects.SerializedSubject;
import rx.subjects.Subject;

public class BaseActivity extends AppCompatActivity {

    @Override
    protected void onStart() {
        super.onRestart();
        initializeLogging();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        initializeLogging();
    }

    /**
     * Set up targets to receive log data
     *
     * @return The last node of the log list.
     */
    public Linkable initializeLogging() {
        final Linkable tail;

        // Using Log, front-end to the logging chain, emulates android.util.log method signatures.
        // Wraps Android's native log framework
        LogWrapper logWrapper = new LogWrapper();
        tail = (Linkable) Log.setLogNode(logWrapper);

        return tail;
    }

    @Override
    protected void onResume() {
        super.onResume();
        ActivityUtils.addActivity(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        ActivityUtils.removeActivity(this);
    }


}
