/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.net.URL;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.MemberProfile;
import com.topcoder.web.studio.dto.MemberProfileRegistration;
import com.topcoder.web.studio.dto.MemberProfileSubmission;

/**
 * <p>A processor for the requests for displaying the details for the member profile matching the handle which is
 * expected to be provided as request parameter.</p>
 * 
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ViewMemberProfile extends BaseProcessor {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for locating the user account based on provided
     * handle.</p>
     */
    private static final String MEMBER_PROFILE_SEARCH_SQL =
       "SELECT u.handle,  u.user_id, up.value " +
       "  FROM user u " +
       ", OUTER user_preference up " +
       "  WHERE lower(u.handle) = ? " +
       "    AND u.user_id = up.user_id " +
       "    AND up.preference_id = 100";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the basic data for member profile.
     * </p>
     */
    private static final String MEMBER_PROFILE_SQL
        = "SELECT c.quote," +
          "       c.member_since," +
          "       (SELECT 'http://www.topcoder.com/' || p.path || i.file_name" +
          "        FROM coder_image_xref cix" +
          "        INNER JOIN image i ON cix.image_id = i.image_id" +
          "        INNER JOIN path p ON i.path_id = p.path_id" +
          "        WHERE cix.coder_id = c.coder_id" +
          "        AND cix.display_flag = 1) AS image_url," +
          "        co.country_name, c.display_quote, c.quote_location, c.quote_color, c.display_banner, c.banner_style " +
          "FROM coder c , " +
          "OUTER country co " +
          "WHERE c.coder_id = ? " +
          "AND c.comp_country_code = co.country_code";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the total earnings for member
     * profile.</p>
     */
    private static final String MEMBER_EARNINGS_SQL 
        = "SELECT " +
          "    SUM(up.gross_amount) AS overall_earnings " + 
          "FROM payment p "+
          "INNER JOIN user_payment up ON p.payment_id = up.payment_id "+
          "WHERE up.user_id = ? " +
          "AND   p.show_in_profile_ind = 1";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the details on projects the member
     * profile is registered to.</p>
     */
    private static final String CURRENT_REGISTRATIONS_SQL 
        = "SELECT " +
          "    p.project_id AS contest_id " +
          "    , (SELECT pi.value " +
          "       FROM project_info pi " +
          "       WHERE pi.project_id = p.project_id " +
          "       AND pi.project_info_type_id = 6) AS name " +
          "    , (SELECT pp1.actual_start_time  " +
          "       FROM project_phase pp1  " +
          "       WHERE pp1.project_id = p.project_id  " +
          "       AND pp1.phase_type_id = 1) AS start_time " +
          "    , (SELECT pp2.scheduled_end_time  " +
          "       FROM project_phase pp2  " +
          "       WHERE pp2.project_id = p.project_id  " +
          "       AND pp2.phase_type_id = 2) AS end_time " +
          "    , (SELECT SUM(pr.prize_amount * pr.number_of_submissions)  " +
          "       FROM prize pr  " +
          "       INNER JOIN project_prize_xref prx ON pr.prize_id = prx.prize_id " +
          "       WHERE prx.project_id = p.project_id " +
          "       AND pr.prize_type_id IN (14, 15))::DECIMAL(10,2) AS prize_total " +
          "    , (SELECT pi.value  " +
          "       FROM project_info pi  " +
          "       WHERE pi.project_id = p.project_id  " +
          "       AND pi.project_info_type_id = 30)::DECIMAL(10, 2) AS dr_points " +
          "    , (SELECT pp.scheduled_end_time  " +
          "       FROM project_phase pp  " +
          "       WHERE pp.project_id = p.project_id  " +
          "       AND pp.phase_type_id = 15) AS milestone_date " +
          "    , p.project_category_id as contest_type_id  " +
          "    , pcl.name as contest_type_name " +
          "FROM project p " +
          "INNER JOIN resource r ON r.project_id = p.project_id  " +
          "INNER JOIN resource_info ri ON r.resource_id = ri.resource_id  " +
          "INNER JOIN project_category_lu pcl ON p.project_category_id = pcl.project_category_id " +
          "INNER JOIN project_phase pps ON p.project_id = pps.project_id AND pps.phase_type_id = 2 " +
          "WHERE p.project_status_id = 1 " +
          "AND   pcl.project_type_id = 3 " +
          "AND   pps.phase_status_id = 2 " +
          "AND   r.resource_role_id = 1 " +
          "AND   ri.resource_info_type_id = 1 " +
          "AND   ri.value = ? ";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the details on recent submissions for
     * the member profile.</p>
     */
    private static final String RECENT_SUBMISSIONS_SQL 
        = "SELECT " +
          "    p.project_id AS contest_id " +
          "    , (SELECT pi.value FROM project_info pi WHERE pi.project_id = p.project_id AND pi.project_info_type_id = 6) AS name " +
          "    , (SELECT pi.value FROM project_info pi WHERE pi.project_id = p.project_id AND pi.project_info_type_id = 53) AS submissions_viewable " +
          "    , (SELECT MAX(r.modify_date) FROM review rv WHERE rv.submission_id = s.submission_id AND rv.committed = 1) AS review_time " +
          "    , p.project_category_id as contest_type_id " +
          "    , pcl.name as contest_type_name " +
          "    , s.submission_status_id " +
          "    , s.create_date " +
          "    , s.placement " +
          "    , pzz.place as prize_place " + 
          "    , s.screening_score " +
          "    , s.initial_score " +
          "    , s.final_score " +
          "    , s.submission_id " +
          "FROM project p " +
          "INNER JOIN resource r ON r.project_id = p.project_id  " +
          "INNER JOIN resource_info ri ON r.resource_id = ri.resource_id  " +
          "INNER JOIN project_category_lu pcl ON p.project_category_id = pcl.project_category_id " +
          "INNER JOIN upload u ON u.project_id = p.project_id AND u.resource_id = r.resource_id " +
          "INNER JOIN submission s ON u.upload_id = s.upload_id " +
          "LEFT JOIN prize pzz on s.prize_id = pzz.prize_id " +
          "WHERE pcl.project_type_id = 3 " +
          "AND   r.resource_role_id = 1 " +
          "AND   ri.resource_info_type_id = 1 " +
          "AND   u.upload_status_id = 1 " +
          "AND   u.upload_type_id = 1 " +
          "AND   s.submission_type_id in (1, 3) " +
          "AND   s.submission_status_id <> 5 " +
          "AND   ri.value = ?  " +
          "AND   s.create_date >= CURRENT - 60 UNITS DAY " +
          "ORDER BY s.create_date desc ";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the details on winning submissions 
     * for the member profile.</p>
     */
    private static final String WINNING_SUBMISSIONS_SQL
        = "SELECT " +
          "    p.project_id AS contest_id " +
          "    , (SELECT pi.value FROM project_info pi WHERE pi.project_id = p.project_id AND pi.project_info_type_id = 6) AS name " +
          "    , (SELECT pi.value FROM project_info pi WHERE pi.project_id = p.project_id AND pi.project_info_type_id = 53) AS submissions_viewable " +
          "    , pzz.prize_amount AS prize_total " +
          "    , p.project_category_id as contest_type_id " +
          "    , pcl.name as contest_type_name " +
          "    , s.create_date " +
          "    , pzz.place as placement " +
          "    , s.submission_id " +
          "FROM project p " +
          "INNER JOIN resource r ON r.project_id = p.project_id  " +
          "INNER JOIN resource_info ri ON r.resource_id = ri.resource_id  " +
          "INNER JOIN project_category_lu pcl ON p.project_category_id = pcl.project_category_id " +
          "INNER JOIN upload u ON u.project_id = p.project_id AND u.resource_id = r.resource_id " +
          "INNER JOIN submission s ON u.upload_id = s.upload_id " +
          "INNER JOIN prize pzz on s.prize_id = pzz.prize_id and pzz.prize_type_id in (14,15) " +
          "WHERE pcl.project_type_id = 3 " +
          "AND   p.project_status_id = 7 " +
          "AND   r.resource_role_id = 1 " +
          "AND   ri.resource_info_type_id = 1 " +
          "AND   u.upload_status_id = 1 " +
          "AND   u.upload_type_id = 1 " +
          "AND   s.submission_type_id in (1,3) " +
          "AND   s.submission_status_id <> 5 " +
          "AND   ri.value = ?  " +
          "AND   NOT s.placement IS NULL " +
          "ORDER BY s.create_date desc ";

    /**
     * <p>Constructs new <code>ViewMemberProfile</code> instance. This implementation does nothing.</p>
     */
    public ViewMemberProfile() {
    }

    /**
     * <p>Handles the request for viewing the member profile matching the handle provided as {@link Constants#HANDLE}
     * request parameter.</p>
     *
     * <p>Looks up for the matching profile and if found binds it to request and forwards request to
     * <code>/memberProfile.jsp</code>; otherwise an exception is raised.</p>
     *
     * @throws MemberNotFoundException if requested member profile could not be found.
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        String handle = getRequest().getParameter(Constants.HANDLE);
        Connection connCommon = null;
        Connection connOltp = null;
        Connection connDW = null;
        Connection connTCS = null;
        try {
            connCommon = DBMS.getConnection(DBMS.COMMON_OLTP_DATASOURCE_NAME);
            connOltp = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            connDW = DBMS.getConnection(DBMS.DW_DATASOURCE_NAME);
            connTCS = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            MemberProfile memberProfile = getMemberProfile(connTCS, connCommon, connOltp, connDW, handle);
            setDefault(Constants.MEMBER_PROFILE, memberProfile);
            setNextPage("/memberProfile.jsp");
            setIsNextPageInContext(true);
        } finally {
            close(connTCS);
            close(connCommon);
            close(connOltp);
            close(connDW);
        }
    }

    /**
     * <p>Gets the basic data (handle, time of registration, </p>
     *
     * @param connTCS a <code>Connection</code> providing the connection to target <code>TCS</code> database.
     * @param connCommon a <code>Connection</code> providing the connection to target <code>Common</code> database.
     * @param connOltp   a <code>Connection</code> providing the connection to target <code>OLTP</code> database.
     * @param connDW     a <code>Connection</code> providing the connection to target <code>DW</code> database.
     * @param handle     a <code>String</code> providing the handle to find the matching member profile for.   
     * @return an <code>Object</code> array containing two elements. The first element is of type {@link Long} and
     *         provides the ID of a member profile; the second element is of type {@link MemberProfile} and provides the
     *         details for the member profile.
     * @throws MemberNotFoundException if no member profile matching the specified handle was found.
     * @throws SQLException if an SQL error occurs while accessing the target database.
     * @throws MalformedURLException in case member photo image URL is invalid.
     */
    private MemberProfile getMemberProfile(Connection connTCS, Connection connCommon, Connection connOltp,
                                           Connection connDW, String handle)
        throws SQLException, MemberNotFoundException, MalformedURLException {

        PreparedStatement stmt = null;
        ResultSet result = null;

        try {
            // Resolve the user ID based on handle
            stmt = connCommon.prepareStatement(MEMBER_PROFILE_SEARCH_SQL);
            stmt.setString(1, handle.toLowerCase());
            result = stmt.executeQuery();
            if (result.next()) {
                long userId = result.getLong("user_id");
                String hide = result.getString("value");
                boolean hidePayments = hide != null && "hide".equals(hide);
                getRequest().setAttribute("hidePayments", new Boolean(hidePayments));
                close(result);
                close(stmt);

                // Get the basic member profile details
                stmt = connOltp.prepareStatement(MEMBER_PROFILE_SQL);
                stmt.setLong(1, userId);
                result = stmt.executeQuery();
                if (result.next()) {
                    // Profile bio
                    MemberProfile profile = new MemberProfile();
                    profile.setUserId(userId);
                    profile.setHandle(handle);
                    profile.setMemberSince(result.getTimestamp("member_since"));
                    profile.setQuote(result.getString("quote"));
                    profile.setCountry(result.getString("country_name"));
                    String imageUrl = result.getString("image_url");
                    if (result.wasNull()) {
                        profile.setImageUrl(null);
                    } else {
                        profile.setImageUrl(new URL(imageUrl));
                    }
                    
                    // Banner/quote
                    boolean displayQuote = result.getInt("display_quote") == 1;
                    String quoteLocation = result.getString("quote_location");
                    String quoteColor = result.getString("quote_color");
                    boolean displayBanner = result.getInt("display_banner") == 1;
                    String bannerStyle = result.getString("banner_style");
                    
                    profile.setDisplayBanner(displayBanner);
                    profile.setDisplayQuote(displayQuote);
                    profile.setQuoteLocation(quoteLocation);
                    profile.setQuoteColor(quoteColor);
                    profile.setBannerStyle(bannerStyle);

                    close(result);
                    close(stmt);
                    
                    // Total earnings
                    stmt = connDW.prepareStatement(MEMBER_EARNINGS_SQL);
                    stmt.setLong(1, userId);
                    result = stmt.executeQuery();
                    if (result.next()) {
                        profile.setOverallEarnings(result.getDouble("overall_earnings"));
                    }
                    close(result);
                    close(stmt);
                    
                    // Current registrations
                    stmt = connTCS.prepareStatement(CURRENT_REGISTRATIONS_SQL);
                    stmt.setString(1, String.valueOf(userId));
                    result = stmt.executeQuery();
                    List<MemberProfileRegistration> currentRegistrations = new ArrayList<MemberProfileRegistration>();
                    while (result.next()) {
                        MemberProfileRegistration registration = new MemberProfileRegistration();
                        registration.setContestId(result.getLong("contest_id"));
                        registration.setContestName(result.getString("name"));
                        registration.setContestTypeId(result.getLong("contest_type_id"));
                        registration.setContestTypeName(result.getString("contest_type_name"));
                        registration.setContestEndTime(result.getTimestamp("end_time"));
                        registration.setContestStartTime(result.getTimestamp("start_time"));
                        registration.setContestPrizePurse(result.getDouble("prize_total"));
                        registration.setDrPoints(result.getDouble("dr_points"));
                        
                        currentRegistrations.add(registration);
                    }
                    profile.setCurrentRegistrations(currentRegistrations);
                    close(result);
                    close(stmt);
                    
                    // Recently submitted
                    stmt = connTCS.prepareStatement(RECENT_SUBMISSIONS_SQL);
                    stmt.setString(1, String.valueOf(userId));
                    result = stmt.executeQuery();
                    List<MemberProfileSubmission> recentSubmissions = new ArrayList<MemberProfileSubmission>();
                    while (result.next()) {
                        MemberProfileSubmission submission = new MemberProfileSubmission();
                        submission.setSubmissionId(result.getLong("submission_id"));
                        submission.setContestId(result.getLong("contest_id"));
                        submission.setContestName(result.getString("name"));
                        submission.setContestTypeId(result.getLong("contest_type_id"));
                        submission.setContestTypeName(result.getString("contest_type_name"));
                        int statusId = result.getInt("submission_status_id");
                        submission.setFailed(statusId == 2 || statusId == 3);
                        submission.setLocked("false".equalsIgnoreCase(result.getString("submissions_viewable")));
                        result.getDouble("screening_score");
                        if (result.wasNull()) {
                            submission.setPendingReview(true);
                        }
                        
                        int placement = result.getInt("placement");
                        if (!result.wasNull()) {
                            submission.setPlacement(placement);
                            submission.setPassedReview(true);
                        }
                        int prizePlace = result.getInt("prize_place");
                        if (!result.wasNull()) {
                            submission.setPrizePlace(prizePlace);
                        } else {
                            submission.setPrizePlace(-1);
                        }
                        submission.setReviewTime(result.getTimestamp("review_time"));
                        submission.setSubmissionTime(result.getTimestamp("create_date"));

                        recentSubmissions.add(submission);
                    }
                    profile.setRecentSubmissions(recentSubmissions);
                    close(result);
                    close(stmt);

                    // Winning submissions
                    stmt = connTCS.prepareStatement(WINNING_SUBMISSIONS_SQL);
                    stmt.setString(1, String.valueOf(userId));
                    result = stmt.executeQuery();
                    List<MemberProfileSubmission> winningSubmissions = new ArrayList<MemberProfileSubmission>();
                    while (result.next()) {
                        MemberProfileSubmission submission = new MemberProfileSubmission();
                        submission.setSubmissionId(result.getLong("submission_id"));
                        submission.setContestId(result.getLong("contest_id"));
                        submission.setContestName(result.getString("name"));
                        submission.setContestTypeId(result.getLong("contest_type_id"));
                        submission.setContestTypeName(result.getString("contest_type_name"));
                        submission.setContestPrizePurse(result.getDouble("prize_total"));
                        submission.setLocked("false".equalsIgnoreCase(result.getString("submissions_viewable")));
                        int placement = result.getInt("placement");
                        if (!result.wasNull()) {
                            submission.setPlacement(placement);
                        }
                        submission.setSubmissionTime(result.getTimestamp("create_date"));

                        winningSubmissions.add(submission);
                    }
                    profile.setWinningSubmissions(winningSubmissions);
                    close(result);
                    close(stmt);

                    return profile;
                } else {
                    throw new MemberNotFoundException(handle);
                }
            } else {
                throw new MemberNotFoundException(handle);
            }
        } finally {
            close(result);
            close(stmt);
        }
    }

    /**
     * <p>Closes the specified result set. Any SQL error which may occur is handled silently so it won't interrupt the
     * current logic flow.</p>
     *
     * @param resultSet a <code>ResultSet</code> to close.
     */
    public static void close(ResultSet resultSet) {
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
    public static void close(PreparedStatement statement) {
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
    public static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }
}
