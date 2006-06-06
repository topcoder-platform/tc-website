/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

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

/**
 * Implementation of the RBoard EJB.
 *
 * <p>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Bean was moved from tc to tcs site and was updated to centralize all RBoard operations.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.1
 */
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

    /**
     * Creates IdGenerator EJB
     *
     * @param dataSource the current datasource
     * @return the IdGenerator
     * @throws CreateException if bean creation fails.
     */
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

    /**
     * Creates a specific permission for a specific user
     *
     * @param conn the connection being used
     * @param idGen the idGenerator for the ids
     * @param permissionName the permission name to create
     * @param prefix the prefix of the permission
     * @param userId the user id to assign permission
     * @throws SQLException when DB operations fails
     * @throws RemoteException if security_roles cannot be found
     */
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

    /**
     * Gets specific project information
     *
     * @param projectId the project id being inquired
     * @param conn the connection being used
     * @return Map with the project information
     * @throws SQLException when DB operations fails
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

    /**
     * Builds the prefix for the permissions
     *
     * @param projectInfo the Map containing project's information.
     * @return the prefix's string
     */
    private String buildPrefix(Map projectInfo) {
        String prefix = String.valueOf(projectInfo.get("projectName")) + " "
                + String.valueOf(projectInfo.get("projectVersion")) + " "
                + String.valueOf(projectInfo.get("projectType")) + " ";
        return prefix;
    }

    /**
     * Inserts a specified user role
     *
     * @param conn the connection being used
     * @param idGen the idGenerator for the ids
     * @param rUserRoleVId the existing userRoleVId
     * @param userId the user to insert
     * @param projectId the related project Id
     * @param reviewRespId the reviewer's responsibility
     * @param rUserRoleId the user role Id to insert
     * @param rRoleId the role Id to insert
     * @param paymentInfoId the payment information Id to insert
     * @throws SQLException when DB operations fails
     * @throws RemoteException if ID generator fails to generate the Id
     */
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
            String.valueOf(paymentInfoId), (reviewRespId != -1) ? String.valueOf(reviewRespId) : null,
            String.valueOf(INTERNAL_ADMIN_USER), "1"});
    }

    /**
     * Resets cur_version for the specified user role version Id
     *
     * @param conn the connection being used
     * @param rUserRoleVId the user role version id to reset.
     */
    private void resetCurrentVersion(Connection conn, long rUserRoleVId) {
        try {
            update(conn, "r_user_role",
                new String[]{"cur_version"}, new String[]{"0"},
                new String[]{"r_user_role_v_id"},
                new String[]{String.valueOf(rUserRoleVId)});
        } catch (Exception e) {
        }
    }

    /**
     * Creates the rboard_application and user_roles rows and insert permissions for the
     * reviewers singing up.
     *
     * @param dataSource the datasource being used
     * @param userId the user id to insert
     * @param projectId the project id to insert
     * @param reviewRespId the review responsibility id to insert
     * @param phaseId the phase id
     * @param opensOn timestamp when the positions opens on
     * @param reviewTypeId the type of the review
     * @param primary true if the reviewer is signing up for primary reviewer position
     * @throws RemoteException if the IDgenerator can't be created or the UserRole rows are not found
     */
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
                    insertUserRole(conn, idGen, rUserRoleVId, userId, projectId, -1,
                        rUserRoleId, rRoleId, paymentInfoId);
                }
            }
            if (!reviewerInserted) {
                throw (new EJBException("Couldn't find UserRole rows for pid:" + projectId));
            }
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            if (e instanceof RBoardRegistrationException) {
                throw ((RBoardRegistrationException) e);
            } else {
                throw new EJBException(e.getMessage());
            }
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    /**
     * Searches for existence of a particular row in rboard_application
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param projectId the project id to inspect
     * @param phaseId the phase id to inspect
     * @return true if row exists
     */
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

    /**
     * Retrieves reviewers for a particular project
     *
     * @param dataSource the datasource being used
     * @param projectId the project id to inspect
     * @param phaseId the phase id to inspect
     * @return ResultSetContainer with the retrieved reviewers
     */
    private ResultSetContainer getReviewers(String dataSource, long projectId,
            int phaseId) {
        return selectSet("rboard_application",
                new String[]{"user_id", "review_resp_id", "primary_ind", "create_date"},
                new String[]{"project_id"},
                new String[]{String.valueOf(projectId)},
                dataSource);
    }

    /**
     * Retrieves the last timestamp when a reviewer signed up for a review position
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @return the timestamp of the last sign up
     */
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

    /**
     * Retrieves the last timestamp when a reviewer signed up for a review position
     *
     * @param dataSource the datasuorce being used
     * @param userId the user id to inspect
     * @return the timestamp for the last signup
     */
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
     * Validates some non-transacional constraints for the review signup
     *
     * @param dataSource the datasource being used
     * @param catalog the catalog id of the project
     * @param reviewTypeId the review type selected
     * @param userId the user id signing in
     * @param phaseId the type of the project
     * @throws RBoardRegistrationException when validations fails
     * @throws RemoteException for unknown catalogs
     */
    public void validateUser(String dataSource, int catalog, int reviewTypeId, long userId, int phaseId) throws RBoardRegistrationException {
//    public void validateUser(String dataSource, int catalog, int reviewTypeId, long userId,
//            int phaseId) throws RBoardRegistrationException, RemoteException {
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

            long status = 0;
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
//                    throw new RemoteException("unknown catalog found " + catalog);
                    throw new EJBException("unknown catalog found " + catalog);
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

    /**
     * Validates some transacional constraints for the review signup
     *
     * @param dataSource the datasource being used
     * @param projectId the project id to validate
     * @param phaseId the project type
     * @param userId the user id to validate
     * @param opensOn the timestamp when the position opnens
     * @param reviewTypeId the review type
     * @param primary true if the position if for primary reviewer
     * @throws RemoteException
     */
    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary)
        throws RBoardRegistrationException, RemoteException {
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);
            conn.setAutoCommit(false);
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException sqle) {
                }
            }
            if (e instanceof RBoardRegistrationException) {
                throw ((RBoardRegistrationException) e);
            } else {
                throw new EJBException(e.getMessage());
            }
        } finally {
            close(conn);
        }
    }

    /**
     * Validates some transacional constraints for the review signup
     *
     * @param conn the connection being used
     * @param dataSource the datasource being used
     * @param projectId the project id to validate
     * @param phaseId the project type
     * @param userId the user id to validate
     * @param opensOn the timestamp when the position opnens
     * @param reviewTypeId the review type
     * @param primary true if the position if for primary reviewer
     * @throws RemoteException
     */
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

    /**
     * Gets reviewers responsibility information
     *
     * @param dataSource the datasource being used
     * @return a map with the reviewers responsibility information
     * @throws SQLException if DB operation fails
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

    /**
     * Retrieves the reviewer status of a particular user
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param phaseId the project type to inspect
     * @return the status of the reviewer
     */
    private long getStatus(Connection conn, long userId, int phaseId) {
        return selectLong(conn,
                "rboard_user",
                "status_id",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue();
    }

    /**
     * Retrieves if a particular user can review Java
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param phaseId the project type to inspect
     * @return true if the user can review Java
     */
    private boolean canReviewJava(Connection conn, long userId, int phaseId) {
        return selectLong(conn,
                "rboard_user",
                "java_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;
    }

    /**
     * Retrieves if a particular user can review DotNet
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param phaseId the project type to inspect
     * @return true if the user can review DotNet
     */
    private boolean canReviewDotNet(Connection conn, long userId, int phaseId) {
        return selectLong(conn,
                "rboard_user",
                "net_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }

    /**
     * Retrieves if a particular user can review Flash
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param phaseId the project type to inspect
     * @return true if the user can review Flash
     */
    private boolean canReviewFlash(Connection conn, long userId, int phaseId) {
        return selectLong(conn,
                "rboard_user",
                "flash_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }

    /**
     * Retrieves if a particular user can review applications
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param phaseId the project type to inspect
     * @return true if the user can review applications
     */
    private boolean canReviewApplication(Connection conn, long userId,
            int phaseId) {
        return selectLong(conn,
                "rboard_user",
                "application_ind",
                new String[] { "user_id", "phase_id" },
                new String[] { String.valueOf(userId), String.valueOf(phaseId) }).intValue() == 1;

    }
}
