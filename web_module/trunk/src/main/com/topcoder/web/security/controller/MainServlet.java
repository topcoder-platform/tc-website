package com.topcoder.web.security.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.security.Constants;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;


public class MainServlet extends BaseServlet {
    /**
     * Initializes the servlet.
     * @throws javax.servlet.ServletException
     */
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(config);
    }
}
