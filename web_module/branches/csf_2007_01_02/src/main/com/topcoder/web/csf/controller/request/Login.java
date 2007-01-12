package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Locator;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Soap;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.holders.SandboxUserHolder;

import javax.xml.rpc.holders.BooleanHolder;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class Login extends ShortHibernateProcessor {


    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String REMEMBER_USER = "rem";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";

    protected void dbProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if ("POST".equals(getRequest().getMethod()) && username != null) {
            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a user name and a password.");

            } else {
                try {
                    try {
                        Sandbox10Locator api = new Sandbox10Locator();
                        Sandbox10Soap sandBox = api.getSandbox10Soap();
                        BooleanHolder res = new BooleanHolder();
                        SandboxUserHolder user = new SandboxUserHolder();
                        sandBox.authenticate("dokkah", "Camer0n", res, user);
                        log.debug("correct user name and password " + res.value);
                        log.debug("on successful login, going to " + getNextPage());
                        getAuthentication().login(new SimpleUser(0, username, password), false);
                        UserDAO dao = DAOUtil.getFactory().getUserDAO();
                        User u =  dao.find(user.value.getUserId(), false);
                        if (u==null) {
                            log.debug("user doesn't exist, create in TC system " + user.value.getUserId());
                            u = new User();
                            u.setHandle(user.value.getUserId());
                            dao.saveOrUpdate(u);
                        }

                        return;
                    } catch (Exception e) {
                        throw new LoginException("Handle or password incorrect.");
                    }
                } catch (LoginException e) {
                    /* the login failed, so tell them what happened */
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        String nextpage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextpage);
        setNextPage("/login.jsp");
        setIsNextPageInContext(true);
    }


}
