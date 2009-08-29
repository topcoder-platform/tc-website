/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.shared.util.DBMS;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

/**
 * <p>A controller for handling the requests for viewing the registration page for signing up for specification review
 * for <code>Studio</code> contests.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Signup Page
 */
public class ViewSpecReviewRegistration extends ShortHibernateProcessor {

    /**
     * <p>An error message for case when invalid specification review was requested for signing up.</p>
     */
    public static final String VERIFICATION_BAD_REVIEW = "Invalid specification review requested";

    /**
     * <p>An error message for case when specification review requested for signing up is not associated with valid
     * contest.</p>
     */
    public static final String VERIFICATION_BAD_CONTEST = "Invalid contest requested";

    /**
     * <p>An error message for case when user with no appropriate permission requested for signing up to specification
     * review.</p>
     */
    public static final String VERIFICATION_NO_PERMISSION = "You do not have a permission to review specification "
                                                            + "for contests of this type";

    /**
     * <p>An error message for case when requested specification review position is already taken.</p>
     */
    public static final String VERIFICATION_ALREADY_TAKEN = "Requested specification review position is already taken";

    /**
     * <p>Constructs new <code>ViewSpecReviewRegistration</code> instance. This implementation does nothing.</p>
     */
    public ViewSpecReviewRegistration() {
    }

    /**
     * <p>Implements the business logic for processing the requests for viewing the registration page for signing up for
     *  specification review opportunities for <code>Studio</code> contests.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        // Get ID for the requested spec review and ID for current user
        final String specReviewId = getRequest().getParameter(Constants.SPEC_REVIEW_ID);
        final long userId = getUser().getId();

        // Check if user is in review board for specified contest type
        Connection connStudio = null;
        try {
            connStudio = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);
            final String verificationResult = canDoReview(connStudio, Long.parseLong(specReviewId), userId);
            if (verificationResult == null) {
                setupTerms();
                setNextPage("/reviewTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                // Can't perform desired review
                throw new NavigationException(verificationResult);
            }
        } finally {
            close(connStudio);
        }
    }

    /**
     * <p>Gets the details for reviewer's terms of use and binds them to request.</p>
     */
    protected void setupTerms() {
        final TermsOfUse termsOfUse
            = DAOUtil.getFactory().getTermsOfUse().find(Constants.SPEC_REVIEWER_TERMS_ID);
        getRequest().setAttribute("terms", termsOfUse);
    }

    /**
     * <p>Closes the specified result set. Any SQL error which may occur is handled silently so it won't interrupt the
     * current logic flow.</p>
     *
     * @param resultSet a <code>ResultSet</code> to close.
     */
    protected static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified SQL statement. Any SQL error which may occur is handled silently so it won't interrupt
     * the current logic flow.</p>
     *
     * @param statement a <code>PreparedStatement</code> to close.
     */
    protected static void close(PreparedStatement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Closes the specified connection to database. Any SQL error which may occur is handled silently so it won't
     * interrupt the current logic flow.</p>
     *
     * @param connection a <code>Connection</code> to close.
     */
    protected static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>Checks if specified user can signup for specified spec review.</p>
     *
     * @param con a <code>Connection</code> providing connection to target database.
     * @param specReviewId a <code>long</code> providing the ID for specification review.
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>String</code> providing the error message or <code>null</code> specified user can signup for
     *         specified spec review.
     * @throws SQLException if an SQL error occurs.
     */
    protected String canDoReview(Connection con, long specReviewId, long userId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT c.contest_id, u.status_id AS reviewer_status_id, " +
                                      "       r2.review_user_id AS lucky_reviewer_id " +
                                      "FROM spec_review r " +
                                      "LEFT JOIN contest c ON r.contest_id = c.contest_id " +
                                      "LEFT JOIN rboard_user u ON u.contest_type_id = c.contest_type_id" +
                                      "     AND u.user_id = ? " +
                                      "LEFT JOIN spec_review_reviewer_xref r2 ON r.spec_review_id = r2.spec_review_id " +
                                      "     AND r2.is_active = 1 " +
                                      "WHERE r.spec_review_id = ? AND r.is_studio = 1 AND r.review_status_type_id = 4");
            ps.setLong(1, userId);
            ps.setLong(2, specReviewId);

            rs = ps.executeQuery();
            if (rs.next()) {
                rs.getLong("contest_id");
                if (rs.wasNull()) {
                    return VERIFICATION_BAD_CONTEST;
                } else {
                    final long reviewerStatusId = rs.getLong("reviewer_status_id");
                    if (rs.wasNull() || reviewerStatusId != 100) {
                        return VERIFICATION_NO_PERMISSION;
                    } else {
                        rs.getLong("lucky_reviewer_id");
                        if (!rs.wasNull()) {
                            return VERIFICATION_ALREADY_TAKEN;
                        }
                    }
                }
            } else {
                return VERIFICATION_BAD_REVIEW;
            }
        } finally {
            close(rs);
            close(ps);
        }
        
        return null;
    }
}
