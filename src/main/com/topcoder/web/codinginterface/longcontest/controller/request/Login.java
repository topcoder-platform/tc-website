package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;

import java.util.Arrays;

/**
 * Logs the user into the long contest system
 *
 * @author farsight
 */
public class Login extends Base {

    public static final String USER_ID = "userid";
    public static final String REMEMBER_USER = "rem";

    protected void longContestProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(Constants.KEY_USER_HANDLE);
        String password = getRequest().getParameter(Constants.KEY_USER_PASS);
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(WebConstants.STATUS));
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));


        // if not null, we got here via a form submit;
        // otherwise, skip this and just draw the login form
        //
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a handle and a password.");

            } else {
                try {
                    try {
                        TCSubject sub;
                        //we need to check if they got the right user name and password before we check anything else
                        try {
                            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                            sub = login.login(username, password);
                            log.debug("correct user name and password");
                        } catch (Exception e) {
                            throw new LoginException("Handle or password incorrect.");
                        }
                        char status = getStatus(sub.getUserId());
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
                            //check if they have an active email address
                            if (getEmailStatus(sub.getUserId()) != WebConstants.EMAIL_ACTIVE_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage(Constants.EMAIL_ACTIVATE);
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
                                getAuthentication().login(new SimpleUser(0, username, password), rememberUser.trim().toLowerCase().equals("on"));
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

        if (loginStatus.equals(WebConstants.STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");

        }

        String nextpage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextpage);
        setNextPage(Constants.LOGIN_JSP);
        setIsNextPageInContext(true);
    }


    /**
     * Gets the status for the user
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        char result;
        User user = (User) createEJB(getInitialContext(), User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }

    /**
     * Gets the e-mail status for the user
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private int getEmailStatus(long userId) throws Exception {
        int result;
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }

}
