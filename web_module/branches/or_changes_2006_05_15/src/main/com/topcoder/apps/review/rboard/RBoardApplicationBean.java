package com.topcoder.apps.review.rboard;

import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.model.SoftwareComponent;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;


/**
 * @author dok Date: Feb 12, 2004
 */
public class RBoardApplicationBean extends BaseEJB {

    private static final int INTERNAL_ADMIN_USER = 100129;
    
    public static final int JAVA_CATALOG_ID = 5801776;
    public static final int DOT_NET_CATALOG_ID = 5801777;
    public static final int CUSTOM_JAVA_CATALOG_ID = 5801778;
    public static final int CUSTOM_DOT_NET_CATALOG_ID = 5801779;
    public static final int FLASH_CATALOG_ID = 8459260;
    public static final int APPLICATIONS_CATALOG_ID = 9926572;
    public static final int ACTIVE_REVIEWER = 100;    

    private IdGen createIDGen(String dataSource) throws CreateException {
        try {
            InitialContext context = new InitialContext();

            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o,
                    IdGenHome.class);
            return idGenHome.create();

        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        }
    }

    private void createPermission(Connection conn, String permissionName,
            String prefix, long rUserRoleId, long userId) throws SQLException {
        PreparedStatement ps = conn
                .prepareStatement("SELECT role_id, description FROM security_roles "
                        + "WHERE description = ?");
        ps.setString(1, prefix + permissionName);
        ResultSet rs = ps.executeQuery();
        long roleId = 0;
        if (rs.next()) {
            roleId = rs.getLong("role_id");
        } else {
            throw (new EJBException("Couldn't find security_roles row for: "
                    + prefix + permissionName));
        }
        close(ps);
        insert(conn, "user_role_xref",
            new String[]{"user_role_id", "login_id", "role_id"},
            new String[]{String.valueOf(rUserRoleId), String.valueOf(userId), 
            String.valueOf(roleId)});
    }

    /**
     * @param projectId
     * @param conn
     * @param ps
     * @return
     * @throws SQLException
     */
    private Map getProjectInfo(long projectId, Connection conn)
            throws SQLException {
        Map returnMap = new HashMap();
        PreparedStatement ps = conn
                .prepareStatement("select p.project_id, cc.component_name, cv.version_text, pt.project_type_name, cfx.forum_id, p.cur_version, cfx.forum_type "
                        + "from project p, comp_catalog cc, comp_versions cv, project_type pt, comp_forum_xref cfx "
                        + "where cv.component_id = cc.component_id and p.comp_vers_id = cv.comp_vers_id "
                        + "and pt.project_type_id = p.project_type_id and p.cur_version = 1 "
                        + "and cfx.comp_vers_id = p.comp_vers_id and cfx.forum_type = 2 "
                        + "and p.project_id = ?");
        ps.setLong(1, projectId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            returnMap.put("projectName", rs.getString("component_name"));
            returnMap.put("projectVersion", rs.getString("version_text"));
            returnMap.put("projectType", rs.getString("project_type_name"));
            returnMap.put("forumId", rs.getString("forum_id"));
        } else {
            throw (new EJBException("Couldn't find project info for pid: "
                    + projectId));
        }
        close(ps);

        return returnMap;
    }

    /**
     * @param projectInfo
     * @return
     */
    private String buildPrefix(Map projectInfo) {
        String prefix = String.valueOf(projectInfo.get("projectName")) + " "
                + String.valueOf(projectInfo.get("projectVersion")) + " "
                + String.valueOf(projectInfo.get("projectType")) + " ";
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
        insert(conn, "r_user_role",
            new String[]{"r_user_role_v_id", "r_user_role_id", "r_role_id", "project_id",
            "login_id", "payment_info_id", "r_resp_id", "modify_user", "cur_version"},
            new String[]{String.valueOf(idGen.nextId()), String.valueOf(rUserRoleId), 
            String.valueOf(rRoleId), String.valueOf(projectId), String.valueOf(userId), 
            String.valueOf(paymentInfoId), String.valueOf(reviewRespId), 
            String.valueOf(INTERNAL_ADMIN_USER), "1"});
    }

    /**
     * @param conn
     * @param rUserRoleVId
     * @return
     * @throws SQLException
     */
    private void resetCurrentVersion(Connection conn, long rUserRoleVId)
        throws SQLException {
        update(conn, "r_user_role",
            new String[]{"cur_version"}, new String[]{"0"},
            new String[]{"r_user_role_v_id"},
            new String[]{String.valueOf(rUserRoleVId)});
    }

    public void createRBoardApplication(String dataSource, long userId,
            long projectId, int reviewRespId, int phaseId, Timestamp opensOn, 
            int reviewTypeId, boolean primary) throws RemoteException{
        
        IdGen idGen = null;
        try {
            idGen = createIDGen(dataSource);
        } catch (Exception e) {
            throw (new EJBException("Couldn't create IDGenerator"));
        }
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(dataSource);
            
            // gets project info
            Map projectInfo = getProjectInfo(projectId, conn);

            // gets UserRole info
            ps = conn.prepareStatement("SELECT * FROM r_user_role "
                    + "WHERE project_id = ? and login_id is null "
                    + "and cur_version = 1");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            // starts transaction
            System.out.println("Begin Transaction");

            conn.setAutoCommit(false);
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);

            insert(conn, "rboard_application",
                    new String[]{"user_id", "project_id", "phase_id", "review_resp_id", "primary_ind"},
                    new String[]{String.valueOf(userId), String.valueOf(projectId), 
                        String.valueOf(phaseId), String.valueOf(reviewRespId), 
                        String.valueOf(primary ? 1 : 0)});

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
                createPermission(conn, "Review " + projectId, prefix,
                        rUserRoleId, userId);
                createPermission(conn, "View Project " + projectId, prefix,
                        rUserRoleId, userId);
                createPermission(conn, "ForumUser "
                        + String.valueOf(projectInfo.get("forumId")), prefix,
                        rUserRoleId, userId);
            } else {
                throw (new EJBException("Couldn't find UserRole rows for pid:"
                        + projectId));
            }
            System.out.println("Commit Transaction");
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback Transaction");
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback Transaction2");
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
s
   /* private int getReviewRespId(Connection conn, long userId, long projectId,
            int phaseId) {
        return selectInt(conn,
                "rboard_application",
                "review_resp_id",
                new String[] { "user_id", "project_id", "phase_id" },
                new String[] { String.valueOf(userId),
                        String.valueOf(projectId), String.valueOf(phaseId) }).intValue();
    }*/

/*    private boolean isPrimary(Connection conn, long userId, long projectId,
            int phaseId) {
        Integer ret = selectInt(conn, "rboard_application",
                "primary_ind",
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)});
        return (ret != null && ret.intValue() == 1);
    }*/

    private boolean exists(Connection conn, long userId, long projectId,
            int phaseId) {
        try {
            selectLong(conn, "rboard_application",
                    "user_id",
                    new String[]{"user_id", "project_id", "phase_id"},
                    new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)});
        } catch (RowNotFoundException e) {
            return false;
        }
        return true;
    }

    private ResultSetContainer getReviewers(String dataSource, long projectId,
            int phaseId) {
        return selectSet("rboard_application",
                new String[]{"user_id", "review_resp_id", "primary_ind", "create_date"},
                new String[]{"project_id"},
                new String[]{String.valueOf(projectId)},
                dataSource);
    }
    
    public Timestamp getLatestReviewApplicationTimestamp(Connection conn, long userId) {
        StringBuffer query = new StringBuffer(200);
        query.append("select create_date from rboard_application where user_id = ?");
        query.append(" order by create_date desc");

        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        Timestamp ret = null;
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getTimestamp("create_date");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(ctx);
        }
        return ret;
    }

    public Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) {
        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            return getLatestReviewApplicationTimestamp(conn, userId);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(conn);
        }
    }

    /**
     * @param catalog
     * @param reviewTypeId
     * @throws RemoteException
     */
    public void validateUser(String dataSource, int catalog, int reviewTypeId, long userId, 
            int phaseId) throws RemoteException {
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);
        
            Map reviewRespMap = null;
            try {
                reviewRespMap = getReviewRespInfo(dataSource);
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e.getMessage());
            }
    
            int status = 0;
            try {
                status = getStatus(conn, userId, phaseId);
            } catch (RowNotFoundException rnfe) {
                throw new RemoteException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            }
    
            if (status != ACTIVE_REVIEWER) {
                throw new RemoteException("Sorry, you are not authorized to perform reviews at this time.");
            }
    
            if (!reviewRespMap.containsKey(new Integer(reviewTypeId)) ||
                    !reviewRespMap.get(new Integer(reviewTypeId)).equals(new Integer(phaseId))) {
                throw new RemoteException("Invalid request, incorrect review position specified.");
            }
    
            try {
                if (catalog == JAVA_CATALOG_ID || catalog == CUSTOM_JAVA_CATALOG_ID) {
                    if (!canReviewJava(conn, userId, phaseId)) {
                        throw new RemoteException("Sorry, you can not review this project because " +
                                "you are not a Java reviewer");
                    }
                } else if (catalog == DOT_NET_CATALOG_ID || catalog == CUSTOM_DOT_NET_CATALOG_ID) {
                    if (!canReviewDotNet(conn, userId, phaseId)) {
                        throw new RemoteException("Sorry, you can not review this project because " +
                                "you are not a .Net reviewer");
                    }
                } else if (catalog == FLASH_CATALOG_ID) {
                    if (!canReviewFlash(conn, userId, phaseId)) {
                        throw new RemoteException("Sorry, you can not review this project because " +
                                "you are not a Flash reviewer");
                    }
                } else if (catalog == APPLICATIONS_CATALOG_ID) {
                    if (!canReviewApplication(conn, userId, phaseId)) {
                        throw new RemoteException("Sorry, you can not review this project because " +
                                "you are not a Application reviewer");
                    }
                } else {
                    throw new RemoteException("unknown catalog found " + catalog);
                }
            } catch (RowNotFoundException enfe) {
                throw new RemoteException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(conn);
        }
    }

    /**
     * @param opensOn
     * @param reviewTypeId
     * @throws RemoteException
     */
    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RemoteException {
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);
            System.out.println("Begin Transaction b");
            conn.setAutoCommit(false);
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);
            System.out.println("Commit Transaction b");
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback Transaction b");
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback Transaction b2");
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
        } finally {
            close(conn);
        }
    }
    
    /**
     * @param opensOn
     * @param reviewTypeId
     * @throws RemoteException
     */
    private void validateUserTrans(Connection conn, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RemoteException {
        
        if (exists(conn, userId, projectId, phaseId)) {
            throw new RemoteException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new RemoteException("Sorry, this project is not open for review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(opensOn));
        }

        Timestamp lastReviewApp = getLatestReviewApplicationTimestamp(conn, userId);
        if (lastReviewApp != null && System.currentTimeMillis() < lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY)
        {
            throw new RemoteException("Sorry, you can not apply for a new review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(new Timestamp(lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY)));
        }

        ResultSetContainer reviewers = getReviewers(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId);

        if (reviewers.size() == 3) {
            throw new RemoteException("Sorry, the project's review positions are already full.");
        }

        if (primary) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("primary_ind") == 1) {
                    throw new RemoteException("Sorry, this review position is already taken.");
                }
            }
        }

        if (phaseId == SoftwareComponent.DEV_PHASE) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new RemoteException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 2)) {
                throw new RemoteException("Sorry, there was an error in the application"
                        + " (primary reviewers must be failure reviewers, and vice versa).");
            }
        } else {
            // Design.
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new RemoteException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 4)) {
                throw new RemoteException("Sorry, there was an error in the application");
            }
        }
        // If somebody came in by constructing the URL, make sure that there is at least one
        // primary before we run out of spots.
        if (!primary && reviewers.size() == 2) {
            boolean alreadyHasPrimary = false;
            for (Iterator it = reviewers.iterator(); it.hasNext() && !alreadyHasPrimary;) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("primary_ind") == 1) {
                    alreadyHasPrimary = true;
                }
            }
            if (!alreadyHasPrimary) {
                throw new RemoteException("Sorry, at least one reviewer must be the primary.");
            }
        }
    }
    
    /**
     * @param projectId
     * @param conn
     * @param ps
     * @return
     * @throws SQLException
     */
    private Map getReviewRespInfo(String dataSource) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Map returnMap = new HashMap();

        conn = DBMS.getConnection(dataSource);
        ps = conn.prepareStatement("select review_resp_id, review_resp_name, phase_id " +
                "from review_resp");
        rs = ps.executeQuery();
        
        while (rs.next()) {
            returnMap.put(new Integer(rs.getInt("review_resp_id")), 
                new Integer(rs.getInt("phase_id")));
        }
        close(rs);
        close(ps);
        close(conn);

        return returnMap;
    }
    
    
    private int getStatus(Connection conn, long userId, int phaseId) {
        return selectInt(conn,
                "rboard_user",
                "status_id",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue();
    }

    private boolean canReviewJava(Connection conn, long userId, int phaseId) {
        return selectInt(conn,
                "rboard_user",
                "java_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;
    }

    private boolean canReviewDotNet(Connection conn, long userId, int phaseId) {
        return selectInt(conn,
                "rboard_user",
                "net_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }

    private boolean canReviewFlash(Connection conn, long userId, int phaseId) {
        return selectInt(conn,
                "rboard_user",
                "flash_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }

    private boolean canReviewApplication(Connection conn, long userId,
            int phaseId) {
        return selectInt(conn,
                "rboard_user",
                "application_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }
    
    

    /*        
    private boolean hasContract(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
            "contract_ind",
            new String[]{"user_id", "phase_id"},
            new String[]{String.valueOf(userId), String.valueOf(phaseId)},
            dataSource).intValue() == 1;
    }
    
    private void createRBoardUser(String dataSource, long userId, int phaseId, int statusId,
                                 boolean hasContract, boolean canReviewJava,
                                 boolean canReviewDotNet, boolean canReviewFlash) {
        int ret = insert("rboard_user",
                new String[]{"user_id", "phase_id", "status_id", "contract_ind", "java_ind", "net_ind", "flash_ind"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId), String.valueOf(statusId),
                             hasContract ? "1" : "0", canReviewJava ? "1" : "0", canReviewDotNet ? "1" : "0",
                             canReviewFlash ? "1" : "0"},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'rboard_user'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }
    
    private void setStatus(String dataSource, long userId, int phaseId, int statusId) {
        int ret = update("rboard_user",
                new String[]{"status_id"},
                new String[]{String.valueOf(statusId)},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }
    
    private void setHasContract(String dataSource, long userId, int phaseId, boolean hasContract) {
        int ret = update("rboard_user",
                new String[]{"contract_ind"},
                new String[]{hasContract ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }
    
    private void setCanReviewJava(String dataSource, long userId, int phaseId, boolean canReviewJava) {
        int ret = update("rboard_user",
                new String[]{"java_ind"},
                new String[]{canReviewJava ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    
    }
    
    private void setCanReviewDotNet(String dataSource, long userId, int phaseId, boolean canReviewDotNet) {
        int ret = update("rboard_user",
                new String[]{"net_ind"},
                new String[]{canReviewDotNet ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    
    }
    
    private void setCanReviewFlash(String dataSource, long userId, int phaseId, boolean canReviewFlash) {
        int ret = update("rboard_user",
                new String[]{"flash_ind"},
                new String[]{canReviewFlash ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    
    }
    
    private void setCanReviewApplication(String dataSource, long userId, int phaseId, boolean canReviewApplication) {
        int ret = update("rboard_user",
                new String[]{"application_ind"},
                new String[]{canReviewApplication ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    
    }*/
}
