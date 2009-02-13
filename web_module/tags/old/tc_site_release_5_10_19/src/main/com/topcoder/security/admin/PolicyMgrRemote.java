package com.topcoder.security.admin;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PermissionCollection;

import java.rmi.RemoteException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrRemote extends javax.ejb.EJBObject {

    public PermissionCollection getPermissions(RolePrincipal role, TCSubject requestor)
            throws RemoteException, GeneralSecurityException;

    public void addPermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws RemoteException, GeneralSecurityException;

    public void removePermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws RemoteException, GeneralSecurityException;

}
