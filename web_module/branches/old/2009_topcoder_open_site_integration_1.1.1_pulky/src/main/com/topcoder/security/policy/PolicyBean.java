package com.topcoder.security.policy;

import com.topcoder.security.BaseEJB;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class PolicyBean extends BaseEJB {


    private static final String DATA_SOURCE = "java:comp/env/jdbc/DefaultDS";

    /**
     * Check to see if the user has the specified permission.  More specifically,
     * check to see if one of the roles the user has has this permission.
     *
     * @param subject The user
     * @param permission
     * @return Return true if the user has the permission, false otherwise
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public boolean checkPermission(TCSubject subject,
                                   TCPermission permission)
            throws GeneralSecurityException {

        InitialContext ctx = null;
        Policy p = null;
        boolean ret = false;
        try {
            ctx = new InitialContext();
            p = new Policy(ctx, DATA_SOURCE);
            ret = p.checkPermission(subject, permission);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ctx);
        }
        return ret;
    }

    /**
     * Checks to see if the user has all of the given permissions
     *
     * @param subject The user
     * @param permissions The collection of permissions
     * @return Returns true if the user as all of the permissions, false otherwise.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public boolean checkPermissions(TCSubject subject,
                                    PermissionCollection permissions)
            throws GeneralSecurityException {

        InitialContext ctx = null;
        Policy p = null;
        boolean ret = false;
        try {
            ctx = new InitialContext();
            p = new Policy(ctx, DATA_SOURCE);
            ret = p.checkPermissions(subject, permissions);
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ctx);
        }
        return ret;
    }

}

