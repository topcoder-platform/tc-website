package com.topcoder.web.distui.controller.request;

import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2007
 */
abstract class Base implements RequestProcessor {
    private TCRequest request;
    private TCResponse response;

    private String nextPage = "";
    private boolean nextPageInContext = false;

    public void setRequest(TCRequest sr) {
        this.request = sr;
    }

    public void setAuthentication(WebAuthentication sr) {
        throw new RuntimeException("We don't support this method right now");
    }

    public void postProcessing() throws Exception {
    }

    public Object getError(String key) {
        return null;
    }

    public boolean hasError(String key) {
        return false;
    }

    public void setResponse(TCResponse r) {
        this.response = r;
    }

    protected TCRequest getRequest() {
        return request;
    }

    protected TCResponse getResponse() {
        return response;
    }

    public String getNextPage() {
        return nextPage;
    }

    public boolean isNextPageInContext() {
        return nextPageInContext;
    }

    /**
     * Call this to let the controller know where to go next.
     * An empty string is magical, and means the same servlet with an empty query.
     *
     * @param page the page (url)
     */
    protected void setNextPage(String page) {
        if (page == null || page.equals(""))
            page = request.getContextPath() + request.getServletPath();
        nextPage = page;
    }

    /**
     * False if a redirect is necessary, ie you need the URL
     * in the browser to change.  True otherwise.
     *
     * @param flag true for forward, false for redirect
     */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }


}
