package com.topcoder.web.common;

import javax.servlet.*;

/**
 * Classes that implement RequestProcessor should contain the
 * business logic to process a request from a servlet controller.
 *
 * Call {@link #setRequest(javax.servlet.ServletRequest)} and {@link #setResponse(javax.servlet.ServletResponse)} first,
 * then {@link #process()} to process the request, and finally the accessor methods to see the result.
 *
 * @author Ambrose Feinstein
 */
public interface RequestProcessor {

    public void setRequest(ServletRequest sr);
    public void setResponse(ServletResponse sr);

    public void process() throws Exception;

    /**
     * if the next page is outside the context of our particular application, it will
     * likely have to be handled differently.
     */
    public boolean isNextPageInContext();

    public String getNextPage();
}
