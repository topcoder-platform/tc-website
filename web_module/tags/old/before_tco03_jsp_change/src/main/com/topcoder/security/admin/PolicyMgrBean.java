package com.topcoder.security.admin;

import com.topcoder.security.BaseEJB;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.TCPermission;
import org.apache.log4j.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
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

    private static Logger logger = Logger.getLogger(PolicyMgrBean.class);
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
        String query = "SELECT permission FROM security_perms WHERE role_id = ?";

        Context ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            DataSource dataSource = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(query);
            ps.setLong(1, roleId);
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
        String query =
                "INSERT INTO security_perms (role_id, permission) " +
                " VALUES ( ?, ? )";
        Iterator it = c.iterator();

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            ctx = new InitialContext();
            DataSource dataSource = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(query);
            while (it.hasNext()) {
                TCPermission p = (TCPermission) it.next();
                String name = p.getName();
                ps.setLong(1, roleId);
                ps.setString(2, name);
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
        String query = "DELETE FROM security_perms WHERE permission = ?";

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            DataSource dataSource = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(query);
            while (i.hasNext()) {
                TCPermission p = (TCPermission) i.next();
                ps.setString(1, p.getName());
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
