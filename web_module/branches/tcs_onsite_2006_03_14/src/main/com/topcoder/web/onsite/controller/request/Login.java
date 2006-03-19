package com.topcoder.web.onsite.controller.request;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.onsite.Constants;
import com.topcoder.web.onsite.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.ApplicationServer;

import java.util.Arrays;

public class Login extends Base {

    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);
        // hack would be to parse out server name from //.../ in next page
        // find server name from sessionInfo
        SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        String loginStatus = StringUtils.checkNull(getRequest().getParameter(STATUS));

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a handle and a password.");

            } else {
                try {
                    try {
                        setNextPage(getRequest().getContextPath());

                        setIsNextPageInContext(false);
                        log.debug("on successful login, going to " + getNextPage());
                        getAuthentication().login(new SimpleUser(0, username, password));
                        return;

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
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                "In order to continue, you must provide your user name and password.");
        }
        int nextPageIdx = info.getRequestString().indexOf("nextpage=");
        if (nextPageIdx != -1) {
            String nextPage = info.getRequestString().substring(nextPageIdx+"nextpage=".length());
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextPage);
        }
        setNextPage(Constants.LOGIN);
        setIsNextPageInContext(true);
    }


}
