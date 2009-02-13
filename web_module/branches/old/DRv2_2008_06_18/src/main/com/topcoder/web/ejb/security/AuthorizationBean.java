package com.topcoder.web.ejb.security;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyLocal;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.SecurityHelper;

import javax.ejb.CreateException;
import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.naming.NamingException;
import java.lang.reflect.InvocationTargetException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
@Stateless
@WebService(endpointInterface = "com.topcoder.web.ejb.security.AuthorizationRemote",
        name = "AuthorizationService", serviceName = "AuthorizationService", portName = "AuthorizationServicePort")
public class AuthorizationBean implements AuthorizationLocal, AuthorizationRemote {

    private static final Logger log = Logger.getLogger(SecurityHelper.class);

    public boolean hasPermission(long userId, Resource resource) {
        try {
            PolicyLocal pl = (PolicyLocal) com.topcoder.web.common.security.Constants.createLocalEJB(PolicyLocal.class);
            boolean ret;
            boolean unknown = false;
            try {
                TCSubject sub = SecurityHelper.getUserSubject(userId);
                ret = pl.checkPermission(sub, new GenericPermission(resource.getName()));
            } catch (NoSuchUserException e) {
                unknown = true;
                ret = false;
            }
            if (log.isInfoEnabled()) {
                StringBuilder info =
                        new StringBuilder(100);
                if (unknown) {
                    info.append("unknown user ");
                } else {
                    info.append("user id ").append(userId);
                }
                info.append(ret ? " does " : " does not ");
                info.append("have access to ").append(resource.getName());
                log.info(info.toString());
            }
            return ret;
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } catch (InvocationTargetException e) {
            throw new GeneralSecurityException(e);
        } catch (com.topcoder.security.GeneralSecurityException e) {
            throw new GeneralSecurityException(e);
        } catch (NoSuchMethodException e) {
            throw new GeneralSecurityException(e);
        } catch (IllegalAccessException e) {
            throw new GeneralSecurityException(e);
        } catch (CreateException e) {
            throw new GeneralSecurityException(e);
        } catch (RemoteException e) {
            throw new GeneralSecurityException(e);
        }
    }

    public boolean hasPermission(long userId, String resource) {
        return hasPermission(userId, new SimpleResource(resource));
    }


}
