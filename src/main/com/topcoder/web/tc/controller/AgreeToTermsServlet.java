/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.shared.util.DBMS;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.security.Constants;
import com.topcoder.security.login.AuthenticationException;

/**
 */
public class AgreeToTermsServlet extends HttpServlet {

    /**
     * <p>
     * Creates an instance of AgreeToTermsServlet.
     * </p>
     */
    public AgreeToTermsServlet() {
    }

    /**
     * <p>
     * Initializes the servlet with use of the given servlet configuration.
     * </p>
     * @param servletConfig the servlet configuration object to be used
     * @throws IllegalArgumentException if servletConfig is null
     * @throws ServletException if some error occurred when initializing this
     *             class using the given configuration
     */
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
    }

    /**
     * <p>
     * Processes the POST request sent by the client to the server.
     * </p>
     * @throws IllegalArgumentException if any argument is null
     * @param response the HttpServletResponse object that contains the
     *            response the servlet sends to the client
     * @param request the HttpServletRequest object that contains the
     *            request the client has send to the servlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String handle = request.getParameter("handle");
            String password = request.getParameter("password");
            String terms = request.getParameter("terms");
            String cb = request.getParameter("cb");

            TCSubject tcSubject = authenticate(handle, password);

            if (tcSubject == null) {
                response.getOutputStream().println(cb == null ? "<response>bad login</response>" : cb + "({\"response\":\"bad login\"})");
            } else {

                long userId = tcSubject.getUserId();
                //long termsId = Long.parseLong(terms);
                //For now, we hardcode the terms id.
                long termsId = 20873;

                UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
                if (userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                    // already joined
                    response.getOutputStream().println(cb == null ? "<response>already agreed</response>" : cb + "({\"response\":\"already agreed\"})");
                } else {
                    try {
                        userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        // success
                        response.getOutputStream().println(cb == null ? "<response>success</response>" : cb + "({\"response\":\"success\"})");
                    } catch (Exception e) {
                        response.getOutputStream().println(cb == null ? "<response>bad terms</response>" : cb + "({\"response\":\"bad terms\"})");
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request, response);
    }

    private TCSubject authenticate(final String userName, final String password) {
        TCSubject ret = null;
        try {
            LoginLocal login = (LoginLocal) Constants.createLocalEJB(LoginLocal.class);
            ret = login.login(userName, password);
        } catch (AuthenticationException e){
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return ret;
    }
}

