package com.topcoder.web.common.security;

import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.policy.*;
import com.topcoder.shared.security.*;

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

    private TCSubject user = null;
    private PolicyRemote policy = null;

    /** Construct an instance which can be used to check access for the given user. */
    public HSAuthorization(TCSubject sub) throws Exception {
        this.user = sub;
        policy = (PolicyRemote)Constants.createEJB(PolicyRemote.class);
    }

    /** Constructor which takes a User object and fetches the TCSubject for that user. */
    public HSAuthorization(User user) throws Exception {
        try {
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote)Constants.createEJB(PrincipalMgrRemote.class);
            this.user = pmgr.getUserSubject(user.getId());
            policy = (PolicyRemote)Constants.createEJB(PolicyRemote.class);
        } catch(Exception e) {
            e.printStackTrace();
            //@@@ leave things as null and check below
        }
    }

    /** Query the security component to determine whether the user can access this resource. */
    public boolean hasPermission(Resource r) {
        try {
            TCPermission perm = new GenericPermission(r.getName());
            return policy.checkPermission(user, perm);
        } catch(Exception e) {
            return true;  //@@@ opposite of production
        }
    }
}
