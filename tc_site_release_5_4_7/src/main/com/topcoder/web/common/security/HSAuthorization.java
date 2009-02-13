package com.topcoder.web.common.security;

import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * This will be using the TopCoder Software security component to determine
 * if a particular user has access to a particular resource.
 * This can be done using com.topcoder.security.policy and passing it
 * the TCSubject associated with this object and a TCPermission object
 * that can be created using the Resource object passed in to the
 * hasPermission() method.
 *
 * @author Greg Paul, Ambrose Feinstein
 */
public class HSAuthorization implements Authorization {

    private static Logger log = Logger.getLogger(HSAuthorization.class);

    private TCSubject sub = null;
    private PolicyRemote policy = null;

    /** Construct an instance which can be used to check access for the given user. */
    public HSAuthorization(TCSubject sub) throws Exception {
        this.sub = sub;
        policy = (PolicyRemote) Constants.createEJB(PolicyRemote.class);
    }

    /** Constructor which takes a User object and fetches the TCSubject for that user. */
    public HSAuthorization(User user) throws Exception {
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
        this.sub = pmgr.getUserSubject(user.getId());
        policy = (PolicyRemote) Constants.createEJB(PolicyRemote.class);
    }

    /** Query the security component to determine whether the user can access this resource. */
    public boolean hasPermission(Resource r) {
        try {
            TCPermission perm = new GenericPermission(r.getName());
            return policy.checkPermission(sub, perm);

        } catch (Exception e) {
            log.warn("caught exception checking access to " + r.getName() + " for userid=" + sub.getUserId() + ", denying", e);
            return false;
        }
    }

    /** Hack to get the groups for the user by looking for specially named roles in their TCSubject. */
    public Set getGroups() {
        Set groupnames = new HashSet();
        Iterator it = sub.getPrincipals().iterator();
        while (it.hasNext()) {
            String rolename = ((RolePrincipal) it.next()).getName();
            if (rolename.startsWith("group_"))
                groupnames.add(rolename.substring(6));
        }
        return groupnames;
    }
}
