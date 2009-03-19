package com.topcoder.web.common.controller.request.authentication;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCWebException;


public class Logout extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {
        getAuthentication().logout();
        getRequest().getSession().invalidate();

        LoginProperties props = LoginProperties.getProperties(getRequest().getContextPath());
        String nextpage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = props.getLogoutLandingURL();
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        setNextPage(nextpage);
        setIsNextPageInContext(false);
    }
}
