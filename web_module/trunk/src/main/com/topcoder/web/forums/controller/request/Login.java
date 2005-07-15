package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.BasicAuthentication;

public class Login extends ForumsProcessor {

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void businessProcessing() throws TCWebException, GeneralSecurityException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String hashedPassword = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        //String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
        String password = "";

        String queryString = getRequest().getQueryString();
        int destStartIdx = queryString.indexOf("http://");
        String dest = queryString.substring(destStartIdx);

        try {
            password = getPassword(forumFactory.getUserManager().getUserID(username));
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        try {
            if (((BasicAuthentication)getAuthentication()).hashPassword(password).equals(hashedPassword)) {
                com.jivesoftware.base.User forumUser = forumFactory.getUserManager().getUser(username);
                authToken = AuthFactory.loginUser(username, password, rememberUser.equals("on"), getHttpRequest(), getHttpResponse());
                getAuthentication().login(new SimpleUser(authToken.getUserID(), username, password), rememberUser.equals("on"));
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

    private String getPassword(long userID) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_to_password");
        r.setProperty("uid", ""+userID);
        java.util.Map map = getDataAccess().getData(r);
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("user_to_password");
        if (rsc.isEmpty())
            return "";
        else
            return rsc.getStringItem(0, "password");
    }
}
