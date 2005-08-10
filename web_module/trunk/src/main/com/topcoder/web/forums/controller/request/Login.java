package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.security.BasicAuthentication;

/**
 * @author mtong
 *
 * Logs into the forums, redirecting the user to the chosen page. 
 */
public class Login extends ForumsProcessor {

    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";

    protected void businessProcessing() throws TCWebException, GeneralSecurityException {

        long userID = -1;
        String username = getRequest().getParameter(USER_NAME);
        String hashedPassword = getRequest().getParameter(PASSWORD);
        String rememberUser = StringUtils.checkNull(getRequest().getParameter(REMEMBER_USER));
        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
        String password = "";
        
        try {
            userID = Long.parseLong(getRequest().getParameter(USER_ID));
            password = getPassword(userID);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
        if (!dest.startsWith("http://") && !dest.startsWith("https://")) {
            dest = "http://" + ApplicationServer.SERVER_NAME + dest;
        }
        
        //String queryString = getRequest().getQueryString();
        //int destStartIdx = queryString.indexOf("http://");
        //String dest = queryString.substring(destStartIdx);

        //try {
        //    userID = forumFactory.getUserManager().getUserID(username);
        //    password = getPassword(forumFactory.getUserManager().getUserID(username));
        //} catch (Exception e) {
        //    throw new TCWebException(e);
        //}

        //User user = ((BasicAuthentication)getAuthentication()).checkCookie();

        try {
            if (((BasicAuthentication)getAuthentication()).hashPassword(getPassword(userID)).equals(hashedPassword)) {
                //com.jivesoftware.base.User forumUser = forumFactory.getUserManager().getUser(username);
                //authToken = AuthFactory.loginUser(username, password, rememberUser.equals("on"), getHttpRequest(), getHttpResponse());
                //getAuthentication().login(new SimpleUser(authToken.getUserID(), username, password), rememberUser.equals("on"));
                getAuthentication().login(new SimpleUser(userID, username, password), rememberUser.equals("on"));
                doLegacyCrap(getRequest());
            } else {
                log.debug("forum password hash not matched");
                throw new Exception();
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            log.debug("login failed for: " + dest);
            AuthFactory.logoutUser(getHttpRequest(), getHttpResponse());
            getAuthentication().logout();
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
    //todo use userid to password, or get rid of this entirely

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
    
    private String getPassword(long userID) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_to_password");
        r.setProperty("uid", ""+userID);
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("user_to_password");
        if (rsc.isEmpty())
            return "";
        else
            return rsc.getStringItem(0, "password");
    }
}
