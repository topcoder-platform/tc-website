/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.policy.PermissionCollection;

/**
 * Mockup implementation of the PolicyManager EJB.
 *
 * @author adic
 * @version 1.0
 */
public class PolicyManagerMockup extends EJBBase implements PolicyMgrRemote {

    public void removePermissions(RolePrincipal p1, PermissionCollection p2, TCSubject p3) throws GeneralSecurityException {
    }

    public PermissionCollection getPermissions(RolePrincipal p1, TCSubject p2) throws GeneralSecurityException {
        return null;
    }

    public void addPermissions(RolePrincipal p1, PermissionCollection p2, TCSubject p3) throws GeneralSecurityException {
    }

}

