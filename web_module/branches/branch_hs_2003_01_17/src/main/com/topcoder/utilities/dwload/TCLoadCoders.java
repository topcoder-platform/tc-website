package com.topcoder.utilities.dwload;

/**
 * TCLoadCoders.java
 *
 * TCLoadCoders loads coder information tables from one database to another.
 * The tables that are built by this load procedure are:
 * <ul>     
 * <li>state</li>
 * <li>country</li>
 * <li>coder</li>
 * <li>skill</li>
 * <li>skill_type</li>
 * <li>coder_skill</li>
 * <li>rating</li>
 * <li>path</li>
 * <li>image</li>
 * <li>coder_image_xref</li>
 * <li>school</li>
 * <li>current_school</li>
 * </ul>
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 */
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.Hashtable;

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

            // Need to load skill_type first due to referential integrity in skill
            loadSkillType();

            loadSkill();

            loadCoderSkill();

            loadRating();

            loadPath();

            loadImage();

            loadCoderImageXref();

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
            query.append(      " ,s.state_name ");    
            query.append(      " ,s.region_code ");
            query.append( " FROM state s ");
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
            query.append(      " ,c.country_name ");    
            query.append(      " ,c.participating ");
            query.append( " FROM country c ");
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
            query=new StringBuffer(1024);
            query.append("SELECT c.coder_id ");                  // 1
            query.append("      ,s.state_code ");                // 2
            query.append("      ,c.country_code ");              // 3
            query.append("      ,u.first_name ");                // 4
            query.append("      ,u.last_name ");                 // 5
            query.append("      ,c.member_since ");              // 6
            query.append("      ,CURRENT ");                     // 7
            query.append("      ,c.editor_id ");                 // 8
            query.append("      ,c.language_id ");               // 9
            query.append("      ,u.handle ");                    // 10
            query.append("      ,u.password ");                  // 11
            query.append("      ,u.status ");                    // 12
            query.append("      ,e.address ");                   // 13
            query.append("      ,u.last_login ");                // 14
            query.append("  FROM coder c ");
            query.append("      ,user u ");
            query.append("      ,email e ");
            query.append("      ,school s ");
            query.append("      ,user_school_xref x ");
            query.append(" WHERE c.coder_id = u.user_id ");
            query.append("   AND e.user_id = u.user_id ");
            query.append("   AND e.primary = 1 ");
            query.append("   AND x.user_id = u.user_id ");
            query.append("   AND x.school_id = s.school_id ");
            query.append("   AND x.current_ind = 1 ");
            query.append("   AND (c.modify_date > ? ");
            query.append("    OR  e.modify_date > ? ");
            query.append("    OR  u.modify_date > ?)");
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
            query = new StringBuffer(1024);
            query.append("INSERT INTO coder ");
            query.append("      (coder_id ");                   // 1
            query.append("       ,state_code ");                // 2
            query.append("       ,country_code ");              // 3
            query.append("       ,first_name ");                // 4
            query.append("       ,last_name ");                 // 5
            query.append("       ,member_since ");              // 6
            query.append("       ,modify_date ");               // 7
            query.append("       ,editor_id ");                 // 8
            query.append("       ,language_id ");               // 9
            query.append("       ,handle ");                    // 10
            query.append("       ,password ");                  // 11
            query.append("       ,status ");                    // 12
            query.append("       ,email ");                     // 13
            query.append("       ,last_login) ");               // 14
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10
            query.append("?,?,?,?)");              // 14 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // Our update statement
            query = new StringBuffer(1024);
            query.append("UPDATE coder ");
            query.append("   SET state_code = ? ");                 // 2
            query.append("       ,country_code = ? ");              // 3
            query.append("       ,first_name = ? ");                // 4
            query.append("       ,last_name = ? ");                 // 5
            query.append("       ,member_since = ? ");              // 6
            query.append("       ,modify_date = ? ");               // 7
            query.append("       ,editor_id = ? ");                 // 8
            query.append("       ,language_id = ? ");               // 9
            query.append("       ,handle = ? ");                    // 10
            query.append("       ,password = ? ");                  // 11
            query.append("       ,status = ? ");                    // 12
            query.append("       ,email = ? ");                     // 13
            query.append("       ,last_login = ? ");                // 14
            query.append("WHERE coder_id = ?");                     // 1
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            // Our select statement to determine if a particular row is
            // present or not
            query = new StringBuffer(1024);
            query.append("SELECT 'pops' ");
            query.append("  FROM coder ");
            query.append(" WHERE coder_id = ?");
            psSel2=prepareStatement(query.toString(), TARGET_DB);

            // The first thing we do is delete the old record prior to
            // inserting the new record. We don't care if this fails or not.
            psSel.setTimestamp(1, fLastLogTime);
            psSel.setTimestamp(2, fLastLogTime);
            psSel.setTimestamp(3, fLastLogTime);
            rs=executeQuery(psSel, "loadCoder");

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, coder_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setString(1, rs.getString(2));         // state_code
                    psUpd.setString(2, rs.getString(3));         // country_code
                    psUpd.setString(3, rs.getString(4));         // first_name
                    psUpd.setString(4, rs.getString(5));         // last_name
                    psUpd.setTimestamp(5, rs.getTimestamp(6));   // member_since
                    psUpd.setTimestamp(6, rs.getTimestamp(7));   // modify_date
                    psUpd.setInt(7, rs.getInt(8));               // editor_id
                    psUpd.setInt(8, rs.getInt(9));               // language_id
                    psUpd.setString(9, rs.getString(10));        // handle
                    psUpd.setString(10, rs.getString(11));       // password
                    psUpd.setString(11, rs.getString(12));       // status
                    psUpd.setString(12, rs.getString(13));       // email
                    psUpd.setTimestamp(13, rs.getTimestamp(14)); // last_login
                    psUpd.setInt(14, coder_id);                  // coder_id

                    // Now, execute the insert of the new row
                    retVal = psUpd.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw(new SQLException("TCLoadCoders: Update for "+
                                               "coder_id "+coder_id+
                                               " modified "+retVal+" rows, "+
                                               "not one."));
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, coder_id);                   // coder_id
                    psIns.setString(2, rs.getString(2));         // state_code
                    psIns.setString(3, rs.getString(3));         // country_code
                    psIns.setString(4, rs.getString(4));         // first_name
                    psIns.setString(5, rs.getString(5));         // last_name
                    psIns.setTimestamp(6, rs.getTimestamp(6));   // member_since
                    psIns.setTimestamp(7, rs.getTimestamp(7));   // modify_date
                    psIns.setInt(8, rs.getInt(8));               // editor_id
                    psIns.setInt(9, rs.getInt(9));               // language_id
                    psIns.setString(10, rs.getString(10));       // handle
                    psIns.setString(11, rs.getString(11));       // password
                    psIns.setString(12, rs.getString(12));       // status
                    psIns.setString(13, rs.getString(13));       // email
                    psIns.setTimestamp(14, rs.getTimestamp(14)); // last_login

                    // Now, execute the insert of the new row
                    retVal = psIns.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw(new SQLException("TCLoadCoders: Insert for "+
                                               "coder_id "+coder_id+
                                               " modified "+retVal+" rows, "+
                                               "not one."));
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
     * This method loads the 'skill' table of the data warehouse.
     */
    private void loadSkill() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        StringBuffer query = null;

        int count = 0;
        int retVal = 0;

        try {
            // Our select statement
            query = new StringBuffer(100);
            query.append("SELECT s.skill_id ");        // 1
            query.append("       ,s.skill_type_id ");  // 2
            query.append("       ,s.skill_desc ");     // 3
            query.append("       ,s.status ");         // 4
            query.append("       ,s.skill_order ");    // 5
            query.append("       ,CURRENT ");          // 6
            query.append(" FROM skill s ");
            query.append("WHERE modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            // Our insert statement
            query = new StringBuffer(100);
            query.append("INSERT INTO skill ");
            query.append("      (skill_id ");        // 1
            query.append("       ,skill_type_id ");  // 2
            query.append("       ,skill_desc ");     // 3
            query.append("       ,status ");         // 4
            query.append("       ,skill_order ");    // 5
            query.append("       ,modify_date) ");   // 6
            query.append("VALUES (?,?,?,?,?,?)"); // 6 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // Our update statement
            query = new StringBuffer(100);
            query.append("UPDATE skill ");
            query.append("   SET skill_type_id = ? ");   // 1
            query.append("       ,skill_desc = ? ");     // 2
            query.append("       ,status = ? ");         // 3
            query.append("       ,skill_order = ? ");    // 4
            query.append("       ,modify_date = ? ");   // 5
            query.append(" WHERE skill_id = ? ");        // 6
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            // Our select statement to determine if the row exists
            query = new StringBuffer(100);
            query.append("SELECT 'pops' ");
            query.append("  FROM skill ");
            query.append(" WHERE skill_id = ?");
            psSel2 = prepareStatement(query.toString(), TARGET_DB);

            psSel.setTimestamp(1, fLastLogTime);
            rs = executeQuery(psSel, "loadSkill");

            while (rs.next()) {
                int skill_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, skill_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setInt(1, rs.getInt(2));  // skill_type_id
                    psUpd.setString(2, rs.getString(3));  // skill_desc
                    psUpd.setString(3, rs.getString(4));  // status
                    psUpd.setInt(4, rs.getInt(5));  // skill_order
                    psUpd.setTimestamp(5, rs.getTimestamp(6));  // modify_date
                    psUpd.setInt(6, skill_id);            // skill_id

                    retVal = psUpd.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Update for skill " +
                                skill_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, skill_id);            // skill_id
                    psIns.setInt(2, rs.getInt(2));  // skill_type_id
                    psIns.setString(3, rs.getString(3));  // skill_desc
                    psIns.setString(4, rs.getString(4));  // status
                    psIns.setInt(5, rs.getInt(5));  // skill_order
                    psIns.setTimestamp(6, rs.getTimestamp(6));  // modify_date

                    retVal = psIns.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Insert for skill " +
                                skill_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "skill");
            }

            log.info("Skill records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'skill' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psIns);
            close(psSel2);
        }
    }

    /**
     * This method loads the 'skill_type' table of the data warehouse.
     */
    private void loadSkillType() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        PreparedStatement psSel2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        int count = 0;
        int retVal = 0;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT st.skill_type_id ");      // 1
            query.append("       ,st.skill_type_desc ");   // 2
            query.append("       ,st.skill_type_order ");  // 3
            query.append("       ,st.status ");            // 4
            query.append("       ,CURRENT ");              // 5
            query.append(" FROM skill_type st ");
            query.append("WHERE modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO skill_type_lu ");
            query.append("      (skill_type_id ");      // 1
            query.append("       ,skill_type_desc ");   // 2
            query.append("       ,skill_type_order ");  // 3
            query.append("       ,status ");            // 4
            query.append("       ,modify_date) ");      // 5
            query.append("VALUES (?,?,?,?,?)");  // 5 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("UPDATE skill_type_lu ");
            query.append("   SET skill_type_desc = ? ");    // 1
            query.append("       ,skill_type_order = ? ");  // 2
            query.append("       ,status = ? ");            // 3
            query.append("       ,modify_date = ? ");       // 4
            query.append(" WHERE skill_type_id = ?");       // 5
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("SELECT 'pops' ");
            query.append("  FROM skill_type_lu ");
            query.append(" WHERE skill_type_id = ?");
            psSel2 = prepareStatement(query.toString(), TARGET_DB);

            psSel.setTimestamp(1, fLastLogTime);
            rs = executeQuery(psSel, "loadSkillType");

            while (rs.next()) {
                int skill_type_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, skill_type_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setString(1, rs.getString(2));  // skill_type_desc
                    psUpd.setInt(2, rs.getInt(3));  // skill_type_order
                    psUpd.setString(3, rs.getString(4));  // status
                    psUpd.setTimestamp(4, rs.getTimestamp(5));  // modify_date
                    psUpd.setInt(5, skill_type_id);  // skill_type_id

                    retVal = psUpd.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Update for skill_type " +
                                skill_type_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, skill_type_id);  // skill_type_id
                    psIns.setString(2, rs.getString(2));  // skill_type_desc
                    psIns.setInt(3, rs.getInt(3));  // skill_type_order
                    psIns.setString(4, rs.getString(4));  // status
                    psIns.setTimestamp(5, rs.getTimestamp(5));  // modify_date

                    retVal = psIns.executeUpdate();
                    count = count + retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadCoders: Insert for skill_type " +
                                skill_type_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "skill_type");
            }

            log.info("Skill_type records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'skill_type' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
        }
    }

    /**
     * This method loads the 'coder_skill' table of the data warehouse.
     */
    private void loadCoderSkill() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        StringBuffer query = null;

        ResultSet rs = null;
        int count = 0;
        int retVal = 0;

        try {
            query = new StringBuffer(100);
            query.append("SELECT cs.coder_id ");       // 1
            query.append("       ,s.skill_id ");       // 2
            query.append("       ,cs.ranking ");       // 3
            query.append("       ,CURRENT ");          // 4
            query.append("       ,s.skill_type_id ");  // 5
            query.append(" FROM coder_skill cs ");
            query.append("      ,skill s ");
            query.append("WHERE cs.skill_id = s.skill_id ");
            query.append("  AND cs.modify_date > ?");
            query.append("   AND EXISTS (SELECT 'pops' FROM group_user gu WHERE gu.user_id = cs.coder_id AND gu.group_id = 10)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = cs.coder_id ");
            query.append("           AND gu.group_id = 13)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = cs.coder_id ");
            query.append("           AND gu.group_id = 14)");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO coder_skill_xref ");
            query.append("      (coder_id ");         // 1
            query.append("       ,skill_id ");        // 2
            query.append("       ,ranking ");         // 3
            query.append("       ,modify_date ");     // 4
            query.append("       ,skill_type_id) ");  // 5
            query.append("VALUES (?,?,?,?,?)");  // 5 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM coder_skill_xref ");
            query.append(" WHERE coder_id = ? ");
            query.append("   AND skill_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);

            psSel.setTimestamp(1, fLastLogTime);
            rs = executeQuery(psSel, "loadCoderSkill");

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int skill_id = rs.getInt(2);
                psDel.setInt(1, coder_id);
                psDel.setInt(2, skill_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, coder_id);  // coder_id
                psIns.setInt(2, skill_id);  // skill_id
                psIns.setInt(3, rs.getInt(3));  // ranking
                psIns.setTimestamp(4, rs.getTimestamp(4));  // modify_date
                psIns.setInt(5, rs.getInt(5));  // skill_type_id

                retVal = psIns.executeUpdate();
                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoders: Insert for coder_id " +
                            coder_id + " and skill_id " + skill_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "coder_skill");
            }

            log.info("Coder_skill records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_skill' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
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
            query.append("   AND EXISTS (SELECT 'pops' FROM group_user gu WHERE gu.user_id = r.coder_id AND gu.group_id = 10)");
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


    private void loadImage() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT i.image_id ");           // 1
            query.append("       ,i.file_name ");         // 2
            query.append("       ,i.image_type_id ");     // 3
            query.append("       ,i.path_id ");           // 4
            query.append("       ,i.link ");
            query.append("       ,i.height ");
            query.append("       ,i.width ");
            query.append("  FROM image i ");
            query.append(" WHERE i.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);


            query = new StringBuffer(100);
            query.append("INSERT INTO image ");
            query.append("      (image_id ");               // 1
            query.append("       ,file_name ");             // 2
            query.append("       ,image_type_id ");         // 3
            query.append("       ,path_id ");              // 4
            query.append("       ,link ");              // 5
            query.append("       ,height ");              // 6
            query.append("       ,width) ");              // 7
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?)");  // 4 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("UPDATE image SET file_name=?, image_type_id=?, path_id=?, link=?, height=?, width=? WHERE image_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadImage");

            while (rs.next()) {
                int image_id = rs.getInt(1);

                psIns.setInt(1, image_id);
                psIns.setString(2, rs.getString("file_name"));
                psIns.setInt(3, rs.getInt("image_type_id"));
                psIns.setInt(4, rs.getInt("path_id"));
                psIns.setString(5, rs.getString("link"));
                psIns.setInt(6, rs.getInt("height"));
                psIns.setInt(7, rs.getInt("width"));

                try {
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("file_name"));
                    psUpd.setInt(2, rs.getInt("image_type_id"));
                    psUpd.setInt(3, rs.getInt("path_id"));
                    psUpd.setString(4, rs.getString("link"));
                    psUpd.setInt(5, rs.getInt("height"));
                    psUpd.setInt(6, rs.getInt("width"));
                    psUpd.setInt(7, image_id);
                    retVal = psUpd.executeUpdate();
                }

                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoders: Load image for image_id " +
                            image_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "image");
            }

            log.info("Image records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'image' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
        }
    }


    private void loadPath() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT p.path_id ");           // 1
            query.append("       ,p.path ");         // 2
            query.append("  FROM path p ");
            query.append(" WHERE p.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO path ");
            query.append("      (path_id ");               // 1
            query.append("       ,path) ");              // 4
            query.append("VALUES (");
            query.append("?,?)");  // 2 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("UPDATE path SET path=? WHERE path_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadPath");

            while (rs.next()) {
                int path_id = rs.getInt(1);

                psIns.setInt(1, path_id);
                psIns.setString(2, rs.getString(2));

                try {
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString(2));
                    psUpd.setInt(2, path_id);
                    retVal = psUpd.executeUpdate();
                }

                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoders: Load path for path_id " +
                            path_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "path");
            }

            log.info("Path records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'path' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
        }
    }


    private void loadCoderImageXref() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT cix.coder_id ");          // 1
            query.append(" ,cix.image_id ");         // 2
            query.append(" ,cix.display_flag ");     // 3
            query.append("  FROM coder_image_xref cix ");
            query.append(" WHERE cix.modify_date > ?");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO coder_image_xref ");
            query.append(" (coder_id ");         // 1
            query.append(" ,image_id ");         // 2
            query.append(" ,display_flag) ");     // 3
            query.append("VALUES (");
            query.append("?,?,?)");  // 3 values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE coder_image_xref set display_flag = ? WHERE coder_id = ? AND image_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadCoderImageXref");

            while (rs.next()) {
                int coder_id = rs.getInt("coder_id");
                int image_id = rs.getInt("image_id");
                int display_flag = rs.getInt("display_flag");

                try {
                    psIns.setInt(1, coder_id);
                    psIns.setInt(2, image_id);
                    psIns.setInt(3, display_flag);
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setInt(1, display_flag);
                    psUpd.setInt(2, coder_id);
                    psUpd.setInt(3, image_id);
                    retVal = psUpd.executeUpdate();
                }

                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoder: Load coder_imag_xref for coder_id " +
                            coder_id + " image_id " +
                            image_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "coder_image_xref");
            }

            log.info("coder_image_xref records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_image_xref' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
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
            query.append(      " ,s.sort_letter ");    
            query.append(      " ,s.city ");
            query.append(      " ,s.state_code ");
            query.append(      " ,s.country_code ");
            query.append(      " ,s.name ");
            query.append(      " ,s.short_name ");
            query.append( " FROM school s ");
            query.append(" WHERE s.modify_date > ?");
            query.append(  " AND s.user_id = 0");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setTimestamp(1, fLastLogTime);

            query = new StringBuffer(100);
            query.append("INSERT INTO school ");
            query.append(" (school_id ");       
            query.append(" ,sort_letter ");      
            query.append(" ,city ");
            query.append(" ,state_code ");
            query.append(" ,country_code ");
            query.append(" ,name ");
            query.append(" ,short_name) ");
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?)"); 
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE school SET sort_letter = ?, city = ?, state_code = ?, country_code = ?, name = ?, short_name = ? WHERE school_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            rs = executeQuery(psSel, "loadSchool");

            while (rs.next()) {
                int school_id = rs.getInt("school_id");


                try {
                    psIns.setInt(1, school_id);
                    psIns.setString(2, rs.getString("sort_letter"));
                    psIns.setString(3, rs.getString("city"));
                    psIns.setString(4, rs.getString("state_code"));
                    psIns.setString(5, rs.getString("country_code"));
                    psIns.setString(6, rs.getString("name"));
                    psIns.setString(7, rs.getString("short_name"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("sort_letter"));
                    psUpd.setString(2, rs.getString("city"));
                    psUpd.setString(3, rs.getString("state_code"));
                    psUpd.setString(4, rs.getString("country_code"));
                    psUpd.setString(5, rs.getString("name"));
                    psUpd.setString(6, rs.getString("short_name"));
                    psUpd.setInt(7, school_id);
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
            query.append(      " ,cs.school_name ");    
            query.append(      " ,cs.school_id ");
            query.append(      " ,cs.degree_number ");
            query.append( " FROM current_school cs ");
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
                    psIns.setString(4, rs.getString("degree_number"));
                    retVal = psIns.executeUpdate();
                } catch (Exception e) {
                    // the insert failed, so try an update
                    psUpd.setString(1, rs.getString("school_name"));
                    psUpd.setString(2, rs.getString("school_id"));
                    psUpd.setString(3, rs.getString("degree_number"));
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
