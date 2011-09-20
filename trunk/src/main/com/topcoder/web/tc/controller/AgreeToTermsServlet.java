/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.HttpObjectFactory;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Notification;

import java.util.List;
import java.util.Set;

/**
 */
public class AgreeToTermsServlet extends BaseServlet {

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
            //BUGR-4218: new param
            boolean agree = false;
            String agreeStr=request.getParameter("agree");
            if (agreeStr != null)
            {
                agree = Boolean.parseBoolean(agreeStr);
            }
            
            //BUGR-4262: new param
            boolean notify = true;
            String notifyStr=request.getParameter("notify");
            if(notifyStr != null) 
            { 
                notify = Boolean.parseBoolean(notifyStr);
            }

            //BUGR-4218: check logged in user
            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication = createAuthentication(tcRequest, tcResponse);

            // if user not logged in
            if(authentication.getActiveUser().isAnonymous()){
                if (handle != null && !handle.equals("")
                     && password != null && !password.equals(""))
                {
                    try {
                        //BUGR-4262
                        authentication.login(new SimpleUser(0, handle, password),false);
                    } catch (LoginException e) {
                        response.getOutputStream().println(cb == null ? "<response>bad login</response>" : cb + "({\"response\":\"bad login\"})");
                    }
                }
                else
                {
                    response.getOutputStream().println(cb == null ? "<response>not logged in</response>" : cb + "({\"response\":\"not logged in\"})");
                    return;
                }
                
            }
            if (!authentication.getActiveUser().isAnonymous()){

                long userId = authentication.getActiveUser().getId();
                long termsId = Long.parseLong(terms);

                //For now, we force the terms id.
                //20873 PayPal
                //20883 Alcatel-Lucent
                // 20903 DARPA
                // 20923 BBM
                if ((termsId != 20873) && (termsId != 20883) && (termsId != 20903) && (termsId != 20923)) throw new RuntimeException("bad terms");

                UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
                if (userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                    // already joined
                    //BUGR-4262
                    if ((termsId==20873))
                    {
                        notify(tcRequest,tcResponse,authentication,notify, 15);
                    } 
                    else if(termsId==20903)
                    {
                         notify(tcRequest,tcResponse,authentication,notify, 16);
                    }
                    else if(termsId==20923)
                    {
                         notify(tcRequest,tcResponse,authentication,notify, 17);
                    }
                    response.getOutputStream().println(cb == null ? "<response>already agreed</response>" : cb + "({\"response\":\"already agreed\"})");
                } else if(agree){ //BUGR-4218: only attempt to agree to the terms if agree=true
                    try {
                        userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        // success
                        //BUGR-4262
                        if ((termsId==20873))
                        {
                            notify(tcRequest,tcResponse,authentication,notify, 15);
                        } 
                        else if(termsId==20903)
                        {
                             notify(tcRequest,tcResponse,authentication,notify, 16);
                        }
                        else if(termsId==20923)
                        {
                             notify(tcRequest,tcResponse,authentication,notify, 17);
                        }
                        response.getOutputStream().println(cb == null ? "<response>success</response>" : cb + "({\"response\":\"success\"})");
                    } catch (Exception e) {
                        response.getOutputStream().println(cb == null ? "<response>bad terms</response>" : cb + "({\"response\":\"bad terms\"})");
                    }
                }else{//BUGR-4218
                    response.getOutputStream().println(cb == null ? "<response>hasn't agreed</response>" : cb + "({\"response\":\"hasn't agreed\"})");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request, response);
    }


    //BUGR-4262
    private void notify(TCRequest tcRequest, TCResponse tcResponse, WebAuthentication authentication, final boolean notify, final long notificationId) throws Exception {
        RequestProcessor rp = new ShortHibernateProcessor() {
            protected void dbProcessing() throws Exception {
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                List<Notification> notifications = (List<Notification>) DAOUtil.getFactory().getNotificationDAO().getNotifications(u.getRegistrationTypes());
                Set<Notification> userNotifications = (Set<Notification>) u.getNotifications();
                for (Notification n : notifications) {
                    if (n.getId() == notificationId) {
                        if (!userNotifications.contains(n) && notify) {
                            u.addNotification(n);
                        }
                        break;
                    }
                }
                DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
            }
        };
        rp.setRequest(tcRequest);
        rp.setResponse(tcResponse);
        rp.setAuthentication(authentication);
        rp.process();
        rp.postProcessing();
    }
}
