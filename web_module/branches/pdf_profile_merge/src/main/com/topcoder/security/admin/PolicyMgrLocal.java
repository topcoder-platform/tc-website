package com.topcoder.security.admin;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PermissionCollection;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrLocal extends javax.ejb.EJBLocalObject {

    public PermissionCollection getPermissions(RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException;

    public void addPermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws GeneralSecurityException;

    public void removePermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws GeneralSecurityException;

}
