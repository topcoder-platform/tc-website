/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.apps.review.rboard;

import java.rmi.RemoteException;
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

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

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
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsHome;

/**
 * <p>An implementation of the <code>RBoard EJB</code>.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>Bean was moved from tc to tcs site and was updated to centralize all RBoard operations.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Schema was changed to allow reviewers for particular technologies.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Submitter role is disabled for the registering reviewer.</li>
 *   </ol>
 *
 *   Version 1.0.4 Change notes:
 *   <ol>
 *     <li> Modified code to set user permissions for new software forums.</li>
 *   </ol>
 *
 *   Version 1.0.5 Change notes:
 *   <ol>
 *     <li> Added a new reviewer application delay that's based on active projects rather than a fixed time.</li>
 *     <li>Removed getLatestApplicationReviewTimestamp. </li>
 *   </ol>
 *
 *   Version 1.0.6 Change notes:
 *   <ol>
 *     <li>Updated {@link #getReviewRespInfo()} method to include newly added reviewer types for Assembly competitions.
 *     </li>
 *   </ol>
 *
 *   Version 1.0.7 Change notes:
 *   <ol>
 *     <li>Added {@link #validateUserWithoutCatalog(String, int, long, int)} method to validate the Assembly reviewer
 *     permissions without taking any catalog into consideration.</li>
 *   </ol>
 *
 *   Version 1.0.8 Change notes:
 *   <ol>
 *     <li>Added support for Conceptualization, Specification and Application Testing Review projects.</li>
 *     <li>Fixed Architecture missing validation.</li>
 *   </ol>
 *
 *   Version 1.0.9 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.0.10 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 *
 *   Version 1.0.11 (Specification Review Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added new method createSpecReviewRBoardApplication to apply for spec reviews.</li>
 *   </ol>
 *
 *   Version 1.0.12 (Spec Reviews Finishing Touches v1.0) Change notes:
 *   <ol>
 *     <li>Now the read permissions are assigned to the spec reviewer.</li>
 *   </ol>
 *
 *   Version 1.0.13 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Added audit information when a resource is saved. (reviewer registration)</li>
 *   </ol>
 *
 *   Version 1.0.14 Change notes:
 *   <ol>
 *     <li>createSpecReviewRBoardApplication method rewritten to work with the new Spec Reviewer process.
 *     It now adds "Specification Reviewer" role to the parent contest in OR instead of a separate project in OR.
 *     </li>
 *   </ol>
 *   Version 1.0.15 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Copilot Posting.</li>
 *   </ol>
 *   Version 1.0.16 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #CONTENT_CREATION_PRIMARY_REVIEW_ID} constant.</li>
 *     <li>Updated {@link #validateRegularUserTrans(java.sql.Connection, long, int, long, Boolean, java.sql.Timestamp,
 *     int, boolean)} method to support validating review positions for content creation projects.</li>
 *     <li>Updated {@link #getReviewRespInfo()} method for support content creation contest.</li>
 *   </ol>
 *
 *   Version 1.0.17 Change notes:
 *   <ol>
 *     <li>createRBoardApplication and createSpecReviewRBoardApplication methods return boolean value
 *     indicating whether the timeline has been extended.
 *     </li>
 *     <li>Old-style Spec Review projects are not supported anymore.</li>
 *   </ol>
 *   
 *   Version 1.0.18 Change notes:
 *   <ol>
 *     <li>Added {@link #REPORTING_PRIMARY_REVIEW_ID} constant.</li>
 *     <li>Updated {@link #validateRegularUserTrans(java.sql.Connection, long, int, long, Boolean, java.sql.Timestamp,
 *     int, boolean)} method to support validating review positions for reporting projects.</li>
 *     <li>Updated {@link #getReviewRespInfo()} method for support reporting contest.</li>
 *   </ol>
 * </p>
 *   
 *   Version 1.0.19 (Online Review Update Review Management Topcoder web site assembly) Change notes:
 *   <ol>
 *     <li>Change Common.close() statement to close().</li>
 *     <li>Add support for the New Review Phases System.</li>
 *   </ol>
 *
 *   Version 1.0.19 Change notes:
  *   <ol>
  *     <li>Added {@link #BUG_HUNT_PRIMARY_REVIEW_ID} constant.</li>
  *     <li>Updated {@link #validateRegularUserTrans(java.sql.Connection, long, int, long, Boolean, java.sql.Timestamp,
  *     int, boolean)} method to support validating review positions for bug hunt projects.</li>
  *     <li>Updated {@link #getReviewRespInfo()} method for support bug hunt contest.</li>
  *   </ol>
 * </p>
 *
 * @author dok, ivern, isv, pulky, snow01, VolodymyrK, Blues, FireIce, lmmortal
 * @version 1.0.19
 */
public class RBoardApplicationBean extends BaseEJB {
    private static final int INTERNAL_ADMIN_USER = 100129;
    private static final int ACTIVE_REVIEWER = 100;

    private static final String LONG_DATE_FORMAT = "MM/dd/yyyy hh:mm:ss aaa";

    private static final int SCREEN_PHASE = 3;
    private static final int REVIEW_PHASE = 4;
    private static final int AGGREGATION_PHASE = 7;
    private static final int FINAL_REVIEW_PHASE = 10;
    private static final int SPECIFICATION_REVIEW_PHASE = 14;

    private static final int PRIMARY_SCREEN_ROLE = 2;
    private static final int AGGREGATOR_REVIEWER_ROLE = 8;
    private static final int FINAL_REVIEWER_ROLE = 9;
    private static final int SPECIFICATION_REVIEWER_ROLE = 18;

    private static final int RESOURCE_INFO_TYPE_EXTERNAL_ID = 1;
    private static final int RESOURCE_INFO_TYPE_REGISTRATION_DATE = 6;

    /**
     * For every active project a reviewer has, they get a compounded delay to sign up to new projects that is equal to
     * this value in milliseconds.
     */
    private static final int APPLICATION_DELAY_PER_ACTIVE_PROJECT = 6 * 60 * 60 * 1000;
    
    /**
     * For every active project a Primary Review Evaluator has, they get a compounded delay to sign up to new projects that is equal to
     * this value in milliseconds.
     * 
     * @since 1.0.16
     */
    private static final int APPLICATION_DEPLOY_PRIMARY_EVALUATOR_PER_ACTIVE_PROJECT = 12 * 60 * 60 * 1000;

    private static final String RESOURCE_ID_SEQ = "resource_id_seq";

    /**
     * <p>A <code>int</code> representing the primary review id for development projects.</p>
     *
     * @since 1.0.8
     */
    private static final int DEVELOPMENT_PRIMARY_REVIEW_ID = 2;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for development projects.</p>
     *
     * @since 1.0.16
     */
    private static final int DEVELOPMENT_NEW_PRIMARY_REVIEW_ID = 82;
    
    /**
     * <p>A <code>int</code> representing the primary review id for design projects.</p>
     *
     * @since 1.0.8
     */
    private static final int DESIGN_PRIMARY_REVIEW_ID = 4;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for design projects.</p>
     *
     * @since 1.0.16
     */
    private static final int DESIGN_NEW_PRIMARY_REVIEW_ID = 115;
    
    /**
     * <p>A <code>int</code> representing the primary review id for assembly projects.</p>
     *
     * @since 1.0.8
     */
    private static final int ASSEMBLY_PRIMARY_REVIEW_ID = 7;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for assembly projects.</p>
     *
     * @since 1.0.16
     */
    private static final int ASSEMBLY_NEW_PRIMARY_REVIEW_ID = 109;
    
    /**
     * <p>A <code>int</code> representing the primary review id for architecture projects.</p>
     *
     * @since 1.0.8
     */
    private static final int ARCHITECTURE_PRIMARY_REVIEW_ID = 10;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for architecture projects.</p>
     *
     * @since 1.0.16
     */
    private static final int ARCHITECTURE_NEW_PRIMARY_REVIEW_ID = 88;
    
    /**
     * <p>A <code>int</code> representing the primary review id for conceptualization projects.</p>
     *
     * @since 1.0.8
     */
    private static final int CONCEPTUALIZATION_PRIMARY_REVIEW_ID = 13;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for conceptualization projects.</p>
     *
     * @since 1.0.16
     */
    private static final int CONCEPTUALIZATION_NEW_PRIMARY_REVIEW_ID = 112;
    
    /**
     * <p>A <code>int</code> representing the primary review id for specification projects.</p>
     *
     * @since 1.0.8
     */
    private static final int SPECIFICATION_PRIMARY_REVIEW_ID = 16;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for specification projects.</p>
     *
     * @since 1.0.16
     */
    private static final int SPECIFICATION_NEW_PRIMARY_REVIEW_ID = 85;

    /**
     * <p>A <code>int</code> representing the primary review id for test suites projects.</p>
     *
     * @since 1.0.10
     */
    private static final int TEST_SUITES_PRIMARY_REVIEW_ID = 19;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for test suites projects.</p>
     *
     * @since 1.0.16
     */
    private static final int TEST_SUITES_NEW_PRIMARY_REVIEW_ID = 100;
    
    /**
     * <p>A <code>int</code> representing the primary review id for test scenarios projects.</p>
     *
     * @since 1.0.10
     */
    private static final int TEST_SCENARIOS_PRIMARY_REVIEW_ID = 31;

    /**
     * <p>A <code>int</code> representing the Primary Review Evaluator id for test scenarios projects.</p>
     *
     * @since 1.0.16
     */
    private static final int TEST_SCENARIOS_NEW_PRIMARY_REVIEW_ID = 91;
    
    /**
     * <p>An <code>int</code> representing the primary review id for ui prototype projects.</p>
     *
     * @since 1.0.9
     */
    private static final int UI_PROTOTYPE_PRIMARY_REVIEW_ID = 22;

    /**
     * <p>An <code>int</code> representing the Primary Review Evaluator id for ui prototype projects.</p>
     *
     * @since 1.0.16
     */
    private static final int UI_PROTOTYPE_NEW_PRIMARY_REVIEW_ID = 121;
    
    /**
     * <p>An <code>int</code> representing the primary review id for ria build projects.</p>
     *
     * @since 1.0.9
     */
    private static final int RIA_BUILD_PRIMARY_REVIEW_ID = 25;

    /**
     * <p>An <code>int</code> representing the Primary Review Evaluator id for ria build projects.</p>
     *
     * @since 1.0.16
     */
    private static final int RIA_BUILD_NEW_PRIMARY_REVIEW_ID = 103;
    
    /**
     * <p>An <code>int</code> representing the primary review id for ria component projects.</p>
     *
     * @since 1.0.9
     */
    private static final int RIA_COMPONENT_PRIMARY_REVIEW_ID = 28;

    /**
     * <p>An <code>int</code> representing the Primary Review Evaluator id for ria component projects.</p>
     *
     * @since 1.0.16
     */
    private static final int RIA_COMPONENT_NEW_PRIMARY_REVIEW_ID = 97;

    /**
     * <p>An <code>int</code> representing the primary review id for Copilot Posting.</p>
     *
     * @since 1.0.15
     */
    private static final int COPILOT_POSTING_PRIMARY_REVIEW_ID = 38;
	
	/**
     * <p>An <code>int</code> representing the Primary Review Evaluator id for Copilot Posting.</p>
     *
     * @since 1.0.16
     */
    private static final int COPILOT_POSTING_NEW_PRIMARY_REVIEW_ID = 94;

    /**
     * <p>An <code>int</code> representing the primary review id for Content Creation.</p>
     *
     * @since 1.0.16
     */
    private static final int CONTENT_CREATION_PRIMARY_REVIEW_ID = 63;
	
	/**
     * <p>An <code>int</code> representing the primary review id for Content Creation.</p>
     *
     * @since 1.0.16
     */
    private static final int CONTENT_CREATION_NEW_PRIMARY_REVIEW_ID = 106;

    /**
     * <p>An <code>int</code> representing the primary review id for Reporting.</p>
     *
     * @since 1.0.18
     */
    private static final int REPORTING_PRIMARY_REVIEW_ID = 76;
	
    /**
     * <p>An <code>int</code> representing the primary review id for Reporting.</p>
     *
     * @since 1.0.18
     */
    private static final int REPORTING_NEW_PRIMARY_REVIEW_ID = 127;	

    /**
     * <p>An <code>int</code> representing the primary review id for Bug Hunt contest.</p>
     *
     * @since 1.0.19
     */
    private static final int BUG_HUNT_PRIMARY_REVIEW_ID = 131;

    /**
     * <p>A <code>String</code> containing the error message for inconsistent reviewers for most project types.</p>
     *
     * @since 1.0.8
     */
    private static final String INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON =
        "Sorry, there was an error in the application";

    /**
     * <p>A <code>String</code> containing the error message for inconsistent reviewers for development project
     * types.</p>
     *
     * @since 1.0.8
     */
    private static final String INCONSISTENT_REVIEWERS_ERROR_MESSAGE_DEVELOPMENT =
        "Sorry, there was an error in the application " +
        "(primary reviewers must be failure reviewers, and " +
        "vice versa).";

    /**
     * This constant represents the project user audit creation type
     *
     * @since 1.0.13
     */
    private static final int PROJECT_USER_AUDIT_CREATE_TYPE = 1;

    /**
     * This constant represents the SQL for inserting project user audit records
     *
     * @since 1.0.13
     */
    private static final String SQL_INSERT_PROJECT_USER_AUDIT =
        "INSERT INTO project_user_audit (project_user_audit_id, project_id, resource_user_id, " +
            " resource_role_id, audit_action_type_id, action_date, action_user_id) " +
            " VALUES (PROJECT_USER_AUDIT_SEQ.nextval, ?, ?, ?, ?, CURRENT, ?)";


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
     * @param conn the connection being used
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
                                       + " left outer join comp_jive_category_xref cjcx on cjcx.comp_vers_id = cv.comp_vers_id "
                                       + "where p.project_id = ? "
                                       + "and p.project_category_id = pt.project_category_id "
                                       + "and p.project_id = pi_cn.project_id and pi_cn.project_info_type_id = 6 "
                                       + "and p.project_id = pi_vt.project_id and pi_vt.project_info_type_id = 7 "
                                       + "and p.project_id = pi_vi.project_id and pi_vi.project_info_type_id = 2 "
                                       + "and cv.component_id = pi_vi.value and cv.phase_id in (112, 113) "
            );
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                returnMap.put("projectName", rs.getString("component_name"));
                returnMap.put("projectVersion", rs.getString("version_text").trim());
                returnMap.put("projectType", rs.getString("project_type_name"));
                if(rs.getObject("jive_category_id") != null) {
                    returnMap.put("jiveCategoryId", rs.getString("jive_category_id"));
                }
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
     * @param conn the connection being used
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

    /**
     * Gets resource role ID for the specified review_resp_id.
	 * The value is retrieved directly from the review_resp table.
     *
     * @param reviewRespId review_resp_id to retrieve the role ID for.
     * @param conn the connection being used
     * @return Resource role ID.
     * @throws SQLException when DB operations fails
     *
     * @since 1.0.14
     */
    private int getResourceRoleIdByReviewRespId(int reviewRespId, Connection conn)
            throws SQLException {

		log.debug("getResourceRoleIdByReviewRespId called: reviewRespId = " + reviewRespId);

        PreparedStatement ps = null;
        ResultSet rs = null;
		int resourceRoleId;
        try {
            ps = conn.prepareStatement("select resource_role_id from review_resp where review_resp_id = ?");
            ps.setLong(1, reviewRespId);

            rs = ps.executeQuery();
            if (rs.next()) {
                resourceRoleId = rs.getInt("resource_role_id");
            } else {
                throw (new EJBException("Couldn't resource role ID for review resp ID: " + reviewRespId));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw (new EJBException("Getting resource role ID failed", sqle));
        } finally {
            close(rs);
            close(ps);
        }

        return resourceRoleId;
    }

    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("MM.dd.yyyy hh:mm a", Locale.US);

    /**
     * Inserts a specified user role
     *
     * @param conn the connection being used
     * @param rUserRoleVId the existing userRoleVId
     * @param userId the user to insert
     * @param projectId the related project Id
     * @param reviewRespId the reviewer's responsibility
     * @param rUserRoleId the user role Id to insert
     * @param rRoleId the role Id to insert
     * @param paymentInfoId the payment information Id to insert
     */
    private void insertUserRole(Connection conn, long resourceId, long resourceRoleId,
                                long projectId, String phaseId, long userId) {

		log.debug("insertUserRole called: projectId = " + projectId + ", resourceRoleId = " + resourceRoleId +", phaseId = " + phaseId + ", userId = " + userId);
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("INSERT INTO resource " +
                                       "(resource_id, resource_role_id, project_id, project_phase_id, create_user, " +
                                       "create_date, modify_user, modify_date) " +
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

            // Audit resource addition
            auditResourceAddition(conn, userId, projectId, resourceRoleId);

            // External Reference ID
            ps = conn.prepareStatement("INSERT INTO resource_info " +
                                       "(resource_id, resource_info_type_id, value, create_user, create_date, " +
                                       "modify_user, modify_date) " +
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
        } finally {
            Common.close(ps);
        }
    }

    private static final String SELECT_HANDLER = "SELECT handle FROM USER WHERE user_id = ? ";

    private String getUserHandleInfo(Connection conn, long userID)
            throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement(SELECT_HANDLER);
        pstmt.setLong(1, userID);

        String ret = null;
        ResultSet rs = pstmt.executeQuery();

        try {
            if (rs.next()) {
                ret = rs.getString(1);
            }
        } finally {
            rs.close();
            pstmt.close();
        }

		return ret;
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
     * Creates the rboard_application and user_roles rows and insert permissions for the reviewers singing up.
     *
     * @param dataSource the datasource being used
     * @param userId the user id to insert
     * @param projectId the project id to insert
     * @param reviewRespId the review responsibility id to insert
     * @param phaseId the phase id
     * @param open Whether the registration is actually open
     * @param opensOn timestamp when the positions opens on
     * @param reviewTypeId the type of the review
     * @param primary true if the reviewer is signing up for primary reviewer position
     * @return true if the timeline was extended
     */
    public boolean createRBoardApplication(String dataSource, long userId,
                                        long projectId, int reviewRespId, int phaseId, Boolean open, Timestamp opensOn,
                                        int reviewTypeId, boolean primary) throws RBoardRegistrationException {

        log.debug("createRBoardApplications called...");

        IdGen idGen = null;
        try {
            idGen = createIDGen(dataSource);
        } catch (CreateException e) {
            throw (new EJBException("Couldn't create IDGenerator", e));
        }

        Connection conn = null;

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
            validateRegularUserTrans(conn, projectId, phaseId, userId, open, opensOn, reviewTypeId, primary);

            insert(conn, "rboard_application",
                   new String[]{"user_id", "project_id", "phase_id", "review_resp_id", "primary_ind"},
                   new String[]{String.valueOf(userId), String.valueOf(projectId),
                                String.valueOf(phaseId), String.valueOf(reviewRespId),
                                String.valueOf(primary ? 1 : 0)});

            // insert common review role
            int roleId = getResourceRoleIdByReviewRespId(reviewRespId, conn);

            Map phaseInfos = getPhaseInfo(projectId, conn);
            String pid = (String) phaseInfos.get(String.valueOf(getPhaseTypeIdByResourceRole(conn, roleId)));
            // Prepare resource for review phase
            insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);

            if (primary) {
                // Prepare for primary screener
                roleId = PRIMARY_SCREEN_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(SCREEN_PHASE));
                if (pid != null && !pid.equals("")) {
                	insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);
                }

                // Prepare for aggregator
                roleId = AGGREGATOR_REVIEWER_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(AGGREGATION_PHASE));
                if (pid != null && !pid.equals("")) {
                	insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);
                }

                // Prepare for final review
                roleId = FINAL_REVIEWER_ROLE;
                pid = (String) phaseInfos.get(String.valueOf(FINAL_REVIEW_PHASE));
                if (pid != null && !pid.equals("")) {
                	insertUserRole(conn, nextId(RESOURCE_ID_SEQ), roleId, projectId, pid, userId);
                }
            }

            boolean extended = false;
            if (primary) {
                extended = extendOpenPhase(conn, projectId, SCREEN_PHASE, 6) || extended;
            }

            extended = extendOpenPhase(conn, projectId, REVIEW_PHASE, 48) || extended;

            // Create forum permission
            Forums forumsBean = null;
            Context context = TCContext.getInitial(ApplicationServer.FORUMS_HOST_URL);
            ForumsHome forumsHome = (ForumsHome) context.lookup(ForumsHome.EJB_REF_NAME);
            forumsBean = forumsHome.create();
            if (projectInfo.containsKey("jiveCategoryId")) {
                forumsBean.assignRole(userId, "Software_Users_" + projectInfo.get("jiveCategoryId"));
            }
            conn.commit();
            log.debug("Registration for project " + projectId + " completed in " + (System.currentTimeMillis() - start)
                      + " milliseconds");

            return extended;
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
            close(conn);
        }
    }

    /**
     * Creates the spec review rboard_application and "Specification Reviewer" resource for the contest in OR.
     *
     * Updated for Version 1.0.12
     *      - Now the write permissions for the contest are assigned to the spec reviewer.
	 *
     * Updated for Version 1.0.14
     *      - The method was completely rewritten to adapt for the new Spec Review process,
	 *        where Spec Review is a set of phases in the parent project in OR, not a spearate OR project.
     *
     * @param dataSource the datasource being used
     * @param userId the user id to insert
     * @param projectId the project id to insert
     * @param reviewRespId the review responsibility id to insert
     * @param phaseId the phase id
     * @param open Whether the registration is actually open
     * @param opensOn timestamp when the positions opens on
     * @param reviewTypeId the type of the review
     * @return true if the timeline was extended	 
     * @throws RBoardRegistrationException if an unexpected error occurs.
     * @throws RemoteException if an error occurs while calling EJB method remotely.
     * @throws EJBException if an error occurs doing persistence operations
     * @since 1.0.14
     */
    public boolean createSpecReviewRBoardApplication(String dataSource, long userId,
                                        long projectId, int reviewRespId, int phaseId, Boolean open, Timestamp opensOn,
                                        int reviewTypeId) throws RBoardRegistrationException {

        log.debug("createSpecReviewRBoardApplication called...");

        IdGen idGen = null;
        try {
            idGen = createIDGen(dataSource);
        } catch (CreateException e) {
            throw (new EJBException("Couldn't create IDGenerator", e));
        }

        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);

            // Check that the position applied is one of the spec review ones.
            int roleId = getResourceRoleIdByReviewRespId(reviewRespId, conn);
            if (roleId != SPECIFICATION_REVIEWER_ROLE) {
                throw new RBoardRegistrationException("Invalid request, incorrect review position specified. Not Specification Reviewer Role.");
            }

            // gets project info.
            Map projectInfo = getProjectInfo(projectId, conn);

            conn.setAutoCommit(false);

            //we're doing this so that we can have something to sync on.  if we don't lock
            //project, then people get register while we're still doing the selects to determine
            //if one should be able to register.  both people end up coming up ok to register and we
            //end up with more than one person in the same slot.
            updateForLock(conn, projectId);

            long start = System.currentTimeMillis();
            validateSpecReviewUserTrans(conn, projectId, phaseId, userId, open, opensOn, reviewTypeId);

            Map phaseInfos = getPhaseInfo(projectId, conn);
            String pid = (String) phaseInfos.get(String.valueOf(SPECIFICATION_REVIEW_PHASE));
			if (pid == null || pid.equals("")) {
			    throw new RBoardRegistrationException("Invalid state of the project, no Specification Review phase found.");
			}

            insert(conn, "rboard_application",
                   new String[]{"user_id", "project_id", "phase_id", "review_resp_id", "primary_ind"},
                   new String[]{String.valueOf(userId), String.valueOf(projectId),
                                String.valueOf(phaseId), String.valueOf(reviewRespId),
                                String.valueOf(0)});

            // Prepare resource for review phase
            insertUserRole(conn, nextId(RESOURCE_ID_SEQ), SPECIFICATION_REVIEWER_ROLE, projectId, pid, userId);

            boolean extended = extendOpenPhase(conn, projectId, SPECIFICATION_REVIEW_PHASE, 2);

            // Create forum permission
            Forums forumsBean = null;
            Context context = TCContext.getInitial(ApplicationServer.FORUMS_HOST_URL);
            ForumsHome forumsHome = (ForumsHome) context.lookup(ForumsHome.EJB_REF_NAME);
            forumsBean = forumsHome.create();
            forumsBean.assignRole(userId, "Software_Users_" + projectInfo.get("jiveCategoryId"));

            conn.commit();
            log.debug("Registration for spec review for project " + projectId + " completed in "
                      + (System.currentTimeMillis() - start) + " milliseconds");

            return extended;
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
            close(conn);
        }
    }

    /**
     * Extend the deadline of the phase of the specified type to be at least specified number of hours from now.
	 * The phase is only extended if open.
     *
     * @param conn the connection being used
     * @param projectId the project id to inspect
     * @param phaseTypeId the type of the phase to extend
	 * @param hours the minimum number of fours from now the new deadline should be
     * @return true if extended
     */
    private boolean extendOpenPhase(Connection conn, long projectId, int phaseTypeId, int hours) throws SQLException {

        log.debug("extendOpenPhase called: projectId = " + projectId + ", phaseTypeId = " + phaseTypeId);
		
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("update project_phase set " +
                    " duration = ((current + ? units hour) - actual_start_time)::interval second(9) to second::char(16)::decimal(16,0)*1000, " +
                    " scheduled_end_time = (current + ? units hour) " +
                    " where " +
                    " project_id=? and phase_type_id=? and " +
                    " actual_start_time is not null and " +
                    " phase_status_id=2 and (current + ? units hour) > scheduled_end_time");

            ps.setInt(1, hours);
            ps.setInt(2, hours);
            ps.setLong(3, projectId);
            ps.setInt(4, phaseTypeId);
            ps.setInt(5, hours);

            int updated = ps.executeUpdate();
			
            log.debug("Number of extended phases: " + updated);
			
            return updated > 0;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw (new EJBException("Extending phase failed.", sqle));
        } finally {
            close(ps);
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
            selectLong(conn, "rboard_application", "user_id",
                       new String[]{"user_id", "project_id", "phase_id"},
                       new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)});
        } catch (RowNotFoundException e) {
            return false;
        }
        return true;
    }

    /**
     * Retrieves reviewers for a particular project and phase ID.
     *
     * @param dataSource the datasource being used
     * @param projectId the project id to inspect
     * @param phaseId the phase id to inspect
     * @return ResultSetContainer with the retrieved reviewers
     */
    private ResultSetContainer getReviewers(Connection conn, long projectId, int phaseId) {
        return selectSet("rboard_application",
                         new String[]{"user_id", "review_resp_id", "primary_ind", "create_date"},
                         new String[]{"project_id", "phase_id"},
                         new String[]{String.valueOf(projectId), String.valueOf(phaseId)},
                         conn);
    }

    /**
     * Retrieves the time a reviewer should wait before being able to apply to a project.
     *
     * For every active project (defined as a project the reviewer has signed up for that is active and without a
     * finished review), the reviewer gets a compounded delay of APPLICATION_DELAY_PER_ACTIVE_PROJECT.
     *
     * [TCWEB-442]: don't count a project as active if submission phase is closed and there are no active submissions.
     *
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @return the time to wait in milliseconds
     */
    private long getApplicationDelay(Connection conn, long userId) {
        log.debug("getApplicationDelay(Connection conn, long userId) called...");

        final String query =
                "select count(*) as active_projects " +
                "  from project p " +
                "     , project_phase pp_review " +
                "     , resource r " +
                "     , resource_info ri_userid " +
                " where p.project_status_id = 1 " +
                "   and p.project_id = pp_review.project_id " +
                "   and pp_review.phase_type_id in (4, 15) " +
                "   and pp_review.phase_status_id != 3 " +
                "   and (pp_review.scheduled_end_time >= current " +
                "        or ((select count(*) " +
                "               from review " +
                "              where resource_id = r.resource_id " +
                "                and committed = 1) " +
                "            < (select count(*) " +
                "                 from submission s " +
                "                    , upload u " +
                "                where u.project_id = p.project_id " +
                "                  and u.upload_type_id = 1 " +
                "                  and u.upload_id = s.upload_id " +
                "                  and s.submission_type_id = 1 " +
                "                  and s.submission_status_id = 1)) " +
                "        or (p.project_category_id = 2 " +
                "            and not exists (select * " +
                "                              from upload u " +
                "                             where u.resource_id = r.resource_id " +
                "                               and u.upload_type_id = 2))) " +
                " and ( exists (select 1  " +                              // There's at least one active submission...
                "            from submission s " +
                "             , upload u " +
                "             where u.project_id = p.project_id     " +
                "             and u.upload_type_id = 1              " +
                "             and u.upload_id = s.upload_id         " +
                "             and s.submission_type_id = 1          " +
                "             and s.submission_status_id = 1)       " +
                "         or exists(                               " +  // or the submission phase is scheduled or open
                "            select 1 from project_phase pp_subm where pp_subm.phase_type_id = 2 " +
                "            and pp_subm.phase_status_id in (1,2) " +
                "            and pp_subm.project_id = p.project_id)) " +
                "   and p.project_id = r.project_id " +
                "   and r.resource_role_id in (4, 5, 6, 7, 19) " +
                "   and r.resource_id = ri_userid.resource_id " +
                "   and ri_userid.resource_info_type_id = 1 " +
                "   and ri_userid.value = ? ";
        
        // query the application deploy for Primary Review Evaluator
        final String query2 =
            "select count(*) as active_projects " +
            "  from project p " +
            "     , project_phase pp_review " +
            "     , resource r " +
            "     , resource_info ri_userid " +
            " where p.project_status_id = 1 " +
            "   and p.project_id = pp_review.project_id " +
            "   and pp_review.phase_type_id = 16 " +
            "   and pp_review.phase_status_id != 3 " +
            " and ( exists (select 1  " +                              // There's at least one active submission...
            "            from submission s " +
            "             , upload u " +
            "             where u.project_id = p.project_id     " +
            "             and u.upload_type_id = 1              " +
            "             and u.upload_id = s.upload_id         " +
            "             and s.submission_type_id = 1          " +
            "             and s.submission_status_id = 1)       " +
            "         or exists(                               " +  // or the submission phase is scheduled or open
            "            select 1 from project_phase pp_subm where pp_subm.phase_type_id = 2 " +
            "            and pp_subm.phase_status_id in (1,2) " +
            "            and pp_subm.project_id = p.project_id)) " +
            "   and p.project_id = r.project_id " +
            "   and r.resource_role_id = 20 " +
            "   and r.resource_id = ri_userid.resource_id " +
            "   and ri_userid.resource_info_type_id = 1 " +
            "   and ri_userid.value = ? ";

        PreparedStatement ps = null;
        ResultSet rs = null;
        int activeProjects = 0;
        int activeProjects2 = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                activeProjects = rs.getInt("active_projects");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e);
        } finally {
            close(rs);
            close(ps);
            rs = null;
            ps = null;
        }
        try {
            ps = conn.prepareStatement(query2);
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                activeProjects2 = rs.getInt("active_projects");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e);
        } finally {
            close(rs);
            close(ps);
        }
        return activeProjects * APPLICATION_DELAY_PER_ACTIVE_PROJECT + activeProjects2 * APPLICATION_DEPLOY_PRIMARY_EVALUATOR_PER_ACTIVE_PROJECT;
    }

    /**
     * Retrieves the time a reviewer should wait before being able to apply to a project.
     *
     * For every active project (defined as a project the reviewer has signed up for that is active and without a
     * finished review), the reviewer gets a compounded delay of APPLICATION_DELAY_PER_ACTIVE_PROJECT.
     *
     * @param dataSource the datasource being used
     * @param userId the user id to inspect
     * @return the time to wait in milliseconds
     */
    public long getApplicationDelay(String dataSource, long userId) {
        log.debug("getApplicationDelay(String dataSource, long userId) called...");

        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            return getApplicationDelay(conn, userId);
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
     * @param dataSource the datasource being used
     * @param catalog the catalog id of the project
     * @param reviewTypeId the review type selected
     * @param userId the user id signing in
     * @param phaseId the type of the project
     * @throws RBoardRegistrationException when validations fails
     */
    public void validateUser(String dataSource, int rootCategory, int reviewTypeId, long userId, int phaseId)
         throws RBoardRegistrationException {

        log.debug("validateUser called...");

		// Check for the "old-style" Spec Review projects which are not supported anymore.
		if (reviewTypeId == 37) {
            throw new RBoardRegistrationException("Old-style Spec Review projects are not supported anymore.");
		}

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
	            if (phaseId > WebConstants.SPECIFICATION_COMPETITION_OFFSET) {
                    status = getStatus(conn, userId, phaseId - 111 - WebConstants.SPECIFICATION_COMPETITION_OFFSET, catalogId);
				} else {
                    status = getStatus(conn, userId, phaseId - 111, catalogId);
				}
            } catch (RowNotFoundException rnfe) {
                try {
                    throw new RBoardRegistrationException("Sorry, you are not a " + getCatalogName(conn, catalogId)
                                                          + " reviewer.  Please contact TopCoder if you would like to "
                                                          + "become one.");
                } catch (RowNotFoundException e) {
                    //this shouldn't really happen, but, in case, we'll be complete.
                    throw new RBoardRegistrationException("Sorry, you are not a reviewer. Please contact TopCoder if "
                                                          + "you would like to become one.");
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
     * @param dataSource the datasource being used
     * @param projectId the project id to validate
     * @param phaseId the project type
     * @param userId the user id to validate
     * @param open Whether the registration is actually open
     * @param opensOn the timestamp when the position opnens
     * @param reviewTypeId the review type
     * @param primary true if the position if for primary reviewer
     */
    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Boolean open,
                                  Timestamp opensOn, int reviewTypeId, boolean primary)
            throws RBoardRegistrationException {

        log.debug("validateUserTrans called...");

        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            conn.setAutoCommit(false);
			if (phaseId > WebConstants.SPECIFICATION_COMPETITION_OFFSET) {
			    validateSpecReviewUserTrans(conn, projectId, phaseId, userId, open, opensOn, reviewTypeId);
            } else {
                validateRegularUserTrans(conn, projectId, phaseId, userId, open, opensOn, reviewTypeId, primary);
			}
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
     * <p>Verifies that the specified user is granted a permission to take the specified review position for the
     * projects of specified type without any regard to catalogs.</p>
     *
     * @param dataSource a <code>String</code> providing the name referencing the data source in <code>JNDI</code>
     * context.
     * @param reviewTypeId an <code>int</code> referencing the review position type.
     * @param userId a <code>long</code> providing the ID of a user to be validated.
     * @param projectTypeId an <code>int</code> providing the ID of a project category.
     * @throws RBoardRegistrationException if specified user is not granted the appropriate permission.
     * @throws RemoteException if an error occurs while calling EJB method remotely.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    public void validateUserWithoutCatalog(String dataSource, int reviewTypeId, long userId, int projectTypeId)
            throws RBoardRegistrationException, RemoteException {
        log.debug("validateUserWithoutCatalog called...");
		
		// Check for the "old-style" Spec Review projects which are not supported anymore.
		if (reviewTypeId == 37) {
            throw new RBoardRegistrationException("Old-style Spec Review projects are not supported anymore.");
		}		
		
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);

            Map reviewRespMap = null;
            reviewRespMap = getReviewRespInfo();

            long status = 0;
            try {
	            if (projectTypeId > WebConstants.SPECIFICATION_COMPETITION_OFFSET) {
                    status = getStatus(conn, userId, projectTypeId - WebConstants.SPECIFICATION_COMPETITION_OFFSET);
				} else {
                    status = getStatus(conn, userId, projectTypeId);
				}
            } catch (RowNotFoundException rnfe) {
                rnfe.printStackTrace();
                try {
                    throw new RBoardRegistrationException("Sorry, you are not a "
                                                          + getProjectCategoryName(conn, projectTypeId)
                                                          + " reviewer. Please contact TopCoder if you would like to "
                                                          + "become one.");
                } catch (RowNotFoundException e) {
                    e.printStackTrace();
                    //this shouldn't really happen, but, in case, we'll be complete.
                    throw new RBoardRegistrationException("Sorry, you are not a reviewer. Please contact TopCoder if "
                                                          + "you would like to become one.");
                }
            }
            if (status != ACTIVE_REVIEWER) {
                throw new RBoardRegistrationException("Sorry, you are not authorized to perform reviews at this time.");
            }

            String tmp = "!!!!!! DEBUG - reviewTypeId" + reviewTypeId + " projectTypeId:" + projectTypeId;
            
            tmp += "\n!!!!!! DEBUG - reviewTypeId check:" + reviewRespMap.containsKey(new Integer(reviewTypeId)) + " projectTypeId check:" + reviewRespMap.get(reviewTypeId).equals(projectTypeId + 111);
            
            if (!reviewRespMap.containsKey(new Integer(reviewTypeId))
                || !reviewRespMap.get(reviewTypeId).equals(projectTypeId + 111)) {
                throw new RBoardRegistrationException("Invalid request, incorrect review position specified.\n" + tmp);
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw (new EJBException(sqle));
        } finally {
            close(conn);
        }
    }

    /**
     * Validates some transactional constraints for the review signup
     *
     * @param conn the connection being used
     * @param projectId the project id to validate
     * @param phaseId the project type
     * @param userId the user id to validate
     * @param open Whether the registration is actually open
     * @param opensOn the timestamp when the position opens
     * @param reviewTypeId the review type
     * @param primary true if the position if for primary reviewer
     *
     * @throws RBoardRegistrationException if there are validation errors
     */
    private void validateRegularUserTrans(Connection conn, long projectId, int phaseId, long userId, Boolean open,
                                   Timestamp opensOn, int reviewTypeId, boolean primary)
            throws RBoardRegistrationException, SQLException {
        log.debug("validateRegularUserTrans called...");

        if (exists(conn, userId, projectId, phaseId)) {
            throw new RBoardRegistrationException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.  "
                                                  + "You will need to wait until "
                                                  + timeStampToString(opensOn));
        }

        if (!open) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.");
        }

        long applicationDelay = getApplicationDelay(conn, userId);
        if (System.currentTimeMillis() < opensOn.getTime() + applicationDelay) {
            throw new RBoardRegistrationException("Sorry, you can not apply for this review yet.  "
                                                  + "You will need to wait until "
                                                  + timeStampToString(new Timestamp(opensOn.getTime()
                                                                                    + applicationDelay)));
        }

        ResultSetContainer reviewers = getReviewers(conn, projectId, phaseId);

        if (reviewers.size() >= 3) {
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

        boolean newReviewSystem = isNewReviewSystem(conn, projectId);
        if (phaseId == SoftwareComponent.DEV_PHASE) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, DEVELOPMENT_PRIMARY_REVIEW_ID, DEVELOPMENT_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_DEVELOPMENT);
        } else if (phaseId == SoftwareComponent.DESIGN_PHASE) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, DESIGN_PRIMARY_REVIEW_ID, DESIGN_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.ASSEMBLY_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, ASSEMBLY_PRIMARY_REVIEW_ID, ASSEMBLY_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.ARCHITECTURE_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, ARCHITECTURE_PRIMARY_REVIEW_ID, ARCHITECTURE_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.CONCEPTUALIZATION_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, CONCEPTUALIZATION_PRIMARY_REVIEW_ID, CONCEPTUALIZATION_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.SPECIFICATION_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, SPECIFICATION_PRIMARY_REVIEW_ID, SPECIFICATION_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.TEST_SUITES_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, TEST_SUITES_PRIMARY_REVIEW_ID, TEST_SUITES_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.TEST_SCENARIOS_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, TEST_SCENARIOS_PRIMARY_REVIEW_ID, TEST_SCENARIOS_NEW_PRIMARY_REVIEW_ID,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.UI_PROTOTYPE_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, UI_PROTOTYPE_PRIMARY_REVIEW_ID, UI_PROTOTYPE_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.RIA_BUILD_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, RIA_BUILD_PRIMARY_REVIEW_ID, RIA_BUILD_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.RIA_COMPONENT_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, RIA_COMPONENT_PRIMARY_REVIEW_ID, RIA_COMPONENT_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.COPILOT_POSTING_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, COPILOT_POSTING_PRIMARY_REVIEW_ID, COPILOT_POSTING_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.CONTENT_CREATION_PROJECT_TYPE + 111)) {
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, CONTENT_CREATION_PRIMARY_REVIEW_ID, CONTENT_CREATION_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.REPORTING_PROJECT_TYPE + 111)) {
           validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, REPORTING_PRIMARY_REVIEW_ID, REPORTING_NEW_PRIMARY_REVIEW_ID,
                INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
        } else if (phaseId == (WebConstants.BUG_HUNT_PROJECT_TYPE + 111)) {
            // TODO: Add bug hunt pirmary review id for new review system
            validateReviewPositions(newReviewSystem, reviewTypeId, primary, reviewers, BUG_HUNT_PRIMARY_REVIEW_ID, -1,
                    INCONSISTENT_REVIEWERS_ERROR_MESSAGE_COMMON);
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
     * Validates some transactional constraints for the spec review signup.
     *
     * @param conn the connection being used
     * @param projectId the project id to validate
     * @param phaseId the project type
     * @param userId the user id to validate
     * @param open Whether the registration is actually open
     * @param opensOn the timestamp when the position opens
     * @param reviewTypeId the review type
     *
     * @throws RBoardRegistrationException if there are validation errors
     */
    private void validateSpecReviewUserTrans(Connection conn, long projectId, int phaseId, long userId, Boolean open,
                                   Timestamp opensOn, int reviewTypeId)
            throws RBoardRegistrationException {
        log.debug("validateSpecReviewUserTrans called...");

        if (exists(conn, userId, projectId, phaseId)) {
            throw new RBoardRegistrationException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.  "
                                                  + "You will need to wait until "
                                                  + timeStampToString(opensOn));
        }

        if (!open) {
            throw new RBoardRegistrationException("Sorry, this project is not open for review yet.");
        }

        ResultSetContainer reviewers = getReviewers(conn, projectId, phaseId);

        if (reviewers.size() >= 1) {
            throw new RBoardRegistrationException("Sorry, the project's review positions are already full.");
        }
    }

    /**
     * Helper private method to validate review positions.
     *
     * @param reviewTypeId the Review Type Id being validated
     * @param primary the Primary flag being validated
     * @param reviewers the list of reviewers being validated
     * @param reviewers the corresponding Primary Review Id according to the project type
     *
     * @throws RBoardRegistrationException if the review position is taken of the url is not consistent
     * @since 1.0.8
     */
    private void validateReviewPositions(boolean isNewReviewSystem, int reviewTypeId, boolean primary,
            ResultSetContainer reviewers, int primaryReviewId, Integer newPrimaryReviewId, String inconsistencyErrorMessage)
            throws RBoardRegistrationException {

        for (Object reviewer : reviewers) {
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) reviewer;
            if (row.getIntItem("review_resp_id") == reviewTypeId) {
                throw new RBoardRegistrationException("Sorry, this review position is already taken.");
            }
        }
        // If somebody came in by constructing the URL, make sure this is consistent too.
        if (primary != (reviewTypeId == (isNewReviewSystem ? newPrimaryReviewId : primaryReviewId))) {
            throw new RBoardRegistrationException(inconsistencyErrorMessage);
        }
    }

    /**
     * Gets reviewers responsibility information
     *
     * @return a map with the reviewers responsibility information
     */
    private Map getReviewRespInfo() {
        // review_resp table is removed
        Map returnMap = new HashMap();
        int[] respIds = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
                22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
				43, 44, 45, 46, 47, 48, 49, 50, 60, 61, 62, 63, 64, 65, 76, 77, 78, 79,
				112, 113, 114,
                130, 131};
        int[] phaseIds = {113, 113, 113, 112, 112, 112, 125, 125, 125, 118, 118, 118, 134, 134, 134,
                117, 117, 117, 124, 124, 124, 130, 130, 130, 135, 135, 135, 136, 136, 136, 137, 137, 137,
                114, 114, 114, 138, 1113, 1112, 1125, 1118, 1134, 1117, 1124, 1130, 1135, 1136, 1137, 1114, 1146, 140, 140, 140, 146, 146, 146, 147, 147, 147, 1147,
				134, 134, 134,
                1120, 120};

        for (int i = 0; i < respIds.length; i++) {
            returnMap.put(new Integer(respIds[i]), new Integer(phaseIds[i]));
        }
        return returnMap;
    }


    /**
     * Retrieves a particular category's catalog id.
     *
     * @param conn the connection being used
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
     * @param conn the connection being used
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
     * @param conn the connection being used
     * @param userId the user id to inspect
     * @param projectType the project type to inspect
     * @param catalogId the catalogId to review
     * @return the status of the reviewer
     * @throws RowNotFoundException if desired record in database table is not found.
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
     * <p>Gets the review status for specified user in context of projects of specified type.</p>
     *
     * @param conn a <code>Connection</code> providing the connection to target database.
     * @param userId a <code>long</code> providing the ID of a user to inspect.
     * @param projectTypeId a <code>long</code> providing the ID of project category to inspect.
     * @return a <code>long</code> referencing the status of specified reviewer.
     * @since TCS Release 2.2.0 (TCS-54)
     * @throws RowNotFoundException if desired record in database table is not found.
     */
    private long getStatus(Connection conn, long userId, int projectTypeId) throws RowNotFoundException {
        return selectLong(conn,
                          "rboard_user",
                          "status_id",
                          new String[]{"user_id", "project_type_id"},
                          new String[]{String.valueOf(userId), String.valueOf(projectTypeId)}).intValue();
    }

    /**
     * <p>Gets the name of the specified project category.</p>
     *
     * @param conn a <code>Connection</code> providing the connection to target database.
     * @param projectTypeId a <code>long</code> providing the ID of project category to get the name for.
     * @return a <code>String</code> providing the name of project category.
     * @throws RowNotFoundException if desired record in database table is not found.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private String getProjectCategoryName(Connection conn, long projectTypeId) throws RowNotFoundException {
        return selectString(conn, "project_category_lu", "name", new String[]{"project_category_id"},
                            new String[] {String.valueOf(projectTypeId)});
    }

    /**
     * This method will audit project user information. This information is generated when reviewers register.
     *
     * @param conn the connection to database
     * @param userId the user id being audited
     * @param projectId the project id being audited
     * @param userRoleId the user role id. Can be SUBMITTER_RESOURCE_ROLE_ID or MANAGER_RESOURCE_ROLE_ID.
     *
     * @throws SQLException if any error occurs in the underlying layer
     *
     * @since 1.0.13
     */
    private static void auditResourceAddition(Connection conn, long userId,
            long projectId, long userRoleId) throws SQLException {

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(SQL_INSERT_PROJECT_USER_AUDIT);

            int index = 1;
            ps.setObject(index++, projectId);
            ps.setObject(index++, userId);
            ps.setLong(index++, userRoleId);
            ps.setInt(index++, PROJECT_USER_AUDIT_CREATE_TYPE);
            ps.setLong(index++, userId);

            ps.executeUpdate();
        } finally  {
            Common.close(ps);
        }
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
    
    /**
     * Checks whether a project is using new review system or not.
     *
     * @param conn the connection to database
     * @param projectId the id of the project
     * @return true if the project is using new review system, false otherwise.
     * @throws SQLException if any error occurs when accessing the database
     * @since 1.0.16
     */
    private boolean isNewReviewSystem(Connection conn, long projectId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "select count(*) as tot from project_phase " +
                            " where project_id = ? and phase_type_id = 18";
        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, projectId);
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt("tot") > 0;
        } finally {
            close(rs);
            close(ps);
        }
    }
    
    /**
     * Gets the phase type id associated with the specified resource role.
     *
     * @param conn the connection to database
     * @param resourceRoleId the id of the specified resource role
     * @return the phase type id associated with the specified resource role.
     * @throws RowNotFoundException if no record found
     * @since 1.0.16
     */
    private int getPhaseTypeIdByResourceRole(Connection conn, int resourceRoleId) throws RowNotFoundException {
        return selectLong(conn, "resource_role_lu", "phase_type_id", new String[]{"resource_role_id"},
                new String[] {String.valueOf(resourceRoleId)}).intValue();
    }
}
