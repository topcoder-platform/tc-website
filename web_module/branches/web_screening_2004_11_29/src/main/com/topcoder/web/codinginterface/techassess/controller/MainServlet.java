package com.topcoder.web.codinginterface.techassess.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.security.Resource;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import java.rmi.RemoteException;

/**
 * User: dok
 * Date: Dec 1, 2004
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        log.debug("loading up the techassess servlet");
        super.init(config);
/*
        Constants.initialize();

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
*/
        try {
            InitialContext ctx = new InitialContext();
            log.debug(ctx.getEnvironment().toString());
            log.debug(TCContext.getInitial().getEnvironment().toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        //todo maybe we check if they have an active session here
        return true;
    }


    protected TCSubject getUser(long id) throws Exception {
        //todo speed this up, we probably need to cache here
        TCSubject user = null;
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
        user = pmgr.getUserSubject(id);
        return user;
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
