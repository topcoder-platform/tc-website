package com.topcoder.web.hs.controller.requests;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.model.*;

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

    /* return values */
    private String nextPage = "";
    private boolean nextPageInContext = false;

    public Base() {
    }

    public void setRequest(ServletRequest request) {
        this.request = request;
    }

    public void setAuthentication(WebAuthentication auth) {
        this.auth = auth;
    }

    /**
     * Some things we want to do for most subclassed request processors.
     * Override this to disable auth setup and adding default beans.
     */
    protected void baseProcessing() throws Exception {

        try {
            user = auth.getUser();
            hsa = new HSAuthorization(user);

        } catch(Exception e) {
            e.printStackTrace();

            /* most likely a stale cookie, so clear it out and try again */
            auth.logout();
            user = auth.getUser();
            hsa = new HSAuthorization(user);
        }

        info = new SessionInfoBean();
        request.setAttribute("SessionInfo", info);
        Set groups = ((HSAuthorization)hsa).getGroups();
        info.setAll(user, groups);

        if(!hsa.hasPermission(new ClassResource(this.getClass())))
            throw new PermissionException("You must login to view this page.");

        nav = new NavZoneBean();
        request.setAttribute("NavZone", nav);
    }

    /** Subclasses should generally do their work by implementing this method. */
    abstract protected void businessProcessing() throws Exception;

    /** This is final to discourage overriding it.  Instead subclasses should implement businessProcessing(). */
    public final void process() throws Exception {
        baseProcessing();
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
