/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.errorhandling.BaseException;
import com.topcoder.web.forums.ForumConstants;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * This is the concrete implementation of the ProjectTrackerV2 interface.
 *
 * @author brain_cn
 * @version 1.0
 */
public class ProjectTrackerV2Bean implements SessionBean {
    private Logger log;
    private SessionContext ejbContext;
    private DataSource dataSource;

    /**
     * Retrieve project info with given project id and project_info_type.
     *
     * @param conn the jdbc connection
     * @param projectId the project id
     * @param type the info type
     *
     * @return info for given type
     *
     * @throws SQLException if error occurs while execute jdbc statement
     */
    private String getProjectInfo(Connection conn, long projectId, int type)
        throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
                "SELECT value from project_info where project_id = ? and project_info_type_id = ?");
        ps.setLong(1, projectId);
        ps.setInt(2, type);

        ResultSet rs = ps.executeQuery();

        try {
            if (rs.next()) {
                return rs.getString("value");
            }
        } finally {
            Common.close(rs);
            Common.close(ps);
        }

        return null;
    }

    /**
     * Parse long type value from given string.
     *
     * @param value string representation
     *
     * @return 0 if the value is null or invalid format.
     */
    private static long parseLongValue(String value) {
        if (value == null) {
            return 0;
        } else {
            try {
                return Long.parseLong(value);
            } catch (Exception e) {
                return 0;
            }
        }
    }

    /**
     * Get a Project from the database, given a specific projectId.
     *
     * @param projectId
     * @param requestor
     *
     * @return long array, first is winner id, second is forum categoryId
     *
     * @throws RuntimeException if error occurs while retrieve winner id/category id
     */
    public long[] getProjectWinnerIdForumCategoryId(long projectId, TCSubject requestor) {
        log.debug("PT.getProjectWinnerIdForumCategoryId(), projectId: " + projectId + ", requestId: " + requestor.getUserId());

        Connection conn = null;
        PreparedStatement psForum = null;
        ResultSet rsForum = null;
        long[] results = new long[2];

        try {
            conn = dataSource.getConnection();
            results[0] = parseLongValue(getProjectInfo(conn, projectId, 23)); // Winner

            long componentId = parseLongValue(getProjectInfo(conn, projectId, 2)); // external id

            String forumDbName = DBMS.getDbName(DBMS.FORUMS_DATASOURCE_NAME);
            psForum = conn.prepareStatement("SELECT c.categoryid " + 
            		"FROM " + forumDbName + ":jivecategory c, " + forumDbName + ":jivecategoryprop cp, " +
            		"	comp_jive_category_xref cjcx, comp_versions cv " +
                    "WHERE c.categoryid = cjcx.jive_category_id " + 
                    "AND cjcx.comp_vers_id = cv.comp_vers_id " +
                    "AND cv.phase_id in (112, 113) " +
                    "AND cv.component_id = ? " +
                    "AND c.categoryid = cp.categoryid " +
                    "AND cp.name = '" + ForumConstants.PROPERTY_ARCHIVAL_STATUS + "' " + 
                    "AND cp.propvalue = " + ForumConstants.PROPERTY_ARCHIVAL_STATUS_ACTIVE);

            psForum.setLong(1, componentId);
            rsForum = psForum.executeQuery();

            if (rsForum.next()) {
                results[1] = rsForum.getLong(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, psForum, rsForum);
        }

        return results;
    }

    /**
     * Retrieves the id of a project based on the component version id of a component and the project type
     *
     * @param compVersId the component's component version id
     * @param projectType the project type (design or development)
     *
     * @return the project id, -1 if no project exists
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public long getProjectIdByComponentVersionId(long compVersId, long projectType) {
    	log.debug("PT.getProjectIdByComponentVersionId; compVersId: " + compVersId + " projectType: " + projectType);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long projectId = -1;

        try {
            conn = dataSource.getConnection();

            // Find projectId with compVersId and projectType
            ps = conn.prepareStatement(
            		"select max(p.project_id) " +
            		"from project p," +
            		"	project_info pi " +
                    "where pi.project_id = p.project_id " +
                    "and pi.project_info_type_id = 1 " +
                    "and pi.value = ? " +
                    "and p.project_category_id = ? ");
            ps.setLong(1, compVersId);
            ps.setLong(2, projectType);
            rs = ps.executeQuery();

            if (rs.next()) {
                projectId = rs.getLong(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return projectId;
    }

    /**
     * Check if the project is aggregated, with the
     * aggregation completed and pm-reviewed.
     *
     * @param projectId The ProjectId
     * @return true if project is aggregated
     */
    public boolean isProjectAggregated(long projectId) throws RemoteException {
    	log.debug("PT.isProjectAggregated; projectId: " + projectId);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            // Find the review which made by aggregator and its review is completed 
            ps = conn.prepareStatement(
            		"select review_id " +
            		"	from review r, " +
            		"	resource res  " +
                    "where committed = 1 " +
                    "and r.resource_id = res.resource_id " +
                    "and res.resource_role_id = 8 " +
                    "and res.project_id = ? ");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Gets the PM for the project, or returns null if no PM is found.
     *
     * @param projectId the id of the project whose PM will be retrieved.
     *
     * @return the User for the PM
     */
    public User getPM(long projectId) {
    	log.debug("PT.getPM; projectId: " + projectId);


        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
            		"select ri.value as id, su.user_id as handle, u.first_name, u.last_name, e.address as email " +
            		"from resource r, " +
            		"outer(security_user su, user u, email e), " +
            		"resource_info ri " +
            		"where ri.resource_id = r.resource_id " +
            		"and ri.resource_info_type_id = 1 " +
            		"and r.resource_role_id = 13 " +
            		"and r.project_id = ? " +
            		"and su.login_id = ri.value " +
            		"and su.login_id = u.user_id " +
            		"and su.login_id = e.user_id " +
            		"and e.primary_ind = 1");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();
            if (rs.next()) {
                long id = -1;
            	try {
            		id = Long.parseLong(rs.getString("id"));
            	} catch(NumberFormatException e) {
            		return null;
            	}
            	User user = new User(id, 
            			rs.getString("handle"), 
            			rs.getString("first_name"), 
            			rs.getString("last_name"),
            			rs.getString("email"));
            	return user;
            } else {
            	return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }
    
    /**
     * Creates a new Online Review Project.
     *
     * @param projectName - the name of the project.
     * @param projectVersion - the version(text) for the project.
     * @param compVersId - the component version id for the project(from comp_versions.comp_vers_id).
     * @param projectTypeId - 1 for design-project, 2 for development-project
     * @param overview the overview
     * @param dates the dates
     * @param requestor the user requestor
     * @param levelId level id
     *
     * @return long - the projectId for the newly created project.
     *
     * @throws BaseException if error occurs
     * @throws RuntimeException if error occurs
     */
    public long createProject(String projectName, String projectVersion, long compVersId, long projectTypeId,
        String overview, Date[] dates, TCSubject requestor, long levelId, long forumCategoryId, double price)
        throws BaseException {
        log.debug("PT.createProject; projectName: " + projectName + " ,compVersId: " + compVersId 
        		+ " ,projectTypeId: " + projectTypeId + " ,projectVersion: " + projectVersion+ " ,requestor: " + requestor.getUserId());

        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            return ProjectUtil.createProject(conn, projectVersion, compVersId, projectTypeId, requestor.getUserId(), forumCategoryId, price);
        } catch (Exception e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("Create project: " + e.getMessage(), e);
        } finally {
            Common.close(conn);
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param userId DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     *
     * @throws BaseException DOCUMENT ME!
     * @throws RuntimeException DOCUMENT ME!
     */
    public void userInquiry(long userId, long projectId)
        throws BaseException {
        log.debug("PT.userInquiry; userId: " + userId + " ,projectId: " + projectId);

        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            ProjectUtil.userInquiry(conn, userId, projectId);
        } catch (SQLException e) {
        	e.printStackTrace();
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } finally {
            Common.close(conn);
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param compVersId DOCUMENT ME!
     * @param oldVersion DOCUMENT ME!
     * @param newVersion DOCUMENT ME!
     */
    public void versionRename(long compVersId, String oldVersion, String newVersion) {
        log.debug("ProjectTrackerBean.versionRename");
        ddeRename(-1, compVersId, null, null, oldVersion, newVersion);
    }

    /**
     * DOCUMENT ME!
     *
     * @param componentId DOCUMENT ME!
     * @param oldName DOCUMENT ME!
     * @param newName DOCUMENT ME!
     */
    public void componentRename(long componentId, String oldName, String newName) {
        log.debug("ProjectTrackerBean.componentRename");
        ddeRename(componentId, -1, oldName, newName, null, null);
    }

    private void ddeRename(long componentId, long compVersId, String oldName, String newName, String oldVersion,
        String newVersion) {
        log.debug("ProjectTrackerBean.ddeRename");
    }

    /**
     * This method is required by the EJB Specification. Used to get the context ... for dynamic connection pools.
     *
     * @throws CreateException if error occurs while create ejb
     */
    public void ejbCreate() throws CreateException {
        dataSource = Common.getDataSource();

        log = Logger.getLogger(ProjectTrackerV2Bean.class);

        log.debug("ProjectTrackerBean created");
    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext ctx) throws EJBException {
        this.ejbContext = ctx;
    }
}
