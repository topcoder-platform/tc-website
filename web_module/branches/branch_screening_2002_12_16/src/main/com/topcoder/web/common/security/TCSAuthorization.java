package com.topcoder.web.common.security;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.AuthorizationException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyLocalHome;
import com.topcoder.security.policy.PolicyLocal;

import javax.naming.InitialContext;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.ejb.CreateException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 14, 2003 2:05:41 AM
 */

public class TCSAuthorization implements Authorization {

    private TCSubject user;

    /**
     * Only constructor requires a corresponding TCSubject object
     * @param user
     */
    public TCSAuthorization(TCSubject user) {
        this.user = user;
    }

    /**
     *
     * @param r (Resource object to give permission for)
     * @return permission boolean
     * @throws com.topcoder.shared.security.AuthorizationException
     */
    public boolean hasPermission(Resource r)
        throws AuthorizationException
    {
        Context ctx = null;

        try {
            ctx = new InitialContext();

            PolicyLocalHome pHome = (PolicyLocalHome)
                PortableRemoteObject.narrow(
                    ctx.lookup(PolicyLocalHome.class.getName()),
                    PolicyLocalHome.class);
            PolicyLocal policy = pHome.create();

            GenericPermission permission = new GenericPermission(r.getName());

            if (user != null)
                return policy.checkPermission(user, permission);
            else {
                String msg = "TCSubject is null in hasPermission()";
                throw new AuthorizationException(msg);
            }
        }
        catch (NamingException e) {
            throw new AuthorizationException(e);
        }
        catch (CreateException e) {
            throw new AuthorizationException(e);
        }
        catch (GeneralSecurityException e) {
            throw new AuthorizationException(e);
        }
    }
}
