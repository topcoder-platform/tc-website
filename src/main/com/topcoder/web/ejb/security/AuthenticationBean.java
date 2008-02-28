package com.topcoder.web.ejb.security;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;

import javax.ejb.Stateless;
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
public class AuthenticationBean implements AuthenticationRemote, AuthenticationLocal {

    public AuthenticatedUser login(String userName, String password) throws InvalidCredentialsException, GeneralAuthenticationException {
        try {
            LoginLocal ll = (LoginLocal) com.topcoder.web.common.security.Constants.createLocalEJB(LoginLocal.class);
            TCSubject sub = ll.login(userName, password);

            AuthenticatedUser ret = new AuthenticatedUser(sub.getUserId(), userName);

            InitialContext ctx = null;
            try {
                ctx = TCContext.getInitial();
                char status = getStatus(sub.getUserId(), ctx);
                if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
                    //check if they have an active email address
                    if (getEmailStatus(ret.getUserId(), ctx) != WebConstants.EMAIL_ACTIVE_STATUS) {
                        throw new InactiveEmailStatusException("Inactive Email status for " + ret.getUserName() + " " + status);
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

            return ret;

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


    private char getStatus(long userId, InitialContext ctx) throws Exception {
        char result;
        User user = (User) BaseProcessor.createLocalEJB(ctx, User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }

    private int getEmailStatus(long userId, InitialContext ctx) throws Exception {
        int result;
        Email email = (Email) BaseProcessor.createLocalEJB(ctx, Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;
    }


}
