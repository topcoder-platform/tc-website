package com.topcoder.security.policy;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyRemote extends javax.ejb.EJBObject {

    public boolean checkPermission(TCSubject subject, TCPermission permission)
            throws RemoteException, GeneralSecurityException;

    public boolean checkPermissions(TCSubject subject, PermissionCollection permissions)
            throws RemoteException, GeneralSecurityException;

}
