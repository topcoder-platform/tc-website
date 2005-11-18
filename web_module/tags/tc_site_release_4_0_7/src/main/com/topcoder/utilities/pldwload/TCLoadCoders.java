package com.topcoder.utilities.pldwload;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

/**
 * TCLoadCoders.java
 *
 * TCLoadCoders loads coder information tables from one database to another.
 * The tables that are built by this load procedure are:
 * <ul>
 * <li>state</li>
 * <li>country</li>
 * <li>coder</li>
 * <li>rating</li>
 * <li>school</li>
 * <li>current_school</li>
 * </ul>
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 */
public class TCLoadCoders extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadCoders.class);
    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;
    private int CODER_LOG_TYPE = 2;


    public TCLoadCoders() {
        DEBUG = false;
    }

    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        return true;
    }

    /**
     * This method performs the load for the coder information tables
     */
    public boolean performLoad() {
        try {
            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());

            getLastUpdateTime();

            loadState();

            loadCountry();

            loadCoder();

            loadRating();

            loadSchool();

            loadCurrentSchool();

            setLastUpdateTime();

            log.info("SUCCESS: Coders load ran successfully.");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }

    private void getLastUpdateTime() throws Exception {
        Statement stmt = null;
        ResultSet rs = null;
        StringBuffer query = null;

        query = new StringBuffer(100);
        query.append("select timestamp from update_log where log_id = ");
        query.append("(select max(log_id) from update_log where log_type_id = " + CODER_LOG_TYPE + ")");

        try {
            stmt = createStatement(TARGET_DB);
            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp(1);
                log.info("Date is " + fLastLogTime.toString());
            } else {
                // A little misleading here as we really didn't hit a SQL
                // exception but all we are doing outside this method is
                // catchin and setting the reason for failure to be the
                // message of the exception.
                throw new SQLException("Last log time not found in " +
                        "update_log table.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(stmt);
        }
    }


    private void loadState() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT s.state_code ");
            query.append(" ,s.state_name ");
            query.append(" ,s.region_code ");
            query.append(" FROM state s ");
            query.append(" WHERE s.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO state ");
            query.append(" (state_code ");
            query.append(" ,state_name ");
            query.append(" ,region_code) ");
            query.append("VALUES (");
            query.append("?,?,?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE state SET state_name = ?, region_code = ? WHERE state_code = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadState");

            while (rs.next()) {
                String state_code = rs.getString("state_code");

                try {
                    psIns.setString(1, state_code);
                    psIns.setString(2, rs.getString("state_name"));
                    psIns.setString(3, rs.getString("region_code"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("state_name"));
                    psUpd.setString(2, rs.getString("region_code"));
                    psUpd.setString(3, state_code);
                    retVal = psUpd.executeUpdate();
                }


                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoder: Load state for state " + state_code +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "state");
            }

            log.info("state records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'state' table failed.\n" +
                    sqle.getMessage());
        }
    }


    private void loadCountry() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT c.country_code ");
            query.append(" ,c.country_name ");
            query.append(" ,c.participating ");
            query.append(" FROM country c ");
            query.append(" WHERE c.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO country ");
            query.append(" (country_code ");
            query.append(" ,country_name ");
            query.append(" ,participating) ");
            query.append("VALUES (");
            query.append("?,?,?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE country SET country_name = ?, participating = ? WHERE country_code = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadCountry");

            while (rs.next()) {
                String country_code = rs.getString("country_code");

                try {
                    psIns.setString(1, country_code);
                    psIns.setString(2, rs.getString("country_name"));
                    psIns.setInt(3, rs.getInt("participating"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("country_name"));
                    psUpd.setString(2, rs.getString("participating"));
                    psUpd.setString(3, country_code);
                    retVal = psUpd.executeUpdate();
                }


                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoder: Load country for country " + country_code +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "country");
            }

            log.info("country records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'country' table failed.\n" +
                    sqle.getMessage());
        }
    }


    /**
     * This method loads the 'coder' table of the data warehouse. It holds
     * information on a particular coder like address, real name, handle, etc.
     */
    private void loadCoder() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        PreparedStatement psSel2 = null;
        StringBuffer query = null;

        ResultSet rs = null;
        ResultSet rs2 = null;
        int count = 0;
        int retVal = 0;

        try {
            // Our select statement
            query = new StringBuffer(100);
            query.append("SELECT c.coder_id");                      //1
            query.append("       ,a.state_code");                   //2
            query.append("       ,a.country_code");                 //3
            query.append("       ,u.first_name");                   //4
            query.append("       ,u.last_name");                    //5
            query.append("       ,a.address1");                     //6
            query.append("       ,a.address2");                     //7
            query.append("       ,a.city");                         //8
            query.append("       ,a.zip");                          //9
            query.append("       ,u.middle_name");                  //10
            query.append("       ,u.activation_code");              //11
            query.append("       ,c.member_since");                 //12
            query.append("       ,c.quote");                        //13
            query.append("       ,CURRENT");                        //14
            query.append("       ,c.editor_id");                    //15
            query.append("       ,c.language_id");                  //16
            query.append("       ,c.coder_type_id");                //17
            query.append("       ,u.handle");                       //18
            query.append("       ,u.status");                       //19
            query.append("       ,e.address");                      //20
            query.append("       ,u.last_login");                   //21
            query.append("       ,(SELECT rs.region_code");         //22
            query.append("           FROM region_state rs");
            query.append("          WHERE a.state_code = rs.state_code");
            query.append("          AND rs.user_type_id = 3)");
            query.append("  FROM coder c ");
            query.append("       ,user u ");
            query.append("       ,address a");
            query.append("       ,user_address_xref uax");
            query.append("       ,email e");
            query.append(" WHERE c.coder_id = u.user_id ");
            query.append("   AND c.modify_date > ?");
            query.append("   AND c.coder_id = uax.user_id");
            query.append("   AND uax.address_id = a.address_id");
            query.append("   AND a.address_type_id = 2");
            query.append("   AND e.user_id = c.coder_id");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = c.coder_id ");
            query.append("           AND gu.group_id = 13)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = c.coder_id ");
            query.append("           AND gu.group_id = 14)");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            // Our insert statement
            query = new StringBuffer(100);
            query.append("INSERT INTO coder ");
            query.append("      (coder_id ");                   // 1
            query.append("       ,state_code ");                // 2
            query.append("       ,country_code ");              // 3
            query.append("       ,first_name ");                // 4
            query.append("       ,last_name ");                 // 5
            query.append("       ,address1 ");                  // 6
            query.append("       ,address2 ");                  // 7
            query.append("       ,city ");                      // 8
            query.append("       ,zip ");                       // 9
            query.append("       ,middle_name ");               // 10
            query.append("       ,activation_code ");           // 11
            query.append("       ,member_since ");              // 12
            query.append("       ,quote ");                     // 13
            query.append("       ,modify_date ");               // 14
            query.append("       ,editor_id ");                 // 15
            query.append("       ,language_id ");               // 16
            query.append("       ,coder_type_id ");             // 17
            query.append("       ,handle ");                    // 18
            query.append("       ,status ");                    // 19
            query.append("       ,email ");                     // 20
            query.append("       ,last_login ");                // 21
            query.append("       ,coder_region_code ");         // 22
            query.append("       ,password ");                  // 23
            query.append("       ,terms) ");                     //24
            query.append(" VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 20
            query.append("?,?,?,?)");  // 24
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // Our update statement
            query = new StringBuffer(100);
            query.append("UPDATE coder ");
            query.append("   SET state_code = ? ");                 // 1
            query.append("       ,country_code = ? ");              // 2
            query.append("       ,first_name = ? ");                // 3
            query.append("       ,last_name = ? ");                 // 4
            query.append("       ,address1 = ? ");                  // 5
            query.append("       ,address2 = ? ");                  // 6
            query.append("       ,city = ? ");                      // 7
            query.append("       ,zip = ? ");                       // 8
            query.append("       ,middle_name = ? ");               // 9
            query.append("       ,activation_code = ? ");           // 10
            query.append("       ,member_since = ? ");              // 11
            query.append("       ,quote = ? ");                     // 12
            query.append("       ,modify_date = ? ");               // 13
            query.append("       ,editor_id = ? ");                 // 14
            query.append("       ,language_id = ? ");               // 15
            query.append("       ,coder_type_id = ? ");             // 16
            query.append("       ,handle = ? ");                    // 17
            query.append("       ,status = ? ");                    // 18
            query.append("       ,email = ? ");                     // 19
            query.append("       ,last_login = ? ");                // 20
            query.append("       ,coder_region_code = ? ");         // 21
            query.append("       ,password = ?");                   // 22
            query.append("       ,terms = ?");                      // 23
            query.append("WHERE coder_id = ?");                     // 24
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            // Our select statement to determine if a particular row is
            // present or not
            query = new StringBuffer(100);
            query.append("SELECT 'pops' ");
            query.append("  FROM coder ");
            query.append(" WHERE coder_id = ?");
            psSel2 = prepareStatement(query.toString(), TARGET_DB);

            // The first thing we do is delete the old record prior to inserting the
            // new record. We don't care if this fails or not.
            psSel.setTimestamp(1, fLastLogTime);
            rs = executeQuery(psSel, "loadCoder");

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, coder_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setString(1, rs.getString(2));   // state_code
                    psUpd.setString(2, rs.getString(3));   // country_code
                    psUpd.setString(3, rs.getString(4));   // first_name
                    psUpd.setString(4, rs.getString(5));   // last_name
                    psUpd.setString(5, rs.getString(6));   // address1
                    psUpd.setString(6, rs.getString(7));   // address2
                    psUpd.setString(7, rs.getString(8));  // city
                    psUpd.setString(8, rs.getString(9));  // zip
                    psUpd.setString(9, rs.getString(10));  // middle_name
                    psUpd.setString(10, rs.getString(11));  // activation_code
                    psUpd.setTimestamp(11, rs.getTimestamp(12));  // member_since
                    psUpd.setString(12, rs.getString(13));  // quote
                    psUpd.setTimestamp(13, rs.getTimestamp(14));  // modify_date
                    psUpd.setInt(14, rs.getInt(15));  // editor_id
                    psUpd.setInt(15, rs.getInt(16));  // language_id
                    psUpd.setInt(16, rs.getInt(17));  // coder_type_id
                    psUpd.setString(17, rs.getString(18));  // handle
                    psUpd.setString(18, rs.getString(19));  // status
                    psUpd.setString(19, rs.getString(20));  // email
                    psUpd.setTimestamp(20, rs.getTimestamp(21));  // last_login
                    psUpd.setString(21, rs.getString(22));  // coder_region_code
                    psUpd.setString(22, ""); //clear the password, dw don't need it
                    psUpd.setString(23, ""); //terms
                    psUpd.setInt(24, coder_id);  // coder_id

                    // Now, execute the insert of the new row
                    retVal = psUpd.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Update for coder_id " +
                                coder_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, coder_id);   // coder_id
                    psIns.setString(2, rs.getString(2));   // state_code
                    psIns.setString(3, rs.getString(3));   // country_code
                    psIns.setString(4, rs.getString(4));   // first_name
                    psIns.setString(5, rs.getString(5));   // last_name
                    psIns.setString(6, rs.getString(6));   // address1
                    psIns.setString(7, rs.getString(7));   // address2
                    psIns.setString(8, rs.getString(8));  // city
                    psIns.setString(9, rs.getString(9));  // zip
                    psIns.setString(10, rs.getString(10));  // middle_name
                    psIns.setString(11, rs.getString(11));  // activation_code
                    psIns.setTimestamp(12, rs.getTimestamp(12));  // member_since
                    psIns.setString(13, rs.getString(13));  // quote
                    psIns.setTimestamp(14, rs.getTimestamp(14));  // modify_date
                    psIns.setInt(15, rs.getInt(15));  // editor_id
                    psIns.setInt(16, rs.getInt(16));  // language_id
                    psIns.setInt(17, rs.getInt(17));  // coder_type_id
                    psIns.setString(18, rs.getString(18));  // handle
                    psIns.setString(19, rs.getString(19));  // status
                    psIns.setString(20, rs.getString(20));  // email
                    psIns.setTimestamp(21, rs.getTimestamp(21));  // last_login
                    psIns.setString(22, rs.getString(22));  // coder_region_code
                    psIns.setString(23, "");  // clear plassword, dw don't need it
                    psIns.setString(24, "");  // terms

                    // Now, execute the insert of the new row
                    retVal = psIns.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Insert for coder_id " +
                                coder_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "coder");
            }

            log.info("Coder records updated/inserted = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psIns);
            close(psSel2);
        }
    }

    /**
     * This method loads the 'rating' table of the data warehouse. For this
     * table, all we are doing is populating a row in the table for newly added
     * coders to the system. The real meat of the table load is done in
     * TCLoadRound.
     */
    private void loadRating() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT r.coder_id ");           // 1
            query.append("       ,r.rating ");            // 2
            query.append("       ,r.num_ratings ");       // 3
            query.append("       ,CURRENT ");             // 4
            query.append("       ,r.vol ");               // 5
            query.append("       ,r.rating_no_vol ");     // 6
            query.append("  FROM rating r ");
            query.append(" WHERE r.modify_date > ? ");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = r.coder_id ");
            query.append("           AND gu.group_id = 13)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = r.coder_id ");
            query.append("           AND gu.group_id = 14)");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("SELECT first_rated_round_id ");  // 1
            query.append("       ,last_rated_round_id ");  // 2
            query.append("       ,lowest_rating ");        // 3
            query.append("       ,highest_rating ");       // 4
            query.append("       ,num_competitions ");     // 5
            query.append("  FROM rating ");
            query.append(" WHERE coder_id = ?");
            psSel2 = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO rating ");
            query.append("      (coder_id ");               // 1
            query.append("       ,rating ");                // 2
            query.append("       ,num_ratings ");           // 3
            query.append("       ,modify_date ");           // 4
            query.append("       ,vol ");                   // 5
            query.append("       ,rating_no_vol ");         // 6
            query.append("       ,highest_rating ");        // 7
            query.append("       ,lowest_rating ");         // 8
            query.append("       ,first_rated_round_id ");  // 9
            query.append("       ,last_rated_round_id ");   // 10
            query.append("       ,num_competitions) ");     // 11
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?)");                   // 11 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM rating where coder_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);

            psSel.setTimestamp(1, fLastLogTime);
            rs = executeQuery(psSel, "loadRating");

            // We have a slightly special case here. If the coder already has a row
            // in the rating table, he/she has a first_rated_round_id. If not, this
            // is their first round rated. So, we have to check to see if that row
            // exists prior to deleting so we can maintain that first rated round
            // value. For the
            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int first_rated_round_id = -1;
                int last_rated_round_id = -1;
                int lowest_rating = 0;
                int highest_rating = 0;
                int num_competitions = 0;

                psSel2.clearParameters();
                psSel2.setInt(1, coder_id);
                rs2 = psSel2.executeQuery();
                if (rs2.next()) {
                    if (rs2.getString(1) != null)
                        first_rated_round_id = rs2.getInt(1);
                    if (rs2.getString(2) != null)
                        last_rated_round_id = rs2.getInt(2);
                    lowest_rating = rs2.getInt(3);
                    highest_rating = rs2.getInt(4);
                    num_competitions = rs2.getInt(5);
                }

                close(rs2);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, coder_id);  // coder_id
                psIns.setInt(2, rs.getInt(2));  // rating
                psIns.setInt(3, rs.getInt(3));  // num_ratings
                psIns.setTimestamp(4, rs.getTimestamp(4));  // modify_date
                psIns.setInt(5, rs.getInt(5));  // vol
                psIns.setInt(6, rs.getInt(6));  // rating_no_vol
                psIns.setInt(7, highest_rating);      // max_rating
                psIns.setInt(8, lowest_rating);       // min_rating

                if (first_rated_round_id > -1)
                    psIns.setInt(9, first_rated_round_id);     // first_rated_round_id
                else
                    psIns.setNull(9, java.sql.Types.DECIMAL);

                if (last_rated_round_id > -1)
                    psIns.setInt(10, last_rated_round_id);      // last_rated_round_id
                else
                    psIns.setNull(10, java.sql.Types.DECIMAL);

                psIns.setInt(11, num_competitions);     // num_competitions

                retVal = psIns.executeUpdate();
                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoders: Insert for coder_id " +
                            coder_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "rating");
            }

            log.info("Rating records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'rating' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psDel);
        }
    }


    private void loadSchool() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT s.school_id ");
            query.append(" ,s.state_code ");
            query.append(" ,s.full_name ");
            query.append(" ,s.short_name ");
            query.append(" FROM school s ");
            query.append(" WHERE s.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO school ");
            query.append(" (school_id ");
            query.append(" ,state_code ");
            query.append(" ,name ");
            query.append(" ,short_name) ");
            query.append("VALUES (");
            query.append("?,?,?,?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE school SET state_code = ?, name = ?, short_name = ? WHERE school_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadSchool");

            while (rs.next()) {
                int school_id = rs.getInt("school_id");


                try {
                    psIns.setInt(1, school_id);
                    psIns.setString(2, rs.getString("state_code"));
                    psIns.setString(3, rs.getString("full_name"));
                    psIns.setString(4, rs.getString("short_name"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("state_code"));
                    psUpd.setString(2, rs.getString("full_name"));
                    psUpd.setString(3, rs.getString("short_name"));
                    psUpd.setInt(4, school_id);
                    retVal = psUpd.executeUpdate();
                }


                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoder: Load school for school " + school_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "school");
            }

            log.info("school records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'school' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
        }
    }


    private void loadCurrentSchool() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT cs.coder_id ");
            query.append(" ,cs.school_name ");
            query.append(" ,cs.school_id ");
            query.append(" ,cs.degree_number ");
            query.append(" FROM current_school cs ");
            query.append(" WHERE cs.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO current_school ");
            query.append(" (coder_id ");
            query.append(" ,school_name ");
            query.append(" ,school_id ");
            query.append(" ,degree_number) ");
            query.append("VALUES (");
            query.append("?,?,?,?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE current_school SET school_name = ?, school_id = ?, degree_number = ? WHERE coder_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadCurrentSchool");

            while (rs.next()) {
                int coder_id = rs.getInt("coder_id");

                try {
                    psIns.setInt(1, coder_id);
                    psIns.setString(2, rs.getString("school_name"));
                    psIns.setString(3, rs.getString("school_id"));
                    psIns.setInt(4, rs.getInt("degree_number"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("school_name"));
                    psUpd.setString(2, rs.getString("school_id"));
                    psUpd.setInt(3, rs.getInt("degree_number"));
                    psUpd.setInt(4, coder_id);
                    retVal = psUpd.executeUpdate();
                }


                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoder: Load current school for coder " + coder_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "current_school");
            }

            log.info("current_school records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'current_school' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
        }
    }


    private void setLastUpdateTime() throws Exception {
        PreparedStatement psUpd = null;
        StringBuffer query = null;

        try {
            int retVal = 0;
            query = new StringBuffer(100);
            query.append("INSERT INTO update_log ");
            query.append("      (log_id ");        // 1
            query.append("       ,calendar_id ");  // 2
            query.append("       ,timestamp ");   // 3
            query.append("       ,log_type_id) ");   // 4
            query.append("VALUES (0, ?, ?, " + CODER_LOG_TYPE + ")");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            int calendar_id = lookupCalendarId(fStartTime, TARGET_DB);
            psUpd.setInt(1, calendar_id);
            psUpd.setTimestamp(2, fStartTime);

            retVal = psUpd.executeUpdate();
            if (retVal != 1) {
                throw new SQLException("SetLastUpdateTime " +
                        " modified " + retVal + " rows, not one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" +
                    sqle.getMessage());
        } finally {
            close(psUpd);
        }
    }
}
