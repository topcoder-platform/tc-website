package com.topcoder.web.common;

import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

public abstract class BaseProcessor implements RequestProcessor{

    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    /* set by the creator */
    protected ServletRequest request;
    protected WebAuthentication auth;

    /* return values */
    private String nextPage = "";
    private boolean nextPageInContext = false;

    public BaseProcessor() {
        log.debug("constructing " + this.getClass().getName());
    }

    public void setRequest(ServletRequest request) {
        this.request = request;
    }

    public void setAuthentication(WebAuthentication auth) {
        this.auth = auth;
    }

    /**
     *  subclasses may override this to demand a login this session
     * @return
     */
    protected User getUser() {
        return auth.getActiveUser();
    }

    /**
     * call this to send the browser a new cookie when the user updates their password;
     * probably ought to use auth.login() instead
     */
    protected void reissueCookie() {
        try {
            ((BasicAuthentication)auth).setCookie(getUser().getId());
        } catch(Exception e) {
            /* this should not happen, but is not a big deal if it does... they just have to login again later */
            log.warn("caught exception reissuing cookie", e);
        }
    }

    /**
     * Some things we want to do for most subclassed request processors.
     * Override this to disable auth setup and adding default beans.
     */
    protected void baseProcessing() throws Exception {
    }

    /**
     * Subclasses should do their work by implementing this method.
     */
    abstract protected void businessProcessing() throws Exception;

    /**
     * This is final to discourage overriding it.  Instead subclasses should implement businessProcessing().
     */
    public final void process() throws Exception {
        baseProcessing();
        log.debug("calling businessProcessing");
        businessProcessing();
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
     */
    protected void setNextPage(String page) {
        if(page.equals(""))
            page = ((HttpServletRequest)request).getContextPath()+((HttpServletRequest)request).getServletPath();
        nextPage = page;
    }

    /** False if a redirect is necessary, ie you need the URL in the browser to change.  True otherwise. */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }
}
