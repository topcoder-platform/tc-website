package com.topcoder.web.common.security;

import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

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
    protected static final Logger log = Logger.getLogger(TCSAuthorization.class);

    private TCSubject tcUser;
    private PolicyRemote policy;

    /**
     * Creates Authorization token for given user.
     *
     * @param user
     */
    public TCSAuthorization(TCSubject user) throws Exception, RemoteException, NamingException {
        tcUser = user;
        policy = (PolicyRemote) Constants.createEJB(PolicyRemote.class);
    }

    public TCSAuthorization(User user) throws Exception, RemoteException, NamingException {
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
        this.tcUser = pmgr.getUserSubject(user.getId());
        policy = (PolicyRemote) Constants.createEJB(PolicyRemote.class);
    }

    /**
     * There will be TCSAuthorization token for every user, so this method will
     * return true if user to which this Authorization belongs to, has
     * permission to given resource.
     *
     * @see com.topcoder.shared.security.Authorization#hasPermission(com.topcoder.shared.security.Resource)
     */
    public boolean hasPermission(Resource rc) throws Exception {
        log.debug("check access to " + rc.getName());
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

    /**
     * Hack to get the groups for the user by looking for specially named roles in their TCSubject.
     * @deprecated
     */
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
