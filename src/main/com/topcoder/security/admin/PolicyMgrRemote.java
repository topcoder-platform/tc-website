package com.topcoder.security.admin;

import java.rmi.RemoteException;
import javax.ejb.FinderException;
import com.topcoder.security.*;
import com.topcoder.security.policy.PermissionCollection;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrRemote extends javax.ejb.EJBObject {

    public PermissionCollection getPermissions (RolePrincipal role, TCSubject requestor) 
        throws RemoteException, GeneralSecurityException;

    public void addPermissions (RolePrincipal role, PermissionCollection permissions, TCSubject requestor) 
        throws RemoteException, GeneralSecurityException;

    public void removePermissions (RolePrincipal role, PermissionCollection permissions, TCSubject requestor) 
        throws RemoteException, GeneralSecurityException;

}
