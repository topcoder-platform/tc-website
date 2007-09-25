package com.topcoder.web.wiki;

import com.atlassian.confluence.user.ConfluenceAuthenticator;
import com.atlassian.confluence.user.UserAccessor;
import com.atlassian.seraph.auth.AuthenticatorException;
import com.atlassian.user.impl.DefaultUser;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.rmi.RemoteException;
import java.security.Principal;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 8, 2007
 */
public class TCAuthenticator extends ConfluenceAuthenticator {
    //public class TCAuthenticator extends DefaultAuthenticator {
    private final static Logger log = Logger.getLogger(TCAuthenticator.class);

    private static int AUTOLOGIN_COOKIE_AGE = 365 * 24 * 60 * 60;
    private static String GROUP_TOPCODER_STAFF = "topcoder-staff";
    private static final User guest = SimpleUser.createGuest();

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password) throws AuthenticatorException {
        return login(request, response, userName, password, false);
    }

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password, boolean cookie) throws AuthenticatorException {
        log.debug("XXX login called " + userName);

        try {

            Principal user = getUser(userName);
            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication =
                    new LightAuthentication(new SessionPersistor(tcRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);

            if (user != null) {

                //todo check for user status and email status potentially
                //todo remove from topcoder-staff group if they are not an admin
                try {
                    TCSubject sub = authenticate(userName, password);
                    if (sub!=null) {
                        if (getUserAccessor().getUser(userName) == null) {
                            log.debug("XXX create the user");
                            String[] groups;
                            if (isAdmin(userName)) {
                                groups = new String[]{UserAccessor.GROUP_CONFLUENCE_USERS, GROUP_TOPCODER_STAFF};
                            } else {
                                groups = new String[]{UserAccessor.GROUP_CONFLUENCE_USERS};
                            }
                            getUserAccessor().addUser(userName, "", "", userName, groups);
                        }

                        authentication.login(new SimpleUser(sub.getUserId(), userName, password), cookie);


/*
                        request.getSession().setAttribute(LOGGED_IN_KEY, user);
                        request.getSession().setAttribute(LOGGED_OUT_KEY, null);
                        if (getRoleMapper().canLogin(user, request)) {
                            if (cookie && response != null) {
                                CookieUtils.setCookie(request, response, getLoginCookieKey(),
                                        encodeCookie(userName, password), AUTOLOGIN_COOKIE_AGE, getCookiePath(request));
                            }
                        } else {
                            request.getSession().removeAttribute(LOGGED_IN_KEY);
                        }
*/
                        return true;
                    } else {
                        return false;
                    }
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    }
                    return false;
                }

            }


            authentication.logout();
/*
            if (response != null && CookieUtils.getCookie(request, getLoginCookieKey()) != null) {

                try {
                    CookieUtils.invalidateCookie(request, response, getLoginCookieKey(), getCookiePath(request));
                }
                catch (Exception e) {
                    log.error("Could not invalidate cookie: " + e, e);
                }
            }
*/

            return false;

        } catch (Exception e) {
            throw new AuthenticatorException(e.getMessage());
        }

    }

    /*        private char getStatus(long userId) throws Exception {
            char result;
            com.topcoder.web.ejb.user.User user = (com.topcoder.web.ejb.user.User)
                    BaseProcessor.createLocalEJB(TCContext.getInitial(), com.topcoder.web.ejb.user.User.class);
            result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            return result;

        }


        private int getEmailStatus(long userId) throws Exception {
            int result;
            Email email = (Email) BaseProcessor.createLocalEJB(TCContext.getInitial(), Email.class);
            result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME);
            return result;
        }
    */
    private TCSubject authenticate(String userName, String password) {


        TCSubject ret = null;
        try {
            LoginLocal login = (LoginLocal) Constants.createLocalEJB(LoginLocal.class);
            ret = login.login(userName, password);
            if (log.isDebugEnabled()) {
                log.debug("correct user name and password");
            }
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } catch (GeneralSecurityException e) {
            return ret;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return ret;
    }

    protected boolean authenticate(Principal principal, String password) {
        log.debug("XXX authenticate called");
        return authenticate(principal.getName(), password)==null;
    }

    public void setUserAccessor(UserAccessor userAccessor) {
        log.debug("XXX setUserAccessor called");
        super.setUserAccessor(userAccessor);
    }

    protected UserAccessor getUserAccessor() {
        log.debug("XXX getUserAccessor called");
        return super.getUserAccessor();
    }

    protected Principal getUser(String userName) {
        if (log.isDebugEnabled()) {
            log.debug("XXX getUser called ");
        }

        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            UserPrincipal p = pmr.getUser(userName);
            if (p.getId()==guest.getId()) {
                return null;
            } else {
                DefaultUser du = new DefaultUser(p.getName());
                du.setName(p.getName());
                du.setFullName(du.getName());
                return du;
            }
        } catch (NoSuchUserException e) {
            log.debug("no such user");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    private boolean isAdmin(String userName) throws Exception {
        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            TCSubject sub = pmr.getUserSubject(pmr.getUser(userName).getId());
            for (Object rp : sub.getPrincipals()) {
                if (((RolePrincipal) rp).getName().equals("group_Admin")) {
                    return true;
                }
            }
            return false;
        } catch (NoSuchUserException e) {
            log.debug("no such user");
            return false;
        }
    }

    public Principal getUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        log.debug("XXX getUser(request, response) called");
/*
        return super.getUser(httpServletRequest, httpServletResponse);
*/

        TCRequest tcRequest = HttpObjectFactory.createRequest(httpServletRequest);
        TCResponse tcResponse = httpServletResponse == null ? null : HttpObjectFactory.createResponse(httpServletResponse);
        try {

            //UserManager.getInstance().getUser(username)

            WebAuthentication authentication =
                    new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            if (authentication.getActiveUser().isAnonymous()) {
                log.debug("anon");
                return null;
            } else {
                DefaultUser ret = new DefaultUser(authentication.getActiveUser().getUserName());
                ret.setFullName(ret.getName());
                log.debug("got " + ret.getName());
                return ret;
            }

        } catch (Exception e) {
            log.warn(e.getMessage(), e);
            return null;
        }
    }
}
