package com.tzh.common.common.logger;

/**
 * Created by TZH on 2016/10/15.
 */

public class PriorityLogFilter extends LinkableLogNode {

    /**
     * The minimum priority to print.
     */
    private int mPriority;

    public PriorityLogFilter(int priority) {
        mPriority = priority;
    }

    @Override
    public void println(int priority, String tag, String msg, Throwable tr) {
        if (priority >= mPriority) {
            super.println(priority, tag, msg, tr);
        }
    }
}
