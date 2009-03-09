package com.topcoder.web.common.controller.request.authentication;

import java.util.Arrays;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;

public class Login extends BaseProcessor {
    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";
    public static final String STATUS = "status";

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        // hack would be to parse out server name from //.../ in next page
        // find server name from sessionInfo
        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));
        if (log.isDebugEnabled()) {
            log.debug("rememberUser: " + rememberUser);
        }

        LoginProperties loginProperties = LoginProperties.getProperties(getRequest().getContextPath());
        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {
            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a username and a password.");
            } else {
                try {
                    try {
                        TCSubject sub = null;
                        //we need to check if they got the right user name and password before we check anything else
                        try {
                            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                            sub = login.login(username, password);
                            if (log.isDebugEnabled()) {
                                log.debug("correct user name and password");
                            }
                        } catch (Exception e) {
                            if (log.isDebugEnabled()) {
                                log.debug("Username or password failed", e);
                            }
                            throw new LoginException("Username or password incorrect.");
                        }
                        char status = getStatus(sub.getUserId());
                        if (log.isDebugEnabled()) {
                            log.debug("status: " + status);
                        }
                        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0)  {
                            //check if they have an active email address
                            if (getEmailStatus(sub.getUserId()) != WebConstants.ACTIVE_EMAIL_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage(loginProperties.getEmailActivationURL());
                                setIsNextPageInContext(true);
                                return;
                            } else {
                                log.debug("user active");
                                 String dest = determineNextPage();
                                setNextPage(dest);
                                setIsNextPageInContext(false);
                                if (log.isDebugEnabled()) {
                                    log.debug("on successful login, going to " + getNextPage());
                                }
                                getAuthentication().login(new SimpleUser(0, username, password), rememberUser.trim().toLowerCase().equals("on"));
                                return;
                            }
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, status) >= 0) {
                                if (log.isDebugEnabled()) {
                                    log.debug("user inactive");
                                }
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
                                if (log.isDebugEnabled()) {
                                    log.debug("user unactive");
                                }
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

        if (loginStatus.equals(WebConstants.STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
        int nextPageIdx = info.getRequestString().indexOf("nextpage=");
        if (nextPageIdx != -1) {
            String nextPage = info.getRequestString().substring(nextPageIdx + "nextpage=".length());
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        }
        setNextPage(loginProperties.getLoginPage());
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
        char result;
        User user = (User) createEJB(getInitialContext(), User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }

    private int getEmailStatus(long userId) throws Exception {
        int result;
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;
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

}
