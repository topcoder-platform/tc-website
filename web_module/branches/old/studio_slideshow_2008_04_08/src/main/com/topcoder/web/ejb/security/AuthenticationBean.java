package com.topcoder.web.ejb.security;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailLocal;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserLocal;

import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.util.Arrays;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
@Stateless
@WebService(endpointInterface = "com.topcoder.web.ejb.security.AuthenticationRemote",
        name = "AuthenticationService", serviceName = "AuthenticationService", portName = "AuthenticationServicePort")
public class AuthenticationBean implements AuthenticationRemote, AuthenticationLocal {

    public long login(String userName, String password) throws InvalidCredentialsException,
            InactiveEmailStatusException, UnactiveUserStatusException, InactiveUserStatusException {
        try {
            LoginLocal ll = (LoginLocal) com.topcoder.web.common.security.Constants.createLocalEJB(LoginLocal.class);
            TCSubject sub =
                    ll.login(userName, password);

            AuthenticatedUser ret = new AuthenticatedUser(sub.getUserId(), userName);

            InitialContext ctx = null;
            try {
                ctx = TCContext.getInitial();
                char status = getStatus(sub.getUserId(), ctx);
                if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
                    //check if they have an active email address
                    int emailStatus = getEmailStatus(ret.getUserId(), ctx);
                    if (emailStatus != WebConstants.EMAIL_ACTIVE_STATUS) {
                        throw new InactiveEmailStatusException("Inactive Email status for " + ret.getUserName() + " " + emailStatus);
                    }
                } else {
                    if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
                        throw new UnactiveUserStatusException("Unactive User status for " + ret.getUserName() + " " + status);
                    } else {
                        throw new InactiveUserStatusException("Inactive User status for " + ret.getUserName() + " " + status);
                    }
                }
            } finally {
                TCContext.close(ctx);
            }

            return ret.getUserId();

        } catch (AuthenticationException e) {
            throw new InvalidCredentialsException();
        } catch (com.topcoder.security.GeneralSecurityException e) {
            throw new GeneralSecurityException(e);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } catch (RemoteException e) {
            throw new GeneralSecurityException(e);
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        }

    }


    private char getStatus(long userId, InitialContext ctx) throws Exception {
        char result;
        UserLocal user = (UserLocal) BaseProcessor.createLocalEJB(ctx, User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }

    private int getEmailStatus(long userId, InitialContext ctx) throws Exception {
        int result;
        EmailLocal email = (EmailLocal) BaseProcessor.createLocalEJB(ctx, Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;
    }


}
