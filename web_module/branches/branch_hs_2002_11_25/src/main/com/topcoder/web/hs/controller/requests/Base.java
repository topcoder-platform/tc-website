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
    protected User user;
    protected HSAuthorization hsa;
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
        si.setUserId(user.getId());
        si.setHandle(user.getUserName());
        si.setGroup(user.getId()==0 ? 'A' : 'S');  //@@@
        si.setRating(2500);  //@@@
        request.setAttribute("SessionInfo", si);
    }

    /** Some things we want to do for all subclassed request processors. */
    protected void baseProcessing() throws Exception {

        Persistor persistor = new SessionPersistor(((HttpServletRequest)request).getSession());
        auth = new BasicAuthentication(persistor, request, response);
        user = auth.getUser();

        hsa = new HSAuthorization(user);
        if(!hsa.hasPermission(new SimpleResource(this.getClass().getName())))
            throw new RuntimeException("@@@ use authexception");

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
