package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 * contains some of the basic methods and data for request processors
 */
public abstract class Base implements RequestProcessor {

    protected ServletRequest request;
    private boolean nextPageInContext;
    private String nextPage;

    public Base() {
        nextPage = null;
        nextPageInContext = false;
    }

    public void setRequest(ServletRequest sr) {
        request = sr;
    }

    public abstract void process();

    public String getNextPage() {
        return nextPage;
    }

    public boolean isNextPageInContext() {
        return nextPageInContext;
    }

    protected void setNextPage(String page) {
        nextPage = page;
    }

    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }
}
