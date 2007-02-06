package com.topcoder.web.csf.controller.request;

import Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Locator;
import Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi.Sandbox10Soap;
import Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.holders.SandboxUserHolder;
import Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.SharedUserProfile;
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
            myPrincipal = pmr.createUser(u.getId().longValue(), u.getHandle(), u.getPassword(), tcs, DBMS.CSF_DATASOURCE_NAME);

            //addVote them to these two as well.  eventually i'm guessing we'll rearrange security and this'll change
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

/*    private boolean isAdmin(String handle) throws NamingException, CreateException, RemoteException, GeneralSecurityException {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            log.debug("create the security user");
            UserPrincipal up = pmr.getUser(handle, DBMS.CSF_DATASOURCE_NAME);
            TCSubject sub = pmr.getUserSubject(up.getId(), DBMS.CSF_DATASOURCE_NAME);
            Set roles = sub.getPrincipals();
            RolePrincipal rp;
            for (Iterator it = roles.iterator(); it.hasNext();) {
                rp = (RolePrincipal) it.next();
                log.debug(rp.getName());
                if ("CSF Contest Administrator".equals(rp.getName())) {
                    return true;
                }
            }
            return false;
        } catch (NoSuchUserException e) {
            return false;
        } finally {
            close(ctx);
        }
    }*/


    private void loginUser(String username, String password) throws LoginException, TCWebException {
        BooleanHolder res = new BooleanHolder();
        SandboxUserHolder user = new SandboxUserHolder();
        try {
            Sandbox10Locator api = new Sandbox10Locator();
            Sandbox10Soap sandBox = api.getSandbox10Soap();
            sandBox.authenticate(username, password, res, user);
            SharedUserProfile profile = sandBox.getSharedUserProfile(user.value.getUserId());
            log.debug(profile.getEmailId());
        } catch (javax.xml.rpc.ServiceException e) {
            throw new TCWebException(e);
        } catch (RemoteException e) {
            log.warn("Login failed " + e);
            throw new LoginException("Handle or password incorrect.");
        }

        log.debug("correct user name and password " + res.value);
        UserDAO dao = DAOUtil.getFactory().getUserDAO();
        User u = dao.find(user.value.getUserId(), false);
        if (u == null) {
            log.debug("user doesn't exist, create in TC system " + user.value.getUserId());
            u = new User();
            u.setHandle(user.value.getUserId());
            u.setPassword("");
            Email a = new Email();
            a.setPrimary(Boolean.TRUE);
            a.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            a.setStatusId(Email.STATUS_ID_UNACTIVE);
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
    }

/*
    private void loginAdmin(String username, String password) throws Exception {
        TCSubject sub = null;
        //we need to check if they got the right user name and password before we check anything else
        try {
            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
            sub = login.login(username, password, DBMS.JTS_OLTP_DATASOURCE_NAME);
            log.debug("correct user name and password");
        } catch (Exception e) {
            throw new LoginException("Handle or password incorrect.");
        }
        char status = getStatus(sub.getUserId());
        log.debug("status: " + status);
        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
            //check if they have an active email address
            if (getEmailStatus(sub.getUserId()) != EmailActivate.ACTIVE_STATUS) {
                getAuthentication().logout();
                log.debug("inactive email");
                setNextPage("http://" + ApplicationServer.SERVER_NAME + "/tc?module=Static&d1=authentication&d2=emailActivate");
                setIsNextPageInContext(false);
            } else {
                log.debug("user active");
                String nextPage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
                if (nextPage != null && !nextPage.equals("")) {
                    setNextPage(nextPage);
                    setIsNextPageInContext(false);
                } else {
                    setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
                    setIsNextPageInContext(false);
                }
                log.debug("on successful login, going to " + getNextPage());
                getAuthentication().login(new SimpleUser(0, username, password), false);
            }
        } else {
            getAuthentication().logout();
            if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, status) >= 0) {
                log.debug("user inactive");
                throw new LoginException("Sorry, your account is not active.  " +
                        "If you believe this is an error, please contact TopCoder.");
            } else if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
                log.debug("user unactive");
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Your account is not active.  " +
                        "Please review the activation email that was sent to you after registration.");
            } else {
                throw new NavigationException("Invalid account status");
            }
        }

    }
*/

    /**
     * shouldn't use ejb slooooooooow
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
/*
    private char getStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getStatus().charValue();

    }

    private int getEmailStatus(long userId) throws Exception {
        return new UserDAOHibernate().find(new Long(userId)).getPrimaryEmailAddress().getStatusId().intValue();
    }
*/

}
