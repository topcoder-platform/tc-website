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

    protected ServletRequest request;
    protected ServletResponse response;
    protected BasicAuthentication auth;
    private boolean nextPageInContext = false;
    private String nextPage = null;

    public Base() {
    }

    public void setRequest(ServletRequest sr) {
        request = sr;
    }

    public void setResponse(ServletResponse sr) {
        response = sr;
    }

    protected void buildSessionInfo() {
        SessionInfoBean si = new SessionInfoBean();
        try { //@@@  this needs to come from calling auth.getUser instead
            String p;
            p = request.getParameter("handle");
            if(p!=null) si.setHandle(p);
            p = request.getParameter("userid");
            if(p!=null) si.setUserId(Integer.parseInt(p));
            p = request.getParameter("group");
            if(p!=null) si.setGroup(p.charAt(0));
            p = request.getParameter("rating");
            if(p!=null) si.setRating(Integer.parseInt(p));
       } catch(Exception e) { e.printStackTrace(); }
       request.setAttribute("SessionInfo", si);
    }

    /** Some things we want to do for all subclassed request processors. */
    protected void baseProcessing() {
        Persistor persistor = new SessionPersistor(((HttpServletRequest)request).getSession());
        auth = new BasicAuthentication(persistor, request, response);
        buildSessionInfo();
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

    /** Call this to let the controller know where to go next. */
    protected void setNextPage(String page) {
        nextPage = page;
    }

    /** False if a redirect is necessary, ie you need the URL in the browser to change.  True otherwise. */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }
}
