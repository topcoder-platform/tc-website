package com.topcoder.web.ejb.security;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.security.login.LoginRemote;

import javax.ejb.Stateless;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
@Stateless
public class AuthenticationBean implements AuthenticationRemote, AuthenticationLocal {

    public AuthenticatedUser login(String userName, String password) throws InvalidCredentialsException, GeneralAuthenticationException {
        try {
            LoginLocal ll = (LoginLocal) com.topcoder.web.common.security.Constants.createLocalEJB(LoginLocal.class);
            LoginRemote login;
            TCSubject sub;
            if (ll == null) {
                login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                sub = login.login(userName, password);
            } else {
                sub = ll.login(userName, password);
            }

            AuthenticatedUser ret = new AuthenticatedUser(sub.getUserId(), userName);
            return ret;

/*

            char status = getStatus(sub.getUserId());
            if (log.isDebugEnabled()) {
                log.debug("status: " + status);
            }
            if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) >= 0) {
                //check if they have an active email address
                if (getEmailStatus(sub.getUserId()) != EmailActivate.ACTIVE_STATUS) {
                    getAuthentication().logout();
                    if (log.isDebugEnabled()) {
                        log.debug("inactive email");
                    }
                    setNextPage(Constants.EMAIL_ACTIVATE);
                    setIsNextPageInContext(true);
                    return;
                } else {
                    if (log.isDebugEnabled()) {
                        log.debug("user active");
                    }
                    String dest = determineNextPage();
                    setNextPage(dest);
                    setIsNextPageInContext(false);
                    if (log.isDebugEnabled()) {
                        log.debug("on successful login, going to " + getNextPage());
                    }
                    getAuthentication().login(new SimpleUser(0, username, password), rememberUser.trim().toLowerCase().equals("on"));
                    doLegacyCrap(getRequest());
                    return;
                }
            } else {
                getAuthentication().logout();
                if (Arrays.binarySearch(Constants.INACTIVE_STATI, status) >= 0) {
                    if (log.isDebugEnabled()) {
                        log.debug("user inactive");
                    }
                    throw new LoginException("Sorry, your account is not active.  " +
                            "If you believe this is an error, please contact TopCoder.");
                } else if (Arrays.binarySearch(Constants.UNACTIVE_STATI, status) >= 0) {
                    if (log.isDebugEnabled()) {
                        log.debug("user unactive");
                    }
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Your account is not active.  " +
                            "Please review the activation email that was sent to you after registration.");
                } else {
                    throw new NavigationException("Invalid account status");
                }
            }
*/


        } catch (AuthenticationException e) {
            throw new InvalidCredentialsException();
        } catch (GeneralSecurityException e) {
            throw new GeneralAuthenticationException(e);
        } catch (NamingException e) {
            throw new GeneralAuthenticationException(e);
        } catch (RemoteException e) {
            throw new GeneralAuthenticationException(e);
        } catch (Exception e) {
            throw new GeneralAuthenticationException(e);
        }

    }
}
