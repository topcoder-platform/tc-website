package com.topcoder.web.common.security;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;

/**
 * This will be using the TopCoder Software security component to determine if a
 * particular user has access to a particular resource.  This can be done using
 * com.topcoder.security.policy and passing it the TCSubject associated with
 * this object and a TCPermission object that can be created using the Resource
 * object passed in to the hasPermission() method.
 *
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TCSAuthorization implements Authorization {
    protected static final Logger log = Logger.getLogger(
            TCSAuthorization.class
    );

    private TCSubject tcUser;
    private PolicyRemote policy;

    /**
     * Creates Authorization token for given user.
     *
     * @param user
     */
    public TCSAuthorization(TCSubject user) throws NamingException, CreateException, RemoteException {
        tcUser = user;
        InitialContext ic = null;
        try {
            ic = (InitialContext) TCContext.getContext(
                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL
            );
            PolicyRemoteHome pHome;
            pHome = (PolicyRemoteHome) ic.lookup(PolicyRemoteHome.EJB_REF_NAME);

            policy = pHome.create();
        } finally {
            closeIC(ic);
        }
    }

    /**
     * There will be TCSAuthorization token for every user, so this method will
     * return true if user to which this Authorization belongs to, has
     * permission to given resource.
     *
     * @see com.topcoder.shared.security.Authorization#hasPermission(com.topcoder.shared.security.Resource)
     */
    public boolean hasPermission(Resource rc) throws Exception {
        InitialContext ic = null;
        try {
            return policy.checkPermission(
                    tcUser,
                    new GenericPermission(rc.getName())
            );
        } catch (RemoteException re) {
            throw re;
        } finally {
            closeIC(ic);
        }
    }

    /**
     * Just closes initial context with care
     * @param ic
     */
    private static void closeIC(InitialContext ic) {
        if (ic == null) return;
        try {
            ic.close();
        } catch (Exception e) {
            log.error("Can't close initial context " + ic);
        }
    }

        /** Hack to get the groups for the user by looking for specially named roles in their TCSubject. */
    public Set getGroups() {
        Set groupnames = new HashSet();
        Iterator it = tcUser.getPrincipals().iterator();
        while (it.hasNext()) {
            String rolename = ((RolePrincipal) it.next()).getName();
            if (rolename.startsWith("group_"))
                groupnames.add(rolename.substring(6));
        }
        return groupnames;
    }
}
