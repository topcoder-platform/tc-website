package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.policy.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;

import java.util.*;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the PolicyRemote.<p>
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class PolicyLocalTester implements PolicyLocal, PolicyRemote {

    private Map users = new HashMap();

    public void addUser(TCSubject user, PermissionCollection permissionCollection) {
        users.put(new Long(user.getUserId()), permissionCollection);
    }

    public boolean checkPermission(TCSubject tcSubject, TCPermission tcPermission) throws GeneralSecurityException {
        PermissionCollection pc = (PermissionCollection) users.get(new Long(tcSubject.getUserId()));
        if (pc == null) return false;
        Collection col = pc.getPermissions();
        return col.contains(tcPermission);
    }

    public boolean checkPermissions(TCSubject tcSubject, PermissionCollection permissionCollection) throws GeneralSecurityException {
        PermissionCollection pc = (PermissionCollection) users.get(new Long(tcSubject.getUserId()));
        if (pc == null) return false;
        Collection col = pc.getPermissions();
        Collection col2 = permissionCollection.getPermissions();
        Iterator itr = col2.iterator();
        while (itr.hasNext()) {
            if (!col.remove(itr.next())) return false;
        }
        return true;
    }

    public EJBLocalHome getEJBLocalHome() {
        return null;
    }

    public EJBHome getEJBHome() {
        return null;
    }

    public Object getPrimaryKey() {
        return null;
    }

    public void remove() throws RemoveException {
    }

    public Handle getHandle() throws RemoteException {
        return null;
    }

    public boolean isIdentical(EJBLocalObject ejbObject) {
        return false;
    }

    public boolean isIdentical(EJBObject ejbObject) {
        return false;
    }
}
