package com.topcoder.web.ep.controller.request;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.ep.Constants;

import java.util.Arrays;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 27, 2006
 */
public class Login extends ShortHibernateProcessor {

    public static final int ACTIVE_STATUS = 1;

    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void dbProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));


        String nextPage = determineNextPage();

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
                            if (getEmailStatus(sub.getUserId()) != ACTIVE_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage("http://" + ApplicationServer.SERVER_NAME + "/tc?module=Static&d1=authentication&d2=emailActivate");
                                setIsNextPageInContext(false);
                                return;
                            } else {
                                log.debug("user active");

                                setNextPage(nextPage);
                                setIsNextPageInContext(false);

                                log.debug("on successful login, going to " + getNextPage());
                                getAuthentication().login(new SimpleUser(0, username, password), "on".equals(rememberUser.trim().toLowerCase()));
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
                    throw(new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        setNextPage("/login.jsp");
        setIsNextPageInContext(true);
    }

    private String determineNextPage() {
        String nextPage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextPage == null) {
            nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        } else {
            log.debug("next page from attribute");
        }
        if (nextPage == null) {
            nextPage = getRequest().getHeader("Referer");
        } else {
            log.debug("next page from parameter");
        }
        if (nextPage == null) {
            nextPage = getSessionInfo().getAbsoluteServletPath();
        } else {
            log.debug("next page from referer header");
        }
        if (nextPage != null) {
            log.debug("next page from session info");
        }
        return nextPage;
    }

    private char getStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getStatus().charValue();
    }

    private int getEmailStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getPrimaryEmailAddress().getStatusId().intValue();
    }

}
