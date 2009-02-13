package com.topcoder.web.screening.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletConfig;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.screening.common.*;
import com.topcoder.web.screening.common.Constants;

/**
 * This class handles all incoming requests.
 * Utilizes similar methods and format to Controller in com.topcoder.web.query.
 * rehashed from Greg Paul with permission.
 *
 * @author Nathaniel Dean
 *
 */

public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    /**
     * Init() is run the moment that the servlet is loaded into the web server.
     * Initializes the static variables.
     *
     * @throws ServletException
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
            throw new ServletException(e.getMessage());
        }
    }

}
