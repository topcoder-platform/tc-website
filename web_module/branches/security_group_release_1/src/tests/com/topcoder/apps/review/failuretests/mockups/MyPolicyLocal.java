/*
 * MyPolicyLocal.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;

import javax.ejb.Handle;
import javax.ejb.EJBLocalHome;
import javax.ejb.EJBLocalObject;
import javax.ejb.RemoveException;

import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PolicyLocal;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.policy.PermissionCollection;

/**
 * <p>A mockup implementation of PolicyLocal used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyPolicyLocal extends EJBBase implements PolicyLocal {
    // PolicyLocal methods

    public boolean checkPermission(TCSubject subject,
                                   TCPermission permission)
            throws GeneralSecurityException {
        return (MyPolicyImpl.checkPermission(subject, permission));
    }

    public boolean checkPermissions(TCSubject subject,
                                    PermissionCollection permissions)
            throws GeneralSecurityException {
        return (MyPolicyImpl.checkPermissions(subject, permissions));
    }
}
