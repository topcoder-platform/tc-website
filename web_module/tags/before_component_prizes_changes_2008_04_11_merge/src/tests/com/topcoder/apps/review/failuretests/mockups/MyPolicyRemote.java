/*
 * MyPolicyRemote.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;

import javax.ejb.Handle;
import javax.ejb.EJBHome;
import javax.ejb.EJBObject;
import javax.ejb.RemoveException;

import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.policy.PermissionCollection;

/**
 * <p>A mockup implementation of PolicyRemote used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyPolicyRemote extends EJBBase implements PolicyRemote {
    // PolicyRemote methods

    public boolean checkPermission(TCSubject subject,
                                   TCPermission permission) throws
            RemoteException, GeneralSecurityException {
        return (MyPolicyImpl.checkPermission(subject, permission));
    }

    public boolean checkPermissions(TCSubject subject,
                                    PermissionCollection permissions) throws
            RemoteException, GeneralSecurityException {
        return (MyPolicyImpl.checkPermissions(subject, permissions));
    }
}
