package com.topcoder.dde.catalog;

import javax.ejb.SessionBean;
import javax.ejb.EJBException;
import javax.ejb.SessionContext;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

/**
 * <p>An implementation of <code>Team Member Roles EJB</code>.</p>
 *
 * @author isv
 * @version 1.0 04/30/2005
 */
public class TeamMemberRolesBean implements SessionBean {

    private SessionContext ejbContext;

    /**
     * <p>Gets the roles for members assigned to current version of specified component.</p>
     *
     * @param componentId a <code>long</code> providing the ID of a requested component.
     * @return a <code>List</code> containing the <code>TeamMemberRole</code> objects providing the roles assigned to
     *         team members in context of specified component.
     * @throws SQLException
     * @throws NamingException
     */
    public List getTeamMemberRoles(long componentId) throws SQLException, NamingException {
        return getTeamMemberRoles(componentId, -1);
    }

    /**
     * <p>Gets the roles for members assigned to specified version of specified component.</p>
     *
     * @param componentId a <code>long</code> providing the ID of a requested component.
     * @param compVersionId a <code>long</code> providing the ID of a version of specified component. Note, this value
     *        maps to 'comp_versions.version' but not 'comp_versions.comp_vers_id' column.
     * @return a <code>List</code> containing the <code>TeamMemberRole</code> objects providing the roles assigned to
     *         team members in context of specified version of specified component.
     * @throws SQLException
     * @throws NamingException
     */
    public List getTeamMemberRoles(long componentId, long compVersionId) throws SQLException, NamingException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            c = getConnection();

            ps = c.prepareStatement("SELECT ur.r_user_role_v_id, ur.login_id, s.user_id, " +
                    "       r.review_role_id, r.review_role_name " +
                    "FROM r_user_role ur,review_role r,comp_catalog c,comp_versions v,security_user s,project p " +
                    "WHERE ur.cur_version=1 " +
                    "AND   ur.r_role_id=r.review_role_id " +
                    "AND   ur.login_id=s.login_id " +
                    "AND   ur.project_id=p.project_id " +
                    "AND   p.cur_version = 1 " +
                    "AND   p.comp_vers_id=v.comp_vers_id " +
                    "AND   v.component_id=c.component_id " +
                    (compVersionId < 0 ? "AND   v.version=c.current_version " : "AND   v.version=? ") +
                    "AND   (ur.r_role_id <> 1 " +
                    "       OR ur.r_role_id=1 " +
                    "          AND EXISTS (SELECT pr.user_id FROM project_result pr WHERE pr.project_id=p.project_id AND ur.login_id = pr.user_id AND pr.placed=1)) " +
                    "AND   c.component_id = ? " +
                    "ORDER BY 3");

            if (compVersionId >= 0) {
                ps.setLong(1, compVersionId);
                ps.setLong(2, componentId);
            } else {
                ps.setLong(1, componentId);
            }

            rs = ps.executeQuery();

            String username;
            TeamMemberRole teamMemberRole;
            Map roles = new TreeMap();
            while (rs.next()) {
                username = rs.getString(3);
                teamMemberRole = (TeamMemberRole) roles.get(username);
                if (teamMemberRole == null) {
                    teamMemberRole = new TeamMemberRole(rs.getLong(2), username);
                    roles.put(username, teamMemberRole);
                }

                teamMemberRole.addRole(rs.getLong(4), rs.getString(5));
            }

            return new ArrayList(roles.values());

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
            }
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception e) {
            }
            try {
                if (c != null) {
                    c.close();
                    c = null;
                }
            } catch (Exception e) {
            }
        }
    }

    /**
     * <p>Gets the connection to database.</p>
     *
     * @return a <code>Connection</code> to database.
     * @throws SQLException
     * @throws NamingException
     */
    private static Connection getConnection() throws SQLException, NamingException {
        return getDataSource().getConnection();
    }

    /**
     * <p>Gets the <code>DataSource</code> to be used to obtain the connections to database. Performs a lookup for a
     * data source within initial JNDI context under "java:comp/env/jdbc/DefaultDS" name.</p>
     *
     * @return a <code>DataSource</code> to be used to obtain the connections to database.
     * @throws NamingException
     */
    private static DataSource getDataSource() throws NamingException {
        return (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/DefaultDS");
    }

    public void ejbActivate() throws EJBException, RemoteException {
    }

    public void ejbPassivate() throws EJBException, RemoteException {
    }

    public void ejbRemove() throws EJBException, RemoteException {
    }

    public void setSessionContext(SessionContext sessionContext) throws EJBException, RemoteException {
        ejbContext = sessionContext;
    }

    public void ejbCreate() {
    }
}
