package com.topcoder.web.hs.controller.requests;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Contains some of the basic methods and data for request processors.
 *
 * @author Ambrose Feinstein
 */
public abstract class Base implements RequestProcessor {

    /* set by the creator */
    protected ServletRequest request;
    protected WebAuthentication auth;

    /* attached to the request */
    protected SessionInfoBean info;
    protected NavZoneBean nav;

    /* used internally */
    protected User user;
    protected Authorization hsa;
    protected static Logger log = Logger.getLogger(Base.class);
    private HashMap errors;

    /* return values */
    private String nextPage = "";
    private boolean nextPageInContext = false;

    public Base() {
        log.debug("constructing "+this.getClass().getName());
        errors = new HashMap();
    }

    public void setRequest(ServletRequest request) {
        this.request = request;
    }

    public void setAuthentication(WebAuthentication auth) {
        this.auth = auth;
    }

    /** subclasses may override this to demand a login this session */
    protected User getAuthUser() {
        return auth.getActiveUser();
    }

    /**
     * call this to send the browser a new cookie when the user updates their password;
     * probably ought to use auth.login() instead
     */
    protected void reissueCookie() {
        try {
            ((BasicAuthentication)auth).setCookie(user.getId());
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
       log.debug("entering baseProcessing");

        try {
            user = getAuthUser();
            hsa = new HSAuthorization(user);

        } catch(Exception e) {
            log.warn("problem getting User and Authorization objects, trying again as guest", e);

            /* most likely a stale cookie, so clear it out and try again */
            auth.logout();
            user = getAuthUser();
            hsa = new HSAuthorization(user);
        }
        info = new SessionInfoBean();
        request.setAttribute("SessionInfo", info);
        Set groups = ((HSAuthorization)hsa).getGroups();
        info.setAll(user, groups);

        Resource r = new ClassResource(this.getClass());
        if(!hsa.hasPermission(new ClassResource(this.getClass())))
            throw new PermissionException(user, r);

        nav = new NavZoneBean();
        request.setAttribute("NavZone", nav);
    }

    /** Subclasses should generally do their work by implementing this method. */
    abstract protected void businessProcessing() throws Exception;

    /** This is final to discourage overriding it.  Instead subclasses should implement businessProcessing(). */
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

}
