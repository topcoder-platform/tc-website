/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;
import java.util.Comparator;
import java.util.TreeMap;
import java.net.URL;
import java.net.MalformedURLException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.dto.MemberProfile;
import com.topcoder.web.studio.dto.ContestStatistics;

/**
 * <p>A processor for the requests for displaying the details for the member profile matching the handle which is
 * expected to be provided as request parameter.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ViewMemberProfile extends BaseProcessor {

    /**
     * <p>A <code>String</code> providing the URL for the image to be displayed instead of member photo in case member's
     * profile does not have any member photo associated with it.</p>
     */
    private static final String NO_MEMBER_PHOTO_IMAGE_URL = "http://www.topcoder.com/i/m/nophoto.jpg";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for locating the user account based on provided
     * handle.</p>
     */
    private static final String MEMBER_PROFILE_SEARCH_SQL
            = "SELECT u.handle," +
              "       u.user_id " +
              "FROM user u " +
              "WHERE u.handle = ?";

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
              "        AND cix.display_flag = 1) AS image_url " +
              "FROM coder c " +
              "WHERE c.coder_id = ?";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the statistics per contest type for
     * member profile.</p>
     */
    private static final String MEMBER_PROFILE_STATS_SQL
            = "SELECT c.contest_type_id, t.contest_type_desc, t.include_gallery, t.require_preview_image, " +
              "t.require_preview_file, " +
              "       COUNT(c.contest_id) AS contests_registered, " +
              "       COUNT(c2.contest_id) AS contests_submitted, " +
              "       COUNT(c3.contest_id) AS wins, " +
              "       SUM(c4.submissions) AS submissions_count, " +
              "       SUM(c5.submissions) AS passed_screening " +
              "FROM contest_registration r " +
              "INNER JOIN contest c ON r.contest_id = c.contest_id " +
              "INNER JOIN contest_type_lu t ON c.contest_type_id = t.contest_type_id " +
              "LEFT JOIN TABLE (MULTISET (SELECT DISTINCT contest_id FROM submission s " +
              "WHERE s.submission_status_id = 1 AND s.submitter_id = ?)) c2 ON c2.contest_id = c.contest_id " +
              "LEFT JOIN TABLE (MULTISET (SELECT DISTINCT s.contest_id FROM prize p, submission_prize_xref spx, submission s " +
              "WHERE p.place = 1 AND p.prize_id = spx.prize_id AND spx.submission_id = s.submission_id " +
              "AND s.submitter_id = ?)) c3 ON c3.contest_id = c.contest_id " +
              "LEFT JOIN TABLE (MULTISET (SELECT contest_id, COUNT(*) AS submissions FROM submission s " +
              "WHERE s.submission_status_id = 1 AND s.submitter_id = ? " +
              "GROUP BY contest_id)) c4 ON c4.contest_id = c.contest_id " +
              "LEFT JOIN TABLE (MULTISET (SELECT contest_id, COUNT(*) AS submissions FROM submission s, submission_review v " +
              "WHERE s.submission_status_id = 1 AND s.submitter_id = ? AND s.submission_id = v.submission_id " +
              "AND v.review_status_id = 1 GROUP BY contest_id)) c5 ON c5.contest_id = c.contest_id " +
              "WHERE r.user_id = ? " +
              "GROUP BY c.contest_type_id, t.contest_type_desc, t.include_gallery, t.require_preview_image, " +
              "t.require_preview_file ";

    /**
     * <p>A <code>Map</code> mapping the <code>Integer</code> ID of contest type to respective numeric order. Such an
     * order is used for displaying the tabs with contest types the user registered to in specific order.</p>
     */
    private static final Map<Integer, Integer> CONTEST_TYPES_ORDER = new HashMap<Integer, Integer>();

    /**
     * <p>This static initializer initializes the {@link #CONTEST_TYPES_ORDER} map with mapping for the contest types
     * outlined in <code>Requirements Specification</code> document.</p>
     */
    static {
        CONTEST_TYPES_ORDER.put(3, 1);                  // Logo Design
        CONTEST_TYPES_ORDER.put(1, 2);                  // Web Page Design
        CONTEST_TYPES_ORDER.put(5, 3);                  // Application Front End Design
        CONTEST_TYPES_ORDER.put(14, 4);                 // Icon
        CONTEST_TYPES_ORDER.put(4, 5);                  // Web Elements
        CONTEST_TYPES_ORDER.put(11, 6);                 // Print - Branding/ Collateral
        CONTEST_TYPES_ORDER.put(12, 7);                 // Print Design
        CONTEST_TYPES_ORDER.put(2, 8);                  // Prototype
        CONTEST_TYPES_ORDER.put(21, 9);                 // PowrPoint Presentation
        CONTEST_TYPES_ORDER.put(13, 10);                // Print - Marketing
        CONTEST_TYPES_ORDER.put(7, 11);                 // Email Newsletter/Promo
        CONTEST_TYPES_ORDER.put(6, 12);                 // Mobile Screen
        CONTEST_TYPES_ORDER.put(9, 13);                 // Widget
        CONTEST_TYPES_ORDER.put(8, 14);                 // FLASH
        CONTEST_TYPES_ORDER.put(15, 15);                // Apparel
        CONTEST_TYPES_ORDER.put(10, 16);                // Javascript
        CONTEST_TYPES_ORDER.put(22, 17);                // Flex
        CONTEST_TYPES_ORDER.put(19, 18);                // CSS Re-Skin
        CONTEST_TYPES_ORDER.put(17, 19);                // Presentation
        CONTEST_TYPES_ORDER.put(20, 20);                // XSL-FO Document Conversion
        CONTEST_TYPES_ORDER.put(16, 21);                // Sound
        CONTEST_TYPES_ORDER.put(23, 22);                // Active Site Code Implementation
        CONTEST_TYPES_ORDER.put(24, 23);                // Bug Race
        CONTEST_TYPES_ORDER.put(18, Integer.MAX_VALUE); // Other
    }

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
        Connection connStudio = null;
        Connection connCommon = null;
        Connection connOltp = null;
        try {
			connStudio = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);
			connCommon = DBMS.getConnection(DBMS.COMMON_OLTP_DATASOURCE_NAME);
			connOltp = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
			MemberProfile memberProfile = retrieveMemberProfile(connStudio, connCommon, connOltp, handle);
			setDefault(Constants.MEMBER_PROFILE, memberProfile);
		} catch (MemberNotFoundException e) {
			setDefault(Constants.MEMBER_PROFILE, null);
		} finally {
	        setNextPage("/memberProfile.jsp");
	        setIsNextPageInContext(true);
            close(connStudio);
            close(connCommon);
            close(connOltp);
		}
	}

    /**
     * <p>Finds the <code>Studio</code> member profile matching the specified handle. Once the profile is found it gets
     * populated with basic data as well as with the statistics for types of contests the user registered to.</p>
     *
     * @param connStudio a <code>Connection</code> providing the connection to target <code>Studio</code> database.
     * @param connCommon a <code>Connection</code> providing the connection to target <code>Common</code> database.
     * @param connOltp a <code>Connection</code> providing the connection to target <code>OLTP</code> database.
     * @param handle a <code>String</code> providing the handle to find the matching member profile for.
     * @return a <code>MemberProfile</code> representing the profile for <code>Studio</code> member matching the
     *         specified handle.
     * @throws MemberNotFoundException if no member profile matching the specified handle was found.
     * @throws SQLException if an SQL error occurs while accessing the target database.
     * @throws MalformedURLException in case member photo image URL is invalid.
     */
	private MemberProfile retrieveMemberProfile(Connection connStudio, Connection connCommon, Connection connOltp,
                                                String handle)
            throws MemberNotFoundException, SQLException, MalformedURLException {

        // Get the basic member profile data
        Object[] memberProfileData = getMemberProfile(connCommon, connOltp, handle);
        MemberProfile profile = (MemberProfile) memberProfileData[1];
        Long profileId = (Long) memberProfileData[0];

        // Calculate statistics per contest types and collect the list of contest types
        Map<Integer, ContestStatistics> stats = getMemberProfileStats(connStudio, profileId);
        profile.setStatistics(stats);

        return profile;
	}

    /**
     * <p>Gets the basic data (handle, time of registration, </p>
     *
     * @param connCommon a <code>Connection</code> providing the connection to target <code>Common</code> database.
     * @param connOltp a <code>Connection</code> providing the connection to target <code>OLTP</code> database.
     * @param handle a <code>String</code> providing the handle to find the matching member profile for.
     * @return an <code>Object</code> array containing two elements. The first element is of type {@link Long} and
     *         provides the ID of a member profile; the second element is of type {@link MemberProfile} and provides the
     *         details for the member profile. 
     * @throws MemberNotFoundException if no member profile matching the specified handle was found.
     * @throws SQLException if an SQL error occurs while accessing the target database.
     * @throws MalformedURLException in case member photo image URL is invalid.
     */
    private Object[] getMemberProfile(Connection connCommon, Connection connOltp, String handle)
            throws SQLException, MemberNotFoundException, MalformedURLException {
        
        PreparedStatement stmt = null;
        ResultSet result = null;

        try {
            // Resolve the user ID based on handle
            stmt = connCommon.prepareStatement(MEMBER_PROFILE_SEARCH_SQL);
            stmt.setString(1, handle);
            result = stmt.executeQuery();
            if (result.next()) {
                long userId = result.getLong("user_id");
                close(result);
                close(stmt);

                // Get the basic member profile details
                stmt = connOltp.prepareStatement(MEMBER_PROFILE_SQL);
                stmt.setLong(1, userId);
                result = stmt.executeQuery();
                if (result.next()) {
                    MemberProfile profile = new MemberProfile();
                    profile.setHandle(handle);
                    profile.setMemberSince(result.getTimestamp("member_since"));
                    profile.setQuote(result.getString("quote"));
                    String imageUrl = result.getString("image_url");
                    if (result.wasNull()) {
                        profile.setImageUrl(new URL(NO_MEMBER_PHOTO_IMAGE_URL));
                    } else {
                        profile.setImageUrl(new URL(imageUrl));
                    }

                    return new Object[] {userId, profile};
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
     * <p>Calculates the statistics per contest types based on the contests which the user has registered to.</p>
     *
     * @param connStudio a <code>Connection</code> providing the connection to target <code>Studio</code> database.
     * @param profileId a <code>long</code> providing the ID of a member profile to get the statistics for.
     * @return a <code>Map</code> mapping the contest type IDs to respective statistics.
     * @throws SQLException if an SQL error occurs while accessing the target database.
     */
    private Map<Integer, ContestStatistics> getMemberProfileStats(Connection connStudio, Long profileId)
            throws SQLException {
        PreparedStatement stmt = null;
        ResultSet result = null;
        try {
            stmt = connStudio.prepareStatement(MEMBER_PROFILE_STATS_SQL);
            for (int i = 1; i <= 5; i++) {
                stmt.setLong(i, profileId);
            }
            result = stmt.executeQuery();
            Map<Integer, ContestStatistics> stats
                = new TreeMap<Integer, ContestStatistics>(new ContestTypeComparator());
            while (result.next()) {
                ContestType type = new ContestType();
                type.setId(result.getInt("contest_type_id"));
                type.setDescription(result.getString("contest_type_desc"));
                type.setIncludeGallery(result.getBoolean("include_gallery"));
                type.setPreviewFileRequired(result.getBoolean("require_preview_file"));
                type.setPreviewImageRequired(result.getBoolean("require_preview_image"));

                int contestsRegistered = result.getInt("contests_registered");
                int contestsSubmitted = result.getInt("contests_submitted");
                int submissionsCount = result.getInt("submissions_count");
                int submissionsPassedCount = result.getInt("passed_screening");
                int wins = result.getInt("wins");

                ContestStatistics statistics = new ContestStatistics();
                statistics.setContestType(type);
                statistics.setContestsRegistered(contestsRegistered);
                statistics.setNumberOfSubmissions(submissionsCount);
                statistics.setNumberOfWins(wins);
                statistics.setSubmissionPassedScreening(submissionsPassedCount);

                if (contestsRegistered != 0) {
                    statistics.setSubmissionPercentage(
                            (int) Math.round(100.00 * contestsSubmitted / contestsRegistered));
                } else {
                    statistics.setSubmissionPercentage(0);
                }
                if (submissionsCount != 0) {
                    statistics.setPassedScreeningPercentage(
                            (int) Math.round(100.00 * submissionsPassedCount / submissionsCount));
                } else {
                    statistics.setPassedScreeningPercentage(0);
                }
                if (contestsSubmitted != 0) {
                    statistics.setWinPercentage((int) Math.round(100.00 * wins / contestsSubmitted));
                } else {
                    statistics.setWinPercentage(0);
                }

                stats.put(type.getId(), statistics);
            }
            return stats;
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
    private static void close(ResultSet resultSet) {
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
    private static void close(PreparedStatement statement) {
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
    private static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                // Ignore this error and do not fill the console output with unnecessary stack trace
            }
        }
    }

    /**
     * <p>A comparator for the contest types. The content types are sorted based on the numeric order mapped to contest
     * type ID as outlined by the <code>Requirements Specification</code> document.</p>
     *
     * @author TCSDEVELOPER
     * @version 1.0
     * @since TopCoder Studio Member Profile Assembly
     * @see ViewMemberProfile#CONTEST_TYPES_ORDER
     */
    private static class ContestTypeComparator implements Comparator<Integer> {

        /**
         * <p>Constructs new <code>ContestTypeComparator</code> instance. This implementation does nothing.</p>
         */
        private ContestTypeComparator() {
        }

        /**
         * <p>Compares the specified types based on the pre-defined orders mapped to their names.</p>
         *
         * @param type1 a <code>ContestType</code> representing the first contest type to be compared.
         * @param type2 a <code>ContestType</code> representing the second contest type to be compared.
         * @return an <code>int</code> providing the result of comparison: a negative integer, zero, or a positive
         *         integer as the first argument is less than, equal to, or greater than the second.
         */
        public int compare(Integer type1, Integer type2) {
            int order1 = getOrder(type1);
            int order2 = getOrder(type2);
            return order1 - order2;
        }

        /**
         * <p>Gets the order for the specified contest type. Such an order specifies the position of specified contest
         * type in list among other contest types.</p>
         *
         * @param typeId a <code>Integer </code> providing the ID referencing the contest type to get the order for.
         * @return an <code>int</code> providing the order for specified contest type.
         */
        private static int getOrder(Integer typeId) {
            if (CONTEST_TYPES_ORDER.containsKey(typeId)) {
                return CONTEST_TYPES_ORDER.get(typeId);
            } else {
                return Integer.MAX_VALUE - 100;
            }
        }
    }
}