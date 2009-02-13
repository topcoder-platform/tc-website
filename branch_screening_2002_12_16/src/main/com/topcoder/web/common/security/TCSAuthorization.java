package com.topcoder.web.common.security;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.AuthorizationException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Hashtable;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import javax.ejb.CreateException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 14, 2003 2:05:41 AM
 */

public class TCSAuthorization implements Authorization {

    private static Logger log = Logger.getLogger(TCSAuthorization.class);
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
        log.debug("callling hasPermission. Resource r = " + r.getName());
        Context ctx = null;

        try {
            log.debug("Getting Policy EJB");
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_FACTORY);
            env.put(Context.PROVIDER_URL,
                ApplicationServer.SECURITY_PROVIDER_URL);
            ctx = new InitialContext(env);

            PolicyRemoteHome pHome = (PolicyRemoteHome)
                    ctx.lookup(PolicyRemoteHome.EJB_REF_NAME);
            PolicyRemote policy = pHome.create();

            log.debug("Checking permissions");
            GenericPermission permission = new GenericPermission(r.getName());

            if (user != null)
                return policy.checkPermission(user, permission);
            else {
                String msg = "TCSubject is null in hasPermission(Resource r)";
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
        catch (RemoteException e) {
            throw new AuthorizationException(e);
        }
        finally {
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getPermissions");}}
        }
    }
}