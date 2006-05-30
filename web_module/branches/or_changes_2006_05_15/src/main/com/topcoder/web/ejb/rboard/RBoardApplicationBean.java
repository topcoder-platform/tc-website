package com.topcoder.web.ejb.rboard;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.Map;
import java.util.HashMap;

import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public class RBoardApplicationBean extends BaseEJB {

    private static final int PRIMARY_ROLE_ID = 2;
    private static final int INTERNAL_ADMIN_USER = 100129;

    private IdGen createIDGen(String dataSource) throws CreateException {
        try {
            InitialContext context = new InitialContext();

            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o, IdGenHome.class);
            return idGenHome.create();

        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        }
    }
    
    private void createPermission(Connection conn, String permissionName, String prefix, long rUserRoleId, long userId) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
            "SELECT role_id, description FROM security_roles "
            + "WHERE description = ?");
        ps.setString(1, prefix + permissionName);
        ResultSet rs = ps.executeQuery();
        long roleId = 0;
        if (rs.next()) {
            roleId = rs.getLong("role_id");
        } else {
            throw(new EJBException("Couldn't find security_roles row for: " + prefix + permissionName));
        }
        Common.close(ps);
        ps = null;
    
        ps = conn.prepareStatement(
            "INSERT INTO user_role_xref (user_role_id, login_id, role_id) " +
            "VALUES ( ?, ?, ?)");
        ps.setLong(1, rUserRoleId);
        ps.setLong(2, userId);
        ps.setLong(3, roleId);
        ps.executeUpdate();
        Common.close(ps);
    }

    /**
     * @param projectId
     * @param conn
     * @param ps
     * @return
     * @throws SQLException
     */
    private Map getProjectInfo(long projectId, Connection conn) throws SQLException {
        Map returnMap = new HashMap();
        PreparedStatement ps = conn.prepareStatement(
            "select p.project_id, cc.component_name, cv.version, pt.project_type_name, cfx.forum_id, p.cur_version, cfx.forum_type "
            + "from project p, comp_catalog cc, comp_versions cv, project_type pt, comp_forum_xref cfx "
            + "where cv.component_id = cc.component_id and p.comp_vers_id = cv.comp_vers_id "
            + "and pt.project_type_id = p.project_type_id and p.cur_version = 1 and "
            + "and cfx.comp_vers_id = p.comp_vers_id and cfx.forum_type = 2 and "
            + "p.project_id = ?");
        ps.setLong(1, projectId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            returnMap.put("projectName", rs.getString("cc.component_name"));
            returnMap.put("projectVersion", rs.getString("cv.version"));
            returnMap.put("projectType", rs.getString("pt.project_type_name"));
            returnMap.put("forumId", rs.getString("cfx.forum_id"));
        } else {
            throw(new EJBException("Couldn't find project info for pid: " + projectId));
        }
        Common.close(ps);

        return returnMap;
    }

    /**
     * @param projectInfo
     * @return
     */
    private String buildPrefix(Map projectInfo) {
        String prefix = String.valueOf(projectInfo.get("projectName")) + " " + 
            String.valueOf(projectInfo.get("projectVersion")) + " " + 
            String.valueOf(projectInfo.get("projectType")) + " ";
        return prefix;
    }

    /**
     * @param userId
     * @param projectId
     * @param reviewRespId
     * @param idGen
     * @param conn
     * @param rUserRoleId
     * @param rRoleId
     * @param paymentInfoId
     * @return
     * @throws SQLException
     * @throws RemoteException
     */
    private void insertUserRole(Connection conn, IdGen idGen, long userId, 
            long projectId, int reviewRespId, long rUserRoleId, long rRoleId, 
            long paymentInfoId) throws SQLException, RemoteException {
        PreparedStatement ps;
        ps = conn.prepareStatement(
            "INSERT INTO r_user_role "
            + "(r_user_role_v_id, r_user_role_id, "
            + "r_role_id, project_id, "
            + "login_id, payment_info_id, "
            + "r_resp_id, modify_user, "
            + "cur_version) VALUES "
            + "(0, ?, ?, ?, ?, ?, ?, ?, 1)");
        ps.setLong(1, idGen.nextId());
        ps.setLong(2, rUserRoleId);
        ps.setLong(3, rRoleId);
        ps.setLong(4, projectId);
        ps.setLong(5, userId);
        ps.setLong(6, paymentInfoId);
        ps.setLong(7, reviewRespId);
        ps.setLong(8, INTERNAL_ADMIN_USER); // admin user
        ps.executeUpdate();
    }

    /**
     * @param conn
     * @param rUserRoleVId
     * @return
     * @throws SQLException
     */
    private void resetCurrentVersion(Connection conn, long rUserRoleVId) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
            "UPDATE r_user_role SET cur_version = 0 "
            + "WHERE r_user_role_v_id = ?");
        ps.setLong(1, rUserRoleVId);
        ps.executeUpdate();
        Common.close(ps);
    }

    public void createRBoardApplication(String dataSource, long userId, long projectId, int reviewRespId) {
        IdGen idGen = null;
        try {
            idGen = createIDGen(dataSource);
        } catch (Exception e) {
            throw(new EJBException("Couldn't create IDGenerator"));
        }
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DBMS.getConnection(dataSource);

            // gets project info
            Map projectInfo = getProjectInfo(projectId, conn);

            // gets UserRole info
            ps = conn.prepareStatement(
                "SELECT * FROM r_user_role "
                + "WHERE project_id = ? and r_resp_id = ? "
                + "and cur_version = 1");
            ps.setLong(1, projectId);
            ps.setLong(2, reviewRespId);
            rs = ps.executeQuery();
            
            // starts transaction
            conn.setAutoCommit(false);
            if (rs.next()) {
                long rUserRoleVId = rs.getLong("r_user_role_v_id");
                long rUserRoleId = rs.getLong("r_user_role_id");
                long rRoleId = rs.getLong("r_role_id");
                long paymentInfoId = rs.getLong("payment_info_id");
                
                // Resets current version
                resetCurrentVersion(conn, rUserRoleVId);

                // insert new UserRole
                insertUserRole(conn, idGen, userId, projectId, reviewRespId, 
                        rUserRoleId, rRoleId, paymentInfoId);

                // create permissions.
                String prefix = buildPrefix(projectInfo);
                createPermission(conn, "Review " + projectId, prefix, rUserRoleId, userId);
                createPermission(conn, "View Project " + projectId, prefix, rUserRoleId, userId);
                createPermission(conn, "ForumUser " + String.valueOf(projectInfo.get("forumId")), prefix, rUserRoleId, userId);
            } else {
                throw(new EJBException("Couldn't find UserRole rows for pid:" + projectId));
            }
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    public int getReviewRespId(String dataSource, long userId, long projectId, int phaseId) {
        return selectInt("rboard_application",
                "review_resp_id",
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource).intValue();
    }

    public boolean isPrimary(String dataSource, long userId, long projectId, int phaseId) {
        Integer ret = selectInt("r_user_role rur, project p",
                "rur.r_role_id",
                new String[]{"rur.login_id", "p.project_id", "p.project_type_id", "rur.cur_version"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), phaseId == 112 ? "1" : "2", "1"},
                dataSource);
        return (ret != null && ret.intValue() == PRIMARY_ROLE_ID);
    }

    public boolean exists(String dataSource, long userId, long projectId, int phaseId) {
        try {
            selectLong("r_user_role rur, project p",
                    "rur.login_id",
                    new String[]{"rur.login_id", "p.project_id", "p.project_type_id", "rur.cur_version"},
                    new String[]{String.valueOf(userId), String.valueOf(projectId), phaseId == 112 ? "1" : "2", "1"},
                    dataSource);
        } catch (RowNotFoundException e) {
            return false;
        }
        return true;        
    }

    public ResultSetContainer getReviewers(String dataSource, long projectId, int phaseId) {
        return selectSet("r_user_role",
                new String[]{"login_id", "r_resp_id", "r_role_id", "modify_date"},
                new String[]{"project_id", "cur_version"},
                new String[]{String.valueOf(projectId), "1"},
                dataSource);
    }

    public Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) {
        StringBuffer query = new StringBuffer(200);
        query.append("select max(modify_date) last_date from r_user_role where login_id = ? and modify_user = 289824");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        Timestamp ret = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getTimestamp("last_date");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }
}
