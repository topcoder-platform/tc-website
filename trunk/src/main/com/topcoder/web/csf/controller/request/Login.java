package com.topcoder.web.csf.controller.request;

import Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Locator;
import Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Soap;
import Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.holders.SandboxUserHolder;
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
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;

import javax.naming.Context;
import javax.xml.rpc.holders.BooleanHolder;
import java.rmi.RemoteException;
import java.util.Collection;

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
                        loginUser(username, password);
                        return;
                    } catch (TCWebException e) {
                        throw e;
                    } catch (LoginException e) {
                        throw e;
                    } catch (Exception e) {
                        throw new TCWebException(e);
                    }
                } catch (LoginException e) {
                    /* the login failed, so tell them what happened */
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                    getAuthentication().logout();
                } catch (TCWebException e) {
                    getAuthentication().logout();
                    throw e;
                }
            }
        }
        String nextpage = (String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, nextpage);

        setNextPage("/login.jsp");
        setIsNextPageInContext(true);

    }

    private void createSecurityUser(User u) throws Exception {

        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            UserPrincipal myPrincipal;
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            log.debug("create the security user");
            myPrincipal = pmr.createUser(u.getId(), u.getHandle(), "", tcs, DBMS.CSF_DATASOURCE_NAME);

            //addVote them to these two as well.  eventually i'm guessing we'll rearrange security and this'll change
            Collection groups = pmr.getGroups(tcs, DBMS.CSF_DATASOURCE_NAME);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            for (Object group : groups) {
                anonGroup = (GroupPrincipal) group;
                if (anonGroup.getName().equals("Anonymous")) {
                    break;
                }
            }
            for (Object group1 : groups) {
                userGroup = (GroupPrincipal) group1;
                if (userGroup.getName().equals("CSF User")) {
                    break;
                }
            }

            log.debug("anon " + anonGroup);
            log.debug("csf " + userGroup);
            pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.CSF_DATASOURCE_NAME);
            pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.CSF_DATASOURCE_NAME);
            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId(), true, DBMS.CSF_DATASOURCE_NAME);
        } finally {
            close(ctx);
        }

    }

    /*
    private void loginUser(String username, String password) throws LoginException, TCWebException {
        UserDAO dao = DAOUtil.getFactory().getUserDAO();
        User u = dao.find(username, false);
        if (u == null) {
            throw new LoginException("Unknown user");
        }
        String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextPage != null && !nextPage.equals("")) {
            setNextPage(nextPage);
            setIsNextPageInContext(false);
        } else {
            setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
            setIsNextPageInContext(false);
        }
        log.debug("on successful login, going to " + getNextPage());
        getAuthentication().login(new SimpleUser(u.getId().longValue(), u.getHandle(), u.getPassword()), false);
    }*/

    private void loginUser(String username, String password) throws LoginException, TCWebException {
        BooleanHolder res = new BooleanHolder();
        SandboxUserHolder user = new SandboxUserHolder();
        String email;
        try {
            Sandbox10Locator api = new Sandbox10Locator();
            Sandbox10Soap sandBox = api.getSandbox10Soap();
            sandBox.authenticate(username, password, res, user);
//            email = sandBox.getSharedUserProfile(user.value.getUserId()).getEmailId();
            if (user.value.isEmailAddressVerified()) {
                email = user.value.getEmailAddress();
            } else {
                setIsNextPageInContext(false);
                setNextPage("http://www.networkmashups.com/SandBox/VerifyEmail.aspx");
                return;
            }

        } catch (javax.xml.rpc.ServiceException e) {
            throw new TCWebException(e);
        } catch (RemoteException e) {
            if (log.isDebugEnabled()) {
                log.warn("Login failed ", e);
            } else {
                log.warn("Login failed " + e);
            }
            throw new LoginException("Handle or password incorrect.");
        }

        log.debug("correct user name and password " + res.value);
        UserDAO dao = DAOUtil.getFactory().getUserDAO();
        User u = dao.find(user.value.getUserId(), false);
        if (u == null) {
            log.debug("user doesn't exist, create in TC system " + user.value.getUserId());
            u = new User();
            u.setHandle(user.value.getUserId());
          //  u.setPassword(password);
            u.setFirstName(username);
            u.setLastName(username);
            Email a = new Email();
            a.setPrimary(Boolean.TRUE);
            a.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            a.setStatusId(Email.STATUS_ID_UNACTIVE);
            a.setAddress(email);
            a.setUser(u);
            u.addEmailAddress(a);
            dao.saveOrUpdate(u);
            try {
                createSecurityUser(u);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
            markForCommit();
            closeConversation();
            beginCommunication();
        } else {
            if (email != null) {
                if (u.getPrimaryEmailAddress() == null) {
                    Email a = new Email();
                    a.setPrimary(Boolean.TRUE);
                    a.setEmailTypeId(Email.TYPE_ID_PRIMARY);
                    a.setStatusId(Email.STATUS_ID_UNACTIVE);
                    a.setAddress(email);
                    a.setUser(u);
                    u.addEmailAddress(a);
                } else {
                    u.getPrimaryEmailAddress().setAddress(email);
                }
                dao.saveOrUpdate(u);

                Context ctx = null;
                try {
                    ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
                    TCSubject tcs = new TCSubject(132456);
                    PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                    PrincipalMgrRemote pmr = pmrh.create();
                    UserPrincipal myPrincipal = pmr.getUser(u.getId(), DBMS.CSF_DATASOURCE_NAME);
                    pmr.editPassword(myPrincipal, password, tcs, DBMS.CSF_DATASOURCE_NAME);
                } catch (Exception e) {
                    throw new TCWebException(e);
                } finally {
                   close(ctx);
                }
                markForCommit();
            }
        }
        String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextPage != null && !nextPage.equals("")) {
            setNextPage(nextPage);
            setIsNextPageInContext(false);
        } else {
            setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
            setIsNextPageInContext(false);
        }
        log.debug("on successful login, going to " + getNextPage());
        getAuthentication().login(new SimpleUser(u.getId(), u.getHandle(), ""), false);
    }

}
