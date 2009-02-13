/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import com.topcoder.db.connectionfactory.DBConnectionException;
import com.topcoder.db.connectionfactory.DBConnectionFactory;
import com.topcoder.web.studio.dto.MemberProfile;
import com.topcoder.web.studio.dto.ContestStatistics;
import com.topcoder.web.studio.model.ContestType;

import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.net.URL;

/**
 * <p>A helper utility class providing various methods for getting the data from the test database. Such data is usually
 * used to test the effects of the executed tested methods of tested persistence class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public final class DatabaseUtil {

    /**
     * <p>Constructs new <code>DatabaseUtil</code> instance. This implementation does nothing.</p>
     */
    private DatabaseUtil() {
    }

    /**
     * <p>Clears the test database tables involved in unit testing. The records are removed from
     * <code>SUBMISSION_REVIEW</code>, <code>SUBMISSION</code> tables.</p>
     *
     * @param factory a <code>DBConnectionFactory</code> to be used for obtaining connections to target database.
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     * @throws IOException if an I/O error occurs while reading from file with test data.
     * @throws FileNotFoundException if the file with SQL script with test data is not found.
     */
    public static void clearTables(DBConnectionFactory factory) throws SQLException, DBConnectionException,
                                                                       IOException {
        Connection con = null;
        PreparedStatement ps = null;
        BufferedReader reader = null;

        String line = null;
        try {
            reader = new BufferedReader(new FileReader("./test_files/studio/testCleanup.sql"));

            con = factory.createConnection();
            con.setAutoCommit(true);

            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if ((line.length() > 0) && (!line.startsWith("--"))) {
                    if (line.endsWith(";")) {
                        line = line.substring(0, line.length() - 1);
                    }
                    ps = con.prepareStatement(line);
                    ps.executeUpdate();
                    ps.close();
                }
            }
        } finally {
            if (line != null) {
                System.out.println("Failed to execute SQL statement : " + line);
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // Ignore
                }
            }
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * <p>Populates the test database tables with sample data to be used for testing. The SQL commands for inserting the
     * sample data are read from the <code>modifications/test_files/testData.sql</code> text file.</p>
     *
     * @param factory a <code>DBConnectionFactory</code> to be used for obtaining connections to target database.
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     * @throws IOException if an I/O error occurs while reading from file with test data.
     * @throws FileNotFoundException if the file with SQL script with test data is not found.
     */
    public static void populateTables(DBConnectionFactory factory) throws DBConnectionException, SQLException,
                                                                          IOException {
        Connection con = null;
        PreparedStatement ps = null;
        BufferedReader reader = null;

        String line = null;
        try {
            reader = new BufferedReader(new FileReader("./test_files/studio/testData.sql"));

            con = factory.createConnection();
            con.setAutoCommit(true);

            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if ((line.length() > 0) && (!line.startsWith("--"))) {
                    if (line.endsWith(";")) {
                        line = line.substring(0, line.length() - 1);
                    }
                    ps = con.prepareStatement(line);
                    ps.executeUpdate();
                    ps.close();
                }
            }
        } finally {
            if (line != null) {
                System.out.println("Failed to execute SQL statement : " + line);
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // Ignore
                }
            }
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * <p>Deletes the records referenced by the specified IDs looked up in specified column from the specified database
     * table.</p>
     *
     * @param factory a <code>DBConnectionFactory</code> to be used for obtaining connections to target database.
     * @param tableName a <code>String</code> providing the name of the database table to delete records from.
     * @param idColumn a <code>String</code> providing the name of the column in specified table which serves for
     *        purpose of identifying the records.
     * @param ids a <code>List</code> providing the IDs of the records to be deleted from the specified table. 
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     * @throws IOException if an I/O error occurs while reading from file with test data.
     * @throws FileNotFoundException if the file with SQL script with test data is not found.
     */
    public static void deleteTableRecords(DBConnectionFactory factory, String tableName, String idColumn,
                                          List<Long> ids) throws SQLException, DBConnectionException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        BufferedReader reader = null;

        String line = null;
        try {
            con = factory.createConnection();
            con.setAutoCommit(true);
            
            ps = con.prepareStatement("DELETE FROM " + tableName + " WHERE " + idColumn + " = ?");
            for (Long id : ids) {
                ps.setLong(1, id);
                ps.executeUpdate();
            }
        } finally {
            if (line != null) {
                System.out.println("Failed to execute SQL statement : " + line);
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // Ignore
                }
            }
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * <p>Gets the member profile matching the specified handle.</p>
     *
     * @param factory a <code>DataSource</code> to be used for obtaining connections to target database.
     * @param handle a <code>String</code> providing the username for the user to get the profile for.
     * @return a <code>MemberProfile</code> matching the specified handle or <code>null</code> if there is no such
     *         handle. 
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     * @throws IOException if an I/O error occurs while reading from file with test data.
     * @throws FileNotFoundException if the file with SQL script with test data is not found.
     * @since TopCoder Studio Member Profile Assembly
     */
    public static MemberProfile getMemberProfile(DataSource factory, String handle)
            throws SQLException, DBConnectionException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = factory.getConnection();
            con.setAutoCommit(true);

            ps = con.prepareStatement("SELECT u.user_id, u.handle, c.quote, c.member_since,"
                                      + "       (SELECT 'http://www.topcoder.com/' || p.path || i.file_name"
                                      + "        FROM informixoltp:coder_image_xref cix"
                                      + "        INNER JOIN informixoltp:image i ON cix.image_id = i.image_id"
                                      + "        INNER JOIN informixoltp:path p ON i.path_id = p.path_id"
                                      + "        WHERE cix.coder_id = u.user_id"
                                      + "        AND cix.display_flag = 1) AS image_url "
                                      + "FROM common_oltp:user u, informixoltp:coder c "
                                      + "WHERE u.user_id=c.coder_id "
                                      + "AND u.handle = ?");
            ps.setString(1, handle);
            rs = ps.executeQuery();

            if (rs.next()) {
                long userId = rs.getLong("user_id");
                MemberProfile profile = new MemberProfile();
                profile.setHandle(rs.getString("handle"));
                profile.setQuote(rs.getString("quote"));
                profile.setMemberSince(rs.getTimestamp("member_since"));
                String imageUrl = rs.getString("image_url");
                if (rs.wasNull()) {
                    profile.setImageUrl(new URL("http://www.topcoder.com/i/m/nophoto.jpg"));
                } else {
                    profile.setImageUrl(new URL(imageUrl));
                }
                rs.close();
                ps.close();
                
                Map<Integer, ContestStatistics> stats = new HashMap<Integer, ContestStatistics>();

                // Number of contest registrations
                String s = "SELECT c.contest_type_id, t.contest_type_desc, t.include_gallery, t.require_preview_image,"
                           + "t.require_preview_file, "
                           + "COUNT(c.contest_id) AS contests_registered "
                           + "FROM contest_registration r "
                           + "INNER JOIN contest c ON r.contest_id = c.contest_id "
                           + "INNER JOIN contest_type_lu t ON c.contest_type_id = t.contest_type_id "
                           + "WHERE r.user_id = ? "
                           + "GROUP BY c.contest_type_id, t.contest_type_desc, t.include_gallery, "
                           + "t.require_preview_image, t.require_preview_file";
                ps = con.prepareStatement(s);
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ContestType type = new ContestType();
                    type.setId(rs.getInt("contest_type_id"));
                    type.setDescription(rs.getString("contest_type_desc"));
                    type.setIncludeGallery(rs.getBoolean("include_gallery"));
                    type.setPreviewFileRequired(rs.getBoolean("require_preview_file"));
                    type.setPreviewImageRequired(rs.getBoolean("require_preview_image"));

                    ContestStatisticsExt typeStats = new ContestStatisticsExt();
                    typeStats.setContestType(type);
                    typeStats.setContestsRegistered(rs.getInt("contests_registered"));

                    stats.put(type.getId(), typeStats);
                }
                rs.close();
                ps.close();

                // Number of contests submitted
                ps = con.prepareStatement("SELECT c.contest_type_id, COUNT(DISTINCT s.contest_id) AS cnt "
                                          + "FROM submission s "
                                          + "INNER JOIN contest c ON s.contest_id = c.contest_id "
                                          + "WHERE s.submission_status_id = 1 "
                                          + "AND s.submitter_id = ? "
                                          + "GROUP BY c.contest_type_id");
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int typeId = rs.getInt(1);
                    int cnt = rs.getInt(2);
                    if (stats.containsKey(typeId)) {
                        ContestStatisticsExt typeStats = (ContestStatisticsExt) stats.get(typeId);
                        typeStats.setContestsSubmitted(cnt);
                    }
                }
                rs.close();
                ps.close();

                // Number of submissions
                ps = con.prepareStatement("SELECT c.contest_type_id, COUNT(*) AS cnt "
                                          + "FROM submission s "
                                          + "INNER JOIN contest c ON s.contest_id = c.contest_id "
                                          + "WHERE s.submission_status_id = 1 "
                                          + "AND s.submitter_id = ? "
                                          + "GROUP BY c.contest_type_id");
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int typeId = rs.getInt(1);
                    int cnt = rs.getInt(2);
                    if (stats.containsKey(typeId)) {
                        ContestStatistics typeStats = stats.get(typeId);
                        typeStats.setNumberOfSubmissions(cnt);
                    }
                }
                rs.close();
                ps.close();

                // Number of submissions passed screening
                ps = con.prepareStatement("SELECT c.contest_type_id, count(*) AS cnt "
                                          + "FROM submission s "
                                          + "INNER JOIN contest c ON s.contest_id = c.contest_id "
                                          + "INNER JOIN submission_review r ON s.submission_id = r.submission_id "
                                          + "WHERE s.submission_status_id = 1 "
                                          + "AND s.submitter_id = ? "
                                          + "AND r.review_status_id = 1 "
                                          + "GROUP BY c.contest_type_id");
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int typeId = rs.getInt(1);
                    int cnt = rs.getInt(2);
                    if (stats.containsKey(typeId)) {
                        ContestStatistics typeStats = stats.get(typeId);
                        typeStats.setSubmissionPassedScreening(cnt);
                    }
                }
                rs.close();
                ps.close();
                
                // Number of winnings
                ps = con.prepareStatement("SELECT c.contest_type_id, count(*) AS cnt "
                                          + "FROM submission s "
                                          + "INNER JOIN contest c ON s.contest_id = c.contest_id "
                                          + "INNER JOIN submission_prize_xref spx ON s.submission_id=spx.submission_id "
                                          + "INNER JOIN prize p ON spx.prize_id = p.prize_id AND p.place = 1 "
                                          + "WHERE s.submission_status_id = 1 "
                                          + "AND s.submitter_id = ? "
                                          + "GROUP BY c.contest_type_id");
                ps.setLong(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int typeId = rs.getInt(1);
                    int cnt = rs.getInt(2);
                    if (stats.containsKey(typeId)) {
                        ContestStatistics typeStats = stats.get(typeId);
                        typeStats.setNumberOfWins(cnt);
                    }
                }
                rs.close();
                ps.close();

                for (Integer typeId : stats.keySet()) {
                    ContestStatisticsExt typeStat = (ContestStatisticsExt) stats.get(typeId);
                    typeStat.setWinPercentage(
                            (int) Math.round(100.00 * typeStat.getNumberOfWins() / typeStat.getContestsSubmitted()));
                    typeStat.setSubmissionPercentage(
                            (int) Math.round(100.00 * typeStat.getContestsSubmitted()
                                             / typeStat.getContestsRegistered()));
                    typeStat.setPassedScreeningPercentage(
                            (int) Math.round(100.00 * typeStat.getSubmissionPassedScreening()
                                             / typeStat.getNumberOfSubmissions()));
                }

                System.out.println("*** Statistics for " + handle);
                for (Integer typeId : stats.keySet()) {
                    ContestStatisticsExt typeStat = (ContestStatisticsExt) stats.get(typeId);
                    System.out.println();
                    System.out.println("    Type ID: " + typeId);
                    System.out.println("        Contests #     :" + typeStat.getContestsRegistered());
                    System.out.println("        Submitted #    :" + typeStat.getContestsSubmitted());
                    System.out.println("        Wins #         :" + typeStat.getNumberOfWins());
                    System.out.println("        Wins %         :" + typeStat.getWinPercentage());
                    System.out.println("        Submissions #  :" + typeStat.getNumberOfSubmissions());
                    System.out.println("        Submissions %  :" + typeStat.getSubmissionPercentage());
                    System.out.println("        Passed #       :" + typeStat.getSubmissionPassedScreening());
                    System.out.println("        Passed %       :" + typeStat.getPassedScreeningPercentage());
                    System.out.println();
                }
                System.out.println("***************");
                profile.setStatistics(stats);
                
                return profile;
            } else {
                return null;
            }
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
