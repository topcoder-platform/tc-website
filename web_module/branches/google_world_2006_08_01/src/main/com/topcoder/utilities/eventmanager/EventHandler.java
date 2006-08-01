package com.topcoder.utilities.eventmanager;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public interface EventHandler {
    void process(long userId) throws Exception;
}
