package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.admin.*;
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
public class PolicyMgrLocalTester implements PolicyMgrLocal, PolicyMgrRemote {

    private Map users = new HashMap();

    public void addUser(TCSubject user, PermissionCollection permissionCollection) {
        users.put(new Long(user.getUserId()), permissionCollection);
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

    public void addPermissions(com.topcoder.security.RolePrincipal rolePrincipal, com.topcoder.security.policy.PermissionCollection permissionCollection, com.topcoder.security.TCSubject tCSubject) throws com.topcoder.security.GeneralSecurityException {
    }

    public com.topcoder.security.policy.PermissionCollection getPermissions(com.topcoder.security.RolePrincipal rolePrincipal, com.topcoder.security.TCSubject tCSubject) throws com.topcoder.security.GeneralSecurityException {
        return null;
    }

    public void removePermissions(com.topcoder.security.RolePrincipal rolePrincipal, com.topcoder.security.policy.PermissionCollection permissionCollection, com.topcoder.security.TCSubject tCSubject) throws com.topcoder.security.GeneralSecurityException {
    }

}
