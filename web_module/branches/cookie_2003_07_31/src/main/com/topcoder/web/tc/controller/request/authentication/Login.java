package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.util.DBMS;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.servlet.http.HttpServletRequest;
import javax.naming.InitialContext;
import java.util.Arrays;

public class Login extends Base {



    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a username and a password.");

            } else {
                try {
                    try {

                        getAuthentication().login(new SimpleUser(0, username, password));

                        char status = getStatus(getAuthentication().getUser().getId());
                        log.debug("status: " + status);
                        if (Arrays.binarySearch(Activate.ACTIVE_STATI, status)>0) {
                            log.debug("user active");
                            String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
                            setNextPage(dest);
                            setIsNextPageInContext(false);
                            doLegacyCrap(getRequest());
                            return;
                        } else {
                            getAuthentication().logout();
                            if (Arrays.binarySearch(Activate.INACTIVE_STATI, status)>0) {
                                log.debug("user inactive");
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (Arrays.binarySearch(Activate.UNACTIVE_STATI, status)>0) {
                                log.debug("user unactive");
                                setNextPage(Constants.UNACTIVE);
                                setIsNextPageInContext(false);
                                return;
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

        setNextPage(Constants.LOGIN);
        setIsNextPageInContext(true);
    }




    /**
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        char result;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            User user = (User)createEJB(ctx, User.class);
            result = user.getStatus(userId, DBMS.OLTP_DATASOURCE_NAME);
        } finally {
            close(ctx);
        }
        return result;

    }

    private void doLegacyCrap(HttpServletRequest request) throws Exception {
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote)
                com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
        TCSubject user = pmgr.getUserSubject(getAuthentication().getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
        Navigation nav = new Navigation(request, ret);
        request.getSession(true).setAttribute("navigation", nav);
    }

}
