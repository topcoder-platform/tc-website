package com.topcoder.web.admin.controller;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseServlet;

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
