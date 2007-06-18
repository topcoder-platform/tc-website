package com.topcoder.web.wiki;

import com.atlassian.confluence.user.ConfluenceAuthenticator;
import com.atlassian.confluence.user.UserAccessor;
import com.atlassian.seraph.auth.AuthenticatorException;
import com.atlassian.seraph.util.CookieUtils;
import com.atlassian.user.impl.DefaultUser;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.util.logging.Logger;

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
    private final static Logger log = Logger.getLogger(TCAuthenticator.class);

    private static int AUTOLOGIN_COOKIE_AGE = 365 * 24 * 60 * 60;

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password, boolean cookie) throws AuthenticatorException {
        log.debug("XXX login called");

        try {

            Principal user = getUser(userName);
            if (user != null) {

                //todo check for user status and email status potentially
                try {
                    if (authenticate(userName, password)) {
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


            if (response != null && CookieUtils.getCookie(request, getLoginCookieKey()) != null) {

                try {
                    CookieUtils.invalidateCookie(request, response, getLoginCookieKey(), getCookiePath(request));
                }
                catch (Exception e) {
                    log.error("Could not invalidate cookie: " + e, e);
                }
            }

            return false;

        } catch (Exception e) {
            throw new AuthenticatorException(e.getMessage());
        }

    }

    /*
        private char getStatus(long userId) throws Exception {
            char result;
            com.topcoder.web.ejb.user.User user = (com.topcoder.web.ejb.user.User)
                    BaseProcessor.createEJB(getInitialContext(), com.topcoder.web.ejb.user.User.class);
            result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            return result;

        }


        private int getEmailStatus(long userId) throws Exception {
            int result;
            Email email = (Email) BaseProcessor.createEJB(getInitialContext(), Email.class);
            result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME);
            return result;
        }
    */
    private boolean authenticate(String userName, String password) {


        try {
            //todo make a local call
            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
            login.login(userName, password);
            if (log.isDebugEnabled()) {
                log.debug("correct user name and password");
            }
            return true;
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } catch (GeneralSecurityException e) {
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected boolean authenticate(Principal principal, String password) {
        log.debug("XXX authenticate called");
        return authenticate(principal.getName(), password);
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
        log.debug("XXX getUser called");

        //todo make a local call
        PrincipalMgrRemote pmr = null;
        try {
            pmr = (PrincipalMgrRemote) com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
            UserPrincipal p = pmr.getUser(userName);
            DefaultUser du = new DefaultUser();
            du.setName(p.getName());
            du.setFullName(p.getName());
            return du;
        } catch (NoSuchUserException e) {
            log.debug("no such user");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public Principal getUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        log.debug("XXX getUser(request, response) called");
        return super.getUser(httpServletRequest, httpServletResponse);
/*
        TCRequest tcRequest = HttpObjectFactory.createRequest(httpServletRequest);
        TCResponse tcResponse = HttpObjectFactory.createResponse(httpServletResponse);
        try {
            WebAuthentication authentication =
                    new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            User ret = new DefaultUser();
            ret.setFullName(authentication.getActiveUser().getUserName());
            return ret;

        } catch (Exception e) {
            log.warn(e.getMessage());
            return null;
        }
*/
    }
}
