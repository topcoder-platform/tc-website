package com.topcoder.web.privatelabel.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

/**
 *
 * @author gpaul 06.26.2003
 */
public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize();

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.PRIVATE_LABEL_SITE);
    }

        protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        CoderSessionInfo ret = new CoderSessionInfo(request, auth, groups);
        return ret;
    }


}