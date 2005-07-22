package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.ApplicationServer;

import java.util.Arrays;

public class Login extends Base {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        // hack would be to parse out server name from //.../ in next page
        // find server name from sessionInfo
        SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));
        log.debug("rememberUser: " + rememberUser);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a handle and a password.");

            } else {
                try {
                    try {
                        long userId = getUserId(username);
                        if (userId < 0)
                            throw new LoginException("Incorrect handle.");
                        char status = getStatus(userId);
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(Activate.ACTIVE_STATI, status) > 0) {
                            if (getEmailStatus(userId) != EmailActivate.ACTIVE_STATUS) {
                                getAuthentication().logout();
                                log.debug("inactive email");
                                setNextPage(Constants.EMAIL_ACTIVATE);
                                setIsNextPageInContext(true);
                                return;
                            } else {
                                log.debug("user active");
                                String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
                                String forumsURL = "http://"+ApplicationServer.FORUMS_SERVER_NAME;
                                
                                //todo make this https
                                SiteTest siteTest = new SiteTest();
                                boolean forumsServerActive = siteTest.check(forumsURL);
                                if (forumsServerActive) {
                                    StringBuffer nextPage = new StringBuffer(forumsURL).append("/?module=Login");
                                    nextPage.append("&").append(USER_NAME).append("=").append(username);
                                    nextPage.append("&").append(PASSWORD).append("=").append(((BasicAuthentication)getAuthentication()).hashPassword(password));
                                    if (!rememberUser.equals("")) {
                                        nextPage.append("&").append(REMEMBER_USER).append("=").append(rememberUser);
                                    }
                                    nextPage.append("&").append(BaseServlet.NEXT_PAGE_KEY).append("=").append(dest);
                                    setNextPage(nextPage.toString());
                                } else {
                                    if (dest.startsWith(forumsURL)) {
                                        dest = "http://"+ApplicationServer.SERVER_NAME+"/tc";
                                    }
                                    setNextPage(dest);
                                }
                                
                                setIsNextPageInContext(false);
                                log.debug("on successful login, going to " + getNextPage());
                                getAuthentication().login(new SimpleUser(0, username, password), rememberUser.trim().toLowerCase().equals("on"));
                                doLegacyCrap(getRequest());
                                return;
                            }
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(Activate.INACTIVE_STATI, status) > 0) {
                                log.debug("user inactive");
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(Activate.UNACTIVE_STATI, status) > 0) {
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

        if (loginStatus.equals(STATUS_START)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name and password.");
        }
        int nextPageIdx = info.getRequestString().indexOf("nextpage=");
        if (nextPageIdx != -1) {
            String nextPage = info.getRequestString().substring(nextPageIdx+"nextpage=".length());
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        }
        setNextPage(Constants.LOGIN);
        setIsNextPageInContext(true);
    }


    /**
     * shouldn't use ejb slooooooooow
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

    private void doLegacyCrap(TCRequest request) throws Exception {
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote)
                com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
        TCSubject user = pmgr.getUserSubject(getAuthentication().getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
        Navigation nav = (Navigation) request.getSession(true).getAttribute("navigation");
        if (nav == null) {
            nav = new Navigation(request, ret);
            request.getSession(true).setAttribute("navigation", nav);
        } else {
            nav.setCoderSessionInfo(ret);
        }
    }

    private long getUserId(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_id_using_handle");
        r.setProperty("ha", handle);
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("user_id");
        if (rsc.isEmpty())
            return -1;
        else
            return rsc.getLongItem(0, "user_id");
    }

}
