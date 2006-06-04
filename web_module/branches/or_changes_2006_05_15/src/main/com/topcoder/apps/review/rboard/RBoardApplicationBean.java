package com.topcoder.apps.review.rboard;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.model.SoftwareComponent;


public class RBoardApplicationBean extends BaseEJB {
    private static final int FINAL_REVIEWER_ROLE_ID = 5;
    private static final int AGGREGATOR_ROLE_ID = 4;
    private static final int PRIMARY_SCREENER_ROLE_ID = 2;
    private static final int REVIEWER_ROLE_ID = 3;
    private static final int INTERNAL_ADMIN_USER = 100129;
    private static final int JAVA_CATALOG_ID = 5801776;
    private static final int DOT_NET_CATALOG_ID = 5801777;
    private static final int CUSTOM_JAVA_CATALOG_ID = 5801778;
    private static final int CUSTOM_DOT_NET_CATALOG_ID = 5801779;
    private static final int FLASH_CATALOG_ID = 8459260;
    private static final int APPLICATIONS_CATALOG_ID = 9926572;
    private static final int ACTIVE_REVIEWER = 100;

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

    private void createPermission(Connection conn, IdGen idGen, String permissionName,
            String prefix, long userId) throws SQLException, RemoteException {
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
        long userRoleId = idGen.nextId();
        try {
            selectLong(conn, "user_role_xref",
                "user_role_id", new String[]{"login_id", "role_id"},
                new String[]{String.valueOf(userId), String.valueOf(roleId)});
        } catch (RowNotFoundException e) {
            insert(conn, "user_role_xref",
                new String[]{"user_role_id", "login_id", "role_id", "create_user_id"},
                new String[]{String.valueOf(userRoleId), String.valueOf(userId),
                String.valueOf(roleId), String.valueOf(INTERNAL_ADMIN_USER)});
        }
    }

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
            returnMap.put("projectVersion", rs.getString("version_text").trim());
            returnMap.put("projectType", rs.getString("project_type_name"));
            returnMap.put("forumId", rs.getString("forum_id"));
        } else {
            throw (new EJBException("Couldn't find project info for pid: "
                    + projectId));
        }
        close(ps);

        return returnMap;
    }

    private String buildPrefix(Map projectInfo) {
        String prefix = String.valueOf(projectInfo.get("projectName")) + " "
                + String.valueOf(projectInfo.get("projectVersion")) + " "
                + String.valueOf(projectInfo.get("projectType")) + " ";
        return prefix;
    }

    private void insertUserRole(Connection conn, IdGen idGen, long rUserRoleVId, long userId,
        long projectId, int reviewRespId, long rUserRoleId, long rRoleId,
        long paymentInfoId) throws SQLException, RemoteException {
        // Resets current version
        resetCurrentVersion(conn, rUserRoleVId);

        insert(conn, "r_user_role",
            new String[]{"r_user_role_v_id", "r_user_role_id", "r_role_id", "project_id",
            "login_id", "payment_info_id", "r_resp_id", "modify_user", "cur_version"},
            new String[]{String.valueOf(idGen.nextId()), String.valueOf(rUserRoleId),
            String.valueOf(rRoleId), String.valueOf(projectId), String.valueOf(userId),
            String.valueOf(paymentInfoId), String.valueOf(reviewRespId),
            String.valueOf(INTERNAL_ADMIN_USER), "1"});
    }

    private void resetCurrentVersion(Connection conn, long rUserRoleVId) {
        try {
            System.out.println("update r_user_role : " + rUserRoleVId);

            update(conn, "r_user_role",
                new String[]{"cur_version"}, new String[]{"0"},
                new String[]{"r_user_role_v_id"},
                new String[]{String.valueOf(rUserRoleVId)});
        } catch (Exception e) {
        }
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
            String prefix = buildPrefix(projectInfo);

            // gets UserRole info (First reviewer)
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

            boolean reviewerInserted = false;
            while (rs.next()) {
                long rUserRoleVId = rs.getLong("r_user_role_v_id");
                long rUserRoleId = rs.getLong("r_user_role_id");
                long rRoleId = rs.getLong("r_role_id");
                long paymentInfoId = rs.getLong("payment_info_id");

                if (rRoleId == REVIEWER_ROLE_ID && !reviewerInserted) {
                    // insert new UserRole
                    insertUserRole(conn, idGen, rUserRoleVId, userId, projectId, reviewRespId,
                            rUserRoleId, rRoleId, paymentInfoId);

                    // create permissions.
                    createPermission(conn, idGen, "Review " + projectId, prefix, userId);
                    createPermission(conn, idGen, "View Project " + projectId, prefix, userId);
                    createPermission(conn, idGen, "ForumUser "
                            + String.valueOf(projectInfo.get("forumId")), "", userId);

                    reviewerInserted = true;
                } else if (primary && (rRoleId == PRIMARY_SCREENER_ROLE_ID ||
                        rRoleId == AGGREGATOR_ROLE_ID || rRoleId == FINAL_REVIEWER_ROLE_ID)) {
                    // insert new UserRole
                    insertUserRole(conn, idGen, rUserRoleVId, userId, projectId, reviewRespId,
                        rUserRoleId, rRoleId, paymentInfoId);
                }
            }
            if (!reviewerInserted) {
                throw (new EJBException("Couldn't find UserRole rows for pid:" + projectId));
            }
            System.out.println("Commit Transaction");
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
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

    public void validateUser(String dataSource, int catalog, int reviewTypeId, long userId,
            int phaseId) throws RBoardRegistrationException, RemoteException {
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
                throw new RBoardRegistrationException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            }

            if (status != ACTIVE_REVIEWER) {
                throw new RBoardRegistrationException("Sorry, you are not authorized to perform reviews at this time.");
            }

            if (!reviewRespMap.containsKey(new Integer(reviewTypeId)) ||
                    !reviewRespMap.get(new Integer(reviewTypeId)).equals(new Integer(phaseId))) {
                throw new RBoardRegistrationException("Invalid request, incorrect review position specified.");
            }

            try {
                if (catalog == JAVA_CATALOG_ID || catalog == CUSTOM_JAVA_CATALOG_ID) {
                    if (!canReviewJava(conn, userId, phaseId)) {
                        throw new RBoardRegistrationException("Sorry, you can not review this project because " +
                                "you are not a Java reviewer");
                    }
                } else if (catalog == DOT_NET_CATALOG_ID || catalog == CUSTOM_DOT_NET_CATALOG_ID) {
                    if (!canReviewDotNet(conn, userId, phaseId)) {
                        throw new RBoardRegistrationException("Sorry, you can not review this project because " +
                                "you are not a .Net reviewer");
                    }
                } else if (catalog == FLASH_CATALOG_ID) {
                    if (!canReviewFlash(conn, userId, phaseId)) {
                        throw new RBoardRegistrationException("Sorry, you can not review this project because " +
                                "you are not a Flash reviewer");
                    }
                } else if (catalog == APPLICATIONS_CATALOG_ID) {
                    if (!canReviewApplication(conn, userId, phaseId)) {
                        throw new RBoardRegistrationException("Sorry, you can not review this project because " +
                                "you are not a Application reviewer");
                    }
                } else {
                    throw new RemoteException("unknown catalog found " + catalog);
                }
            } catch (RowNotFoundException enfe) {
                throw new RBoardRegistrationException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(conn);
        }
    }

    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RemoteException {
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);
            System.out.println("Begin Transaction b");
            conn.setAutoCommit(false);
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);
            System.out.println("Commit Transaction b");
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
        } catch (Exception e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback Transaction b2");
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            throw new EJBException(e.getMessage());
        } finally {
            close(conn);
        }
    }

    private void validateUserTrans(Connection conn, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary)
        throws RBoardRegistrationException, RemoteException {

        if (exists(conn, userId, projectId, phaseId)) {
            throw new RBoardRegistrationException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(opensOn));
        }

        Timestamp lastReviewApp = getLatestReviewApplicationTimestamp(conn, userId);
        if (lastReviewApp != null && System.currentTimeMillis() < lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY)
        {
            throw new RBoardRegistrationException("Sorry, you can not apply for a new review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(new Timestamp(lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY)));
        }

        ResultSetContainer reviewers = getReviewers(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId);

        if (reviewers.size() == 3) {
            throw new RBoardRegistrationException("Sorry, the project's review positions are already full.");
        }

        if (primary) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("primary_ind") == 1) {
                    throw new RBoardRegistrationException("Sorry, this review position is already taken.");
                }
            }
        }

        if (phaseId == SoftwareComponent.DEV_PHASE) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new RBoardRegistrationException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 2)) {
                throw new RBoardRegistrationException("Sorry, there was an error in the application"
                        + " (primary reviewers must be failure reviewers, and vice versa).");
            }
        } else {
            // Design.
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new RBoardRegistrationException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 4)) {
                throw new RBoardRegistrationException("Sorry, there was an error in the application");
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
                throw new RBoardRegistrationException("Sorry, at least one reviewer must be the primary.");
            }
        }
    }

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
}
