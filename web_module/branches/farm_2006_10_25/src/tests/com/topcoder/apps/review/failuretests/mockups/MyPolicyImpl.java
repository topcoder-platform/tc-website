/*
 * MyPolicyImpl.java 1.0 6/30/2003
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

import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.policy.PermissionCollection;

/**
 * <p>A mockup implementation used by MyPolicyRemote and MyPolicyLocal.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyPolicyImpl {
    /**
     * <p>Maps TCSubjects to TCPermissions</p>
     */
    private static HashMap map = new HashMap();

    /**
     * <p>Checks that the given subject is associate with the given
     * permission.</p>
     *
     * @param subject the TCSubject to check
     * @param permission the TCPermission that we
     * want to check TCSubject for
     * @return true if subject is associated with permission
     */
    public static boolean checkPermission(TCSubject subject,
                                          TCPermission permission)
            throws GeneralSecurityException {
        Long id = new Long(subject.getUserId());
        PermissionCollection pc = (PermissionCollection) map.get(id);
        if (pc == null) {
            return (false);
        }
        return (pc.getPermissions().contains(permission));
    }

    /**
     * <p>Checks that the given subject is associate with the given
     * permissions.</p>
     *
     * @param subject the TCSubject to check
     * @param permissions the TCPermissions that we
     * want to check TCSubject for
     * @return true if subject is associated with permissions
     */
    public static boolean checkPermissions(TCSubject subject,
                                           PermissionCollection permissions)
            throws GeneralSecurityException {
        Long id = new Long(subject.getUserId());
        PermissionCollection pc = (PermissionCollection) map.get(id);
        if (pc == null) {
            return (false);
        }
        return (pc.getPermissions().containsAll(permissions.getPermissions()));
    }

    /**
     * <p>Associates the given TCSubject with the given TCPermission.</p>
     *
     * @param subject the subject
     * @param permission the permission to associate with subject
     * @return none
     */
    public static void addPermission(TCSubject subject,
                                     TCPermission permission) {
        Long id = new Long(subject.getUserId());
        PermissionCollection pc = (PermissionCollection) map.get(id);
        if (pc == null) {
            pc = new PermissionCollection();
            map.put(id, pc);
        }
        pc.addPermission(permission);
    }

    /**
     * <p>Clears all Permissions</p>
     *
     * @param none
     * @return none
     */
    public static void clearPermissions() {
        map.clear();
    }
}
