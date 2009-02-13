package com.topcoder.security.policy;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyLocal extends javax.ejb.EJBLocalObject {

    public boolean checkPermission(TCSubject subject, TCPermission permission)
            throws GeneralSecurityException;

    public boolean checkPermissions(TCSubject subject, PermissionCollection permissions)
            throws GeneralSecurityException;

}
