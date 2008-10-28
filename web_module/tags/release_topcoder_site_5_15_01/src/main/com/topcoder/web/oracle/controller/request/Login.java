package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.tc.controller.request.authentication.EmailActivate;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;

import java.util.Arrays;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class Login  extends ShortHibernateProcessor {


    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";

    protected void dbProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));

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
                            throw new LoginException("Handle or password incorrect.");
                        }
                        char status = getStatus(sub.getUserId());
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
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
                                getAuthentication().login(new SimpleUser(0, username, password), "on".equals(rememberUser.trim().toLowerCase()));
                                return;
                            }
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, status) >= 0) {
                                log.debug("user inactive");
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
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
                    throw(new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

/*
        if (loginStatus.equals(STATUS_START)) {
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

