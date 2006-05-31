package com.topcoder.utilities.hsdwload;

/**
 * TCLoadAggregate.java
 *
 * TCLoadAggregate loads the various aggregate tables in the data warehouse.
 *
 * The tables that are built by this load procedure are:
 *
 * <ul>
 * <li>room_result</li>
 * <li>coder_division</li>
 * <li>round_division</li>
 * <li>coder_problem_summary</li>
 * <li>coder_level</li>
 * <li>streak</li>
 * <li>round_problem</li>
 * </ul>
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 */

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

            loadRRschool_points();

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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT coder_id ");                              // 1
            query.append("       ,division_id ");                          // 2
            query.append("       ,SUM(problems_presented) ");              // 3
            query.append("       ,SUM(problems_opened) ");                 // 4
            query.append("       ,SUM(problems_submitted) ");              // 5
            query.append("       ,SUM(problems_correct) ");                // 6
            query.append("       ,SUM(problems_failed_by_challenge) ");    // 7
            query.append("       ,SUM(problems_failed_by_system_test) ");  // 8
            query.append("       ,SUM(problems_left_open) ");              // 9
            query.append("       ,SUM(challenge_attempts_made) ");         // 10
            query.append("       ,SUM(challenges_made_successful) ");      // 11
            query.append("       ,SUM(challenges_made_failed) ");          // 12
            query.append("       ,SUM(challenge_attempts_received) ");     // 13
            query.append("       ,SUM(challenges_received_successful) ");  // 14
            query.append("       ,SUM(challenges_received_failed) ");      // 15
            query.append("       ,SUM(submission_points) ");               // 16
            query.append("       ,SUM(challenge_points) ");                // 17
            query.append("       ,SUM(system_test_points) ");              // 18
            query.append("       ,SUM(final_points) ");                    // 19
            query.append("       ,SUM(defense_points) ");                  // 20
            query.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                query.append(" WHERE coder_id IN");
                query.append(" (SELECT coder_id");
                query.append(" FROM room_result");
                query.append(" WHERE attended = 'Y'");
                query.append(" AND round_id = " + fRoundId + ")");
            }
            query.append(" GROUP BY coder_id ");
            query.append("          ,division_id");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO coder_division ");
            query.append("      (coder_id ");                         // 1
            query.append("       ,division_id ");                     // 2
            query.append("       ,problems_presented ");              // 3
            query.append("       ,problems_opened ");                 // 4
            query.append("       ,problems_submitted ");              // 5
            query.append("       ,problems_correct ");                // 6
            query.append("       ,problems_failed_by_challenge ");    // 7
            query.append("       ,problems_failed_by_system_test ");  // 8
            query.append("       ,problems_left_open ");              // 9
            query.append("       ,challenge_attempts_made ");         // 10
            query.append("       ,challenges_made_successful ");      // 11
            query.append("       ,challenges_made_failed ");          // 12
            query.append("       ,challenge_attempts_received ");     // 13
            query.append("       ,challenges_received_successful ");  // 14
            query.append("       ,challenges_received_failed ");      // 15
            query.append("       ,submission_points ");               // 16
            query.append("       ,challenge_points ");                // 17
            query.append("       ,system_test_points ");              // 18
            query.append("       ,final_points ");                    // 19
            query.append("       ,defense_points) ");                  // 20
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?,?,?,?,?,?,?,?,?,?)");  // 20 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM coder_division ");
            query.append(" WHERE coder_id = ? ");
            query.append("   AND division_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT round_id ");                              // 1
            query.append("       ,division_id ");                          // 2
            query.append("       ,SUM(problems_presented) ");              // 3
            query.append("       ,SUM(problems_opened) ");                 // 4
            query.append("       ,SUM(problems_submitted) ");              // 5
            query.append("       ,SUM(problems_correct) ");                // 6
            query.append("       ,SUM(problems_failed_by_system_test) ");  // 7
            query.append("       ,SUM(problems_failed_by_challenge) ");    // 8
            query.append("       ,SUM(problems_left_open) ");              // 9
            query.append("       ,SUM(challenge_attempts_made) ");         // 10
            query.append("       ,SUM(challenges_made_successful) ");      // 11
            query.append("       ,SUM(challenges_made_failed) ");          // 12
            query.append("       ,SUM(challenge_attempts_received) ");     // 13
            query.append("       ,AVG(final_points) ");                    // 14
            query.append("       ,STDEV(final_points) ");                  // 15
            query.append("       ,SUM(defense_points) ");                  // 16
            query.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                query.append(" WHERE round_id =" + fRoundId);
            }
            query.append(" GROUP BY round_id ");
            query.append("          ,division_id");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO round_division ");
            query.append("      (round_id ");                         // 1
            query.append("       ,division_id ");                     // 2
            query.append("       ,problems_presented ");              // 3
            query.append("       ,problems_opened ");                 // 4
            query.append("       ,problems_submitted ");              // 5
            query.append("       ,problems_correct ");                // 6
            query.append("       ,problems_failed_by_system_test ");  // 7
            query.append("       ,problems_failed_by_challenge ");    // 8
            query.append("       ,problems_left_open ");              // 9
            query.append("       ,challenge_attempts_made ");         // 10
            query.append("       ,challenges_made_successful ");      // 11
            query.append("       ,challenges_made_failed ");          // 12
            query.append("       ,challenge_attempts_received ");     // 13
            query.append("       ,average_points ");                  // 14
            query.append("       ,point_standard_deviation ");        // 15
            query.append("       ,defense_points) ");                 // 16
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?,?,?,?,?,?)");          // 16 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM round_division ");
            query.append(" WHERE round_id = ? ");
            query.append("   AND division_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        // Need the point_standard_deviation for this table
        try {
            query = new StringBuffer(100);

            //  TODO replace hard codes with constants
            query.append(" SELECT cp.coder_id ");                       // 1
            query.append(" ,cp.division_id ");                          // 2
            query.append(" ,cp.level_id ");                             // 3
            query.append(" ,SUM(CASE WHEN cp.end_status_id >= 120 THEN 1 ELSE 0 END) AS problems_opened");     // 4
            query.append(" ,SUM(CASE WHEN cp.end_status_id >= 130 THEN 1 ELSE 0 END) AS problems_submitted");   //5
            query.append(" ,SUM(CASE WHEN cp.end_status_id = 150 THEN 1 ELSE 0 END) AS problems_correct");   //6
            query.append(" ,SUM(CASE WHEN cp.end_status_id = 140 THEN 1 ELSE 0 END) AS problems_failed_by_challenge ");   //7
            query.append(" ,SUM(CASE WHEN cp.end_status_id = 160 THEN 1 ELSE 0 END) AS problems_failed_by_system_test ");   //8
            query.append(" ,SUM(CASE WHEN cp.end_status_id between 120 and 121 THEN 1 ELSE 0 END) AS problems_left_open");   //9
            query.append(" ,AVG(cp.final_points)");   //10
            query.append(" ,SUM(cp.submission_points) ");   //11
            query.append(" ,SUM(cp.challenge_points)");   //12
            query.append(" ,SUM(cp.system_test_points)");   //13
            query.append(" ,SUM(cp.final_points)");   //14
            query.append(" ,STDEV(cp.final_points)");   //15
            query.append(" ,SUM(cp.defense_points)");   //16
            query.append(" ,AVG(cp.time_elapsed)");     //17
            query.append(" FROM coder_problem cp");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                query.append(" WHERE cp.coder_id IN");
                query.append(" (SELECT coder_id");
                query.append(" FROM room_result");
                query.append(" WHERE attended = 'Y'");
                query.append(" AND round_id = " + fRoundId + ")");
            }
            query.append(" GROUP BY 1,2,3");
            psSel = prepareStatement(query.toString(), SOURCE_DB);


            query = new StringBuffer(100);
            query.append(" INSERT ");
            query.append(" INTO coder_level ");
            query.append(" (coder_id ");                         // 1
            query.append(" ,division_id ");                     // 2
            query.append(" ,level_id ");                        // 3
            query.append(" ,problems_opened ");                 // 4
            query.append(" ,problems_submitted ");              // 5
            query.append(" ,problems_correct ");                // 6
            query.append(" ,problems_failed_by_challenge ");    // 7
            query.append(" ,problems_failed_by_system_test ");  // 8
            query.append(" ,problems_left_open ");              // 9
            query.append(" ,average_points ");                  // 10
            query.append(" ,submission_points ");               // 11
            query.append(" ,challenge_points ");                // 12
            query.append(" ,system_test_points ");              // 13
            query.append(" ,final_points ");                    // 14
            query.append(" ,point_standard_deviation ");        // 15
            query.append(" ,defense_points ");                  // 16
            query.append(" ,avg_time_elapsed) ");               // 16
            query.append(" VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?,?,?,?,?,?,?)");       // 17 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE coder_level");
            query.append(" SET problems_presented = ");
            query.append(" (SELECT count(*)");
            query.append(" FROM problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE p.round_id = rr.round_id ");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.level_id = coder_level.level_id");
            query.append(" AND p.division_id = coder_level.division_id)");
            query.append(" ,challenge_attempts_made = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id)");
            query.append(" ,challenges_made_successful = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id ");
            query.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            query.append(" ,challenges_made_failed = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id ");
            query.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            query.append(" ,challenge_attempts_received = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.defendant_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id) ");
            query.append(" ,challenges_received_successful = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.defendant_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id ");
            query.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            query.append(" ,challenges_received_failed = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.defendant_id = rr.coder_id");
            query.append(" AND rr.coder_id = coder_level.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = coder_level.division_id");
            query.append(" AND p.level_id = coder_level.level_id ");
            query.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            query.append(" WHERE coder_id = ?");
            query.append(" AND division_id = ?");
            query.append(" AND level_id = ?");


            psUpd = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM coder_level ");
            query.append(" WHERE coder_id = ? ");
            query.append("   AND division_id = ?");
            query.append("   AND level_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT coder_id ");                              // 1
            query.append("       ,SUM(problems_presented) ");              // 2
            query.append("       ,SUM(problems_opened) ");                 // 3
            query.append("       ,SUM(problems_submitted) ");              // 4
            query.append("       ,SUM(problems_correct) ");                // 5
            query.append("       ,SUM(problems_failed_by_challenge) ");    // 6
            query.append("       ,SUM(problems_failed_by_system_test) ");  // 7
            query.append("       ,SUM(problems_left_open) ");              // 8
            query.append("       ,SUM(challenge_attempts_made) ");         // 9
            query.append("       ,SUM(challenges_made_successful) ");      // 10
            query.append("       ,SUM(challenges_made_failed) ");          // 11
            query.append("       ,SUM(challenge_attempts_received) ");     // 12
            query.append("       ,SUM(challenges_received_successful) ");  // 13
            query.append("       ,SUM(challenges_received_failed) ");      // 14
            query.append("       ,SUM(submission_points) ");               // 15
            query.append("       ,SUM(challenge_points) ");                // 16
            query.append("       ,SUM(system_test_points) ");              // 17
            query.append("       ,SUM(final_points) ");                    // 18
            query.append("       ,SUM(defense_points) ");                  // 19
            query.append("  FROM room_result ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                query.append(" WHERE coder_id IN");
                query.append(" (SELECT coder_id");
                query.append(" FROM room_result");
                query.append(" WHERE attended = 'Y'");
                query.append(" AND round_id = " + fRoundId + ")");
            }
            query.append(" GROUP BY coder_id ");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO coder_problem_summary ");
            query.append("      (coder_id ");                         // 1
            query.append("       ,problems_presented ");              // 2
            query.append("       ,problems_opened ");                 // 3
            query.append("       ,problems_submitted ");              // 4
            query.append("       ,problems_correct ");                // 5
            query.append("       ,problems_failed_by_challenge ");    // 6
            query.append("       ,problems_failed_by_system_test ");  // 7
            query.append("       ,problems_left_open ");              // 8
            query.append("       ,challenge_attempts_made ");         // 9
            query.append("       ,challenges_made_successful ");      // 10
            query.append("       ,challenges_made_failed ");          // 11
            query.append("       ,challenge_attempts_received ");     // 12
            query.append("       ,challenges_received_successful ");  // 13
            query.append("       ,challenges_received_failed ");      // 14
            query.append("       ,submission_points ");               // 15
            query.append("       ,challenge_points ");                // 16
            query.append("       ,system_test_points ");              // 17
            query.append("       ,final_points ");                    // 18
            query.append("       ,defense_points) ");                  // 19
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?,?,?,?,?,?,?,?,?)");    // 19 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM coder_problem_summary ");
            query.append(" WHERE coder_id = ? ");
            psDel = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT rr.coder_id ");      // 1
            query.append("       ,rr.round_id ");     // 2
            query.append("       ,rm.division_id ");  // 3
            query.append("       ,rr.room_placed ");  // 4
            query.append("       ,r.calendar_id");
            query.append("  FROM room_result rr ");
            query.append("       ,room rm ");
            query.append("       ,round r ");
            query.append(" WHERE rr.room_id = rm.room_id ");
            query.append("   AND r.round_type_id = " + SINGLE_ROUND_MATCH);
            query.append("   AND r.round_id = rr.round_id ");
            query.append(" ORDER BY rr.coder_id ");
            query.append("          ,r.calendar_id ");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO streak ");
            query.append("      (coder_id ");         // 1
            query.append("       ,streak_type_id ");  // 2
            query.append("       ,start_round_id ");  // 3
            query.append("       ,end_round_id ");    // 4
            query.append("       ,length ");          // 5
            query.append("       ,is_current) ");     // 6
            query.append("VALUES (?,?,?,?,?,?)");  // 6 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("SELECT round_id FROM round");
            query.append(" WHERE calendar_id = (SELECT MAX(calendar_id) FROM round)");

            psSel2 = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM streak");
            psDel = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        try {
            // First, lets get the submission_points
            query = new StringBuffer(100);
            query.append(" SELECT cp.round_id");
            query.append(" ,cp.coder_id ");
            query.append(" ,SUM(cp.submission_points) ");
            query.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_SUBMITTED + " THEN 1 ELSE 0 END)");
            query.append(" FROM coder_problem cp");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the people that competed in the round we're loading
                query.append(" WHERE cp.coder_id IN");
                query.append(" (SELECT coder_id");
                query.append(" FROM room_result");
                query.append(" WHERE attended = 'Y'");
                query.append(" AND round_id = " + fRoundId + ")");
            }
            query.append(" GROUP BY cp.round_id ");
            query.append(" ,cp.coder_id ");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("UPDATE room_result ");
            query.append("   SET submission_points = ? ");    // 1
            query.append("       ,problems_submitted = ? ");  // 2
            query.append(" WHERE round_id = ? ");
            query.append("   AND coder_id = ? ");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT rd.round_id ");                   // 1
            query.append("       ,rd.division_id ");               // 2
            query.append("       ,rd.point_standard_deviation ");  // 3
            query.append("       ,rd.average_points ");            // 4
            query.append("  FROM round_division rd ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                query.append(" WHERE rd.round_id =" + fRoundId);
            }
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("SELECT rr.coder_id ");                   // 1
            query.append("       ,rr.final_points ");              // 2
            query.append("  FROM room_result rr ");
            query.append(" WHERE rr.round_id = ? ");
            query.append("   AND rr.division_id = ? ");
            psSel2 = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("UPDATE room_result ");
            query.append("   SET point_standard_deviation = ? ");  // 1
            query.append(" WHERE round_id = ? ");
            query.append("   AND coder_id = ? ");
            query.append("   AND division_id = ? ");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

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
     * This method loads the 'room_result' table with column school_points.
     * It would be nice to use overall_rank instead of division_placed, but that's not populated.
     */
    private void loadRRschool_points() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT rr.round_id ");               // 1
            query.append("      ,rr.school_id ");              // 2
            query.append("      ,rr.coder_id ");               // 3
            query.append("      ,rr.division_placed ");        // 4
            query.append("      ,(SELECT COUNT(*) ");          // 5
            query.append("          FROM room_result rr3 ");
            query.append("         WHERE rr3.school_id = rr.school_id ");
            query.append("           AND rr3.round_id = rr.round_id ");
            query.append("           AND rr3.division_placed < rr.division_placed) ");
            query.append("       ,(SELECT COUNT(*) ");         // 6
            query.append("           FROM room_result rr2 ");
            query.append("          WHERE rr2.school_id = rr.school_id ");
            query.append("            AND rr2.round_id = rr.round_id) ");
            query.append("  FROM room_result rr");
            query.append(" WHERE attended = 'Y'");
            query.append(" AND round_id = " + fRoundId);
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("UPDATE room_result ");
            query.append("   SET school_points = ? ");  // 1
            query.append(" WHERE round_id = ? ");       // 2
            query.append("   AND coder_id = ? ");       // 3
            psUpd = prepareStatement(query.toString(), TARGET_DB);

            // On to the load
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int school_id = rs.getInt(2);
                int coder_id = rs.getInt(3);
                int division_placed = rs.getInt(4);
                int place_within_school = rs.getInt(5);
                int num_attended_school = rs.getInt(6);

                int school_points = 0;
                if (num_attended_school >= 3 && place_within_school < 3)
                    school_points = division_placed;

                psUpd.clearParameters();
                psUpd.setInt(1, school_points);
                psUpd.setInt(2, round_id);
                psUpd.setInt(3, coder_id);

                retVal = psUpd.executeUpdate();
                count += retVal;
                if (retVal > 1) {
                    throw new SQLException("TCLoadAggregate: Update for " +
                            "round_id " + round_id +
                            " coder_id " + coder_id +
                            " modified more than one row.");
                }

                printLoadProgress(count, "room_result.school_points");
            }

            log.info("Records loaded for room_result " +
                    "(school_points): " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of aggregate 'room_result' for " +
                    "school_points failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psUpd);
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
        StringBuffer query = null;

        try {
            query = new StringBuffer(100);
            query.append("SELECT cp.round_id ");                              // 1
            query.append("       ,cp.problem_id ");                           // 2
            query.append("       ,cp.division_id ");                          // 3
            // 4: problems_opened
            query.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_OPENED +
                    " THEN 1 ELSE 0 END)");
            // 5: problems_submitted
            query.append(" ,SUM(CASE WHEN cp.end_status_id >= " + STATUS_SUBMITTED +
                    " THEN 1 ELSE 0 END)");
            // 6: problems_correct
            query.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_PASSED_SYS_TEST + " THEN 1 ELSE 0 END)  ");
            // 7: problems_failed_by_challenge
            query.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_CHLNG_SUCCEEDED + " THEN 1 ELSE 0 END)  ");
            // 8: problems_failed_by_system_test
            query.append(" ,SUM(CASE WHEN cp.end_status_id = " +
                    STATUS_FAILED_SYS_TEST + " THEN 1 ELSE 0 END)  ");
            // 9: problems_left_open
            query.append(" ,SUM(CASE WHEN cp.end_status_id between " +
                    STATUS_OPENED + " and 121 THEN 1 ELSE 0 END)");
            // 10: submission_points
            query.append("  ,SUM(cp.submission_points) ");
            query.append(" ,SUM(cp.challenge_points)"); // 11: challenge_points
            query.append(" ,SUM(cp.system_test_points)"); // 12: system_test_points
            query.append(" ,SUM(cp.defense_points)"); // 13: defense_points
            query.append(" ,AVG(cp.final_points)"); // 14: average_points
            query.append("       ,STDEV(final_points) "); // 15: point_standard_deviation
            query.append("       ,SUM(final_points) "); // 16: final_points
            query.append("       ,AVG(time_elapsed) ");     //17
            query.append("  FROM coder_problem cp ");
            if (!FULL_LOAD) {   //if it's not a full load, just load up the problems from this round
                query.append(" WHERE cp.round_id =" + fRoundId);
            }
            query.append(" GROUP BY 1,2,3 ");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            query = new StringBuffer(100);
            query.append("INSERT INTO round_problem ");
            query.append("      (round_id ");                         // 1
            query.append("       ,problem_id ");                      // 2
            query.append("       ,division_id ");                     // 3
            query.append("       ,problems_opened ");                 // 4
            query.append("       ,problems_submitted ");              // 5
            query.append("       ,problems_correct ");                // 6
            query.append("       ,problems_failed_by_challenge ");    // 7
            query.append("       ,problems_failed_by_system_test ");  // 8
            query.append("       ,problems_left_open ");              // 9
            query.append("       ,submission_points ");               // 10
            query.append("       ,challenge_points ");                // 11
            query.append("       ,system_test_points ");              // 12
            query.append("       ,defense_points ");                  // 13
            query.append("       ,average_points ");                  // 14
            query.append("       ,point_standard_deviation ");        // 15
            query.append("       ,final_points ");                    // 16
            query.append("       ,avg_time_elapsed) ");               // 17
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            query.append("?,?,?,?,?,?,?)");        // 17 total values
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM round_problem ");
            query.append(" WHERE round_id = ? ");
            query.append("   AND problem_id = ? ");
            query.append("   AND division_id = ? ");
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" UPDATE round_problem ");
            query.append(" SET problems_presented = ");
            query.append(" (SELECT count(*)");
            query.append(" FROM problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE p.round_id = rr.round_id ");
            query.append(" AND p.round_id = round_problem.round_id");
            query.append(" AND p.problem_id = round_problem.problem_id");
            query.append(" AND p.division_id = round_problem.division_id");
            query.append(" AND p.division_id = rr.division_id)");
            query.append(" ,challenge_attempts_made = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = round_problem.division_id");
            query.append(" AND p.level_id = round_problem.level_id)");
            query.append(" ,challenges_made_successful = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = round_problem.division_id");
            query.append(" AND p.level_id = round_problem.level_id");
            query.append(" AND c.succeeded = " + STATUS_SUCCEEDED + ")");
            query.append(" ,challenges_made_failed = ");
            query.append(" (SELECT count(*) ");
            query.append(" FROM challenge c ");
            query.append(" ,problem p ");
            query.append(" ,room_result rr ");
            query.append(" WHERE c.challenger_id = rr.coder_id");
            query.append(" AND c.round_id = rr.round_id");
            query.append(" AND rr.round_id = p.round_id");
            query.append(" AND rr.division_id = p.division_id");
            query.append(" AND p.problem_id = c.problem_id");
            query.append(" AND p.division_id = round_problem.division_id");
            query.append(" AND p.level_id = round_problem.level_id");
            query.append(" AND c.succeeded = " + STATUS_FAILED + ")");
            query.append(" ,open_order = ");
            query.append(" (SELECT distinct open_order ");
            query.append(" FROM coder_problem cp ");
            query.append(" WHERE cp.problem_id = round_problem.problem_id ");
            query.append("   AND cp.round_id = round_problem.round_id ");
            query.append("   AND cp.division_id = round_problem.division_id) ");
            query.append(" ,level_id = ");
            query.append(" (SELECT distinct level_id ");
            query.append(" FROM coder_problem cp ");
            query.append(" WHERE cp.problem_id = round_problem.problem_id ");
            query.append("   AND cp.round_id = round_problem.round_id ");
            query.append("   AND cp.division_id = round_problem.division_id) ");
            query.append(" ,level_desc = ");
            query.append(" (SELECT distinct level_desc ");
            query.append(" FROM coder_problem cp ");
            query.append(" WHERE cp.problem_id = round_problem.problem_id ");
            query.append("   AND cp.round_id = round_problem.round_id ");
            query.append("   AND cp.division_id = round_problem.division_id) ");
            query.append(" WHERE problem_id = ? ");
            query.append("   AND round_id = ? ");
            query.append("   AND division_id = ?");
            psUpd = prepareStatement(query.toString(), TARGET_DB);

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
