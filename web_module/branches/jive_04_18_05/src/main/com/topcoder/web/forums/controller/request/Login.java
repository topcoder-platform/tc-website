package com.topcoder.web.forums.controller.request;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.shared.util.DBMS;

import com.topcoder.web.common.*;
import com.topcoder.web.ejb.user.User;

import com.jivesoftware.base.AuthFactory;

public class Login extends ForumsProcessor {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void businessProcessing() throws TCWebException, GeneralSecurityException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String hashedPassword = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
        String password = "";
        
        try {
            password = getPassword(forumFactory.getUserManager().getUserID(username));
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
        try {
            if (com.jivesoftware.util.StringUtils.hash(password).equals(hashedPassword)) {
                com.jivesoftware.base.User forumUser = forumFactory.getUserManager().getUser(username);
                authToken = AuthFactory.loginUser(username, password, rememberUser.equals("on"), getHttpRequest(), getHttpResponse());
            } else {
                log.debug("forum password hash not matched");
                throw new Exception();
            }
        } catch (Exception e) {
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
    
    private String getPassword(long userId) throws Exception {
        String password;
        User user = (User) createEJB(getInitialContext(), User.class);
        password = user.getPassword(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return password;
    }
}
