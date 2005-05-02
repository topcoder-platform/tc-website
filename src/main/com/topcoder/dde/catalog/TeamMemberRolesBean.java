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

public class TeamMemberRolesBean implements SessionBean {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(TeamMemberRolesBean.class);

    private SessionContext ejbContext;

    public List getTeamMemberRoles(long componentId) throws SQLException, NamingException {
        return getTeamMemberRoles(componentId, -1);
    }

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

    private static Connection getConnection() throws SQLException, NamingException {

        return getDataSource().getConnection();
    }

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
