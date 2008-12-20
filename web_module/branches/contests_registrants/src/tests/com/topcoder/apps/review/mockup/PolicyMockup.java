/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.TCPermission;

/**
 * Mockup implementation of the Policy EJB.
 *
 * @author adic
 * @version 1.0
 */
public class PolicyMockup extends EJBBase implements PolicyRemote {

    public boolean checkPermission(TCSubject p1, TCPermission p2) throws GeneralSecurityException {
        return MockupData.checkPermission(p1, p2);
    }

    public boolean checkPermissions(TCSubject p1, PermissionCollection p2) {
        return false;
    }

}

