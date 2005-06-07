package com.topcoder.web.forums.controller.request;

import com.topcoder.security.Util;
import com.topcoder.security.GeneralSecurityException;

import com.topcoder.web.common.*;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.UnauthorizedException;

public class Login extends ForumsProcessor {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void businessProcessing() throws TCWebException, GeneralSecurityException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        //String password = Util.decodePassword(getRequest().getParameter(PASSWORD), "users");
        String password = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
        
        try {
            authToken = AuthFactory.loginUser(username, password, rememberUser.equals("on"), getHttpRequest(), getHttpResponse());
        } catch (UnauthorizedException ue) {
            log.debug("login failed for: " + dest);
            AuthFactory.logoutUser(getHttpRequest(), getHttpResponse());
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Handle or password incorrect.");
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, dest);
            setNextPage("/login.jsp");
            setIsNextPageInContext(true);
            return;
        }
        setNextPage(dest);
        setIsNextPageInContext(false);
        return;
    }
}
