package com.topcoder.web.corp.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.corp.common.*;
import com.topcoder.web.corp.common.Constants;

/**
 * This class handles all incoming requests.
 * Utilizes similar methods and format to Controller in com.topcoder.web.query.
 * rehashed from Greg Paul with permission.
 *
 * @author Nathaniel Dean
 *
 */

public class ScreeningServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(ScreeningServlet.class);

    /**
     * Init() is run the moment that the servlet is loaded into the web server.
     * Initializes the static variables.
     *
     * @throws javax.servlet.ServletException
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize(config);

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");

        //initialize data types for problem component factory
        try {
            Data.initializeDataTypes();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e.getMessage());
        }
    }

    protected WebAuthentication createAuthentication(HttpServletRequest request,
                                                     HttpServletResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.CORP_SITE);
    }

}
