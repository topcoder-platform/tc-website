package com.topcoder.utilities.dwload;

/*****************************************************************************
 * TCLoadCoders.java
 *
 * TCLoadCoders loads coder information tables from one database to another.
 * The tables that are built by this load procedure are:
 *      coder
 *      skill
 *      skill_type
 *      coder_skill
 *      rating
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2  2002/04/22 17:50:38  gpaul
 *           include coder_image_xref.display_flag in the move
 *
 *           Revision 1.1  2002/04/02 21:54:14  gpaul
 *           moving the load over from 153 cvs
 *
 *           Revision 1.1.2.3  2002/03/19 18:30:42  gpaul
 *           Log.msg instead of system.out.println
 *
 *           Revision 1.1.2.2  2002/03/18 19:31:46  gpaul
 *           added image schema load
 *
 *           Revision 1.1.2.1  2002/03/16 20:17:02  gpaul
 *           moving these over from the member dev area.  i've added  a couple fixes to exclude admins from queries.
 *
 *           Revision 1.13  2002/03/12 21:21:12  stalker
 *           Latest version of the coders load
 *
 *           Revision 1.12  2002/03/02 15:23:54  stalker
 *           dok fixed one bug and I cleaned up some other code. thanks dok
 *
 *           Revision 1.11  2002/02/20 15:09:38  stalker
 *           Fixed minor bug in rating table load
 *
 *           Revision 1.10  2002/02/14 14:43:29  stalker
 *           Fixed problem with num_competitions not being computed correctly. It has been
 *           moved to the round load so is actually computed on every round you load
 *
 *           Revision 1.9  2002/02/13 22:20:27  stalker
 *           The latest version of TCLoadCoders with all tables/columns loaded.
 *
 *****************************************************************************/
import java.sql.*;
import java.util.*;

import com.topcoder.common.*;

public class TCLoadCoders extends TCLoad {
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

      loadCoder();

      // Need to load skill_type first due to referential integrity in skill
      loadSkillType();

      loadSkill();

      loadCoderSkill();

      loadRating();

      loadImage();

      loadPath();

      loadCoderImageXref();

      setLastUpdateTime();

      Log.msg("SUCCESS: Coders load ran successfully.");
      return true;
    }
    catch(Exception ex) {
      setReasonFailed(ex.getMessage());
      return false;
    }
  }

  private void getLastUpdateTime() throws Exception {
    Statement stmt = null;
    ResultSet rs = null;

    fSql.setLength(0);
    fSql.append("select timestamp from update_log where log_id = ");
    fSql.append("(select max(log_id) from update_log where log_type_id = " + CODER_LOG_TYPE + ")");

    try {
      stmt = createStatement(TARGET_DB);
      rs = stmt.executeQuery(fSql.toString());
      if (rs.next()) {
        fLastLogTime = rs.getTimestamp(1);
        Log.msg("Date is " + fLastLogTime.toString());
      }
      else {
        // A little misleading here as we really didn't hit a SQL
        // exception but all we are doing outside this method is
        // catchin and setting the reason for failure to be the
        // message of the exception.
        throw new SQLException("Last log time not found in "+
                               "update_log table.");
      }
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Failed to retrieve last log time.\n"+
                          sqle.getMessage());
    }
    finally {
      close(rs);
      close(stmt);
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

    ResultSet rs = null;
    ResultSet rs2 = null;
    int count = 0;
    int retVal = 0;

    try {
      // Our select statement
      fSql.setLength(0);
      fSql.append("SELECT c.coder_id ");                  // 1
      fSql.append("       ,c.state_code ");               // 2
      fSql.append("       ,c.country_code ");             // 3
      fSql.append("       ,c.first_name ");               // 4
      fSql.append("       ,c.last_name ");                // 5
      fSql.append("       ,c.home_phone ");               // 6
      fSql.append("       ,c.work_phone ");               // 7
      fSql.append("       ,c.address1 ");                 // 8
      fSql.append("       ,c.address2 ");                 // 9
      fSql.append("       ,c.city ");                     // 10
      fSql.append("       ,c.zip ");                      // 11
      fSql.append("       ,c.middle_name ");              // 12
      fSql.append("       ,c.activation_code ");          // 13
      fSql.append("       ,c.member_since ");             // 14
      fSql.append("       ,c.notify ");                   // 15
      fSql.append("       ,c.quote ");                    // 16
      fSql.append("       ,c.employer_search ");          // 17
      fSql.append("       ,c.relocate ");                 // 18
      fSql.append("       ,CURRENT ");                    // 19
      fSql.append("       ,c.editor_id ");                // 20
      fSql.append("       ,c.notify_inquiry ");           // 21
      fSql.append("       ,c.language_id ");              // 22
      fSql.append("       ,c.coder_type_id ");            // 23
      fSql.append("       ,u.handle ");                   // 24
      fSql.append("       ,u.password ");                 // 25
      fSql.append("       ,u.status ");                   // 26
      fSql.append("       ,u.email ");                    // 27
      fSql.append("       ,u.terms ");                    // 28
      fSql.append("       ,u.last_login ");               // 29
      fSql.append("       ,(SELECT rs.region_code ");     // 30
      fSql.append("           FROM region_state rs ");
      fSql.append("          WHERE c.state_code = rs.state_code ");
      fSql.append("          AND rs.user_type_id = 3) ");
      fSql.append("       ,c.image ");                    // 31
      fSql.append("  FROM coder c ");
      fSql.append("       ,user u ");
      fSql.append(" WHERE c.coder_id = u.user_id ");
      fSql.append("   AND c.modify_date > ?");
      fSql.append("   AND EXISTS (SELECT * FROM group_user gu WHERE gu.user_id = u.user_id AND gu.group_id = 10)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = c.coder_id ");
      fSql.append("           AND gu.group_id = 13)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = c.coder_id ");
      fSql.append("           AND gu.group_id = 14)");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      // Our insert statement
      fSql.setLength(0);
      fSql.append("INSERT INTO coder ");
      fSql.append("      (coder_id ");                   // 1
      fSql.append("       ,state_code ");                // 2
      fSql.append("       ,country_code ");              // 3
      fSql.append("       ,first_name ");                // 4
      fSql.append("       ,last_name ");                 // 5
      fSql.append("       ,home_phone ");                // 6
      fSql.append("       ,work_phone ");                // 7
      fSql.append("       ,address1 ");                  // 8
      fSql.append("       ,address2 ");                  // 9
      fSql.append("       ,city ");                      // 10
      fSql.append("       ,zip ");                       // 11
      fSql.append("       ,middle_name ");               // 12
      fSql.append("       ,activation_code ");           // 13
      fSql.append("       ,member_since ");              // 14
      fSql.append("       ,notify ");                    // 15
      fSql.append("       ,quote ");                     // 16
      fSql.append("       ,employer_search ");           // 17
      fSql.append("       ,relocate ");                  // 18
      fSql.append("       ,modify_date ");               // 19
      fSql.append("       ,editor_id ");                 // 20
      fSql.append("       ,notify_inquiry ");            // 21
      fSql.append("       ,language_id ");               // 22
      fSql.append("       ,coder_type_id ");             // 23
      fSql.append("       ,handle ");                    // 24
      fSql.append("       ,password ");                  // 25
      fSql.append("       ,status ");                    // 26
      fSql.append("       ,email ");                     // 27
      fSql.append("       ,terms ");                     // 28
      fSql.append("       ,last_login ");                // 29
      fSql.append("       ,coder_region_code ");         // 30
      fSql.append("       ,image) ");                    // 31
      fSql.append("VALUES (");
      fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10
      fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 20
      fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 30
      fSql.append("?)");                    // 31 total values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      // Our update statement
      fSql.setLength(0);
      fSql.append("UPDATE coder ");
      fSql.append("   SET state_code = ? ");                 // 1
      fSql.append("       ,country_code = ? ");              // 2
      fSql.append("       ,first_name = ? ");                // 3
      fSql.append("       ,last_name = ? ");                 // 4
      fSql.append("       ,home_phone = ? ");                // 5
      fSql.append("       ,work_phone = ? ");                // 6
      fSql.append("       ,address1 = ? ");                  // 7
      fSql.append("       ,address2 = ? ");                  // 8
      fSql.append("       ,city = ? ");                      // 9
      fSql.append("       ,zip = ? ");                       // 10
      fSql.append("       ,middle_name = ? ");               // 11
      fSql.append("       ,activation_code = ? ");           // 12
      fSql.append("       ,member_since = ? ");              // 13
      fSql.append("       ,notify = ? ");                    // 14
      fSql.append("       ,quote = ? ");                     // 15
      fSql.append("       ,employer_search = ? ");           // 16
      fSql.append("       ,relocate = ? ");                  // 17
      fSql.append("       ,modify_date = ? ");               // 18
      fSql.append("       ,editor_id = ? ");                 // 19
      fSql.append("       ,notify_inquiry = ? ");            // 20
      fSql.append("       ,language_id = ? ");               // 21
      fSql.append("       ,coder_type_id = ? ");             // 22
      fSql.append("       ,handle = ? ");                    // 23
      fSql.append("       ,password = ? ");                  // 24
      fSql.append("       ,status = ? ");                    // 25
      fSql.append("       ,email = ? ");                     // 26
      fSql.append("       ,terms = ? ");                     // 27
      fSql.append("       ,last_login = ? ");                // 28
      fSql.append("       ,coder_region_code = ? ");         // 29
      fSql.append("       ,image = ? ");                     // 30
      fSql.append("WHERE coder_id = ?");                     // 31
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

      // Our select statement to determine if a particular row is
      // present or not
      fSql.setLength(0);
      fSql.append("SELECT * ");
      fSql.append("  FROM coder ");
      fSql.append(" WHERE coder_id = ?");
      psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

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
        if(rs2.next()) {
          psUpd.clearParameters();
          psUpd.setString   (1,  rs.getString   (2));   // state_code
          psUpd.setString   (2,  rs.getString   (3));   // country_code
          psUpd.setString   (3,  rs.getString   (4));   // first_name
          psUpd.setString   (4,  rs.getString   (5));   // last_name
          psUpd.setString   (5,  rs.getString   (6));   // home_phone
          psUpd.setString   (6,  rs.getString   (7));   // work_phone
          psUpd.setString   (7,  rs.getString   (8));   // address1
          psUpd.setString   (8,  rs.getString   (9));   // address2
          psUpd.setString   (9,  rs.getString   (10));  // city
          psUpd.setString   (10, rs.getString   (11));  // zip
          psUpd.setString   (11, rs.getString   (12));  // middle_name
          psUpd.setString   (12, rs.getString   (13));  // activation_code
          psUpd.setTimestamp(13, rs.getTimestamp(14));  // member_since
          psUpd.setString   (14, rs.getString   (15));  // notify
          psUpd.setString   (15, rs.getString   (16));  // quote
          psUpd.setString   (16, rs.getString   (17));  // employer_search
          psUpd.setString   (17, rs.getString   (18));  // relocate
          psUpd.setTimestamp(18, rs.getTimestamp(19));  // modify_date
          psUpd.setInt      (19, rs.getInt      (20));  // editor_id
          psUpd.setString   (20, rs.getString   (21));  // notify_inquiry
          psUpd.setInt      (21, rs.getInt      (22));  // language_id
          psUpd.setInt      (22, rs.getInt      (23));  // coder_type_id
          psUpd.setString   (23, rs.getString   (24));  // handle
          psUpd.setString   (24, rs.getString   (25));  // password
          psUpd.setString   (25, rs.getString   (26));  // status
          psUpd.setString   (26, rs.getString   (27));  // email
          psUpd.setString   (27, rs.getString   (28));  // terms
          psUpd.setTimestamp(28, rs.getTimestamp(29));  // last_login
          psUpd.setString   (29, rs.getString   (30));  // coder_region_code
          psUpd.setInt      (30, rs.getInt      (31));  // image
          psUpd.setInt      (31,  coder_id          );  // coder_id

          // Now, execute the insert of the new row
          retVal = psUpd.executeUpdate();
          count = count + retVal;
          if (retVal != 1) {
            throw new SQLException("TCLoadCoders: Update for coder_id "+
                                   coder_id +
                                   " modified " + retVal + " rows, not one.");
          }
        }
        else {
          psIns.clearParameters();
          psIns.setInt      (1,  coder_id          );   // coder_id
          psIns.setString   (2,  rs.getString   (2));   // state_code
          psIns.setString   (3,  rs.getString   (3));   // country_code
          psIns.setString   (4,  rs.getString   (4));   // first_name
          psIns.setString   (5,  rs.getString   (5));   // last_name
          psIns.setString   (6,  rs.getString   (6));   // home_phone
          psIns.setString   (7,  rs.getString   (7));   // work_phone
          psIns.setString   (8,  rs.getString   (8));   // address1
          psIns.setString   (9,  rs.getString   (9));   // address2
          psIns.setString   (10, rs.getString   (10));  // city
          psIns.setString   (11, rs.getString   (11));  // zip
          psIns.setString   (12, rs.getString   (12));  // middle_name
          psIns.setString   (13, rs.getString   (13));  // activation_code
          psIns.setTimestamp(14, rs.getTimestamp(14));  // member_since
          psIns.setString   (15, rs.getString   (15));  // notify
          psIns.setString   (16, rs.getString   (16));  // quote
          psIns.setString   (17, rs.getString   (17));  // employer_search
          psIns.setString   (18, rs.getString   (18));  // relocate
          psIns.setTimestamp(19, rs.getTimestamp(19));  // modify_date
          psIns.setInt      (20, rs.getInt      (20));  // editor_id
          psIns.setString   (21, rs.getString   (21));  // notify_inquiry
          psIns.setInt      (22, rs.getInt      (22));  // language_id
          psIns.setInt      (23, rs.getInt      (23));  // coder_type_id
          psIns.setString   (24, rs.getString   (24));  // handle
          psIns.setString   (25, rs.getString   (25));  // password
          psIns.setString   (26, rs.getString   (26));  // status
          psIns.setString   (27, rs.getString   (27));  // email
          psIns.setString   (28, rs.getString   (28));  // terms
          psIns.setTimestamp(29, rs.getTimestamp(29));  // last_login
          psIns.setString   (30, rs.getString   (30));  // coder_region_code
          psIns.setInt      (31, rs.getInt      (31));  // image

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

      Log.msg("Coder records updated/inserted = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'coder' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
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

    int count = 0;
    int retVal = 0;

    try {
      // Our select statement
      fSql.setLength(0);
      fSql.append("SELECT s.skill_id ");        // 1
      fSql.append("       ,s.skill_type_id ");  // 2
      fSql.append("       ,s.skill_desc ");     // 3
      fSql.append("       ,s.status ");         // 4
      fSql.append("       ,s.skill_order ");    // 5
      fSql.append("       ,CURRENT ");          // 6
      fSql.append(" FROM skill s ");
      fSql.append("WHERE modify_date > ?");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      // Our insert statement
      fSql.setLength(0);
      fSql.append("INSERT INTO skill ");
      fSql.append("      (skill_id ");        // 1
      fSql.append("       ,skill_type_id ");  // 2
      fSql.append("       ,skill_desc ");     // 3
      fSql.append("       ,status ");         // 4
      fSql.append("       ,skill_order ");    // 5
      fSql.append("       ,modify_date) ");   // 6
      fSql.append("VALUES (?,?,?,?,?,?)"); // 6 total values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      // Our update statement
      fSql.setLength(0);
      fSql.append("UPDATE skill ");
      fSql.append("   SET skill_type_id = ? ");   // 1
      fSql.append("       ,skill_desc = ? ");     // 2
      fSql.append("       ,status = ? ");         // 3
      fSql.append("       ,skill_order = ? ");    // 4
      fSql.append("       ,modify_date = ? ");   // 5
      fSql.append(" WHERE skill_id = ? ");        // 6
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

      // Our select statement to determine if the row exists
      fSql.setLength(0);
      fSql.append("SELECT * ");
      fSql.append("  FROM skill ");
      fSql.append(" WHERE skill_id = ?");
      psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

      psSel.setTimestamp(1, fLastLogTime);
      rs = executeQuery(psSel, "loadSkill");

      while (rs.next()) {
        int skill_id = rs.getInt(1);
        psSel2.clearParameters();
        psSel2.setInt(1, skill_id);
        rs2 = psSel2.executeQuery();

        // If next() returns true that means this row exists. If so,
        // we update. Otherwise, we insert.
        if(rs2.next()) {
          psUpd.clearParameters();
          psUpd.setInt      (1,  rs.getInt      (2));  // skill_type_id
          psUpd.setString   (2,  rs.getString   (3));  // skill_desc
          psUpd.setString   (3,  rs.getString   (4));  // status
          psUpd.setInt      (4,  rs.getInt      (5));  // skill_order
          psUpd.setTimestamp(5,  rs.getTimestamp(6));  // modify_date
          psUpd.setInt      (6,  skill_id);            // skill_id

          retVal = psUpd.executeUpdate();
          count = count + retVal;
          if (retVal != 1) {
            throw new SQLException("TCLoadCoders: Update for skill " +
                                   skill_id + 
                                   " modified " + retVal + " rows, not one.");
          }
	}
        else {
          psIns.clearParameters();
          psIns.setInt      (1,  skill_id);            // skill_id
          psIns.setInt      (2,  rs.getInt      (2));  // skill_type_id
          psIns.setString   (3,  rs.getString   (3));  // skill_desc
          psIns.setString   (4,  rs.getString   (4));  // status
          psIns.setInt      (5,  rs.getInt      (5));  // skill_order
          psIns.setTimestamp(6,  rs.getTimestamp(6));  // modify_date

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

      Log.msg("Skill records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'skill' table failed.\n"+
                            sqle.getMessage());
    }
    finally {
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

    try {
      fSql.setLength(0);
      fSql.append("SELECT st.skill_type_id ");      // 1
      fSql.append("       ,st.skill_type_desc ");   // 2
      fSql.append("       ,st.skill_type_order ");  // 3
      fSql.append("       ,st.status ");            // 4
      fSql.append("       ,CURRENT ");              // 5
      fSql.append(" FROM skill_type st ");
      fSql.append("WHERE modify_date > ?");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO skill_type_lu ");
      fSql.append("      (skill_type_id ");      // 1
      fSql.append("       ,skill_type_desc ");   // 2
      fSql.append("       ,skill_type_order ");  // 3
      fSql.append("       ,status ");            // 4
      fSql.append("       ,modify_date) ");      // 5
      fSql.append("VALUES (?,?,?,?,?)");  // 5 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("UPDATE skill_type_lu ");
      fSql.append("   SET skill_type_desc = ? ");    // 1
      fSql.append("       ,skill_type_order = ? ");  // 2
      fSql.append("       ,status = ? ");            // 3
      fSql.append("       ,modify_date = ? ");       // 4
      fSql.append(" WHERE skill_type_id = ?");       // 5
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("SELECT * ");
      fSql.append("  FROM skill_type_lu ");
      fSql.append(" WHERE skill_type_id = ?");
      psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

      psSel.setTimestamp(1, fLastLogTime);
      rs = executeQuery(psSel, "loadSkillType");

      while (rs.next()) {
        int skill_type_id = rs.getInt(1);
        psSel2.clearParameters();
        psSel2.setInt(1, skill_type_id);
        rs2 = psSel2.executeQuery();

        // If next() returns true that means this row exists. If so,
        // we update. Otherwise, we insert.
        if(rs2.next()) {
          psUpd.clearParameters();
          psUpd.setString   (1,  rs.getString   (2));  // skill_type_desc
          psUpd.setInt      (2,  rs.getInt      (3));  // skill_type_order
          psUpd.setString   (3,  rs.getString   (4));  // status
          psUpd.setTimestamp(4,  rs.getTimestamp(5));  // modify_date
          psUpd.setInt      (5,  skill_type_id     );  // skill_type_id

          retVal = psUpd.executeUpdate();
          count = count + retVal;
          if (retVal != 1) {
            throw new SQLException("TCLoadCoders: Update for skill_type " +
                                   skill_type_id +
                                   " modified " + retVal + " rows, not one.");
          }
        }
        else {
          psIns.clearParameters();
          psIns.setInt      (1,  skill_type_id     );  // skill_type_id
          psIns.setString   (2,  rs.getString   (2));  // skill_type_desc
          psIns.setInt      (3,  rs.getInt      (3));  // skill_type_order
          psIns.setString   (4,  rs.getString   (4));  // status
          psIns.setTimestamp(5,  rs.getTimestamp(5));  // modify_date

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

      Log.msg("Skill_type records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'skill_type' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
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

    ResultSet rs = null;
    int count = 0;
    int retVal = 0;

    try {
      fSql.setLength(0);
      fSql.append("SELECT cs.coder_id ");       // 1
      fSql.append("       ,s.skill_id ");       // 2
      fSql.append("       ,cs.ranking ");       // 3
      fSql.append("       ,CURRENT ");          // 4
      fSql.append("       ,s.skill_type_id ");  // 5
      fSql.append(" FROM coder_skill cs ");
      fSql.append("      ,skill s ");
      fSql.append("WHERE cs.skill_id = s.skill_id ");
      fSql.append("  AND cs.modify_date > ?");
      fSql.append("   AND EXISTS (SELECT * FROM group_user gu WHERE gu.user_id = cs.coder_id AND gu.group_id = 10)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = cs.coder_id ");
      fSql.append("           AND gu.group_id = 13)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = cs.coder_id ");
      fSql.append("           AND gu.group_id = 14)");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO coder_skill_xref ");
      fSql.append("      (coder_id ");         // 1
      fSql.append("       ,skill_id ");        // 2
      fSql.append("       ,ranking ");         // 3
      fSql.append("       ,modify_date ");     // 4
      fSql.append("       ,skill_type_id) ");  // 5
      fSql.append("VALUES (?,?,?,?,?)");  // 5 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("DELETE FROM coder_skill_xref ");
      fSql.append(" WHERE coder_id = ? ");
      fSql.append("   AND skill_id = ?");
      psDel = prepareStatement(fSql.toString(), TARGET_DB);

      psSel.setTimestamp(1, fLastLogTime);
      rs = executeQuery(psSel, "loadCoderSkill");

      while (rs.next()) {
        int coder_id = rs.getInt(1);
        int skill_id = rs.getInt(2);
        psDel.setInt(1, coder_id);
        psDel.setInt(2, skill_id);
        psDel.executeUpdate();

        psIns.clearParameters();
        psIns.setInt      (1,  coder_id          );  // coder_id
        psIns.setInt      (2,  skill_id          );  // skill_id
        psIns.setInt      (3,  rs.getInt      (3));  // ranking
        psIns.setTimestamp(4,  rs.getTimestamp(4));  // modify_date
        psIns.setInt      (5,  rs.getInt      (5));  // skill_type_id

        retVal = psIns.executeUpdate();
        count = count + retVal;
        if (retVal != 1) {
          throw new SQLException("TCLoadCoders: Insert for coder_id " +
                                 coder_id + " and skill_id " + skill_id +
                                 " modified " + retVal + " rows, not one.");
        }

        printLoadProgress(count, "coder_skill");
      }

      Log.msg("Coder_skill records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'coder_skill' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
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
    PreparedStatement psSel  = null;
    PreparedStatement psSel2 = null;
    PreparedStatement psIns  = null;
    PreparedStatement psDel  = null;
    ResultSet rs  = null;
    ResultSet rs2 = null;

    try {
      fSql.setLength(0);
      fSql.append("SELECT r.coder_id ");           // 1
      fSql.append("       ,r.rating ");            // 2
      fSql.append("       ,r.num_ratings ");       // 3
      fSql.append("       ,CURRENT ");             // 4
      fSql.append("       ,r.vol ");               // 5
      fSql.append("       ,r.rating_no_vol ");     // 6
      fSql.append("  FROM rating r ");
      fSql.append(" WHERE r.modify_date > ? ");
      fSql.append("   AND EXISTS (SELECT * FROM group_user gu WHERE gu.user_id = r.coder_id AND gu.group_id = 10)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = r.coder_id ");
      fSql.append("           AND gu.group_id = 13)");
      fSql.append("   AND NOT EXISTS ");
      fSql.append("       (SELECT * ");
      fSql.append("          FROM group_user gu ");
      fSql.append("         WHERE gu.user_id = r.coder_id ");
      fSql.append("           AND gu.group_id = 14)");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("SELECT first_rated_round_id ");  // 1
      fSql.append("       ,last_rated_round_id ");  // 2
      fSql.append("       ,lowest_rating ");        // 3
      fSql.append("       ,highest_rating ");       // 4
      fSql.append("       ,num_competitions ");     // 5
      fSql.append("  FROM rating ");
      fSql.append(" WHERE coder_id = ?");
      psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO rating ");
      fSql.append("      (coder_id ");               // 1
      fSql.append("       ,rating ");                // 2
      fSql.append("       ,num_ratings ");           // 3
      fSql.append("       ,modify_date ");           // 4
      fSql.append("       ,vol ");                   // 5
      fSql.append("       ,rating_no_vol ");         // 6
      fSql.append("       ,highest_rating ");        // 7
      fSql.append("       ,lowest_rating ");         // 8
      fSql.append("       ,first_rated_round_id ");  // 9
      fSql.append("       ,last_rated_round_id ");   // 10
      fSql.append("       ,num_competitions) ");     // 11
      fSql.append("VALUES (");
      fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
      fSql.append("?)");                   // 11 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("DELETE FROM rating where coder_id = ?");
      psDel = prepareStatement(fSql.toString(), TARGET_DB);

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
        if(rs2.next()) {
          if(rs2.getString(1) != null)
	    first_rated_round_id = rs2.getInt(1);
          if(rs2.getString(2) != null)
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
        psIns.setInt      (1,  coder_id          );  // coder_id
        psIns.setInt      (2,  rs.getInt      (2));  // rating
        psIns.setInt      (3,  rs.getInt      (3));  // num_ratings
        psIns.setTimestamp(4,  rs.getTimestamp(4));  // modify_date
        psIns.setInt      (5,  rs.getInt      (5));  // vol
        psIns.setInt      (6,  rs.getInt      (6));  // rating_no_vol
        psIns.setInt      (7,  highest_rating);      // max_rating
        psIns.setInt      (8,  lowest_rating);       // min_rating

        if(first_rated_round_id > -1)
          psIns.setInt(9, first_rated_round_id);     // first_rated_round_id
        else
          psIns.setNull(9, java.sql.Types.DECIMAL);

        if(last_rated_round_id > -1)
          psIns.setInt(10, last_rated_round_id);      // last_rated_round_id
        else
          psIns.setNull(10, java.sql.Types.DECIMAL);

        psIns.setInt      (11, num_competitions);     // num_competitions

        retVal = psIns.executeUpdate();
        count = count + retVal;
        if (retVal != 1) {
          throw new SQLException("TCLoadCoders: Insert for coder_id " +
                                 coder_id + 
                                 " modified " + retVal + " rows, not one.");
        }

        printLoadProgress(count, "rating");
      }

      Log.msg("Rating records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'rating' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
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
    PreparedStatement psSel  = null;
    PreparedStatement psIns  = null;
    PreparedStatement psUpd  = null;
    ResultSet rs  = null;

    try {
      fSql.setLength(0);
      fSql.append("SELECT i.image_id ");           // 1
      fSql.append("       ,i.file_name ");         // 2
      fSql.append("       ,i.image_type_id ");     // 3
      fSql.append("       ,i.path_id ");           // 4
      fSql.append("  FROM image i ");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO image ");
      fSql.append("      (image_id ");               // 1
      fSql.append("       ,file_name ");             // 2
      fSql.append("       ,image_type_id ");         // 3
      fSql.append("       ,path_id) ");              // 4
      fSql.append("VALUES (");
      fSql.append("?,?,?,?)");  // 4 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("UPDATE image SET file_name=?, image_type_id=?, path_id=? WHERE image_id = ?");
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

      rs = executeQuery(psSel, "loadImage");

      while (rs.next()) {
        int image_id = rs.getInt(1);

        psIns.setInt(1, image_id);
        psIns.setString(2, rs.getString(2)); 
        psIns.setInt(3, rs.getInt(3)); 
        psIns.setInt(4, rs.getInt(4)); 
        
        try {
          retVal = psIns.executeUpdate();
        } catch (Exception e) {
          // the insert failed, so try an update
          psUpd.setString(1, rs.getString(2));
          psUpd.setInt(2, rs.getInt(3));
          psUpd.setInt(3, rs.getInt(4));
          psUpd.setInt(4, image_id);
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

      Log.msg("Image records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'image' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
      close(rs);
      close(psSel);
      close(psIns);
      close(psUpd);
    }
  }



  private void loadPath() throws Exception {
    int count = 0;
    int retVal = 0;
    PreparedStatement psSel  = null;
    PreparedStatement psIns  = null;
    PreparedStatement psUpd  = null;
    ResultSet rs  = null;

    try {
      fSql.setLength(0);
      fSql.append("SELECT p.path_id ");           // 1
      fSql.append("       ,p.path ");         // 2
      fSql.append("  FROM path p ");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO path ");
      fSql.append("      (path_id ");               // 1
      fSql.append("       ,path) ");              // 4
      fSql.append("VALUES (");
      fSql.append("?,?)");  // 2 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append("UPDATE path SET path=? WHERE path_id = ?");
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

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

      Log.msg("Path records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'path' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
      close(rs);
      close(psSel);
      close(psIns);
      close(psUpd);
    }
  }




  private void loadCoderImageXref() throws Exception {
    int count = 0;
    int retVal = 0;
    PreparedStatement psSel  = null;
    PreparedStatement psIns  = null;
    PreparedStatement psDel = null;
    ResultSet rs  = null;

    try {
      fSql.setLength(0);
      fSql.append("SELECT cix.coder_id ");          // 1
      fSql.append(      " ,cix.image_id ");         // 2
      fSql.append(      " ,cix.display_flag ");     // 3
      fSql.append("  FROM coder_image_xref cix ");
      psSel = prepareStatement(fSql.toString(), SOURCE_DB);

      fSql.setLength(0);
      fSql.append("INSERT INTO coder_image_xref ");
      fSql.append(          " (coder_id ");         // 1
      fSql.append(          " ,image_id ");         // 2
      fSql.append(          " ,display_flag) ");     // 3
      fSql.append("VALUES (");
      fSql.append("?,?,?)");  // 3 values
      psIns = prepareStatement(fSql.toString(), TARGET_DB);

      fSql.setLength(0);
      fSql.append(" DELETE FROM coder_image_xref WHERE coder_id = ? AND image_id = ?");
      psDel = prepareStatement(fSql.toString(), TARGET_DB);

      rs = executeQuery(psSel, "loadCoderImageXref");

      while (rs.next()) {
        int coder_id = rs.getInt(1);
        int image_id = rs.getInt(2);
        int display_flag = rs.getInt(3);

        psIns.setInt(1, coder_id);
        psIns.setInt(2, image_id);
        psIns.setInt(3, display_flag);
       
        psDel.setInt(1, coder_id);
        psDel.setInt(2, image_id);
  
        psDel.executeUpdate();

        retVal = psIns.executeUpdate();

        count = count + retVal;
        if (retVal != 1) {
          throw new SQLException("TCLoadCoder: Insert coder_image_xref for coder_id " +
                                 coder_id +  " image_id " +
                                 image_id + 
                                 " modified " + retVal + " rows, not one.");
        }

        printLoadProgress(count, "coder_image_xref");
      }

      Log.msg("coder_image_xref records copied = " + count);
    }
    catch(SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Load of 'coder_image_xref' table failed.\n"+
                          sqle.getMessage());
    }
    finally {
      close(rs);
      close(psSel);
      close(psIns);
    }
  }

  private void setLastUpdateTime() throws Exception {
    PreparedStatement psUpd = null;

    try {
      int retVal = 0;
      fSql.setLength(0);
      fSql.append("INSERT INTO update_log ");
      fSql.append("      (log_id ");        // 1
      fSql.append("       ,calendar_id ");  // 2
      fSql.append("       ,timestamp ");   // 3
      fSql.append("       ,log_type_id) ");   // 4
      fSql.append("VALUES (0, ?, ?, " + CODER_LOG_TYPE + ")");
      psUpd = prepareStatement(fSql.toString(), TARGET_DB);

      int calendar_id = lookupCalendarId(fStartTime, TARGET_DB);
      psUpd.setInt      (1, calendar_id);
      psUpd.setTimestamp(2, fStartTime);
      
      retVal = psUpd.executeUpdate();
      if (retVal != 1) {
        throw new SQLException("SetLastUpdateTime "+
                               " modified " + retVal + " rows, not one.");
      }
    }
    catch (SQLException sqle) {
      DBMS.printSqlException(true, sqle);
      throw new Exception("Failed to set last log time.\n"+
                          sqle.getMessage());
    }
    finally {
      close(psUpd);
    }
  }
}
