/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.HttpObjectFactory;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;

import java.util.List;
import java.util.Set;

/**
 */
public class EventRegServlet extends BaseServlet {

    /**
     * <p>
     * Creates an instance of AgreeToTermsServlet.
     * </p>
     */
    public EventRegServlet() {
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
            String eventstr = request.getParameter("event");
            String cb = request.getParameter("cb");
            //BUGR-4218: new param
            boolean agree = false;
            String agreeStr=request.getParameter("agree");
            if (agreeStr != null)
            {
                agree = Boolean.parseBoolean(agreeStr);
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
                        return;
                    }
                }
                else
                {
                    response.getOutputStream().println(cb == null ? "<response>not logged in</response>" : cb + "({\"response\":\"not logged in\"})");
                    return;
                }
                
            }

            if (!authentication.getActiveUser().isAnonymous()){

                UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();

                long userId = authentication.getActiveUser().getId();
                long eventId = Long.parseLong(eventstr);
                long termsId = 0;
                String commandToRefresh = "";

                //For now, we force the event id.
                //3433 tco11
                // 3434 tco12
                if (eventId != 3433 && eventId!= 3434) {
                    response.getOutputStream().println(cb == null ? "<response>bad event</response>" : cb + "({\"response\":\"bad event\"})");
                    return;
                }

                // hard map for now
                if (eventId == 3433)
                {
                    termsId = 20933;
                    commandToRefresh = "tco11_registrants";
                }
                else if (eventId == 3434)
                {
                    termsId = 20933;
                    commandToRefresh = "tco12_registrants";
                }
              

                // if registered
                if (isRegistered(eventId, userId))
                { 
                    // if registered but for some reason, not agreed, we will agree here
                    if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                        userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    }
                    response.getOutputStream().println(cb == null ? "<response>already registered</response>" : cb + "({\"response\":\"already registered\"})");
                }
                 else if(agree){ //only attempt to register is agree
                    try {
                       
                        //if registered but for some reason, not agreed, we will agree here
                        if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                            userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        }
                        completeRegistration(eventId, userId, commandToRefresh);
                        
                        response.getOutputStream().println(cb == null ? "<response>success</response>" : cb + "({\"response\":\"success\"})");
                    } catch (Exception e) {
                        response.getOutputStream().println(cb == null ? "<response>bad event/terms</response>" : cb + "({\"response\":\"bad event/terms\"})");
                    }
                }else{//BUGR-4218
                    response.getOutputStream().println(cb == null ? "<response>hasn't registered</response>" : cb + "({\"response\":\"hasn't registered\"})");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request, response);
    }


   /**
     * <p>
     * Helper method to save TCO10 registration to the database.
     * After the registration is saved registrants query cache needs to be cleaned to
     * reflect the latest addition.
     * </p>
     *
     * @param event an <code>Event</code> containing TCO10 event.
     * @param user an <code>User</code> containing active user.
     */
    private void completeRegistration(long eventId, long userId, String commandToRefresh) throws Exception {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        EventDAO eventDAO = DAOUtil.getFactory().getEventDAO();
        

        Session session = HibernateUtils.getSession();
        Transaction t = session.beginTransaction();

        try
        {
            Event event = eventDAO.find(new Long(eventId));
            User user = userDAO.find(new Long(userId));

            user.addEventRegistration(event, null, true);
            userDAO.saveOrUpdate(user);

            session.flush();
            t.commit();
        }
        catch (Exception e)
        {
            t.rollback();
            throw e;
        }
        

        refreshCache(commandToRefresh);
    }

    /**
     * <p>
     * Helper method to save TCO10 registration to the database.
     * After the registration is saved registrants query cache needs to be cleaned to
     * reflect the latest addition.
     * </p>
     *
     * @param event an <code>Event</code> containing TCO10 event.
     * @param user an <code>User</code> containing active user.
     */
    private boolean isRegistered(long eventId, long userId) throws Exception{
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        EventDAO eventDAO = DAOUtil.getFactory().getEventDAO();
        
        Session session = HibernateUtils.getSession();
        Transaction t = session.beginTransaction();
    
        try
        {
            Event event = eventDAO.find(new Long(eventId));
            User user = userDAO.find(new Long(userId));

            if (user.getEventRegistration(event) != null)
            {
                t.commit();
                return true;
            }
            t.commit();
        }
        catch (Exception e)
        {
            t.rollback();
            throw e;
        }
        


        return false;
    }

    /**
     * <p>
     * Helper method to clean registrants query results from the cache to
     * reflect the latest addition.
     * </p>
     */
    private void refreshCache(String commandToRefresh) {
        try {
            if (commandToRefresh != null && !commandToRefresh.equals(""))
            {
            }
            CacheClearer.removelike(commandToRefresh);
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }
}
