package com.topcoder.web.common;

import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.HashMap;

public abstract class BaseProcessor implements RequestProcessor {

    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    /* set by the creator */
    protected ServletRequest request;
    protected WebAuthentication auth;

    private InitialContext ctx;
    private HashMap errors;

    /* return values */
    private String nextPage = "";
    private boolean nextPageInContext = false;

    public BaseProcessor() {
        log.debug("constructing " + this.getClass().getName());
        errors = new HashMap();
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
            ((BasicAuthentication) auth).setCookie(getUser().getId());
        } catch (Exception e) {
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
        try {
            baseProcessing();
            log.debug("calling businessProcessing");
            businessProcessing();
        } finally {
            try {
                if (ctx != null) {
                    ctx.close();
                }
            } catch (Exception e) {
                log.error("Couldn't close context");
                e.printStackTrace();
            }
        }
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
        if (page == null || page.equals(""))
            page = ((HttpServletRequest) request).getContextPath() + ((HttpServletRequest) request).getServletPath();
        nextPage = page;
    }

    /** False if a redirect is necessary, ie you need the URL
     * in the browser to change.  True otherwise.
     */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }

    /**
     * Returns true iff the user has an active logged in session.
     * @return
     */
    protected boolean userLoggedIn() {
        return !auth.getUser().isAnonymous();
    }

    /**
     * Returns true iff we can identify the user.  Basically, if the user
     * has a cookie, or an active logged in session.
     * @return
     */
    protected boolean userIdentified() {
        return !auth.getActiveUser().isAnonymous();
    }

    protected InitialContext getInitialContext() throws NamingException {
        if (ctx == null) {
            ctx = new InitialContext();
        }
        return ctx;
    }

    protected void addError(String key, Object error) {
        if (!hasError(key)) {
            errors.put(key, error);
        }
    }

    public String getError(String key) {
        if (errors.containsKey(key) && errors.get(key) != null) {
            return errors.get(key).toString();
        }
        return "";
    }

    public boolean hasError(String key) {
        return errors.containsKey(key);
    }

    protected void removeError(String key) {
        if (hasError(key)) {
            errors.remove(key);
        }
    }

    protected void clearErrors() {
        errors.clear();
    }

    protected boolean hasErrors() {
        return !errors.isEmpty();
    }

    /* some utility methods */

    protected boolean isEmpty(String s) {
        return !(s != null && s.trim().length() > 0);
    }

    protected String checkNull(String s) {
        return s == null ? "" : s;
    }

}

