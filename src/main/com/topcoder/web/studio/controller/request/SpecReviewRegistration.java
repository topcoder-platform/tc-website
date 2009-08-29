/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.studio.Constants;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.ClassResource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 * <p>A controller for handling the requests for registering reviewers to spec review opportunities for
 * <code>Studio</code> contests.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Signup Page
 */
public class SpecReviewRegistration extends ViewSpecReviewRegistration {

    /**
     * <p>Constructs new <code>SpecReviewRegistration</code> instance. This implementation does nothing.</p>
     */
    public SpecReviewRegistration() {
    }

    /**
     * <p>Implements the business logic for processing the requests for registering reviewers to spec review
     * opportunities for <code>Studio</code> contests.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            if ("POST".equalsIgnoreCase(getRequest().getMethod())) {
                // Get ID for the requested spec review and ID for current user
                final long userId = getUser().getId();
                Long specReviewId;
                try {
                    specReviewId = new Long(getRequest().getParameter(Constants.SPEC_REVIEW_ID));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid Specification Review Specified");
                }

                // Check if user agreed to terms of use
                if ("on".equals(getRequest().getParameter(Constants.TERMS_AGREE))) {
                    Connection connStudio = null;
                    boolean success = false;
                    try {
                        connStudio = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);
                        connStudio.setAutoCommit(false);
                        final String verificationResult = canDoReview(connStudio, specReviewId, userId);
                        if (verificationResult == null) {
                            // User is allowed to do review
                            addSpecReviewReviewer(connStudio, specReviewId, userId);
                            updateSpecReviewToAssigned(connStudio, specReviewId);
                            addSpecReviewPermission(connStudio, specReviewId, userId);
                            success = true;
                            connStudio.commit();
                            setNextPage("/?" + Constants.MODULE_KEY + "=ViewSpecReviewOpportunities");
                            setIsNextPageInContext(false);
                        } else {
                            // Can't perform desired review
                            throw new NavigationException(verificationResult);
                        }
                    } finally {
                        if (!success) {
                            if (connStudio != null) {
                                connStudio.rollback();
                            }
                        }
                        close(connStudio);
                    }
                } else {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                    setDefault(Constants.SPEC_REVIEW_ID, specReviewId.toString());
                    setupTerms();
                    setNextPage("/reviewTerms.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                throw new NavigationException("Invalid request type.");
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    /**
     * <p>Adds a new entry for the reviewer in spec_review_reviewer_xref table.</p>
     *
     * @param conn the datbase connection to be used.
     * @param specReviewId the spec review id for which reviewer entry should be added.
     * @param userId the reviewer's user id.
     * @throws SQLException if an unexpected error occurs.
     */
    private void addSpecReviewReviewer(Connection conn, long specReviewId, long userId) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("INSERT INTO spec_review_reviewer_xref(spec_review_reviewer_id, "
                    + "                                                         spec_review_id, "
                    + "                                                         review_user_id, "
                    + "                                                         review_start_time, "
                    + "                                                         is_active, "
                    + "                                                         creation_time, "
                    + "                                                         creation_user) "
            		+ " VALUES (SPEC_REVIEW_REVIEWER_SEQ.NEXTVAL, ?, ?, CURRENT, 1, CURRENT, 'System')");
            ps.setLong(1, specReviewId);
            ps.setLong(2, userId);
            
            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw e;
        } finally {
            close(ps);
        }
    }

    /**
     * <p>Updates the spec_review table's entry to REVIEWER_ASSIGNED i.e. id = 5.</p>
     *
     * @param conn the database connection for the update.
     * @param specReviewId the spec review id for which to update.
     * @throws SQLException if an unexpected error occurs.
     */
    private void updateSpecReviewToAssigned(Connection conn, long specReviewId) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("UPDATE spec_review SET review_status_type_id = 5, "
                    + " modification_time = CURRENT, "
                    + " modification_user = 'System' "
                    + " WHERE spec_review_id = ?"
                    + " AND is_studio = 1");
            ps.setLong(1, specReviewId);
            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw e;
        } finally {
            close(ps);
        }
    }

    /**
     * <p>Adds permission for the user.</p>
     *
     * @param conn the datbase connection to be used.
     * @param specReviewId the spec review id for which reviewer entry should be added.
     * @param userId the reviewer's user id.
     * @throws SQLException if an unexpected error occurs.
     */
    private void addSpecReviewPermission(Connection conn, long specReviewId, long userId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;

        long permId = 0;
        long permTypeId = 0;

        try {
            ps = conn.prepareStatement("SELECT u.user_permission_grant_id, u.permission_type_id " +
                                       "FROM user_permission_grant u " +
                                       "INNER JOIN spec_review r ON u.resource_id = r.contest_id " +
                                       "      AND r.spec_review_id = ? " +
                                       "WHERE u.user_id = ? AND u.is_studio = 1");
            ps.setLong(1, specReviewId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                permId = rs.getLong(1);
                permTypeId = rs.getLong(2);
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
        } finally {
            close(rs);
            close(ps);
        }

        if (permId > 0) {
            // we have sufficient permission
            if (permTypeId >= 4 && permTypeId <= 6) {
                return;
            }

            try {
                ps = conn.prepareStatement("UPDATE user_permission_grant SET permission_type_id = 4 " +
                                           "where user_permission_grant_id = ?");
                ps.setLong(1, permId);
                ps.executeUpdate();
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
            } finally {
                close(rs);
                close(ps);
            }
        } else {
            try {
                ps = conn.prepareStatement("INSERT INTO user_permission_grant " +
                                           "(user_permission_grant_id, user_id, resource_id, permission_type_id, " +
                                           "is_studio) "
                        + " SELECT PERMISSION_SEQ.NEXTVAL, " + userId
                        + ", contest_id, 4, 0 FROM spec_review WHERE spec_review_id = ?");
                ps.setLong(1, specReviewId);
                final int updateCnt = ps.executeUpdate();
                if (updateCnt != 1) {
                    throw new SQLException("Wrong number of records inserted into user_permission_grant table: "
                                           + updateCnt);
                }
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw e;
            } finally {
                close(rs);
                close(ps);
            }
        }
    }
}
