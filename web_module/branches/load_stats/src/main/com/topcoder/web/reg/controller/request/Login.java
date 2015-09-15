package com.topcoder.web.reg.controller.request;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.tc.controller.request.authentication.EmailActivate;

import java.util.Arrays;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 27, 2006
 */
public class Login extends ShortHibernateProcessor {


    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void dbProcessing() throws Exception {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);

/*
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));
*/

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if ("POST".equals(getRequest().getMethod()) && username != null) {
            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a user name and a password.");

            } else {
                try {
                    try {
                        TCSubject sub = null;
                        //we need to check if they got the right user name and password before we check anything else
                        try {
                            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                            sub = login.login(username, password, DBMS.JTS_OLTP_DATASOURCE_NAME);
                            log.debug("correct user name and password");
                        } catch (Exception e) {
                            if (log.isDebugEnabled()) {
                                e.printStackTrace();
                            }
                            throw new LoginException("Handle or password incorrect.");
                        }
                        char status = getStatus(sub.getUserId());
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) >= 0) {
                            //check if they have an active email address
                            if (getEmailStatus(sub.getUserId()) != EmailActivate.ACTIVE_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage("http://" + ApplicationServer.SERVER_NAME + "/tc?module=Static&d1=authentication&d2=emailActivate");
                                setIsNextPageInContext(false);
                                return;
                            } else {
                                log.debug("user active");
                                String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
                                if (nextPage != null && !nextPage.equals("")) {
                                    setNextPage(nextPage);
                                    setIsNextPageInContext(false);
                                } else {
                                    setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
                                    setIsNextPageInContext(false);
                                }
                                log.debug("on successful login, going to " + getNextPage());
                                getAuthentication().login(new SimpleUser(0, username, password), false);
                                //clear the session for the case that they've been messing around as someone else or as no one
                                //this is basically copied from reg.controller.request.Base
                                getRequest().getSession().setAttribute(Constants.USER, null);
                                getRequest().getSession().setAttribute(Constants.REG_TYPES, null);

                                return;
                            }
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(Constants.INACTIVE_STATI, status) >= 0) {
                                log.debug("user inactive");
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(Constants.UNACTIVE_STATI, status) >= 0) {
                                log.debug("user unactive");
                                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Your account is not active.  " +
                                        "Please review the activation email that was sent to you after registration.");
                            } else {
                                throw new NavigationException("Invalid account status");
                            }
                        }

                    } catch (LoginException e) {
                        /* the login failed, so tell them what happened */
                        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                    }
                } catch (TCWebException e) {
                    throw e;
                } catch (Exception e) {
                    throw (new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

/*
        if (loginStatus.equals(WebConstants.STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
*/
        String nextpage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextpage);
        setNextPage("/login.jsp");
        setIsNextPageInContext(true);
    }


    /**
     * shouldn't use ejb slooooooooow
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getStatus().charValue();

    }

    private int getEmailStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getPrimaryEmailAddress().getStatusId().intValue();
    }


}