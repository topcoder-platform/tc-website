package com.topcoder.web.common;

import javax.servlet.*;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * Classes that implement RequestProcessor should contain the
 * business logic to process a request from a servlet controller.
 *
 * Call {@link #setRequest(javax.servlet.ServletRequest)}
 * and {@link #setAuthentication(com.topcoder.web.common.security.WebAuthentication)}
 * first, then {@link #process()} to process the request, and finally use
 * the accessor methods to see the result.
 *
 * @author Ambrose Feinstein
 */
public interface RequestProcessor {

    public void setRequest(ServletRequest sr);
    public void setAuthentication(WebAuthentication sr);

    /** entry point from the controller */
    public void process() throws Exception;

    /**
     * if the next page is outside the context of our particular application, it will
     * likely have to be handled differently.
     */
    public boolean isNextPageInContext();

    /** where the controller should go next, to render this request */
    public String getNextPage();
}
