package com.topcoder.utilities.dwload;

/*****************************************************************************
 * TCLoadAggregate.java
 *
 * TCLoadAggregate loads the various aggregate tables in the data warehouse.
 *
 * The tables that are built by this load procedure are:
 *
 RoomResult2();

 CoderDivision();

 RoundDivision();

 RoomResult3();

 CoderProblemSummary();

 CoderLevel();

 Streak();

 RoundProblem();
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.6  2002/07/12 17:15:47  gpaul
 *           merged baby
 *
 *           Revision 1.5.2.1  2002/07/09 23:41:27  gpaul
 *           switched to use com.topcoder.shared.util.logging.Logger
 *
 *           Revision 1.5  2002/06/11 02:08:36  gpaul
 *           fixed up the win streak load, it was using the wrong division id on the insert.  also, i cleaned up the case where someone has consequtive streaks in different divisions, it was probably wrong before.
 *
 *           Revision 1.4  2002/06/06 22:39:35  gpaul
 *           fixed win streak load, it would exclusive on the begining round
 *
 *           Revision 1.3  2002/05/31 01:25:37  gpaul
 *           added more stuff to speed it up
 *
 *           Revision 1.2  2002/05/24 19:28:10  gpaul
 *           added some  code so that we can load just the stuff for the current round in the aggregate load
 *
 *           Revision 1.1  2002/04/02 21:54:14  gpaul
 *           moving the load over from 153 cvs
 *
 *           Revision 1.1.2.12  2002/03/22 03:50:00  gpaul
 *           fix so problems submitted shows 0, not null
 *
 *           Revision 1.1.2.11  2002/03/21 23:52:05  gpaul
 *           gotta update the standard deviation in room_result after loading the round_division tablel
 *
 *           Revision 1.1.2.10  2002/03/21 20:08:46  gpaul
 *           fixed round_problem load for division
 *
 *           Revision 1.1.2.9  2002/03/20 19:38:06  gpaul
 *           added avg_time_elapsed to round_problem and coder_level tables
 *
 *           Revision 1.1.2.8  2002/03/19 23:05:03  gpaul
 *           pulled extra comments
 *
 *           Revision 1.1.2.7  2002/03/19 23:04:41  gpaul
 *           added round_problem load
 *
 *           Revision 1.1.2.6  2002/03/19 18:30:42  gpaul
 *           log.debug instead of system.out.println
 *
 *           Revision 1.1.2.5  2002/03/19 01:23:56  gpaul
 *           fixed a couple loads for number_submitted column
 *
 *           Revision 1.1.2.4  2002/03/17 20:26:14  gpaul
 *           pulled out some comments
 *
 *           Revision 1.1.2.3  2002/03/17 20:25:38  gpaul
 *           pulled out some comments
 *
 *           Revision 1.1.2.2  2002/03/17 20:23:40  gpaul
 *           fixed up coder_level load
 *
 *           Revision 1.1.2.1  2002/03/16 20:17:02  gpaul
 *           moving these over from the member dev area.  i've added  a couple fixes to exclude admins from queries.
 *
 *           Revision 1.12  2002/03/12 21:21:50  stalker
 *           Latest version of the aggregate load
 *
 *           Revision 1.11  2002/03/06 13:02:25  stalker
 *           Fixed problem with win_streak load
 *
 *           Revision 1.10  2002/03/05 19:17:18  stalker
 *           Modified win_streak load to only include those rounds whose type is 1 (single match rounds). Also added the singrndmatch parameter to override this value.
 *
 *           Revision 1.9  2002/03/02 15:22:11  stalker
 *           Fixed error message when more or less than one row is modified by an update
 *
 *           Revision 1.8  2002/02/20 15:08:48  stalker
 *           The latest version of TCLoadAggregate
 *
 *           Revision 1.7  2002/02/13 22:19:58  stalker
 *           The latest version of TCLoadAggregate which has all code in place for loading
 *           aggregate tables.
 *
 *****************************************************************************/

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.Hashtable;

public class TCLoadAggregate extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadAggregate.class);
    // The following set of variables are all configureable from the command
    // line by specifying -variable (where the variable is after the //)
    // followed by the new value
    private int fRoundId = -1;                 // roundid
    private int STATUS_FAILED = 0;    // failed
    private int STATUS_SUCCEEDED = 1;    // succeeded
    private int SINGLE_ROUND_MATCH = 1;    // singrndmatch
    private int CONSEC_WINS_DIV1 = 1;    // conswinsdiv1
    private int CONSEC_WINS_DIV2 = 2;    // conswinsdiv2
    private int STATUS_OPENED = 120;  // opened
    private int STATUS_SUBMITTED = 130;  // submitted
    private int STATUS_CHLNG_SUCCEEDED = 140;  // chlngsucceeded
    private int STATUS_PASSED_SYS_TEST = 150;  // passsystest
    private int STATUS_FAILED_SYS_TEST = 160;  // failsystest
    private boolean FULL_LOAD = false;//fullload

    /**
     * Constructor. Set our usage message here.
     */
    public TCLoadAggregate() {
        USAGE_MESSAGE = new String(
                "TCLoadAggregate parameters - defaults in ():\n" +
                "  -roundid number       : Round ID to load\n" +
                "  [-failed number]         : Failed status for succeeded column    (0)\n" +
                "  [-succeeded number]      : Succeeded status for succeeded column (1)\n" +
                "  [-singrndmatch number]   : Round_type_id for single round matches   (1)\n" +
                "  [-conswinsdiv1 number]   : Streak_type_id for consecutive div1 wins (1)\n" +
                "  [-conswinsdiv2 number]   : Streak_type_id for consecutive div2 wins (2)\n" +
                "  [-opened number]         : Problem_status of opened              (120)\n" +
                "  [-submitted number]      : Problem_status of submitted           (130)\n" +
                "  [-chlngsucceeded number] : Problem_status of challenge succeeded (140)\n" +
                "  [-passsystest number]    : Problem_status of passed system test  (150)\n" +
                "  [-failsystest number]    : Problem_status of failed system test  (160)\n" +
                "  [-fullload boolean] : true-clean round load, false-selective  (false)\n");
    }

    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        try {
            Integer tmp;
            Boolean tmpBool;

            fRoundId = retrieveIntParam("roundid", params, false, true).intValue();

            tmp = retrieveIntParam("failed", params, true, true);
            if (tmp != null) {
                STATUS_FAILED = tmp.intValue();
                log.info("New failed is " + STATUS_FAILED);
            }

            tmp = retrieveIntParam("succeeded", params, true, true);
            if (tmp != null) {
                STATUS_SUCCEEDED = tmp.intValue();
                log.info("New succeeded is " + STATUS_SUCCEEDED);
            }

            tmp = retrieveIntParam("opened", params, true, true);
            if (tmp != null) {
                STATUS_OPENED = tmp.intValue();
                log.info("New opened is " + STATUS_OPENED);
            }

            tmp = retrieveIntParam("submitted", params, true, true);
            if (tmp != null) {
                STATUS_SUBMITTED = tmp.intValue();
                log.info("New submitted is " + STATUS_SUBMITTED);
            }

            tmp = retrieveIntParam("chlngsucceeded", params, true, true);
            if (tmp != null) {
                STATUS_CHLNG_SUCCEEDED = tmp.intValue();
                log.info("New chlngsucceeded is " + STATUS_CHLNG_SUCCEEDED);
            }

            tmp = retrieveIntParam("passsystest", params, true, true);
            if (tmp != null) {
                STATUS_PASSED_SYS_TEST = tmp.intValue();
                log.info("New passsystest is " + STATUS_PASSED_SYS_TEST);
            }

            tmp = retrieveIntParam("failsystest", params, true, true);
            if (tmp != null) {
                STATUS_FAILED_SYS_TEST = tmp.intValue();
                log.info("New failsystest  is " + STATUS_FAILED_SYS_TEST);
            }

            tmp = retrieveIntParam("conswinsdiv1", params, true, true);
            if (tmp != null) {
                CONSEC_WINS_DIV1 = tmp.intValue();
                log.info("New conswinsdiv1  is " + CONSEC_WINS_DIV1);
            }

            tmp = retrieveIntParam("conswinsdiv2", params, true, true);
            if (tmp != null) {
                CONSEC_WINS_DIV2 = tmp.intValue();
                log.info("New conswinsdiv2  is " + CONSEC_WINS_DIV2);
            }

            tmp = retrieveIntParam("singrndmatch", params, true, true);
            if (tmp != null) {
                SINGLE_ROUND_MATCH = tmp.intValue();
                log.info("New singrndmatch is " + SINGLE_ROUND_MATCH);
            }

            tmpBool = retrieveBooleanParam("fullload", params, true);
            if (tmpBool != null) {
                FULL_LOAD = tmpBool.booleanValue();
                log.info("New fullload flag is " + FULL_LOAD);
            }

        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }

        return true;
    }

    /**
     * This method performs the load for the round information tables
     */
    public boolean performLoad() {
        try {

            loadRoomResult2();

            loadCoderDivision();

            loadRoundDivision();

            loadRoomResult3();

            loadCoderProblemSummary();

            loadCoderLevel();

            loadStreak();

            loadRoundProblem();

            log.info("SUCCESS: Aggregate load ran successfully.");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }

    /**
     * This method loads the 'coder_division' table
     */
    private void loadCoderDivision() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT coder_id ");                              // 1
            fSql.append("       ,division_id ");                          // 2
            fSql.append("       ,SUM(problems_presented) ");              // 3
            fSql.append("       ,SUM(problems_opened) ");                 // 4
            fSql.append("       ,SUM(problems_submitted) ");              // 5
            fSql.append("       ,SUM(problems_correct) ");                // 6
            fSql.append("       ,SUM(problems_failed_by_challenge) ");    // 7
            fSql.append("       ,SUM(problems_failed_by_system_test) ");  // 8
            fSql.append("       ,SUM(problems_left_open) ");              // 9
            fSql.append("       ,SUM(challenge_attempts_made) ");         // 10
            fSql.append("       ,SUM(challenges_made_successful) ");      // 11
            fSql.append("       ,SUM(challenges_made_failed) ");          // 12
            fSql.append("       ,SUM(challenge_attempts_received) ");     // 13
            fSql.append("       ,SUM(challenges_received_successful) ");  // 14
            fSql.append("       ,SUM(challenges_received_failed) ");      // 15
            fSql.append("       ,SUM(submission_points) ");               // 16
            fSql.append("       ,SUM(challenge_points) ");                // 17
            fSql.append("       ,SUM(system_test_points) ");              // 18
            fSql.append("       ,SUM(final_points) ");                    // 19
            fSql.append("       ,SUM(defense_points) ");                  // 20
            fSql.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                fSql.append(" WHERE coder_id IN");
                fSql.append(" (SELECT coder_id");
                fSql.append(" FROM room_result");
                fSql.append(" WHERE attended = 'Y'");
                fSql.append(" AND round_id = " + fRoundId + ")");
            }
            fSql.append(" GROUP BY coder_id ");
            fSql.append("          ,division_id");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO coder_division ");
            fSql.append("      (coder_id ");                         // 1
            fSql.append("       ,division_id ");                     // 2
            fSql.append("       ,problems_presented ");              // 3
            fSql.append("       ,problems_opened ");                 // 4
            fSql.append("       ,problems_submitted ");              // 5
            fSql.append("       ,problems_correct ");                // 6
            fSql.append("       ,problems_failed_by_challenge ");    // 7
            fSql.append("       ,problems_failed_by_system_test ");  // 8
            fSql.append("       ,problems_left_open ");              // 9
            fSql.append("       ,challenge_attempts_made ");         // 10
            fSql.append("       ,challenges_made_successful ");      // 11
            fSql.append("       ,challenges_made_failed ");          // 12
            fSql.append("       ,challenge_attempts_received ");     // 13
            fSql.append("       ,challenges_received_successful ");  // 14
            fSql.append("       ,challenges_received_failed ");      // 15
            fSql.append("       ,submission_points ");               // 16
            fSql.append("       ,challenge_points ");                // 17
            fSql.append("       ,system_test_points ");              // 18
            fSql.append("       ,final_points ");                    // 19
            fSql.append("       ,defense_points) ");                  // 20
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?,?,?,?,?)");  // 20 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM coder_division ");
            fSql.append(" WHERE coder_id = ? ");
            fSql.append("   AND division_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int division_id = rs.getInt(2);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.setInt(2, division_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // coder_id
                psIns.setInt(2, rs.getInt(2));  // division_id
                psIns.setInt(3, rs.getInt(3));  // problems_presented
                psIns.setInt(4, rs.getInt(4));  // problems_opened
                psIns.setInt(5, rs.getInt(5));  // problems_submitted
                psIns.setInt(6, rs.getInt(6));  // problems_correct
                psIns.setInt(7, rs.getInt(7));  // prblms_failed_by_systest
                psIns.setInt(8, rs.getInt(8));  // prblms_failed_by_chlnge
                psIns.setInt(9, rs.getInt(9));  // problems_left_open
                psIns.setInt(10, rs.getInt(10));  // challenge_attempts_made
                psIns.setInt(11, rs.getInt(11));  // chlnges_made_successful
                psIns.setInt(12, rs.getInt(12));  // chlnges_made_failed
                psIns.setInt(13, rs.getInt(13));  // chlnge_attempts_received
                psIns.setInt(14, rs.getInt(14));  // chlnge_recvd_successfl
                psIns.setInt(15, rs.getInt(15));  // chlnge_recvd_failed
                psIns.setFloat(16, rs.getFloat(16));  // submission_points
                psIns.setFloat(17, rs.getFloat(17));  // challenge_points
                psIns.setFloat(18, rs.getFloat(18));  // system_test_points
                psIns.setFloat(19, rs.getFloat(19));  // final_points
                psIns.setFloat(20, rs.getFloat(20));  // defense_points

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadAggregate: Insert for " +
                            "coder_id " + coder_id +
                            ", division_id " + division_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "coder_division");
            }

            log.info("Records loaded for coder_division: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_division' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This method loads the 'round_division' table
     */
    private void loadRoundDivision() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT round_id ");                              // 1
            fSql.append("       ,division_id ");                          // 2
            fSql.append("       ,SUM(problems_presented) ");              // 3
            fSql.append("       ,SUM(problems_opened) ");                 // 4
            fSql.append("       ,SUM(problems_submitted) ");              // 5
            fSql.append("       ,SUM(problems_correct) ");                // 6
            fSql.append("       ,SUM(problems_failed_by_system_test) ");  // 7
            fSql.append("       ,SUM(problems_failed_by_challenge) ");    // 8
            fSql.append("       ,SUM(problems_left_open) ");              // 9
            fSql.append("       ,SUM(challenge_attempts_made) ");         // 10
            fSql.append("       ,SUM(challenges_made_successful) ");      // 11
            fSql.append("       ,SUM(challenges_made_failed) ");          // 12
            fSql.append("       ,SUM(challenge_attempts_received) ");     // 13
            fSql.append("       ,AVG(final_points) ");                    // 14
            fSql.append("       ,STDEV(final_points) ");                  // 15
            fSql.append("       ,SUM(defense_points) ");                  // 16
            fSql.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                fSql.append(" WHERE round_id =" + fRoundId);
            }
            fSql.append(" GROUP BY round_id ");
            fSql.append("          ,division_id");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO round_division ");
            fSql.append("      (round_id ");                         // 1
            fSql.append("       ,division_id ");                     // 2
            fSql.append("       ,problems_presented ");              // 3
            fSql.append("       ,problems_opened ");                 // 4
            fSql.append("       ,problems_submitted ");              // 5
            fSql.append("       ,problems_correct ");                // 6
            fSql.append("       ,problems_failed_by_system_test ");  // 7
            fSql.append("       ,problems_failed_by_challenge ");    // 8
            fSql.append("       ,problems_left_open ");              // 9
            fSql.append("       ,challenge_attempts_made ");         // 10
            fSql.append("       ,challenges_made_successful ");      // 11
            fSql.append("       ,challenges_made_failed ");          // 12
            fSql.append("       ,challenge_attempts_received ");     // 13
            fSql.append("       ,average_points ");                  // 14
            fSql.append("       ,point_standard_deviation ");        // 15
            fSql.append("       ,defense_points) ");                 // 16
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?)");          // 16 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM round_division ");
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND division_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int division_id = rs.getInt(2);

                psDel.clearParameters();
                psDel.setInt(1, round_id);
                psDel.setInt(2, division_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // round_id
                psIns.setInt(2, rs.getInt(2));  // division_id
                psIns.setInt(3, rs.getInt(3));  // problems_presented
                psIns.setInt(4, rs.getInt(4));  // problems_opened
                psIns.setInt(5, rs.getInt(5));  // problems_submitted
                psIns.setInt(6, rs.getInt(6));  // problems_correct
                psIns.setInt(7, rs.getInt(7));  // prblms_failed_by_systest
                psIns.setInt(8, rs.getInt(8));  // prblms_failed_by_chlnge
                psIns.setInt(9, rs.getInt(9));  // problems_left_open
                psIns.setInt(10, rs.getInt(10));  // challenge_attempts_made
                psIns.setInt(11, rs.getInt(11));  // chlnges_made_successful
                psIns.setInt(12, rs.getInt(12));  // chlnges_made_failed
                psIns.setInt(13, rs.getInt(13));  // chlnge_attempts_received
                psIns.setFloat(14, rs.getFloat(14));  // average_points
                psIns.setFloat(15, rs.getFloat(15));  // point_standard_deviation
                psIns.setFloat(16, rs.getFloat(16));  // defense_points

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadAggregate: Insert for " +
                            "round_id " + round_id +
                            ", division_id " + division_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "round_division");
            }

            log.info("Records loaded for round_division: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'round_division' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This method loads the 'coder_level' table
     */
    private void loadCoderLevel() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        // Need the point_standard_deviation for this table
        try {
            fSql.setLength(0);

            //  dok replace hard codes with constants
            fSql.append(" SELECT cp.coder_id ");                       // 1
            fSql.append(" ,cp.division_id ");                          // 2
            fSql.append(" ,cp.level_id ");                             // 3
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id >= 120 THEN 1 ELSE 0 END)");     // 4
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id >= 130 THEN 1 ELSE 0 END)");   //5
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END)  ");   //6
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = 140 THEN 1 ELSE 0 END)  ");   //7
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = 160 THEN 1 ELSE 0 END)  ");   //8
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id between 120 and 121 THEN 1 ELSE 0 END)");   //9
            fSql.append(" ,AVG(cp.final_points)");   //10
            fSql.append(" ,SUM(cp.submission_points) ");   //11
            fSql.append(" ,SUM(cp.challenge_points)");   //12
            fSql.append(" ,SUM(cp.system_test_points)");   //13
            fSql.append(" ,SUM(cp.final_points)");   //14
            fSql.append(" ,STDEV(cp.final_points)");   //15
            fSql.append(" ,SUM(cp.defense_points)");   //16
            fSql.append(" ,AVG(cp.time_elapsed)");     //17
            fSql.append(" FROM coder_problem cp");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                fSql.append(" WHERE cp.coder_id IN");
                fSql.append(" (SELECT coder_id");
                fSql.append(" FROM room_result");
                fSql.append(" WHERE attended = 'Y'");
                fSql.append(" AND round_id = " + fRoundId + ")");
            }
            fSql.append(" GROUP BY 1,2,3");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);
            fSql.setLength(0);
            fSql.append("INSERT INTO coder_level ");
            fSql.append("      (coder_id ");                         // 1
            fSql.append("       ,division_id ");                     // 2
            fSql.append("       ,level_id ");                        // 3
            fSql.append("       ,problems_opened ");                 // 4
            fSql.append("       ,problems_submitted ");              // 5
            fSql.append("       ,problems_correct ");                // 6
            fSql.append("       ,problems_failed_by_challenge ");    // 7
            fSql.append("       ,problems_failed_by_system_test ");  // 8
            fSql.append("       ,problems_left_open ");              // 9
            fSql.append("       ,average_points ");                  // 10
            fSql.append("       ,submission_points ");               // 11
            fSql.append("       ,challenge_points ");                // 12
            fSql.append("       ,system_test_points ");              // 13
            fSql.append("       ,final_points ");                    // 14
            fSql.append("       ,point_standard_deviation ");        // 15
            fSql.append("       ,defense_points ");                  // 16
            fSql.append("       ,avg_time_elapsed) ");               // 16
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?,?)");       // 17 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append(" UPDATE coder_level");
            fSql.append(" SET problems_presented = ");
            fSql.append(" (SELECT count(*)");
            fSql.append(" FROM problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE p.round_id = rr.round_id ");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND p.level_id = coder_level.level_id");
            fSql.append(" AND p.division_id = coder_level.division_id)");
            fSql.append(" ,challenge_attempts_made = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id)");
            fSql.append(" ,challenges_made_successful = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id ");
            fSql.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            fSql.append(" ,challenges_made_failed = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id ");
            fSql.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            fSql.append(" ,challenge_attempts_received = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.defendant_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id) ");
            fSql.append(" ,challenges_received_successful = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.defendant_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id ");
            fSql.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            fSql.append(" ,challenges_received_failed = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.defendant_id = rr.coder_id");
            fSql.append(" AND rr.coder_id = coder_level.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = coder_level.division_id");
            fSql.append(" AND p.level_id = coder_level.level_id ");
            fSql.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            fSql.append(" WHERE coder_id = ?");
            fSql.append(" AND division_id = ?");
            fSql.append(" AND level_id = ?");


            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM coder_level ");
            fSql.append(" WHERE coder_id = ? ");
            fSql.append("   AND division_id = ?");
            fSql.append("   AND level_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int division_id = rs.getInt(2);
                int level_id = rs.getInt(3);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.setInt(2, division_id);
                psDel.setInt(3, level_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // coder_id
                psIns.setInt(2, rs.getInt(2));  // division_id
                psIns.setInt(3, rs.getInt(3));  // level_id
                psIns.setInt(4, rs.getInt(4));  // problems_opened
                psIns.setInt(5, rs.getInt(5));  // problems_submitted
                psIns.setInt(6, rs.getInt(6));  // problems_correct
                psIns.setInt(7, rs.getInt(7));  // prblms_failed_by_chlnge
                psIns.setInt(8, rs.getInt(8));  // prblms_failed_by_systest
                psIns.setInt(9, rs.getInt(9));  // problems_left_open
                psIns.setFloat(10, rs.getFloat(10));  // average_points
                psIns.setFloat(11, rs.getFloat(11));  // submission_points
                psIns.setFloat(12, rs.getFloat(12));  // challenge_points
                psIns.setFloat(13, rs.getFloat(13));  // system_test_points
                psIns.setFloat(14, rs.getFloat(14));  // final_points
                psIns.setFloat(15, rs.getFloat(15));  // point_standard_deviation
                psIns.setFloat(16, rs.getFloat(16));  // defense_points
                psIns.setFloat(17, rs.getFloat(17));  // avg_time_elapsed

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadAggregate: Insert for " +
                            "coder_id " + coder_id +
                            ", division_id " + division_id +
                            "level_id " + level_id +
                            " modified " + retVal + " rows, not one.");
                }

                psUpd.setInt(1, coder_id);
                psUpd.setInt(2, division_id);
                psUpd.setInt(3, level_id);

                retVal = psUpd.executeUpdate();
                if (retVal != 1) {
                    throw new SQLException("TCLoadAggregate: Update for " +
                            "coder_id " + coder_id +
                            ", division_id " + division_id +
                            "level_id " + level_id +
                            " modified " + retVal + " rows, not one.");
                }


                printLoadProgress(count, "coder_level");
            }

            log.info("Records loaded for coder_level: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_level' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psUpd);
            close(psDel);
        }
    }

    /**
     * This method loads the 'coder_problem_summary' table
     */
    private void loadCoderProblemSummary() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT coder_id ");                              // 1
            fSql.append("       ,SUM(problems_presented) ");              // 2
            fSql.append("       ,SUM(problems_opened) ");                 // 3
            fSql.append("       ,SUM(problems_submitted) ");              // 4
            fSql.append("       ,SUM(problems_correct) ");                // 5
            fSql.append("       ,SUM(problems_failed_by_challenge) ");    // 6
            fSql.append("       ,SUM(problems_failed_by_system_test) ");  // 7
            fSql.append("       ,SUM(problems_left_open) ");              // 8
            fSql.append("       ,SUM(challenge_attempts_made) ");         // 9
            fSql.append("       ,SUM(challenges_made_successful) ");      // 10
            fSql.append("       ,SUM(challenges_made_failed) ");          // 11
            fSql.append("       ,SUM(challenge_attempts_received) ");     // 12
            fSql.append("       ,SUM(challenges_received_successful) ");  // 13
            fSql.append("       ,SUM(challenges_received_failed) ");      // 14
            fSql.append("       ,SUM(submission_points) ");               // 15
            fSql.append("       ,SUM(challenge_points) ");                // 16
            fSql.append("       ,SUM(system_test_points) ");              // 17
            fSql.append("       ,SUM(final_points) ");                    // 18
            fSql.append("       ,SUM(defense_points) ");                  // 19
            fSql.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                fSql.append(" WHERE coder_id IN");
                fSql.append(" (SELECT coder_id");
                fSql.append(" FROM room_result");
                fSql.append(" WHERE attended = 'Y'");
                fSql.append(" AND round_id = " + fRoundId + ")");
            }
            fSql.append(" GROUP BY coder_id ");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO coder_problem_summary ");
            fSql.append("      (coder_id ");                         // 1
            fSql.append("       ,problems_presented ");              // 2
            fSql.append("       ,problems_opened ");                 // 3
            fSql.append("       ,problems_submitted ");              // 4
            fSql.append("       ,problems_correct ");                // 5
            fSql.append("       ,problems_failed_by_challenge ");    // 6
            fSql.append("       ,problems_failed_by_system_test ");  // 7
            fSql.append("       ,problems_left_open ");              // 8
            fSql.append("       ,challenge_attempts_made ");         // 9
            fSql.append("       ,challenges_made_successful ");      // 10
            fSql.append("       ,challenges_made_failed ");          // 11
            fSql.append("       ,challenge_attempts_received ");     // 12
            fSql.append("       ,challenges_received_successful ");  // 13
            fSql.append("       ,challenges_received_failed ");      // 14
            fSql.append("       ,submission_points ");               // 15
            fSql.append("       ,challenge_points ");                // 16
            fSql.append("       ,system_test_points ");              // 17
            fSql.append("       ,final_points ");                    // 18
            fSql.append("       ,defense_points) ");                  // 19
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?,?,?,?)");    // 19 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM coder_problem_summary ");
            fSql.append(" WHERE coder_id = ? ");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int coder_id = rs.getInt(1);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // coder_id
                psIns.setInt(2, rs.getInt(2));  // problems_presented
                psIns.setInt(3, rs.getInt(3));  // problems_opened
                psIns.setInt(4, rs.getInt(4));  // problems_submitted
                psIns.setInt(5, rs.getInt(5));  // problems_correct
                psIns.setInt(6, rs.getInt(6));  // prblms_failed_by_chlnge
                psIns.setInt(7, rs.getInt(7));  // prblms_failed_by_systest
                psIns.setInt(8, rs.getInt(8));  // problems_left_open
                psIns.setInt(9, rs.getInt(9));  // challenge_attempts_made
                psIns.setInt(10, rs.getInt(10));  // chlnges_made_successful
                psIns.setInt(11, rs.getInt(11));  // chlnges_made_failed
                psIns.setInt(12, rs.getInt(12));  // chlnge_attempts_received
                psIns.setInt(13, rs.getInt(13));  // chlnge_recvd_successfl
                psIns.setInt(14, rs.getInt(14));  // chlnge_recvd_failed
                psIns.setFloat(15, rs.getFloat(15));  // submission_points
                psIns.setFloat(16, rs.getFloat(16));  // challenge_points
                psIns.setFloat(17, rs.getFloat(17));  // system_test_points
                psIns.setFloat(18, rs.getFloat(18));  // final_points
                psIns.setFloat(19, rs.getFloat(19));  // defense_points

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadAggregate: Insert for " +
                            "coder_id " + coder_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "coder_problem_summary");
            }

            log.info("Records loaded for coder_problem_summary: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_problem_summary' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This method loads the 'streak' table
     */
    private void loadStreak() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psDel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT rr.coder_id ");      // 1
            fSql.append("       ,rr.round_id ");     // 2
            fSql.append("       ,rm.division_id ");  // 3
            fSql.append("       ,rr.room_placed ");  // 4
            fSql.append("       ,r.calendar_id");
            fSql.append("  FROM room_result rr ");
            fSql.append("       ,room rm ");
            fSql.append("       ,round r ");
            fSql.append(" WHERE rr.room_id = rm.room_id ");
            fSql.append("   AND r.round_type_id = " + SINGLE_ROUND_MATCH);
            fSql.append("   AND r.round_id = rr.round_id ");
            fSql.append(" ORDER BY rr.coder_id ");
            fSql.append("          ,r.calendar_id ");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO streak ");
            fSql.append("      (coder_id ");         // 1
            fSql.append("       ,streak_type_id ");  // 2
            fSql.append("       ,start_round_id ");  // 3
            fSql.append("       ,end_round_id ");    // 4
            fSql.append("       ,length ");          // 5
            fSql.append("       ,is_current) ");     // 6
            fSql.append("VALUES (?,?,?,?,?,?)");  // 6 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("SELECT round_id FROM round");
            fSql.append(" WHERE calendar_id = (SELECT MAX(calendar_id) FROM round)");

            psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM streak");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // Get the most recent round_id
            // information We compare this against the ending round id for a
            // streak. If they match, the streak is considered current.
            rs = executeQuery(psSel2, "getMaxIdFromRoomResult");
            int latest_round_id = -1;
            if (rs.next()) {
                latest_round_id = rs.getInt(1);
            } else {
                throw new SQLException("Unable to retrieve max(round_id) from " +
                        "room_result");
            }

            close(rs);

            // On to the load. First, we want to delete the whole table so
            // we can reload it.
            psDel.executeUpdate();

            rs = psSel.executeQuery();

            int cur_division_id = -1, cur_coder_id = -1;
            int start_round_id = -1, end_round_id = -1;
            int numWins = 0;

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int round_id = rs.getInt(2);
                int division_id = rs.getInt(3);
                int room_placed = rs.getInt(4);

                // The first thing we do is check to see if we are still with
                // the same coder and in the same division. Only with those
                // constraints can a win streak continue. And then, iff room
                // placed is 1 do we continue the streak.
                if ((cur_coder_id == -1 || coder_id == cur_coder_id) &&
                        (cur_division_id == -1 || division_id == cur_division_id) &&
                        room_placed == 1) {
                    cur_coder_id = coder_id;
                    cur_division_id = division_id;
                    numWins++;
                    if (start_round_id == -1)
                        start_round_id = round_id;
                    end_round_id = round_id;
                } else if (numWins > 1) {  //we have a streak, load it up
                    int streak_type_id = -1;
                    if (cur_division_id == 1)
                        streak_type_id = CONSEC_WINS_DIV1;
                    else if (cur_division_id == 2)
                        streak_type_id = CONSEC_WINS_DIV2;
                    else
                        throw new SQLException("Unknown division_id " + cur_division_id +
                                ". Code for streak table needs to be " +
                                "modified to accomodate new division.");

                    psIns.clearParameters();
                    psIns.setInt(1, cur_coder_id);
                    psIns.setInt(2, streak_type_id);
                    psIns.setInt(3, start_round_id);
                    psIns.setInt(4, end_round_id);
                    psIns.setInt(5, numWins);
                    psIns.setInt(6, (end_round_id == latest_round_id ? 1 : 0));

                    retVal = psIns.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadAggregate: Insert for " +
                                "coder_id " + coder_id +
                                ", streak_type_id " + streak_type_id +
                                " modified " + retVal + " rows, not one.");
                    }

                    printLoadProgress(count, "streak");

                    // if this record is a first place, start a new streak
                    if (room_placed == 1) {
                        cur_coder_id = coder_id;
                        cur_division_id = division_id;
                        start_round_id = round_id;
                        end_round_id = round_id;
                        numWins = 1;
                    } else {
                        cur_coder_id = -1;
                        cur_division_id = -1;
                        start_round_id = -1;
                        end_round_id = -1;
                        numWins = 0;
                    }
                } else {
                    cur_coder_id = -1;
                    cur_division_id = -1;
                    start_round_id = -1;
                    end_round_id = -1;
                    numWins = 0;
                }
            }
            log.info("Records loaded for streak: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'streak' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psSel2);
            close(psIns);
        }
    }

    /**
     * This method loads the 'room_result' table with information we
     * didn't get from the round load...namely submission_points,
     * problems_submitted
     */
    private void loadRoomResult2() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            // First, lets get the submission_points
            fSql.setLength(0);
            fSql.append(" SELECT cp.round_id");
            fSql.append(" ,cp.coder_id ");
            fSql.append(" ,SUM(cp.submission_points) ");
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_SUBMITTED + " THEN 1 ELSE 0 END)");
            fSql.append(" FROM coder_problem cp");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                fSql.append(" WHERE cp.coder_id IN");
                fSql.append(" (SELECT coder_id");
                fSql.append(" FROM room_result");
                fSql.append(" WHERE attended = 'Y'");
                fSql.append(" AND round_id = " + fRoundId + ")");
            }
            fSql.append(" GROUP BY cp.round_id ");
            fSql.append(" ,cp.coder_id ");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("UPDATE room_result ");
            fSql.append("   SET submission_points = ? ");    // 1
            fSql.append("       ,problems_submitted = ? ");  // 2
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND coder_id = ? ");
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int coder_id = rs.getInt(2);

                psUpd.clearParameters();
                psUpd.setFloat(1, rs.getFloat(3));  // sum submission_points
                psUpd.setInt(2, rs.getInt(4));  // problems_submitted
                psUpd.setInt(3, round_id);
                psUpd.setInt(4, coder_id);

                retVal = psUpd.executeUpdate();
                count += retVal;
                if (retVal > 1) {
                    throw new SQLException("TCLoadAggregate: Update for " +
                            "round_id " + round_id +
                            " coder_id " + coder_id +
                            " modified more than one row.");
                }

                printLoadProgress(count, "room_result");
            }

            log.info("Records loaded for room_result " +
                    "(submission_points): " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of aggregate 'room_result' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psUpd);
            close(psDel);
        }
    }

    /**
     * This method loads the 'room_result' table with information about
     * point_standard_deviation
     */
    private void loadRoomResult3() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psUpd = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT rd.round_id ");                   // 1
            fSql.append("       ,rd.division_id ");               // 2
            fSql.append("       ,rd.point_standard_deviation ");  // 3
            fSql.append("       ,rd.average_points ");            // 4
            fSql.append("  FROM round_division rd ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                fSql.append(" WHERE rd.round_id =" + fRoundId);
            }
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("SELECT rr.coder_id ");                   // 1
            fSql.append("       ,rr.final_points ");              // 2
            fSql.append("  FROM room_result rr ");
            fSql.append(" WHERE rr.round_id = ? ");
            fSql.append("   AND rr.division_id = ? ");
            psSel2 = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("UPDATE room_result ");
            fSql.append("   SET point_standard_deviation = ? ");  // 1
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND coder_id = ? ");
            fSql.append("   AND division_id = ? ");
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int division_id = rs.getInt(2);
                float pstddev = rs.getFloat(3);
                float avgpts = rs.getFloat(4);

                psSel2.clearParameters();
                psSel2.setInt(1, round_id);
                psSel2.setInt(2, division_id);
                rs2 = psSel2.executeQuery();

                while (rs2.next()) {
                    int coder_id = rs2.getInt(1);
                    float final_points = rs2.getFloat(2);
                    float coder_pstddev = ((final_points - avgpts) / pstddev);

                    psUpd.clearParameters();
                    psUpd.setFloat(1, coder_pstddev); // point_standard_deviation
                    psUpd.setInt(2, round_id);
                    psUpd.setInt(3, coder_id);
                    psUpd.setInt(4, division_id);

                    retVal = psUpd.executeUpdate();
                    count += retVal;
                    if (retVal > 1) {
                        throw new SQLException("TCLoadAggregate: Update for " +
                                "round_id " + round_id +
                                " coder_id " + coder_id +
                                " division_id " + division_id +
                                " modified more than one row.");
                    }

                    printLoadProgress(count, "room_result_pstdev");
                }

                close(rs2);
            }

            log.info("Records loaded for room_result " +
                    "(point_standard_deviation): " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of aggregate 'room_result' for " +
                    "point_standard_deviation failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psUpd);
            close(psDel);
        }
    }


    /**
     * This populates the 'round_problem' table
     */
    private void loadRoundProblem() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT cp.round_id ");                              // 1
            fSql.append("       ,cp.problem_id ");                           // 2
            fSql.append("       ,cp.division_id ");                          // 3
            // 4: problems_opened
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_OPENED +
                    " THEN 1 ELSE 0 END)");
            // 5: problems_submitted
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_SUBMITTED +
                    " THEN 1 ELSE 0 END)");
            // 6: problems_correct
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_PASSED_SYS_TEST + " THEN 1 ELSE 0 END)  ");
            // 7: problems_failed_by_challenge
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_CHLNG_SUCCEEDED + " THEN 1 ELSE 0 END)  ");
            // 8: problems_failed_by_system_test
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_FAILED_SYS_TEST + " THEN 1 ELSE 0 END)  ");
            // 9: problems_left_open
            fSql.append(" ,SUM(CASE WHEN cp.end_status_id between " +
                    STATUS_OPENED + " and 121 THEN 1 ELSE 0 END)");
            // 10: submission_points
            fSql.append("  ,SUM(cp.submission_points) ");
            fSql.append(" ,SUM(cp.challenge_points)"); // 11: challenge_points
            fSql.append(" ,SUM(cp.system_test_points)"); // 12: system_test_points
            fSql.append(" ,SUM(cp.defense_points)"); // 13: defense_points
            fSql.append(" ,AVG(cp.final_points)"); // 14: average_points
            fSql.append("       ,STDEV(final_points) "); // 15: point_standard_deviation
            fSql.append("       ,SUM(final_points) "); // 16: final_points
            fSql.append("       ,AVG(time_elapsed) ");     //17
            fSql.append("  FROM coder_problem cp ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                fSql.append(" WHERE cp.round_id =" + fRoundId);
            }
            fSql.append(" GROUP BY 1,2,3 ");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO round_problem ");
            fSql.append("      (round_id ");                         // 1
            fSql.append("       ,problem_id ");                      // 2
            fSql.append("       ,division_id ");                     // 3
            fSql.append("       ,problems_opened ");                 // 4
            fSql.append("       ,problems_submitted ");              // 5
            fSql.append("       ,problems_correct ");                // 6
            fSql.append("       ,problems_failed_by_challenge ");    // 7
            fSql.append("       ,problems_failed_by_system_test ");  // 8
            fSql.append("       ,problems_left_open ");              // 9
            fSql.append("       ,submission_points ");               // 10
            fSql.append("       ,challenge_points ");                // 11
            fSql.append("       ,system_test_points ");              // 12
            fSql.append("       ,defense_points ");                  // 13
            fSql.append("       ,average_points ");                  // 14
            fSql.append("       ,point_standard_deviation ");        // 15
            fSql.append("       ,final_points ");                    // 16
            fSql.append("       ,avg_time_elapsed) ");               // 17
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?,?)");        // 17 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM round_problem ");
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND problem_id = ? ");
            fSql.append("   AND division_id = ? ");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append(" UPDATE round_problem ");
            fSql.append(" SET problems_presented = ");
            fSql.append(" (SELECT count(*)");
            fSql.append(" FROM problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE p.round_id = rr.round_id ");
            fSql.append(" AND p.round_id = round_problem.round_id");
            fSql.append(" AND p.problem_id = round_problem.problem_id");
            fSql.append(" AND p.division_id = round_problem.division_id");
            fSql.append(" AND p.division_id = rr.division_id)");
            fSql.append(" ,challenge_attempts_made = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = round_problem.division_id");
            fSql.append(" AND p.level_id = round_problem.level_id)");
            fSql.append(" ,challenges_made_successful = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = round_problem.division_id");
            fSql.append(" AND p.level_id = round_problem.level_id");
            fSql.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            fSql.append(" ,challenges_made_failed = ");
            fSql.append(" (SELECT count(*) ");
            fSql.append(" FROM challenge c ");
            fSql.append(" ,problem p ");
            fSql.append(" ,room_result rr ");
            fSql.append(" WHERE c.challenger_id = rr.coder_id");
            fSql.append(" AND c.round_id = rr.round_id");
            fSql.append(" AND rr.round_id = p.round_id");
            fSql.append(" AND rr.division_id = p.division_id");
            fSql.append(" AND p.problem_id = c.problem_id");
            fSql.append(" AND p.division_id = round_problem.division_id");
            fSql.append(" AND p.level_id = round_problem.level_id");
            fSql.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            fSql.append(" ,open_order = ");
            fSql.append(" (SELECT distinct open_order ");
            fSql.append(" FROM coder_problem cp ");
            fSql.append(" WHERE cp.problem_id = round_problem.problem_id ");
            fSql.append("   AND cp.round_id = round_problem.round_id ");
            fSql.append("   AND cp.division_id = round_problem.division_id) ");
            fSql.append(" ,level_id = ");
            fSql.append(" (SELECT distinct level_id ");
            fSql.append(" FROM coder_problem cp ");
            fSql.append(" WHERE cp.problem_id = round_problem.problem_id ");
            fSql.append("   AND cp.round_id = round_problem.round_id ");
            fSql.append("   AND cp.division_id = round_problem.division_id) ");
            fSql.append(" ,level_desc = ");
            fSql.append(" (SELECT distinct level_desc ");
            fSql.append(" FROM coder_problem cp ");
            fSql.append(" WHERE cp.problem_id = round_problem.problem_id ");
            fSql.append("   AND cp.round_id = round_problem.round_id ");
            fSql.append("   AND cp.division_id = round_problem.division_id) ");
            fSql.append(" WHERE problem_id = ? ");
            fSql.append("   AND round_id = ? ");
            fSql.append("   AND division_id = ?");
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int problem_id = rs.getInt(2);
                int division_id = rs.getInt(3);

                psDel.clearParameters();
                psDel.setInt(1, round_id);
                psDel.setInt(2, problem_id);
                psDel.setInt(3, division_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, round_id);  // round_id
                psIns.setInt(2, problem_id);  // problem_id
                psIns.setInt(3, division_id);  // division_id
                psIns.setInt(4, rs.getInt(4));  // problems_opened
                psIns.setInt(5, rs.getInt(5));  // problems_submitted
                psIns.setInt(6, rs.getInt(6));  // problems_correct
                psIns.setInt(7, rs.getInt(7));  // prb_failed_by_challenge
                psIns.setInt(8, rs.getInt(8));  // prb_failed_by_systemtest
                psIns.setInt(9, rs.getInt(9));  // problems_left_open
                psIns.setFloat(10, rs.getFloat(10));  // submission_points
                psIns.setFloat(11, rs.getFloat(11));  // challenge_points
                psIns.setFloat(12, rs.getFloat(12));  // system_test_points
                psIns.setFloat(13, rs.getFloat(13));  // defense_points
                psIns.setFloat(14, rs.getFloat(14));  // average_points
                psIns.setFloat(15, rs.getFloat(15));  // point_standard_dev
                psIns.setFloat(16, rs.getFloat(16));  // final_points
                psIns.setFloat(17, rs.getFloat(17));  // avg_time_elapsed

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for round_id " +
                            round_id +
                            ", problem_id " + problem_id +
                            ", division_id " + division_id +
                            " modified " + retVal + " rows, not one.");
                }

                psUpd.clearParameters();
                psUpd.setInt(1, problem_id);      // problem_id
                psUpd.setInt(2, round_id);        // round_id
                psUpd.setInt(3, division_id);     // division_id
                psUpd.executeUpdate();

                printLoadProgress(count, "round_problem");
            }

            log.info("Round_problem records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'round_problem' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
            close(psUpd);
        }
    }

}
