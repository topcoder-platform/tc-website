package com.topcoder.utilities.dwload;

/*****************************************************************************
 * TCLoadRequests.java
 *
 * TCLoadCoders loads applet requests from the RDBMS to the Data Warehouse.
 *
 * @author Matthew Lahut [TCid: Garzahd] (mlahut@andrew.cmu.edu)
 * Much thanks to Chris Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * for the template
 * @version $Revision$
 *
 *****************************************************************************/

import com.topcoder.shared.util.DBMS;

import java.sql.*;
import java.util.Hashtable;

public class TCLoadRequests extends TCLoad {
    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;

    public TCLoadRequests() {
        //DEBUG = false;
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
            System.out.println("It is now " + fStartTime.toString());

            getLastUpdateTime();


            loadRequests();

            setLastUpdateTime();

            /*
            loadCoder();

            // Need to load skill_type first due to referential integrity in skill
            loadSkillType();

            loadSkill();

            loadCoderSkill();

            loadRating();
            */

            System.out.println("SUCCESS: Requests load ran successfully.");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }

    private void getLastUpdateTime() throws Exception {
        Statement stmt = null;
        ResultSet rs = null;

        fSql.setLength(0);
        fSql.append("select timestamp from update_log where log_id = ");
        fSql.append("(select max(log_id) from update_log ");
        fSql.append("where log_type_id = 3)");

        try {
            stmt = createStatement(TARGET_DB);
            rs = stmt.executeQuery(fSql.toString());
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp(1);
                System.out.println("Last log time was  " + fLastLogTime.toString());
            } else {
                // A little misleading here as we really didn't hit a SQL
                // exception but all we are doing outside this method is
                // catching and setting the reason for failure to be the
                // message of the exception.
                throw new SQLException("Last log time not found in " +
                        "request_update_log table.");
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

    private void loadRequests() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        PreparedStatement psDel = null;

        ResultSet rs = null;
        int count = 0;
        int retVal = 0;

        try {
            // Our select statement
            fSql.setLength(0);
            fSql.append("SELECT rt.request_id ");           // 1
            fSql.append("       ,rt.request_type_id ");     // 2
            fSql.append("       ,rt.coder_id ");            // 3
            fSql.append("       ,rt.round_id ");            // 4
            fSql.append("       ,rt.room_id ");             // 5
            fSql.append("       ,rt.open_window ");         // 6
            fSql.append("       ,rt.open_period ");         // 7
            fSql.append("       ,rt.connection_id ");       // 8
            fSql.append("       ,rt.server_id ");           // 9
            fSql.append("       ,rt.timestamp ");           //10
            fSql.append("       ,rt.close_window ");        //11
            fSql.append("  FROM request rt ");
            fSql.append("   WHERE timestamp > ?");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rt.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rt.coder_id ");
            fSql.append("           AND gu.group_id = 14)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM room ro ");
            fSql.append("         WHERE ro.room_id = rt.room_id ");
            fSql.append("           AND ro.room_type_id <> 1)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);
            // Our insert statement
            fSql.setLength(0);
            fSql.append("INSERT INTO request ");
            fSql.append("       (request_id ");          // 1
            fSql.append("       ,request_type_id ");     // 2
            fSql.append("       ,coder_id ");            // 3
            fSql.append("       ,round_id ");            // 4
            fSql.append("       ,room_id ");             // 5
            fSql.append("       ,open_window ");         // 6
            fSql.append("       ,open_period ");         // 7
            fSql.append("       ,connection_id ");       // 8
            fSql.append("       ,server_id ");           // 9
            fSql.append("       ,timestamp ");           //10
            fSql.append("       ,close_window) ");        //11
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10
            fSql.append("?)");                    // 11

            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM request ");
            fSql.append(" WHERE request_id = ? ");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setTimestamp(1, fLastLogTime);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int request_id = rs.getInt(1);

                psDel.clearParameters();
                psDel.setInt(1, request_id);
                psDel.executeUpdate();
                int round_id = rs.getInt(4);
//          System.out.println(round_id);
                int room_id = rs.getInt(5);
//          System.out.println(room_id);

                psIns.clearParameters();
                psIns.setInt(1, request_id);  // request_id
                psIns.setInt(2, rs.getInt(2));  // request_type_id
                psIns.setInt(3, rs.getInt(3));  // coder_id
                psIns.setInt(4, round_id);  // round_id
                psIns.setInt(5, room_id);  // room_id
                psIns.setTimestamp(6, rs.getTimestamp(6));  // open_window
                psIns.setTimestamp(7, rs.getTimestamp(7));  // open_period
                psIns.setInt(8, rs.getInt(8));  // connection_id
                psIns.setInt(9, rs.getInt(9));  // server_id
                psIns.setTimestamp(10, rs.getTimestamp(10)); // timestamp
                psIns.setTimestamp(11, rs.getTimestamp(11)); // close_window

                //System.out.println(rs.getInt(1)+" "+rs.getInt(2)+" "+rs.getInt(3)+" "+rs.getInt(4)+" "+rs.getInt(5)+rs.getTimestamp(10).toString());

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    System.out.println("TCLoadRequests: Insert for " +
                            "request_id " + request_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "request");
            }

            System.out.println("Records loaded for request: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'request' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
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
            fSql.append("       ,timestamp ");    // 3
            fSql.append("       ,log_type_id) "); // 4
            fSql.append("VALUES (0, ?, ?, 3)");
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

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
