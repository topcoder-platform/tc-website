package com.topcoder.web.csf.controller.request;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Locator;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Soap;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.holders.SandboxUserHolder;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.xml.rpc.holders.BooleanHolder;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.Iterator;

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
                        sandBox.authenticate(username, password, res, user);
                        log.debug("correct user name and password " + res.value);
                        log.debug("on successful login, going to " + getNextPage());
                        UserDAO dao = DAOUtil.getFactory().getUserDAO();
                        User u =  dao.find(user.value.getUserId(), false);
                        if (u==null) {
                            log.debug("user doesn't exist, create in TC system " + user.value.getUserId());
                            u = new User();
                            u.setHandle(user.value.getUserId());
                            u.setPassword("");
                            dao.saveOrUpdate(u);
                            createSecurityUser(u);
                            markForCommit();
                            closeConversation();
                            beginCommunication();
                            
                        }
                        String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
                        if (nextPage != null && !nextPage.equals("")) {
                            setNextPage(nextPage);
                            setIsNextPageInContext(false);
                        } else {
                            setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
                            setIsNextPageInContext(false);
                        }

                        getAuthentication().login(new SimpleUser(u.getId().longValue(), u.getHandle(), u.getPassword()), false);

                        return;
                    } catch (Exception e) {
                        if (log.isDebugEnabled()) {
                            e.printStackTrace();
                        }
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

    private void createSecurityUser(User u) throws Exception, RemoteException, CreateException, GeneralSecurityException {

        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            UserPrincipal myPrincipal;
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            log.debug("create the security user");
            myPrincipal = pmr.createUser(u.getId().longValue(), u.getHandle(), u.getPassword(), tcs, DBMS.CSF_DATASOURCE_NAME);

            //add them to these two as well.  eventually i'm guessing we'll rearrange security and this'll change
            Collection groups = pmr.getGroups(tcs, DBMS.CSF_DATASOURCE_NAME);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                anonGroup = (GroupPrincipal) iterator.next();
                if (anonGroup.getName().equals("Anonymous")) {
                    break;
                }
            }
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                userGroup = (GroupPrincipal) iterator.next();
                if (userGroup.getName().equals("CSF User")) {
                    break;
                }
            }

            log.debug("anon " + anonGroup);
            log.debug("csf " + userGroup);
            pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.CSF_DATASOURCE_NAME);
            pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.CSF_DATASOURCE_NAME);
            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.CSF_DATASOURCE_NAME);
        } finally {
            close(ctx);
        }

    }


}
