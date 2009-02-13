/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.onsite.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.shared.util.logging.Logger;

/**
 * <strong>Purpose</strong>:
 * A processor to login the onsite app.
 * 
 * @author pulky
 * @version 1.0
 */
public class Login extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(Login.class);

    /**
     * Processes the login request.
     */
    protected void businessProcessing() throws TCWebException {
        /* may be null */
        String username = getRequest().getParameter(Constants.USER_NAME);
        String password = getRequest().getParameter(Constants.PASSWORD);

        SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {
            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a handle and a password.");
            } else {
                try {
                    try {
                        setNextPage(checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY)));
                        setIsNextPageInContext(false);
                        getAuthentication().login(new SimpleUser(0, username, password));
                        log.debug("on successful login, going to " + getNextPage());
                        return;
                    } catch (LoginException e) {
                        /* the login failed, so tell them what happened */
                        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                    }
                } catch (Exception e) {
                    throw(new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
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
