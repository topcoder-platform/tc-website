package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.web.common.RequestProcessor;

/**
 * Contains some of the basic methods and data for request processors.
 *
 * @author Ambrose Feinstein
 */
public abstract class Base implements RequestProcessor {

    /* set by the creator */
    protected ServletRequest request;
    protected ServletResponse response;

    /* attached to the request */
    protected SessionInfoBean info;
    protected NavZoneBean nav;

    /* used internally */
    protected WebAuthentication auth;
    protected User user;
    protected Authorization hsa;

    /* return values */
    private boolean nextPageInContext = false;
    private String nextPage = "";

    public Base() {
    }

    public void setRequest(ServletRequest sr) {
        request = sr;
    }

    public void setResponse(ServletResponse sr) {
        response = sr;
    }

    protected boolean isUserGuest() {
      return user.getId() == -1;  // hardcoded userid for anonymous user
    }

    protected void addBeans() {
        info = new SessionInfoBean();
        info.setUserId((int)user.getId());
        info.setHandle(isUserGuest() ? "" : user.getUserName());
        info.setGroup(isUserGuest() ? 'G' : 'S');  //@@@
        info.setRating(2500);  //@@@

        nav = new NavZoneBean();

        request.setAttribute("SessionInfo", info);
        request.setAttribute("NavZone", nav);
    }

    /** Some things we want to do for all subclassed request processors. */
    protected void baseProcessing() throws Exception {

        Persistor persistor = new SessionPersistor(((HttpServletRequest)request).getSession());
        auth = new BasicAuthentication(persistor, request, response);
        user = auth.getUser();

        hsa = new HSAuthorization(user);
        if(!hsa.hasPermission(new ClassResource(this.getClass())))
            throw new PermissionException("You must login to view this page.");

        addBeans();
    }

    /** Override this to specialize. */
    protected void businessProcessing() throws Exception {
    }

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
