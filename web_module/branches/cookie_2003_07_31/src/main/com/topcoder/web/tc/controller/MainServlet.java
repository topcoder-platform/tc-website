package com.topcoder.web.tc.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;
import com.topcoder.common.web.data.Navigation;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.Set;

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

    protected SessionInfo createSessionInfo(HttpServletRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        CoderSessionInfo ret = null;
        if (nav == null) {
            ret = new CoderSessionInfo(request, auth, groups);
            nav = new Navigation(request, ret);
            request.getSession(true).setAttribute("navigation", nav);
        } else {
            ret = nav.getSessionInfo();
        }
        return ret;
    }
}