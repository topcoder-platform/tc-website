package com.topcoder.web.tc.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize(config);

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    /**
     * override to make us backward compatible with the old login stuff
     * @param request
     * @param response
     * @param info
     * @throws Exception
     */
    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {

        StringBuffer buf = new StringBuffer(200);
        buf.append("http://");
        buf.append(info.getServerName());
        buf.append("/?t=authentication&c=login&errorMsg=");
        buf.append("In order to continue, you must provide your user name and password.&errorURL=");
        buf.append(info.getRequestString());

        fetchRegularPage(request, response, buf.toString(), false);
    }
}