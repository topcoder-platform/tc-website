package com.topcoder.web.common;

import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * Classes that implement RequestProcessor should contain the
 * business logic to process a request from a servlet controller.
 *
 * Call {@link #setRequest(javax.servlet.http.HttpServletRequest)}
 * and {@link #setAuthentication(com.topcoder.web.common.security.WebAuthentication)}
 * first, then {@link #process()} to process the request, and finally use
 * the accessor methods to see the result.
 *
 * @author Ambrose Feinstein
 */
public interface RequestProcessor {

    void setRequest(HttpServletRequest sr);

    void setAuthentication(WebAuthentication sr);

    /** entry point from the controller */
    void process() throws Exception;

    /**
     * if the next page is outside the context of our particular application, it will
     * likely have to be handled differently.
     */
    boolean isNextPageInContext();

    /** where the controller should go next, to render this request */
    String getNextPage();

    Object getError(String key);

    boolean hasError(String key);

}
