package com.topcoder.web.common;

import com.topcoder.web.common.security.WebAuthentication;

/**
 * Classes that implement RequestProcessor should contain the
 * business logic to process a request from a servlet controller.
 * <p/>
 * Call {@link #setRequest(TCRequest)}
 * and {@link #setAuthentication(com.topcoder.web.common.security.WebAuthentication)}
 * first, then {@link #process()} to process the request, and finally use
 * the accessor methods to see the result.
 *
 * @author Ambrose Feinstein
 */
public interface RequestProcessor {

    void setRequest(TCRequest sr);

    void setAuthentication(WebAuthentication sr);

    /**
     * entry point from the controller
     */
    void process() throws Exception;

    /**
     * this method is called after the request has been
     * forwarded/redirected or the response has been commited.
     * it can be used to clean up any resources that might need to be available
     * to the front end.
     *
     * @throws Exception
     */
    void postProcessing() throws Exception;

    /**
     * This method is called if there was an error during forwarding/redirecting.
	 * It can be used to rollback all changes and clean up any allocated resources.
     *
     */
    void rollback();

    /**
     * if the next page is outside the context of our particular application, it will
     * likely have to be handled differently.
     */
    boolean isNextPageInContext();

    /**
     * where the controller should go next, to render this request
     */
    String getNextPage();

    Object getError(String key);

    boolean hasError(String key);

    void setResponse(TCResponse r);

}
