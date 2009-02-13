package com.topcoder.web.reg.controller;

import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionEvent;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public class TestSessionListener implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        Thread.dumpStack();
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        Thread.dumpStack();
    }
}
