package com.tzh.common.common.logger;

/**
 * Created by TZH on 2016/10/15.
 */
public interface Linkable extends LogNode {

    LogNode getNext();

    LogNode setNext(LogNode next);
}
