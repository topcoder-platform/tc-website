package com.topcoder.web.codinginterface.techassess.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/**
 * User: dok
 * Date: Dec 1, 2004
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
/*
        Constants.initialize();

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
*/
    }


    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        //todo maybe we check if they have an active session here
        return true;
    }




    //get request
    //instantiate appropriate processor
        //create appropriate request
        //if "request" request
            //put request on request queue
            //wait for response
            //put up waiting page and make it stay up
            //receive response
            //redirect to a "response" processor
            //respond to user
        //else if "response' request
            //lookup data by id (some kind of 1-way hash?)
            //load necessary data into request
    //forward to appropriate jsp

}
