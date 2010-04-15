package com.topcoder.security.policy;

import com.topcoder.security.*;

import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

/**
 * The policy object is intended for use by the components within the
 * security component directly. This will remove the overhead of obtaining
 * an EJB reference and marshalling of data.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class Policy {

    private String dataSource;
    private InitialContext ctx;

    protected Policy(InitialContext ctx, String dataSource) {
        this.dataSource = dataSource;
        this.ctx = ctx;
    }

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

        String roleIds = getRoleIds(subject.getPrincipals());
        if (roleIds.length() == 0) {
            return false;
        }

        final String permQuery = "SELECT x.role_id " +
                                  " FROM user_role_xref x, security_perms p" +
                                 " WHERE x.login_id = ?" +
                                   " and p.role_id = x.role_id" +
                                   " and p.permission = ?" +
                                   " and p.security_status_id = ?" +
                                   " and x.security_status_id = ?" +
                                 " UNION SELECT grx.role_id" +
                                  " FROM user_group_xref ugx, group_role_xref grx, security_perms p" +
                                 " WHERE ugx.login_id = ?" +
                                   " AND ugx.group_id = grx.group_id" +
                                   " and grx.role_id = p.role_id" +
                                   " and p.security_status_id = ?" +
                                   " and ugx.security_status_id = ?" +
                                   " and grx.security_status_id = ?" +
                                   " and p.permission = ?";

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = Util.getConnection(ctx, dataSource);
            ps = conn.prepareStatement(permQuery);
            ps.setLong(1, subject.getUserId());
            ps.setString(2, permission.getName());
            ps.setInt(3, SecurityDB.STATUS_ACTIVE);
            ps.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps.setLong(5, subject.getUserId());
            ps.setInt(6, SecurityDB.STATUS_ACTIVE);
            ps.setInt(7, SecurityDB.STATUS_ACTIVE);
            ps.setInt(8, SecurityDB.STATUS_ACTIVE);
            ps.setString(9, permission.getName());
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            throw new GeneralSecurityException(e);
        } finally {
            BaseEJB.close(rs);
            BaseEJB.close(ps);
            BaseEJB.close(conn);
        }
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

        Collection c = permissions.getPermissions();
        Iterator i = c.iterator();
        boolean b = true;

        //check whether the user has each of the permissions.  stop if the user doesn't have one.
        while (i.hasNext() && b) {
            b = checkPermission(subject, (TCPermission) i.next());
        }
        return b;
    }

    /**
     * Get the user's principals and return in the form of a String to be
     * plugged into a query
     *
     * @param principals
     * @return String of principal names/descriptions
     */
    private String getRoleIds(Collection principals) {
        String roleIds = "";
        Iterator i = principals.iterator();
        while (i.hasNext()) {
            roleIds += ((TCPrincipal) i.next()).getId();
            roleIds += ", ";
        }
        roleIds = roleIds.length() == 0 ? roleIds : roleIds.substring(0, roleIds.length() - 2);
        return roleIds;
    }
}
