package com.topcoder.web.corp.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.common.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.ServletConfig;


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

}