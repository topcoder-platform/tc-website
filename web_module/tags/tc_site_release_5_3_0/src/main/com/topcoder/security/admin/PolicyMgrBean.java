package com.topcoder.security.admin;

import com.topcoder.security.*;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.TCPermission;
import org.apache.log4j.Logger;

import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Iterator;

/**
 * Use this Bean to manage the permissions associated with a particular role
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class PolicyMgrBean extends BaseEJB {

    private static final Logger logger = Logger.getLogger(PolicyMgrBean.class);
    private String DATA_SOURCE = "java:comp/env/jdbc/DefaultDS";

    /**
     * Returns a collection of all of the permissions this role has
     *
     * @param role
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @return A PermissionCollection
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public PermissionCollection getPermissions(RolePrincipal role, TCSubject requestor)
            throws GeneralSecurityException {

        logger.debug("PolicyMgrBean.getPermissions");
        long roleId = role.getId();
        PermissionCollection pc = new PermissionCollection();
        String query = "SELECT permission FROM security_perms WHERE role_id = ? and security_status_id = ?";

        InitialContext ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);

            ps = conn.prepareStatement(query);
            ps.setLong(1, roleId);
            ps.setInt(2, SecurityDB.STATUS_ACTIVE);
            rs = ps.executeQuery();
            while (rs.next()) {
                pc.addPermission(new GenericPermission(rs.getString(1)));
            }

        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return pc;
    }

    /**
     * Add these permissions to this role.
     *
     * @param role
     * @param permissions
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public void addPermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws GeneralSecurityException {

        logger.debug("PolicyMgrBean.addPermissions");
        long roleId = role.getId();
        Collection c = permissions.getPermissions();
        String deleteQuery = "DELETE FROM security_perms where role_id = ? and permission = ?";
        String query =
                "INSERT INTO security_perms (role_id, permission, security_status_id) " +
                " VALUES ( ?, ?, ?)";
        Iterator it = c.iterator();

        InitialContext ctx = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        Connection conn = null;

        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);
            ps = conn.prepareStatement(query);
            ps2 = conn.prepareStatement(deleteQuery);
            while (it.hasNext()) {
                TCPermission p = (TCPermission) it.next();
                String name = p.getName();

                ps2.setLong(1, roleId);
                ps2.setString(2, name);
                ps2.executeUpdate();

                ps.setLong(1, roleId);
                ps.setString(2, name);
                ps.setInt(3, SecurityDB.STATUS_ACTIVE);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(ps2);
            close(conn);
            close(ctx);
        }
    }

    /**
     * Remove these permissions from this role.
     *
     * @param role
     * @param permissions
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public void removePermissions(RolePrincipal role, PermissionCollection permissions, TCSubject requestor)
            throws GeneralSecurityException {

        logger.debug("PolicyMgrBean.removePermissions");
        Collection c = permissions.getPermissions();
        Iterator i = c.iterator();
        String query = "UPDATE security_perms SET security_status_id = ? WHERE permission = ? and  role_id = ?";

        InitialContext ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, DATA_SOURCE);

            ps = conn.prepareStatement(query);
            while (i.hasNext()) {
                TCPermission p = (TCPermission) i.next();
                ps.setInt(1, SecurityDB.STATUS_INACTIVE);
                ps.setString(2, p.getName());
                ps.setLong(3, role.getId());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }
}
