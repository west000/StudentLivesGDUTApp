package com.tzh.common.common.logger;

/**
 * Created by TZH on 2016/10/15.
 */
public abstract class LinkableLogNode implements Linkable, LogNode {

    // For piping:  The next node to receive Log data after this one has done its work.
    private LogNode mNext;

    @Override
    public void println(int priority, String tag, String msg, Throwable tr) {
        // Default notifySend the message to the next node.
        if (mNext != null) {
            mNext.println(priority, tag, msg, tr);
        }
    }

    /**
     * Returns the next LogNode in the chain.
     */
    public LogNode getNext() {
        return mNext;
    }

    /**
     * Sets the LogNode data will be sent to..
     */
    public LogNode setNext(LogNode next) {
        return mNext = next;
    }
}
