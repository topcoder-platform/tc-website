package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.web.hs.model.*;

/**
 * Contains some of the basic methods and data for request processors.
 *
 * @author Ambrose Feinstein
 */
public abstract class Base implements RequestProcessor {

    protected ServletRequest request;
    private boolean nextPageInContext;
    private String nextPage;

    public Base() {
        nextPage = null;
        nextPageInContext = false;
    }

    public void setRequest(ServletRequest sr) {
        request = sr;
    }

    protected void buildSessionInfo() {
        SessionInfoBean si = new SessionInfoBean();
        try {
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
       sr.setAttribute("SessionInfo", si);
    }

    public abstract void process();

    public String getNextPage() {
        return nextPage;
    }

    public boolean isNextPageInContext() {
        return nextPageInContext;
    }

    protected void setNextPage(String page) {
        nextPage = page;
    }

    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }
}
