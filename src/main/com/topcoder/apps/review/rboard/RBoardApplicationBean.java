/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsHome;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

/**
 * Implementation of the RBoard EJB.
 * <p/>
 * <p/>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Bean was moved from tc to tcs site and was updated to centralize all RBoard operations.
 * </li>
 * </ol>
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * Schema was changed to allow reviewers for particular technologies.
 * </li>
 * </ol>
 * Version 1.0.3 Change notes:
 * <ol>
 * <li>
 * Submitter role is disabled for the registering reviewer.
 * </li>
 * </ol>
 * Version 1.0.4 Change notes:
 * <ol>
 * <li>
 * Modified code to set user permissions for new software forums.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.4
 */
public class RBoardApplicationBean extends BaseEJB {
    private static final int INTERNAL_ADMIN_USER = 100129;
    private static final int ACTIVE_REVIEWER = 100;

    private static final String LONG_DATE_FORMAT = "MM/dd/yyyy hh:mm:ss aaa";

    private static final int SCREEN_PHASE = 3;
    private static final int REVIEW_PHASE = 4;
    private static final int AGGREGATION_PHASE = 7;
    private static final int FINAL_REVIEW_PHASE = 10;

    private static final int PRIMARY_SCREEN_ROLE = 2;
    private static final int REVIEWER_ROLE = 4;
    private static final int STRESS_REVIEWER_ROLE = 7;
    private static final int FAILURE_REVIEWER_ROLE = 6;
    private static final int ACCURACY_REVIWER_ROLE = 5;
    private static final int AGGREGATOR_REVIEWER_ROLE = 8;
    private static final int FINAL_REVIEWER_ROLE = 9;

    private static final int RESOURCE_INFO_TYPE_EXTERNAL_ID = 1;
    private static final int RESOURCE_INFO_TYPE_REGISTRATION_DATE = 6;

    private static final String RESOURCE_ID_SEQ = "resource_id_seq";

    private static Logger log = Logger.getLogger(RBoardApplicationBean.class);

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
     * Creates Principal Manager EJB
     *
     * @return PrincipalMgrRemote the ejb instance
     */
    protected PrincipalMgrRemote createPrincipalMgr() throws CreateException {
        InitialContext ctx = null;
        PrincipalMgrRemote principalMgr = null;
        try {
            ctx = new InitialContext();
            log.debug("context: " + ctx.getEnvironment().toString());

            Object objPrincipalMgr = ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemoteHome home =
                    (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalMgr, PrincipalMgrRemoteHome.class);
            principalMgr = home.create();
        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        } finally {
            close(ctx);
        }
        return principalMgr;
    }

    /**
     * Gets specific project information
     *
     * @param projectId the project id being inquired
     * @param conn      the connection being used
     * @return Map with the project information
     * @throws SQLException when DB operations fails
     */
    private Map getProjectInfo(long projectId, Connection conn)
            throws SQLException {
        Map returnMap = new HashMap();


        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select p.project_id, pi_cn.value as component_name, pi_vt.value as version_text, "
                    + "pt.name as project_type_name, cjcx.jive_category_id from project p "
                    + ",project_category_lu pt "
                    + ",project_info pi_cn "
                    + ",project_info pi_vt "
                    + ",project_info pi_vi "
                    + ",comp_versions cv "
                    + ",comp_jive_category_xref cjcx "
                    + "where p.project_id = ? "
                    + "and p.project_category_id = pt.project_category_id "
                    + "and p.project_id = pi_cn.project_id and pi_cn.project_info_type_id = 6 "
                    + "and p.project_id = pi_vt.project_id and pi_vt.project_info_type_id = 7 "
                    + "and p.project_id = pi_vi.project_id and pi_vi.project_info_type_id = 2 "
                    + "and cv.component_id = pi_vi.value and cv.phase_id in (112, 113) "
                    + "and cjcx.comp_vers_id = cv.comp_vers_id "
            );
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                returnMap.put("projectName", rs.getString("component_name"));
                returnMap.put("projectVersion", rs.getString("version_text").trim());
                returnMap.put("projectType", rs.getString("project_type_name"));
                returnMap.put("jiveCategoryId", rs.getString("jive_category_id"));
            } else {
                throw (new EJBException("Couldn't find project info for pid: " + projectId));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw (new EJBException("Getting project info failed", sqle));
        } finally {
            close(rs);
            close(ps);
        }
        return returnMap;
    }

    /**
     * Gets specific phases information
     *
     * @param projectId the project id being inquired
     * @param conn      the connection being used
     * @return Map with the phase information, key is phase type id and value is phase id
     * @throws SQLException when DB operations fails
     */
    private Map getPhaseInfo(long projectId, Connection conn)
            throws SQLException {
        Map returnMap = new HashMap();

        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select project_phase_id, phase_type_id "
                    + " from project_phase "
                    + "where project_id = ?");
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            while (rs.next()) {
                returnMap.put(rs.getString("phase_type_id"), rs.getString("project_phase_id"));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw (new EJBException("Getting phase info failed", sqle));
        } finally {
            close(rs);
            close(ps);
        }

        return returnMap;
    }

    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy hh:mm", Locale.US);

    /**
     * Inserts a specified user role
     *
     * @param conn          the connection being used
     * @param rUserRoleVId  the existing userRoleVId
     * @param userId        the user to insert
     * @param projectId     the related project Id
     * @param reviewRespId  the reviewer's responsibility
     * @param rUserRoleId   the user role Id to insert
     * @param rRoleId       the role Id to insert
     * @param paymentInfoId the payment information Id to insert
     */
    private void insertUserRole(Connection conn, long resourceId, long resourceRoleId,
                                long projectId, String phaseId, long userId) {

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("INSERT INTO resource " +
                    "(resource_id, resource_role_id, project_id, project_phase_id, create_user, create_date, modify_user, modify_date) " +
                    "VALUES (?, ?, ?, ?, ?, CURRENT, ?, CURRENT)");


            int index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, resourceRoleId);
            ps.setLong(index++, projectId);
            ps.setString(index++, phaseId);
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();
            Common.close(ps);

            // External Reference ID
            ps = conn.prepareStatement("INSERT INTO resource_info " +
                    "(resource_id, resource_info_type_id, value, create_user, create_date, modify_user, modify_date) " +
                    " VALUES (?, ?, ?, ?, CURRENT, ?, CURRENT)");
            index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, RESOURCE_INFO_TYPE_EXTERNAL_ID); // External Reference ID 1
            ps.setString(index++, String.valueOf(userId));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();

            String handle = getUserHandleInfo(conn, userId);
            index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, 2); // handle
            ps.setString(index++, handle);
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();

            index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, 7); // payment
            ps.setString(index++, "0");
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();

            index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, 8); // payment status
            ps.setString(index++, "No");
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();

            // Registration Date.
            index = 1;
            ps.setLong(index++, resourceId);
            ps.setLong(index++, RESOURCE_INFO_TYPE_REGISTRATION_DATE); // External Reference ID 1
            ps.setString(index++, DATE_FORMAT.format(new Date()));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.setString(index++, String.valueOf(INTERNAL_ADMIN_USER));
            ps.executeUpdate();

            Common.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static final String SELECT_HANDLER = "SELECT handle FROM USER WHERE user_id = ? ";

    private String getUserHandleInfo(Connection conn, long userID)
            throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement(SELECT_HANDLER);
        pstmt.setLong(1, userID);

        ResultSet rs = pstmt.executeQuery();

        try {
            if (rs.next()) {
                return rs.getString(1);
            }

            return null;
        } finally {
            rs.close();
            pstmt.close();
        }
    }

    private long nextId(String tableId) {
        try {
            IDGenerator idgen = IDGeneratorFactory.getIDGenerator(tableId);
            return idgen.getNextID();
        } catch (IDGenerationException e) {
            throw new RuntimeException("Failed to get id generator for " + tableId);
        }
    }

    /**
     * Creates the rboard_application and user_roles rows and insert permissions for the
     * reviewers singing up.
     *
     * @param dataSource   the datasource being used
     * @param userId       the user id to insert
     * @param projectId    the project id to insert
     * @param reviewRespId the review responsibility id to insert
     * @param phaseId      the phase id
     * @param opensOn      timestamp when the positions opens on
     * @param reviewTypeId the type of the review
     * @param primary      true if the reviewer is signing up for primary reviewer position
     */
    public void createRBoardApplication(String dataSource, long userId,
                                        long projectId, int reviewRespId, int phaseId, Timestamp opensOn,
                                        int reviewTypeId, boolean primary) throws RBoardRegistrationException {

        log.debug("createRBoardApplications called...");

        IdGen idGen = null;
        try {
            idGen = createIDGen(dataSource);
        } catch (CreateException e) {
            throw (new EJBException("Couldn't create IDGenerator", e));
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(dataSource);

            // gets project info.
            Map projectInfo = getProjectInfo(projectId, conn);

            conn.setAutoCommit(false);

            //we're doing this so that we can have something to sync on.  if we don't lock
            //project, then people get register while we're still doing the selects to determine
            //if one should be able to register.  both people end up coming up ok to register and we
            //end up with more than one person in the same slot.
            updateForLock(conn, projectId);

            long start = System.currentTimeMillis();
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);

            insert(conn, "rboard_application",
                    new String[]{"user_id", "project_id", "phase_id", "review_resp_id", "primary_ind"},
                    new String[]{String.valueOf(userId), String.valueOf(projectId),
                            String.valueOf(phaseId), String.valueOf(reviewRespId),
                            String.valueOf(primary ? 1 : 0)});

            // insert common review role
            int roleId = REVIEWER_ROLE;
//            switch (reviewRespId) {
//                case 1:
//                    roleId = STRESS_REVIEWER_ROLE;
//                    break;
//                case 2:
//                    roleId = FAILURE_REVIEWER_ROLE;
//                    break;
//                case 3:
//                    roleId = ACCURACY_REVIWER_ROLE;
//                    break;
//                case 4:
//                    roleId = REVIEWER_ROLE;
//                    break;
//            }
            Map phaseInfos = getPhaseInfo(projectId, conn);
            String pid = (String) phaseInfos.get(String.valueOf(REVIEW_PHASE));
            // Prepre resource for review phase
            insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);

            if (primary) {
                // Prepare for primary screener
                roleId = PRIMARY_SCREEN_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(SCREEN_PHASE));
                insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);

                // Prepare for aggregator
                roleId = AGGREGATOR_REVIEWER_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(AGGREGATION_PHASE));
                insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);

                // Prepare for final review
                roleId = FINAL_REVIEWER_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(FINAL_REVIEW_PHASE));
                insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);
            }

            // Create forum permission
            Forums forumsBean = null;
            Context context = TCContext.getInitial(ApplicationServer.FORUMS_HOST_URL);
            ForumsHome forumsHome = (ForumsHome) context.lookup(ForumsHome.EJB_REF_NAME);
            forumsBean = forumsHome.create();
            forumsBean.assignRole(userId, "Software_Users_" + projectInfo.get("jiveCategoryId"));

            conn.commit();
            log.debug("Registration for project " + projectId + " completed in " + (System.currentTimeMillis() - start) + " milliseconds");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            rollback(conn);
            throw new EJBException(sqle);
        } catch (RBoardRegistrationException rbre) {
            rollback(conn);
            throw rbre;
        } catch (Exception e) {
            rollback(conn);
            throw new EJBException(e);
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    /**
     * Searches for existence of a particular row in rboard_application
     *
     * @param conn      the connection being used
     * @param userId    the user id to inspect
     * @param projectId the project id to inspect
     * @param phaseId   the phase id to inspect
     * @return true if row exists
     */
    private boolean exists(Connection conn, long userId, long projectId,
                           int phaseId) {
        try {
            selectLong(conn, "rboard_application", "user_id",
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
     * @param projectId  the project id to inspect
     * @param phaseId    the phase id to inspect
     * @return ResultSetContainer with the retrieved reviewers
     */
    private ResultSetContainer getReviewers(Connection conn, long projectId, int phaseId) {
        return selectSet("rboard_application",
                new String[]{"user_id", "review_resp_id", "primary_ind", "create_date"},
                new String[]{"project_id"},
                new String[]{String.valueOf(projectId)},
                conn);
    }

    /**
     * Retrieves the last timestamp when a reviewer signed up for a review position
     *
     * @param conn   the connection being used
     * @param userId the user id to inspect
     * @return the timestamp of the last sign up
     */
    private Timestamp getLatestReviewApplicationTimestamp(Connection conn, long userId) {

        log.debug("getLatestReviewApplicationTimestamp called...");

        StringBuffer query = new StringBuffer(200);
        query.append("select create_date from rboard_application where user_id = ?");
        query.append(" order by create_date desc");

        PreparedStatement ps = null;
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
            throw new EJBException(e);
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }

    /**
     * Retrieves the last timestamp when a reviewer signed up for a review position
     *
     * @param dataSource the datasuorce being used
     * @param userId     the user id to inspect
     * @return the timestamp for the last signup
     */
    public Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) {

        log.debug("getLatestReviewApplicationTimestamp called...");

        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            return getLatestReviewApplicationTimestamp(conn, userId);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e);
        } finally {
            close(conn);
        }
    }

    /**
     * Validates some non-transacional constraints for the review signup
     *
     * @param dataSource   the datasource being used
     * @param catalog      the catalog id of the project
     * @param reviewTypeId the review type selected
     * @param userId       the user id signing in
     * @param phaseId      the type of the project
     * @throws RBoardRegistrationException when validations fails
     */
    public void validateUser(String dataSource, int rootCategory, int reviewTypeId, long userId, int phaseId) throws RBoardRegistrationException {

        log.debug("validateUser called...");

        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);

            Map reviewRespMap = null;
            reviewRespMap = getReviewRespInfo();

            long catalogId = 0;
            try {
                catalogId = getCatalogId(conn, rootCategory);
            } catch (RowNotFoundException rnfe) {
                throw new RBoardRegistrationException("Invalid request. Unknown review category.");
            }

            long status = 0;
            try {
                status = getStatus(conn, userId, phaseId - 111, catalogId);
            } catch (RowNotFoundException rnfe) {
                try {
                    throw new RBoardRegistrationException("Sorry, you are not a " + getCatalogName(conn, catalogId) + " reviewer.  Please contact TopCoder if you would like to become one.");
                } catch (RowNotFoundException e) {
                    //this shouldn't really happen, but, in case, we'll be complete.
                    throw new RBoardRegistrationException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
                }
            }

            if (status != ACTIVE_REVIEWER) {
                throw new RBoardRegistrationException("Sorry, you are not authorized to perform reviews at this time.");
            }

            if (!reviewRespMap.containsKey(new Integer(reviewTypeId)) ||
                    !reviewRespMap.get(new Integer(reviewTypeId)).equals(new Integer(phaseId))) {
                throw new RBoardRegistrationException("Invalid request, incorrect review position specified.");
            }
        } catch (SQLException sqle) {
            throw (new EJBException(sqle));
        } finally {
            close(conn);
        }
    }

    /**
     * Validates some transacional constraints for the review signup
     *
     * @param dataSource   the datasource being used
     * @param projectId    the project id to validate
     * @param phaseId      the project type
     * @param userId       the user id to validate
     * @param opensOn      the timestamp when the position opnens
     * @param reviewTypeId the review type
     * @param primary      true if the position if for primary reviewer
     */
    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary)
            throws RBoardRegistrationException {

        log.debug("validateUser called...");

        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            conn.setAutoCommit(false);
            validateUserTrans(conn, projectId, phaseId, userId, opensOn, reviewTypeId, primary);
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            rollback(conn);
            throw new EJBException(sqle);
        } catch (RBoardRegistrationException rbre) {
            rollback(conn);
            throw rbre;
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(conn);
        }
    }

    /**
     * Validates some transacional constraints for the review signup
     *
     * @param conn         the connection being used
     * @param projectId    the project id to validate
     * @param phaseId      the project type
     * @param userId       the user id to validate
     * @param opensOn      the timestamp when the position opnens
     * @param reviewTypeId the review type
     * @param primary      true if the position if for primary reviewer
     */
    private void validateUserTrans(Connection conn, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary)
            throws RBoardRegistrationException {

        if (exists(conn, userId, projectId, phaseId)) {
            throw new RBoardRegistrationException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.  "
                    + "You will need to wait until "
                    + timeStampToString(opensOn));
        }

        Timestamp lastReviewApp = getLatestReviewApplicationTimestamp(conn, userId);
        if (lastReviewApp != null && System.currentTimeMillis() < lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY) {
            throw new RBoardRegistrationException("Sorry, you can not apply for a new review yet.  "
                    + "You will need to wait until "
                    + timeStampToString(new Timestamp(lastReviewApp.getTime() + RBoardApplication.APPLICATION_DELAY)));
        }

        ResultSetContainer reviewers = getReviewers(conn, projectId, phaseId);

        if (reviewers.size() == 3) {
            throw new RBoardRegistrationException("Sorry, the project's review positions are already full.");
        }

        if (primary) {
            for (Object reviewer : reviewers) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) reviewer;
                if (row.getIntItem("primary_ind") == 1) {
                    throw new RBoardRegistrationException("Sorry, this review position is already taken.");
                }
            }
        }

        if (phaseId == SoftwareComponent.DEV_PHASE) {
            for (Object reviewer : reviewers) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) reviewer;
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new RBoardRegistrationException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 1)) {
                throw new RBoardRegistrationException("Sorry, there was an error in the application");
            }
        } else {
            // Design.
            for (Object reviewer : reviewers) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) reviewer;
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
     * @param conn the connection being used
     * @return a map with the reviewers responsibility information
     */
    private Map getReviewRespInfo() {
        // review_resp table is removed
        Map returnMap = new HashMap();
        int[] respIds = {1, 2, 3, 4, 5, 6};
        int[] phaseIds = {113, 113, 113, 112, 112, 112};

        for (int i = 0; i < respIds.length; i++) {
            returnMap.put(new Integer(respIds[i]), new Integer(phaseIds[i]));
        }
        return returnMap;
    }


    /**
     * Retrieves a particular category's catalog id.
     *
     * @param conn      the connection being used
     * @param catalogId the category being inspected
     * @return the catalog's ID.
     * @since 1.0.2
     */
    private long getCatalogId(Connection conn, long categoryId) throws RowNotFoundException {
        return selectLong(conn,
                "category_catalog",
                "catalog_id",
                new String[]{"category_id"},
                new String[]{String.valueOf(categoryId)}).intValue();
    }

    /**
     * Retrieves a particular catalog name.
     *
     * @param conn      the connection being used
     * @param catalogId the catalog's ID
     * @return the catalog's name.
     * @since 1.0.2
     */
    private String getCatalogName(Connection conn, long catalogId) throws RowNotFoundException {
        return selectString(conn,
                "catalog",
                "catalog_name",
                new String[]{"catalog_id"},
                new String[]{String.valueOf(catalogId)});
    }

    /**
     * Retrieves the reviewer status of a particular user
     *
     * @param conn        the connection being used
     * @param userId      the user id to inspect
     * @param projectType the project type to inspect
     * @param projectType the catalogId to review
     * @return the status of the reviewer
     */
    private long getStatus(Connection conn, long userId, int projectType, long catalogId) throws RowNotFoundException {
        return selectLong(conn,
                "rboard_user",
                "status_id",
                new String[]{"user_id", "project_type_id", "catalog_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectType),
                        String.valueOf(catalogId)}).intValue();
    }

    /**
     * Retrieves SQL TimeStamp as a formatted string
     *
     * @param timeStamp the TimeStamp to format
     * @return the formatted TimeStamp
     */
    private static String timeStampToString(java.sql.Timestamp timeStamp) {
        String result = null;
        if (timeStamp != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(LONG_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(LONG_DATE_FORMAT.length());
            buffer = dateFormat.format(timeStamp, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }

    private void updateForLock(Connection conn, long projectId) throws SQLException {
        log.debug("lock called on project " + projectId);
        String query = "update project set project_id = project_id where project_id = ?";

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, projectId);
            ps.executeUpdate();
        } finally {
            close(ps);
        }
    }
}
