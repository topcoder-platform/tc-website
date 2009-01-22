package com.topcoder.web.corp.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.corp.Constants;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;


public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    /**
     * Initializes the servlet. Primary goal is to set up application context
     * variables and constants.
     *
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(config);
    }

    /*protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.CORP_SITE);
    }*/

}