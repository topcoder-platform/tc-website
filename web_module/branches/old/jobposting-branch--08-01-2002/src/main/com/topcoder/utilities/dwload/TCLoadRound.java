package com.topcoder.utilities.dwload;

/*****************************************************************************
 * TCLoadRound.java
 *
 * TCLoadRound loads round information from the transactional database and
 * populates tables in the data warehouse.
 *
 * The tables that are built by this load procedure are:
 *
 *  rating (additional information is populated in the rating table)
 *  problem_submission
 *  system_test_case
 *  system_test_result
 *  contest
 *  problem
 *  round
 *  room
 *  room_result
 *  coder_problem
 *
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.8  2002/07/12 17:15:47  gpaul
 *           merged baby
 *
 *           Revision 1.7.2.1  2002/07/09 23:41:27  gpaul
 *           switched to use com.topcoder.shared.util.logging.Logger
 *
 *           Revision 1.7  2002/06/13 03:56:37  gpaul
 *           fixed the payment stuff to use the round_payment table
 *
 *           Revision 1.6  2002/06/12 05:13:41  gpaul
 *           exclude people in group_id 14 also
 *
 *           Revision 1.5  2002/06/11 18:44:38  gpaul
 *           added stuff to populate the payment_type_id and payment_type_desc columns in room_result
 *
 *           Revision 1.4  2002/05/31 01:25:37  gpaul
 *           added more stuff to speed it up
 *
 *           Revision 1.3  2002/05/24 19:28:10  gpaul
 *           added some  code so that we can load just the stuff for the current round in the aggregate load
 *
 *           Revision 1.2  2002/05/16 07:26:09  gpaul
 *           don't load nullified challenges.  load last submission only
 *
 *           Revision 1.1  2002/04/02 21:54:14  gpaul
 *           moving the load over from 153 cvs
 *
 *           Revision 1.1.2.11  2002/03/29 20:41:34  gpaul
 *           only load the coder_problem record if the coder attended
 *
 *           Revision 1.1.2.10  2002/03/28 21:21:32  gpaul
 *           un comment out the load
 *
 *           Revision 1.1.2.9  2002/03/28 21:20:12  gpaul
 *           load compiled code to problem_submission too
 *
 *           Revision 1.1.2.8  2002/03/25 18:16:29  gpaul
 *           load system tests before system test results.
 *           load system tests for each problem in given round rather than by date
 *
 *           Revision 1.1.2.7  2002/03/22 18:17:35  gpaul
 *           dont' clear round and contest tables in clean rounds method.  be sure room_type is a contest room for coder_problem load
 *
 *           Revision 1.1.2.6  2002/03/21 20:08:17  gpaul
 *           delete for round before you load...just to make sure it's clean
 *
 *           Revision 1.1.2.5  2002/03/20 23:08:54  gpaul
 *           changed so that if they didn't submit, the coder_problem table should get the distance between open time and end of coding phase
 *
 *           Revision 1.1.2.4  2002/03/20 20:42:42  gpaul
 *           load rating after room_result cuz rating gets num_competitions from room_result
 *
 *           Revision 1.1.2.3  2002/03/19 23:04:19  gpaul
 *           pulled round_problem load out and put it in aggregate load
 *
 *           Revision 1.1.2.2  2002/03/19 18:30:42  gpaul
 *           log.info instead of system.out.println
 *
 *           Revision 1.1.2.1  2002/03/16 20:17:02  gpaul
 *           moving these over from the member dev area.  i've added  a couple fixes to exclude admins from queries.
 *
 *           Revision 1.19  2002/03/15 01:37:29  stalker
 *           Latest version
 *
 *           Revision 1.18  2002/03/12 21:21:26  stalker
 *           Latest version of the round load
 *
 *           Revision 1.17  2002/03/06 03:16:15  stalker
 *           Fixed minor problem with new columns being added and the fact that the coder_problem table was not loading level_id and level_desc properly since the problem_id is no longer unique.
 *
 *           Revision 1.16  2002/03/05 19:16:26  stalker
 *           Fixed a few problems with the round table load due to columns being added last minute
 *
 *           Revision 1.15  2002/03/02 15:25:50  stalker
 *           Fixed error message when more than or fewer than 1 row is modified by an update. Also, changed the round comparison to be based on date instead of id as roundIds are not sequential.
 *
 *           Revision 1.14  2002/02/20 15:11:18  stalker
 *           Added new loads for division_seed, division_placed and overall_rank
 *
 *           Revision 1.13  2002/02/14 14:44:27  stalker
 *           Moved the computation of num_competitions for the rating table to this load.
 *           Since we need to select from the room_result table, we don't want this in the
 *           coders load.
 *
 *           Revision 1.12  2002/02/13 22:20:53  stalker
 *           The latest version of TCLoadRound
 *
 *****************************************************************************/

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.*;

public class TCLoadRound extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadRound.class);
    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;

    // The following set of variables are all configureable from the command
    // line by specifying -variable (where the variable is after the //)
    // followed by the new value
    private int fRoundId = -1;                 // roundid
    private int STATUS_FAILED = 0;    // failed
    private int STATUS_SUCCEEDED = 1;    // succeeded
    private int CODING_SEGMENT_ID = 2;    // codingseg
    private int STATUS_OPENED = 120;  // opened
    private int STATUS_PASSED_SYS_TEST = 150;  // passsystest
    private int STATUS_FAILED_SYS_TEST = 160;  // failsystest
    private int CONTEST_ROOM = 2;    // contestroom
    private int ROUND_LOG_TYPE = 1;    // roundlogtype
    private int CHALLENGE_NULLIFIED = 92;   // challengenullified
    private boolean FULL_LOAD = false;//fullload

    /**
     * This Hashtable stores the start date of a particular round so
     * that we don't have to look it up each time.
     */
    private Hashtable fRoundStartHT = new Hashtable();

    /**
     * Constructor. Set our usage message here.
     */
    public TCLoadRound() {
        DEBUG = false;

        USAGE_MESSAGE = new String(
                "TCLoadRound parameters - defaults in ():\n" +
                "  -roundid number       : Round ID to load\n" +
                "  [-failed number]      : Failed status for succeeded column    (0)\n" +
                "  [-succeeded number]   : Succeeded status for succeeded column (1)\n" +
                "  [-codingseg number]   : ID for beginning of coding segment    (2)\n" +
                "  [-opened number]      : Problem_status of opened              (120)\n" +
                "  [-passsystest number] : Problem_status of passed system test  (150)\n" +
                "  [-failsystest number] : Problem_status of failed system test  (160)\n" +
                "  [-contestroom number] : Type id for contest rooms             (2)\n" +
                "  [-roundlogtype number] : Log type id for this load            (1)\n" +
                "  [-challengenullified number] : id for nullified challenges    (2)\n" +
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

            tmp = retrieveIntParam("codingseg", params, true, true);
            if (tmp != null) {
                CODING_SEGMENT_ID = tmp.intValue();
                log.info("New coding segment id is " + CODING_SEGMENT_ID);
            }

            tmp = retrieveIntParam("opened", params, true, true);
            if (tmp != null) {
                STATUS_OPENED = tmp.intValue();
                log.info("New opened is " + STATUS_OPENED);
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

            tmp = retrieveIntParam("contestroom", params, true, true);
            if (tmp != null) {
                CONTEST_ROOM = tmp.intValue();
                log.info("New contestroom id is " + CONTEST_ROOM);
            }

            tmp = retrieveIntParam("roundlogtype", params, true, true);
            if (tmp != null) {
                ROUND_LOG_TYPE = tmp.intValue();
                log.info("New roundlogtype is " + ROUND_LOG_TYPE);
            }

            tmp = retrieveIntParam("challengenullified", params, true, true);
            if (tmp != null) {
                CHALLENGE_NULLIFIED = tmp.intValue();
                log.info("New challengenullified id is " + CHALLENGE_NULLIFIED);
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
            log.info("Loading round: " + fRoundId);

            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());

            getLastUpdateTime();

            clearRound();

            loadContest();

            loadRound();

            loadProblem();

            loadProblemSubmission();

            loadSystemTestCase();

            loadSystemTestResult();

            loadRoom();

            loadRoomResult();

            loadRating();

            loadCoderProblem();

            loadChallenge();

            setLastUpdateTime();

            log.info("SUCCESS: Round " + fRoundId +
                    " load ran successfully.");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }

    private void clearRound() throws Exception {
        PreparedStatement ps = null;
        ArrayList a = null;

        try {
            a = new ArrayList();


            if (FULL_LOAD) {
                a.add(new String("DELETE FROM coder_level"));
                a.add(new String("DELETE FROM coder_division"));
                a.add(new String("DELETE FROM room_result WHERE round_id = ?"));
                a.add(new String("DELETE FROM round_division"));
                a.add(new String("DELETE FROM coder_problem_summary"));
                a.add(new String("DELETE FROM system_test_case WHERE problem_id in (SELECT problem_id FROM round_problem WHERE round_id = ?)"));
                a.add(new String("DELETE FROM round_problem"));
                a.add(new String("DELETE FROM challenge WHERE round_id = ?"));
                a.add(new String("DELETE FROM coder_problem WHERE round_id = ?"));
                a.add(new String("DELETE FROM room WHERE round_id = ?"));
                a.add(new String("DELETE FROM system_test_result WHERE round_id = ?"));
                a.add(new String("DELETE FROM problem_submission WHERE round_id = ?"));
                a.add(new String("DELETE FROM problem WHERE round_id = ?"));
                a.add(new String("UPDATE rating SET first_rated_round_id = null WHERE first_rated_round_id = ?"));
                a.add(new String("UPDATE rating SET last_rated_round_id = null WHERE last_rated_round_id = ?"));

            } else {
                a.add(new String("DELETE FROM coder_level WHERE coder_id IN (SELECT coder_id FROM room_result WHERE attended = 'Y' AND round_id = ?)"));
                a.add(new String("DELETE FROM coder_division WHERE coder_id IN (SELECT coder_id FROM room_result WHERE attended = 'Y' AND round_id = ?)"));
                a.add(new String("DELETE FROM room_result WHERE round_id = ?"));
                a.add(new String("DELETE FROM round_division WHERE round_id = ?"));
                a.add(new String("DELETE FROM coder_problem_summary WHERE coder_id IN (SELECT coder_id FROM room_result WHERE attended = 'Y' AND round_id = ?)"));
                a.add(new String("DELETE FROM system_test_case WHERE problem_id in (SELECT problem_id FROM round_problem WHERE round_id = ?)"));
                a.add(new String("DELETE FROM round_problem WHERE round_id = ?"));
                a.add(new String("DELETE FROM challenge WHERE round_id = ?"));
                a.add(new String("DELETE FROM coder_problem WHERE round_id = ?"));
                a.add(new String("DELETE FROM system_test_result WHERE round_id = ?"));
                a.add(new String("DELETE FROM problem_submission WHERE round_id = ?"));
                a.add(new String("DELETE FROM problem WHERE round_id = ?"));
                a.add(new String("UPDATE rating SET first_rated_round_id = null WHERE first_rated_round_id = ?"));
                a.add(new String("UPDATE rating SET last_rated_round_id = null WHERE last_rated_round_id = ?"));

            }

            int count = 0;
            for (int i = 0; i < a.size(); i++) {
                ps = prepareStatement((String) a.get(i), TARGET_DB);
                if (((String) a.get(i)).indexOf('?') > -1)
                    ps.setInt(1, fRoundId);
                count = ps.executeUpdate();
                log.info("" + count + " rows: " + (String) a.get(i));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("clearing data failed.\n" +
                    sqle.getMessage());
        } finally {
            close(ps);
        }
    }


    private void getLastUpdateTime() throws Exception {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("select timestamp from update_log where log_id = ");
            fSql.append("(select max(log_id) from update_log where log_type_id = " + ROUND_LOG_TYPE + ")");
            stmt = createStatement(TARGET_DB);
            rs = stmt.executeQuery(fSql.toString());
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp(1);
            } else {
                throw new SQLException("Last log time not found in update_log table");
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

    /**
     * Here we want to load any new rating information into the rating table.
     */
    private void loadRating() throws Exception {
        int count = 0;
        int retVal = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSelNumCompetitions = null;
        PreparedStatement psSelRatedRounds = null;
        PreparedStatement psSelMinMaxRatings = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            // Get all the coders that participated in this round
            fSql.setLength(0);
            fSql.append("SELECT rr.coder_id ");    // 1
            fSql.append("  FROM room_result rr ");
            fSql.append(" WHERE rr.round_id = ? ");
            fSql.append("   AND rr.attended = 'Y' ");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("SELECT min(rr.new_rating) ");  // 1
            fSql.append("       ,max(rr.new_rating) "); // 2
            fSql.append("  FROM room_result rr ");
            fSql.append(" WHERE rr.coder_id = ? ");
            fSql.append("   AND rr.attended = 'Y' ");
            fSql.append("   AND rr.new_rating > 0 ");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSelMinMaxRatings = prepareStatement(fSql.toString(), SOURCE_DB);

            // No need to filter admins here as they have already been filtered from
            // the DW rating table
            fSql.setLength(0);
            fSql.append("SELECT first_rated_round_id "); // 1
            fSql.append("       ,last_rated_round_id "); // 2
            fSql.append("  FROM rating ");
            fSql.append(" WHERE coder_id = ?");
            psSelRatedRounds = prepareStatement(fSql.toString(), TARGET_DB);

            // No need to filter admins here as they have already been filtered from
            // the DW rating table
            fSql.setLength(0);
            fSql.append("SELECT count(*) ");     // 1
            fSql.append("  FROM room_result rr ");
            fSql.append(" WHERE rr.attended = 'Y' ");
            fSql.append("   AND rr.coder_id = ? ");
            psSelNumCompetitions = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("UPDATE rating ");
            fSql.append("   SET first_rated_round_id = ? ");  // 1
            fSql.append("       ,last_rated_round_id = ? ");  // 2
            fSql.append("       ,lowest_rating = ? ");        // 3
            fSql.append("       ,highest_rating = ? ");       // 4
            fSql.append("       ,num_competitions = ? ");     // 5
            fSql.append(" WHERE coder_id = ?");               // 6
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int coder_id = rs.getInt(1);

                int num_competitions = -1;
                int first_rated_round_id = -1;
                int last_rated_round_id = -1;
                int lowest_rating = -1;
                int highest_rating = -1;

                // Get the existing first and last rated round ids in case they are
                // already there.
                psSelRatedRounds.clearParameters();
                psSelRatedRounds.setInt(1, coder_id);
                rs2 = psSelRatedRounds.executeQuery();
                if (rs2.next()) {
                    if (rs2.getString(1) != null)
                        first_rated_round_id = rs2.getInt(1);
                    if (rs2.getString(2) != null)
                        last_rated_round_id = rs2.getInt(2);
                }

                close(rs2);

                // Get the number of competitions
                psSelNumCompetitions.clearParameters();
                psSelNumCompetitions.setInt(1, coder_id);
                rs2 = psSelNumCompetitions.executeQuery();
                if (rs2.next()) {
                    num_competitions = rs2.getInt(1);
                }

                close(rs2);

                // Get the new min/max ratings to see if we
                psSelMinMaxRatings.clearParameters();
                psSelMinMaxRatings.setInt(1, coder_id);
                rs2 = psSelMinMaxRatings.executeQuery();
                if (rs2.next()) {
                    lowest_rating = rs2.getInt(1);
                    highest_rating = rs2.getInt(2);
                }

                close(rs2);

                // Check to see if any of the round ids need to be updated to be this
                // round id. If the round we are loading is prior to the first rated
                // round (or it isn't set) we set this round as the first rated round.
                // If the round we are loading is greater than the last rated round
                // (or it isn't set), we set this round as the last rated round
                if (first_rated_round_id == -1 ||
                        getRoundStart(fRoundId).compareTo(getRoundStart(first_rated_round_id)) < 0)
                    first_rated_round_id = fRoundId;

                if (last_rated_round_id == -1 ||
                        getRoundStart(fRoundId).compareTo(getRoundStart(last_rated_round_id)) > 0)
                    last_rated_round_id = fRoundId;

                // Finally, do update
                psUpd.clearParameters();
                psUpd.setInt(1, first_rated_round_id);  // first_rated_round_id
                psUpd.setInt(2, last_rated_round_id);   // last_rated_round_id
                psUpd.setInt(3, lowest_rating);         // lowest_rating
                psUpd.setInt(4, highest_rating);        // highest_rating
                psUpd.setInt(5, num_competitions);      // num_competitions
                psUpd.setInt(6, coder_id);              // coder_id

                retVal = psUpd.executeUpdate();
                count = count + retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadCoders: Insert for coder_id " +
                            coder_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "rating");
            }

            log.info("Rating records updated = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'rating' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSelNumCompetitions);
            close(psSelRatedRounds);
            close(psSelMinMaxRatings);
            close(psUpd);
        }
    }

    /**
     * This method loads the 'problem_submission' table which holds
     * information for a given round and given coder, the results of a
     * particular problem
     */
    private void loadProblemSubmission() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append(" SELECT ps.round_id");              //1
            fSql.append(" ,ps.coder_id ");            //2
            fSql.append(" ,ps.problem_id ");          //3
            fSql.append(" ,ps.points ");              //4
            fSql.append(" ,ps.status_id ");           //5
            fSql.append(" ,ps.language_id ");         //6
            fSql.append(" ,s.open_time ");            //7
            fSql.append(" ,ps.submission_number ");   //8
            fSql.append(" ,s.submission_text ");      //9
            fSql.append(" ,s.submit_time ");          //10
            fSql.append(" ,s.submission_points ");    //11
            fSql.append("  ,(SELECT status_desc ");   //12
            fSql.append(" FROM problem_status ");
            fSql.append(" WHERE problem_status_id = ps.status_id) ");
            fSql.append(" ,c.compilation_text");      //13
            fSql.append(" ,s.submission_number");     //14
            fSql.append(" FROM problem_state ps ");
            fSql.append(" LEFT OUTER JOIN submission s ");
            fSql.append(" ON ps.problem_state_id = s.problem_state_id");
            fSql.append(" LEFT OUTER JOIN compilation c ");
            fSql.append(" ON ps.problem_state_id = c.problem_state_id");
            fSql.append(" WHERE ps.round_id = ?");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = ps.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = ps.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO problem_submission ");
            fSql.append("      (round_id ");            // 1
            fSql.append("       ,coder_id ");           // 2
            fSql.append("       ,problem_id ");         // 3
            fSql.append("       ,final_points ");       // 4
            fSql.append("       ,status_id ");          // 5
            fSql.append("       ,language_id ");        // 6
            fSql.append("       ,open_time ");          // 7
            fSql.append("       ,submission_number ");  // 8
            fSql.append("       ,submission_text ");    // 9
            fSql.append("       ,submit_time ");        // 10
            fSql.append("       ,submission_points ");  // 11
            fSql.append("       ,status_desc ");        // 12
            fSql.append("       ,last_submission) ");   // 13
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10
            fSql.append("?,?,?)");                // 12 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM problem_submission ");
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND coder_id = ? ");
            fSql.append("   AND problem_id = ?");
            fSql.append("   AND submission_number = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int coder_id = rs.getInt(2);
                int problem_id = rs.getInt(3);
                int submission_number = rs.getInt(14);
                int last_submission = 0;
                if (rs.getInt(8) > 0) {  //they submitted at least once
                    last_submission = rs.getInt(8) == submission_number?1:0;
                }

                psDel.clearParameters();
                psDel.setInt(1, round_id);
                psDel.setInt(2, coder_id);
                psDel.setInt(3, problem_id);
                psDel.setInt(4, submission_number);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // round_id
                psIns.setInt(2, rs.getInt(2));  // coder_id
                psIns.setInt(3, rs.getInt(3));  // problem_id
                psIns.setFloat(4, rs.getFloat(4));  // final_points
                psIns.setInt(5, rs.getInt(5));  // status_id
                psIns.setInt(6, rs.getInt(6));  // language_id
                psIns.setLong(7, rs.getLong(7));  // open_time
                psIns.setInt(8, rs.getInt(14));  // submission_number
                if (Arrays.equals(getBytes(rs, 9), "".getBytes()))
                    setBytes(psIns, 9, getBytes(rs, 13));       // use compilation_text
                else
                    setBytes(psIns, 9, getBytes(rs, 9));       // use submission_text
                psIns.setLong(10, rs.getLong(10));  // submit_time
                psIns.setFloat(11, rs.getFloat(11));  // submission_points
                psIns.setString(12, rs.getString(12));  // status_desc
                psIns.setInt(13, last_submission);  // last_submission

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for coder_id " +
                            coder_id + ", round_id " + round_id +
                            ", problem_id " + problem_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "problem_submission");
            }

            log.info("Problem_submission records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'problem_submission' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This load the 'system_test_case' table
     */
    private void loadSystemTestCase() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT stc.test_case_id ");      // 1
            fSql.append("       ,stc.problem_id ");       // 2
            fSql.append("       ,stc.args ");             // 3
            fSql.append("       ,stc.expected_result ");  // 4
            fSql.append("       ,CURRENT ");              // 5
            fSql.append("  FROM system_test_case stc ");
            fSql.append(" WHERE problem_id in (SELECT problem_id FROM round_problem WHERE round_id = ?)");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO system_test_case ");
            fSql.append("      (test_case_id ");      // 1
            fSql.append("       ,problem_id ");       // 2
            fSql.append("       ,args ");             // 3
            fSql.append("       ,expected_result ");  // 4
            fSql.append("       ,modify_date) ");     // 5
            fSql.append("VALUES ( ");
            fSql.append("?,?,?,?,?)");  // 5 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM system_test_case ");
            fSql.append(" WHERE test_case_id = ? ");
            fSql.append("   AND problem_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int test_case_id = rs.getInt(1);
                int problem_id = rs.getInt(2);

                psDel.clearParameters();
                psDel.setInt(1, test_case_id);
                psDel.setInt(2, problem_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // test_case_id
                psIns.setInt(2, rs.getInt(2));  // problem_id
                setBytes(psIns, 3, getBlobObject(rs, 3));  // args
                setBytes(psIns, 4, getBlobObject(rs, 4));  // expected_result
                psIns.setTimestamp(5, rs.getTimestamp(5));  // modify_date

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for test_case_id " +
                            test_case_id + ", problem_id " + problem_id +
                            " modified more than one row.");
                }

                printLoadProgress(count, "system_test_case");
            }

            log.info("System_test_case records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'system_test_case' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This load the 'system_test_result' table which holds the results
     * of the system tests for a give round, coder and problem.
     */
    private void loadSystemTestResult() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT str.coder_id ");           // 1
            fSql.append("       ,str.round_id ");          // 2
            fSql.append("       ,str.problem_id ");        // 3
            fSql.append("       ,str.test_case_id ");      // 4
            fSql.append("       ,str.num_iterations ");    // 5
            fSql.append("       ,str.processing_time ");   // 6
            fSql.append("       ,str.deduction_amount ");  // 7
            fSql.append("       ,str.timestamp ");         // 8
            fSql.append("       ,str.viewable ");          // 9
            fSql.append("       ,str.received ");          // 10
            fSql.append("       ,str.succeeded ");         // 11
            fSql.append("       ,str.message ");           // 12
            fSql.append("  FROM system_test_result str ");
            fSql.append(" WHERE round_id = ?");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = str.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = str.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO system_test_result ");
            fSql.append("      (coder_id ");           // 1
            fSql.append("       ,round_id ");          // 2
            fSql.append("       ,problem_id ");        // 3
            fSql.append("       ,test_case_id ");      // 4
            fSql.append("       ,num_iterations ");    // 5
            fSql.append("       ,processing_time ");   // 6
            fSql.append("       ,deduction_amount ");  // 7
            fSql.append("       ,timestamp ");         // 8
            fSql.append("       ,viewable ");          // 9
            fSql.append("       ,received ");          // 10
            fSql.append("       ,succeeded ");         // 11
            fSql.append("       ,message) ");          // 12
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?)");                   // 12 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM system_test_result ");
            fSql.append(" WHERE coder_id = ? ");
            fSql.append("   AND round_id = ? ");
            fSql.append("   AND problem_id = ? ");
            fSql.append("   AND test_case_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int coder_id = rs.getInt(1);
                int round_id = rs.getInt(2);
                int problem_id = rs.getInt(3);
                int test_case_id = rs.getInt(4);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.setInt(2, round_id);
                psDel.setInt(3, problem_id);
                psDel.setInt(4, test_case_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // coder_id
                psIns.setInt(2, rs.getInt(2));  // round_id
                psIns.setInt(3, rs.getInt(3));  // problem_id
                psIns.setInt(4, rs.getInt(4));  // test_case_id
                psIns.setInt(5, rs.getInt(5));  // num_iterations
                psIns.setLong(6, rs.getLong(6));  // processing_time
                psIns.setFloat(7, rs.getFloat(7));  // deduction_amount
                psIns.setTimestamp(8, rs.getTimestamp(8));  // timestamp
                psIns.setString(9, rs.getString(9));  // viewable
                setBytes(psIns, 10, getBlobObject(rs, 10));  // received
                psIns.setInt(11, rs.getInt(11));  // succeeded
                psIns.setString(12, rs.getString(12));  // message

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for coder_id " +
                            coder_id + ", round_id " + round_id +
                            ", problem_id " + problem_id +
                            ", test_case_id " + test_case_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "system_test_result");
            }

            log.info("System_test_result records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'system_test_result' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This loads the 'contest' table
     */
    private void loadContest() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT c.contest_id ");    // 1
            fSql.append("       ,c.name ");         // 2
            fSql.append("       ,c.start_date ");   // 3
            fSql.append("       ,c.end_date ");     // 4
            fSql.append("       ,c.status ");       // 5
            fSql.append("       ,c.group_id ");     // 6
            fSql.append("       ,c.region_code ");  // 7
            fSql.append("       ,c.ad_text ");      // 8
            fSql.append("       ,c.ad_start ");     // 9
            fSql.append("       ,c.ad_end ");       // 10
            fSql.append("       ,c.ad_task ");      // 11
            fSql.append("       ,c.ad_command ");   // 12
            fSql.append("  FROM contest c ");
            fSql.append("       ,round r ");
            fSql.append(" WHERE r.round_id = ? ");
            fSql.append("   AND r.contest_id = c.contest_id");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO contest ");
            fSql.append("      (contest_id ");    // 1
            fSql.append("       ,name ");         // 2
            fSql.append("       ,start_date ");   // 3
            fSql.append("       ,end_date ");     // 4
            fSql.append("       ,status ");       // 5
            fSql.append("       ,group_id ");     // 6
            fSql.append("       ,region_code ");  // 7
            fSql.append("       ,ad_text ");      // 8
            fSql.append("       ,ad_start ");     // 9
            fSql.append("       ,ad_end ");       // 10
            fSql.append("       ,ad_task ");      // 11
            fSql.append("       ,ad_command) ");  // 12
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?)");                  // 12 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("UPDATE contest ");
            fSql.append("   SET name = ? ");          // 1
            fSql.append("       ,start_date = ? ");   // 2
            fSql.append("       ,end_date = ? ");     // 3
            fSql.append("       ,status = ? ");       // 4
            fSql.append("       ,group_id = ? ");     // 5
            fSql.append("       ,region_code = ? ");  // 6
            fSql.append("       ,ad_text = ? ");      // 7
            fSql.append("       ,ad_start = ? ");     // 8
            fSql.append("       ,ad_end = ? ");       // 9
            fSql.append("       ,ad_task = ? ");      // 10
            fSql.append("       ,ad_command = ? ");  // 11
            fSql.append(" WHERE contest_id = ? ");    // 12
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("SELECT * ");
            fSql.append("  FROM contest ");
            fSql.append(" WHERE contest_id = ?");
            psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int contest_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, contest_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setString(1, rs.getString(2));  // name
                    psUpd.setTimestamp(2, rs.getTimestamp(3));  // start_date
                    psUpd.setTimestamp(3, rs.getTimestamp(4));  // end_date
                    psUpd.setString(4, rs.getString(5));  // status
                    psUpd.setInt(5, rs.getInt(6));  // group_id
                    psUpd.setString(6, rs.getString(7));  // region_code
                    psUpd.setString(7, rs.getString(8));  // ad_text
                    psUpd.setTimestamp(8, rs.getTimestamp(9));  // ad_start
                    psUpd.setTimestamp(9, rs.getTimestamp(10));  // ad_end
                    psUpd.setString(10, rs.getString(11));  // ad_task
                    psUpd.setString(11, rs.getString(12));  // ad_command
                    psUpd.setInt(12, rs.getInt(1));  // contest_id

                    retVal = psUpd.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Insert for contest_id " +
                                contest_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, rs.getInt(1));  // contest_id
                    psIns.setString(2, rs.getString(2));  // name
                    psIns.setTimestamp(3, rs.getTimestamp(3));  // start_date
                    psIns.setTimestamp(4, rs.getTimestamp(4));  // end_date
                    psIns.setString(5, rs.getString(5));  // status
                    psIns.setInt(6, rs.getInt(6));  // group_id
                    psIns.setString(7, rs.getString(7));  // region_code
                    psIns.setString(8, rs.getString(8));  // ad_text
                    psIns.setTimestamp(9, rs.getTimestamp(9));  // ad_start
                    psIns.setTimestamp(10, rs.getTimestamp(10));  // ad_end
                    psIns.setString(11, rs.getString(11));  // ad_task
                    psIns.setString(12, rs.getString(12));  // ad_command

                    retVal = psIns.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Insert for contest_id " +
                                contest_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "contest");
            }

            log.info("Contest records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contest' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psUpd);
        }
    }

    /**
     * This loads the 'problem' table
     */
    private void loadProblem() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT p.problem_id ");                             // 1
            fSql.append("       ,rp.round_id ");                             // 2
            fSql.append("       ,p.result_type_id ");                        // 3
            fSql.append("       ,p.method_name ");                           // 4
            fSql.append("       ,p.class_name ");                            // 5
            fSql.append("       ,p.status ");                                // 6
            fSql.append("       ,p.default_solution ");                      // 7
            fSql.append("       ,p.language_id ");                           // 8
            fSql.append("       ,p.param_types ");                           // 9
            fSql.append("       ,p.problem_text ");                          // 10
            fSql.append("       ,p.group_id ");                              // 11
            fSql.append("       ,CURRENT ");                                 // 12
            fSql.append("       ,(SELECT data_type_desc ");                  // 13
            fSql.append("           FROM data_type ");
            fSql.append("          WHERE data_type_id = result_type_id) ");
            fSql.append("       ,d.difficulty_id ");                         // 14
            fSql.append("       ,d.difficulty_desc ");                       // 15
            fSql.append("       ,rp.division_id ");                          // 16
            fSql.append("  FROM problem p ");
            fSql.append("       ,round_problem rp ");
            fSql.append("       ,difficulty d ");
            fSql.append(" WHERE rp.round_id = ? ");
            fSql.append("   AND p.problem_id = rp.problem_id ");
            fSql.append("   AND rp.difficulty_id = d.difficulty_id");
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO problem ");
            fSql.append("      (problem_id ");         // 1
            fSql.append("       ,round_id ");          // 2
            fSql.append("       ,result_type_id ");    // 3
            fSql.append("       ,method_name ");       // 4
            fSql.append("       ,class_name ");        // 5
            fSql.append("       ,status ");            // 6
            fSql.append("       ,default_solution ");  // 7
            fSql.append("       ,language_id ");       // 8
            fSql.append("       ,param_types ");       // 9
            fSql.append("       ,problem_text ");      // 10
            fSql.append("       ,group_id ");          // 11
            fSql.append("       ,modify_date ");       // 12
            fSql.append("       ,result_type_desc ");  // 13
            fSql.append("       ,level_id ");          // 14
            fSql.append("       ,level_desc ");        // 15
            fSql.append("       ,division_id) ");      // 16
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?)");          // 15 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("UPDATE problem ");
            fSql.append("   SET result_type_id = ? ");     // 1
            fSql.append("       ,method_name = ? ");       // 2
            fSql.append("       ,class_name = ? ");        // 3
            fSql.append("       ,status = ? ");            // 4
            fSql.append("       ,default_solution = ? ");  // 5
            fSql.append("       ,language_id = ? ");       // 6
            fSql.append("       ,param_types = ? ");       // 7
            fSql.append("       ,problem_text = ? ");      // 8
            fSql.append("       ,group_id = ? ");          // 9
            fSql.append("       ,modify_date = ? ");       // 10
            fSql.append("       ,result_type_desc = ? ");  // 11
            fSql.append("       ,level_id = ? ");          // 12
            fSql.append("       ,level_desc = ? ");        // 13
            fSql.append(" WHERE problem_id = ? ");         // 14
            fSql.append("   AND round_id = ? ");           // 15
            fSql.append("   AND division_id = ? ");        // 16
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("SELECT * FROM problem ");
            fSql.append(" WHERE problem_id = ? ");
            fSql.append("   AND round_id = ?");
            fSql.append("   AND division_id = ?");
            psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int problem_id = rs.getInt(1);
                int round_id = rs.getInt(2);
                int division_id = rs.getInt(16);

                psSel2.clearParameters();
                psSel2.setInt(1, problem_id);
                psSel2.setInt(2, round_id);
                psSel2.setInt(3, division_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setInt(1, rs.getInt(3));  // result_type_id
                    psUpd.setString(2, rs.getString(4));  // method_name
                    psUpd.setString(3, rs.getString(5));  // class_name
                    psUpd.setInt(4, rs.getInt(6));  // status
                    setBytes(psUpd, 5, getBytes(rs, 7));  // default_solution
                    psUpd.setInt(6, rs.getInt(8));  // language_id
                    setBytes(psUpd, 7, getBlobObject(rs, 9));  // param_types
                    setBytes(psUpd, 8, getBytes(rs, 10));  // problem_text
                    psUpd.setInt(9, rs.getInt(11));  // group_id
                    psUpd.setTimestamp(10, rs.getTimestamp(12));  // modify_date
                    psUpd.setString(11, rs.getString(13));  // result_type_desc
                    psUpd.setInt(12, rs.getInt(14));  // level_id
                    psUpd.setString(13, rs.getString(15));  // level_desc
                    psUpd.setInt(14, rs.getInt(1));  // problem_id
                    psUpd.setInt(15, rs.getInt(2));  // round_id
                    psUpd.setInt(16, rs.getInt(16));  // division_id

                    retVal = psUpd.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Update for problem_id " +
                                problem_id + ", round_id " + round_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, rs.getInt(1));  // problem_id
                    psIns.setInt(2, rs.getInt(2));  // round_id
                    psIns.setInt(3, rs.getInt(3));  // result_type_id
                    psIns.setString(4, rs.getString(4));  // method_name
                    psIns.setString(5, rs.getString(5));  // class_name
                    psIns.setInt(6, rs.getInt(6));  // status
                    setBytes(psIns, 7, getBytes(rs, 7));  // default_solution
                    psIns.setInt(8, rs.getInt(8));  // language_id
                    setBytes(psIns, 9, getBlobObject(rs, 9));  // param_types
                    setBytes(psIns, 10, getBytes(rs, 10));  // problem_text
                    psIns.setInt(11, rs.getInt(11));  // group_id
                    psIns.setTimestamp(12, rs.getTimestamp(12));  // modify_date
                    psIns.setString(13, rs.getString(13));  // result_type_desc
                    psIns.setInt(14, rs.getInt(14));  // level_id
                    psIns.setString(15, rs.getString(15));  // level_desc
                    psIns.setInt(16, rs.getInt(16));  // division_id

                    retVal = psIns.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Insert for problem_id " +
                                problem_id + ", round_id " + round_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "problem");
            }

            log.info("Problem records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'problem' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psUpd);
        }
    }

    /**
     * This loads the 'round' table
     */
    private void loadRound() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT r.round_id ");                          // 1
            fSql.append("       ,r.contest_id ");                       // 2
            fSql.append("       ,r.name ");                             // 3
            fSql.append("       ,r.status ");                           // 4
            fSql.append("       ,(SELECT sum(paid) ");                  // 5
            fSql.append("           FROM room_result rr ");
            fSql.append("          WHERE rr.round_id = r.round_id) ");
            fSql.append("       ,rs.start_time ");                      // 6
            fSql.append("       ,r.round_type_id ");                    // 7
            fSql.append("       ,r.invitational ");                     // 8
            fSql.append("       ,r.notes ");                            // 9
            fSql.append("       ,(SELECT rtlu.round_type_desc ");       // 10
            fSql.append("           FROM round_type_lu rtlu ");
            fSql.append("          WHERE rtlu.round_type_id = r.round_type_id) ");
            fSql.append("  FROM round r ");
            fSql.append("       ,round_segment rs ");
            fSql.append(" WHERE r.round_id = ? ");
            fSql.append("   AND rs.round_id = r.round_id ");
            fSql.append("   AND rs.segment_id = " + CODING_SEGMENT_ID);
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            // We have 8 values in the insert as opposed to 7 in the select
            // because we want to provide a default value for failed. We
            // don't have a place to select failed from in the transactional
            // DB
            fSql.setLength(0);
            fSql.append("INSERT INTO round ");
            fSql.append("      (round_id ");          // 1
            fSql.append("       ,contest_id ");       // 2
            fSql.append("       ,name ");             // 3
            fSql.append("       ,status ");           // 4
            fSql.append("       ,money_paid ");       // 5
            fSql.append("       ,calendar_id ");      // 6
            fSql.append("       ,failed ");           // 7
            fSql.append("       ,round_type_id ");    // 8
            fSql.append("       ,invitational  ");    // 9
            fSql.append("       ,notes         ");    // 10
            fSql.append("       ,round_type_desc) "); // 11
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");
            fSql.append("?)");

            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("UPDATE round ");
            fSql.append("   SET contest_id = ? ");       // 1
            fSql.append("       ,name = ? ");            // 2
            fSql.append("       ,status = ? ");          // 3
            fSql.append("       ,money_paid = ? ");      // 4
            fSql.append("       ,calendar_id = ? ");     // 5
            fSql.append("       ,failed = ? ");          // 6
            fSql.append("       ,round_type_id = ? ");   // 7
            fSql.append("       ,invitational  = ? ");   // 8
            fSql.append("       ,notes = ?         ");   // 9
            fSql.append("       ,round_type_desc = ? "); // 10
            fSql.append(" WHERE round_id = ? ");         // 11
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("SELECT * FROM round where round_id = ?");
            psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();
            while (rs.next()) {
                int round_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, round_id);
                rs2 = psSel2.executeQuery();

                // Retrieve the calendar_id for the start_time of this round
                java.sql.Timestamp stamp = rs.getTimestamp(6);
                int calendar_id = lookupCalendarId(stamp, TARGET_DB);

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setInt(1, rs.getInt(2));  // contest_id
                    psUpd.setString(2, rs.getString(3));  // name
                    psUpd.setString(3, rs.getString(4));  // status
                    psUpd.setFloat(4, rs.getFloat(5));  // money_paid
                    psUpd.setInt(5, calendar_id);         // cal_id of start_time
                    psUpd.setInt(6, 0);                   // failed (default is 0)
                    psUpd.setInt(7, rs.getInt(7));        // round_type_id
                    psUpd.setInt(8, rs.getInt(8));        // invitational
                    psUpd.setString(9, rs.getString(9));     // notes
                    psUpd.setString(10, rs.getString(10));    // round_type_desc
                    psUpd.setInt(11, rs.getInt(1));  // round_id

                    retVal = psUpd.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Update for round_id " +
                                round_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, rs.getInt(1));  // round_id
                    psIns.setInt(2, rs.getInt(2));  // contest_id
                    psIns.setString(3, rs.getString(3));  // name
                    psIns.setString(4, rs.getString(4));  // status
                    psIns.setFloat(5, rs.getFloat(5));  // money_paid
                    psIns.setInt(6, calendar_id);  // cal_id of start_time
                    psIns.setInt(7, 0);                   // failed (default is 0)
                    psIns.setInt(8, rs.getInt(7));        // round_type_id
                    psIns.setInt(9, rs.getInt(8));        // invitational
                    psIns.setString(10, rs.getString(9));     // notes
                    psIns.setString(11, rs.getString(10));    // round_type_desc

                    retVal = psIns.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Insert for round_id " +
                                round_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "round");
            }

            log.info("Round records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'round' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psUpd);
        }
    }

    /**
     * This loads the 'room' table
     */
    private void loadRoom() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT r.room_id");                                    // 1
            fSql.append("       ,r.round_id ");                                 // 2
            fSql.append("       ,r.name ");                                     // 3
            fSql.append("       ,r.state_code ");                               // 4
            fSql.append("       ,(SELECT s.state_name ");                       // 5
            fSql.append("           FROM state s ");
            fSql.append("          WHERE s.state_code = r.state_code) ");
            fSql.append("       ,r.country_code ");                             // 6
            fSql.append("       ,(SELECT c.country_name ");                     // 7
            fSql.append("           FROM country c ");
            fSql.append("          WHERE c.country_code = r.country_code) ");
            fSql.append("       ,r.region_code ");                              // 8
            fSql.append("       ,(SELECT reg.region_name ");                    // 9
            fSql.append("           FROM region reg ");
            fSql.append("          WHERE reg.region_code = r.region_code ");
            fSql.append("            AND reg.country_code = r.country_code) ");
            fSql.append("       ,r.division_id ");                              // 10
            fSql.append("       ,(SELECT d.division_desc ");                    // 11
            fSql.append("           FROM division d ");
            fSql.append("          WHERE d.division_id = r.division_id) ");
            fSql.append("       ,r.room_type_id ");                             // 12
            fSql.append("       ,(SELECT rt.room_type_desc ");                  // 13
            fSql.append("           FROM room_type rt ");
            fSql.append("          WHERE rt.room_type_id = r.room_type_id) ");
            fSql.append("       ,r.eligible ");                                 // 14
            fSql.append("       ,r.unrated ");                                  // 15
            fSql.append("   FROM room r ");
            fSql.append("  WHERE round_id = ?");
            fSql.append("    AND r.room_type_id = " + CONTEST_ROOM);
            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO room ");
            fSql.append("      (room_id ");           // 1
            fSql.append("       ,round_id ");         // 2
            fSql.append("       ,name ");             // 3
            fSql.append("       ,state_code ");       // 4
            fSql.append("       ,state_name ");       // 5
            fSql.append("       ,country_code ");     // 6
            fSql.append("       ,country_name ");     // 7
            fSql.append("       ,region_code ");      // 8
            fSql.append("       ,region_name ");      // 9
            fSql.append("       ,division_id ");      // 10
            fSql.append("       ,division_desc ");    // 11
            fSql.append("       ,room_type_id ");     // 12
            fSql.append("       ,room_type_desc ");   // 13
            fSql.append("       ,eligible ");         // 14
            fSql.append("       ,unrated) ");         // 15
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?)");            // 15 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("UPDATE room ");
            fSql.append("   SET round_id = ? ");          // 1
            fSql.append("       ,name = ? ");             // 2
            fSql.append("       ,state_code = ? ");       // 3
            fSql.append("       ,state_name = ? ");       // 4
            fSql.append("       ,country_code = ? ");     // 5
            fSql.append("       ,country_name = ? ");     // 6
            fSql.append("       ,region_code = ? ");      // 7
            fSql.append("       ,region_name = ? ");      // 8
            fSql.append("       ,division_id = ? ");      // 9
            fSql.append("       ,division_desc = ? ");    // 10
            fSql.append("       ,room_type_id = ? ");     // 11
            fSql.append("       ,room_type_desc = ? ");   // 12
            fSql.append("       ,eligible = ? ");         // 13
            fSql.append("       ,unrated = ? ");          // 14
            fSql.append(" WHERE room_id = ? ");           // 15
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("SELECT * FROM room WHERE room_id = ?");
            psSel2 = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int room_id = rs.getInt(1);
                psSel2.clearParameters();
                psSel2.setInt(1, room_id);
                rs2 = psSel2.executeQuery();

                // If next() returns true that means this row exists. If so,
                // we update. Otherwise, we insert.
                if (rs2.next()) {
                    psUpd.clearParameters();
                    psUpd.setInt(1, rs.getInt(2));  // round_id
                    psUpd.setString(2, rs.getString(3));  // name
                    psUpd.setString(3, rs.getString(4));  // state_code
                    psUpd.setString(4, rs.getString(5));  // state_name
                    psUpd.setString(5, rs.getString(6));  // country_code
                    psUpd.setString(6, rs.getString(7));  // country_name
                    psUpd.setString(7, rs.getString(8));  // region_code
                    psUpd.setString(8, rs.getString(9));  // region_name
                    psUpd.setInt(9, rs.getInt(10));  // division_id
                    psUpd.setString(10, rs.getString(11));  // division_desc
                    psUpd.setInt(11, rs.getInt(12));  // room_type_id
                    psUpd.setString(12, rs.getString(13));  // room_type_desc
                    psUpd.setInt(13, rs.getInt(14));  // eligible
                    psUpd.setInt(14, rs.getInt(15));  // unrated
                    psUpd.setInt(15, rs.getInt(1));  // room_id

                    retVal = psUpd.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Update for room_id " +
                                room_id +
                                " modified " + retVal + " rows, not one.");
                    }
                } else {
                    psIns.clearParameters();
                    psIns.setInt(1, rs.getInt(1));  // room_id
                    psIns.setInt(2, rs.getInt(2));  // round_id
                    psIns.setString(3, rs.getString(3));  // name
                    psIns.setString(4, rs.getString(4));  // state_code
                    psIns.setString(5, rs.getString(5));  // state_name
                    psIns.setString(6, rs.getString(6));  // country_code
                    psIns.setString(7, rs.getString(7));  // country_name
                    psIns.setString(8, rs.getString(8));  // region_code
                    psIns.setString(9, rs.getString(9));  // region_name
                    psIns.setInt(10, rs.getInt(10));  // division_id
                    psIns.setString(11, rs.getString(11));  // division_desc
                    psIns.setInt(12, rs.getInt(12));  // room_type_id
                    psIns.setString(13, rs.getString(13));  // room_type_desc
                    psIns.setInt(14, rs.getInt(14));  // eligible
                    psIns.setInt(15, rs.getInt(15));  // unrated

                    retVal = psIns.executeUpdate();
                    count += retVal;
                    if (retVal != 1) {
                        throw new SQLException("TCLoadRound: Insert for room_id " +
                                room_id +
                                " modified " + retVal + " rows, not one.");
                    }
                }

                close(rs2);
                printLoadProgress(count, "room");
            }

            log.info("Room records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'room' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psUpd);
        }
    }

    /**
     * This loads the 'room_result'. This is actually a partial load of
     * the 'room_result' table as three columns are not populated:
     * submission_points, problems_submitted and
     * point_standard_deviation. We get these later on in the aggregate
     * load.
     */
    private void loadRoomResult() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT rr.round_id ");                              // 1
            fSql.append("       ,rr.room_id ");                              // 2
            fSql.append("       ,rr.coder_id ");                             // 3
            fSql.append("       ,rr.point_total ");                          // 4
            fSql.append("       ,rr.room_seed ");                            // 5
            fSql.append("       ,rp.paid ");                                 // 6
            fSql.append("       ,rr.old_rating ");                           // 7
            fSql.append("       ,rr.new_rating ");                           // 8
            fSql.append("       ,rr.room_placed ");                          // 9
            fSql.append("       ,rr.attended ");                             // 10
            fSql.append("       ,rr.advanced ");                             // 11
            fSql.append("       ,(SELECT sum(c.challenger_points) ");        // 12
            fSql.append("           FROM challenge c ");
            fSql.append("          WHERE c.round_id = rr.round_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("          AND c.challenger_id = rr.coder_id) ");
            fSql.append("       ,(SELECT sum(deduction_amount) ");           // 13
            fSql.append("           FROM system_test_result str ");
            fSql.append("          WHERE str.round_id = rr.round_id ");
            fSql.append("            AND str.coder_id = rr.coder_id) ");
            fSql.append("       ,(SELECT division_id FROM room ");           // 14
            fSql.append("          WHERE room.room_id = rr.room_id) ");
            fSql.append("       ,(SELECT count(*) ");                        // 15
            fSql.append("           FROM round_problem rp ");
            fSql.append("                ,room r ");
            fSql.append("          WHERE rp.round_id = rr.round_id ");
            fSql.append("            AND rp.division_id = r.division_id ");
            fSql.append("            AND rr.room_id = r.room_id) ");
            fSql.append("       ,(SELECT count(*) FROM problem_state ps ");  // 16
            fSql.append("          WHERE ps.round_id = rr.round_id ");
            fSql.append("            AND ps.coder_id = rr.coder_id ");
            fSql.append("            AND status_id = " + STATUS_PASSED_SYS_TEST + ") ");
            fSql.append("       ,(SELECT count(*) FROM problem_state ps ");  // 17
            fSql.append("          WHERE ps.round_id = rr.round_id ");
            fSql.append("            AND ps.coder_id = rr.coder_id ");
            fSql.append("            AND status_id = " + STATUS_FAILED_SYS_TEST + ") ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 18
            fSql.append("          WHERE c.round_id = rr.round_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.defendant_id = rr.coder_id ");
            fSql.append("            AND succeeded = " + STATUS_SUCCEEDED + ") ");
            fSql.append("       ,(SELECT count(*) FROM problem_state ps ");  // 19
            fSql.append("          WHERE ps.round_id = rr.round_id ");
            fSql.append("            AND ps.coder_id = rr.coder_id) ");
            fSql.append("       ,(SELECT count(*) FROM problem_state ps ");  // 20
            fSql.append("          WHERE ps.round_id = rr.round_id ");
            fSql.append("            AND ps.coder_id = rr.coder_id ");
            fSql.append("            AND status_id = " + STATUS_OPENED + ") ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 21
            fSql.append("          WHERE c.challenger_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id) ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 22
            fSql.append("          WHERE c.challenger_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id ");
            fSql.append("            AND succeeded = " + STATUS_SUCCEEDED + ") ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 23
            fSql.append("          WHERE c.challenger_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id ");
            fSql.append("            AND succeeded = " + STATUS_FAILED + ") ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 24
            fSql.append("          WHERE c.defendant_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id) ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 25
            fSql.append("          WHERE c.defendant_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id ");
            fSql.append("            AND succeeded = " + STATUS_SUCCEEDED + ") ");
            fSql.append("       ,(SELECT count(*) FROM challenge c ");       // 26
            fSql.append("          WHERE c.defendant_id = rr.coder_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.round_id = rr.round_id ");
            fSql.append("            AND succeeded = " + STATUS_FAILED + ") ");
            fSql.append("       ,(SELECT sum(defendant_points) ");           // 27
            fSql.append("           FROM challenge c ");
            fSql.append("          WHERE c.round_id = rr.round_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.defendant_id = rr.coder_id) ");
            fSql.append("       ,rr.overall_rank ");                        // 28
            fSql.append("       ,rr.division_placed ");                     // 29
            fSql.append("       ,rr.division_seed ");                       // 30
            fSql.append("       ,pt.payment_type_id");                      // 31
            fSql.append("       ,pt.payment_type_desc");                    // 32
            fSql.append("  FROM room_result rr ");
            fSql.append("  JOIN room r ON rr.round_id = r.round_id ");
            fSql.append("   AND rr.room_id = r.room_id ");
            fSql.append("  LEFT OUTER JOIN round_payment rp ON rr.round_id = rp.round_id");
            fSql.append("              AND rp.coder_id = rr.coder_id");
            fSql.append("  LEFT OUTER JOIN payment_type_lu pt ON rp.payment_type_id = pt.payment_type_id");
            fSql.append(" WHERE r.room_type_id = " + CONTEST_ROOM);
            fSql.append("   AND rr.round_id = ?");
            fSql.append("   AND rr.attended = 'Y'");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = rr.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO room_result ");
            fSql.append("      (round_id ");                         // 1
            fSql.append("       ,room_id ");                         // 2
            fSql.append("       ,coder_id ");                        // 3
            fSql.append("       ,final_points ");                    // 4
            fSql.append("       ,room_seed ");                       // 5
            fSql.append("       ,paid ");                            // 6
            fSql.append("       ,old_rating ");                      // 7
            fSql.append("       ,new_rating ");                      // 8
            fSql.append("       ,room_placed ");                     // 9
            fSql.append("       ,attended ");                        // 10
            fSql.append("       ,advanced ");                        // 11
            fSql.append("       ,challenge_points ");                // 12
            fSql.append("       ,system_test_points ");              // 13
            fSql.append("       ,division_id ");                     // 14
            fSql.append("       ,problems_presented ");              // 15
            fSql.append("       ,problems_correct ");                // 16
            fSql.append("       ,problems_failed_by_system_test ");  // 17
            fSql.append("       ,problems_failed_by_challenge ");    // 18
            fSql.append("       ,problems_opened ");                 // 19
            fSql.append("       ,problems_left_open ");              // 20
            fSql.append("       ,challenge_attempts_made ");         // 21
            fSql.append("       ,challenges_made_successful ");      // 22
            fSql.append("       ,challenges_made_failed ");          // 23
            fSql.append("       ,challenge_attempts_received ");     // 24
            fSql.append("       ,challenges_received_successful ");  // 25
            fSql.append("       ,challenges_received_failed ");      // 26
            fSql.append("       ,defense_points ");                  // 27
            fSql.append("       ,overall_rank ");                    // 28
            fSql.append("       ,division_placed ");                 // 29
            fSql.append("       ,division_seed ");                   // 30
            fSql.append("       ,payment_type_id ");                 // 31
            fSql.append("       ,payment_type_desc) ");              // 32
            fSql.append("VALUES (?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("        ?,?,?,?,?,?,?,?,?,?,");  // 20 values
            fSql.append("        ?,?,?,?,?,?,?,?,?,?,?,?)");  // 32 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM room_result ");
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND room_id = ? ");
            fSql.append("   AND coder_id = ? ");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int round_id = rs.getInt(1);
                int room_id = rs.getInt(2);
                int coder_id = rs.getInt(3);

                psDel.clearParameters();
                psDel.setInt(1, round_id);
                psDel.setInt(2, room_id);
                psDel.setInt(3, coder_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // round_id
                psIns.setInt(2, rs.getInt(2));  // room_id
                psIns.setInt(3, rs.getInt(3));  // coder_id
                psIns.setFloat(4, rs.getFloat(4));  // point_total
                psIns.setInt(5, rs.getInt(5));  // room_seed
                psIns.setFloat(6, rs.getFloat(6));  // paid
                psIns.setInt(7, rs.getInt(7));  // old_rating
                psIns.setInt(8, rs.getInt(8));  // new_rating
                psIns.setInt(9, rs.getInt(9));  // room_placed
                psIns.setString(10, rs.getString(10));  // attended
                psIns.setString(11, rs.getString(11));  // advanced
                psIns.setFloat(12, rs.getFloat(12));  // challenge_points
                psIns.setFloat(13, rs.getFloat(13));  // system_test_points
                psIns.setInt(14, rs.getInt(14));  // division_id
                psIns.setInt(15, rs.getInt(15));  // problems_presented
                psIns.setInt(16, rs.getInt(16));  // problems_correct
                psIns.setInt(17, rs.getInt(17));  // problems_failed_by_system_test
                psIns.setInt(18, rs.getInt(18));  // problems_failed_by_challenge
                psIns.setInt(19, rs.getInt(19));  // problems_opened
                psIns.setInt(20, rs.getInt(20));  // problems_left_open
                psIns.setInt(21, rs.getInt(21));  // challenge_attempts_made
                psIns.setInt(22, rs.getInt(22));  // challenges_made_successful
                psIns.setInt(23, rs.getInt(23));  // challenges_made_failed
                psIns.setInt(24, rs.getInt(24));  // challenge_attempts_received
                psIns.setInt(25, rs.getInt(25));  // challenges_received_successful
                psIns.setInt(26, rs.getInt(26));  // challenges_received_failed
                psIns.setFloat(27, rs.getFloat(27));  // defense_points
                psIns.setInt(28, rs.getInt(28));  // overall_rank
                psIns.setInt(29, rs.getInt(29));  // division_placed
                psIns.setInt(30, rs.getInt(30));  // division_seed
                if (rs.getInt("payment_type_id") == 0) {  //it's null
                    psIns.setNull(31, java.sql.Types.DECIMAL);
                    psIns.setNull(32, java.sql.Types.VARCHAR);
                } else {
                    psIns.setInt(31, rs.getInt("payment_type_id"));
                    psIns.setString(32, rs.getString("payment_type_desc"));
                }

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for coder_id " +
                            coder_id + ", round_id " + round_id +
                            ", room_id " + room_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "room_result");
            }

            log.info("Room_result records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'room_result' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This loads the 'coder_problem' table. This is a new table
     * which reports the results of each problem by coder.
     */
    private void loadCoderProblem() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psSelOpenSubmitOrder = null;
        PreparedStatement psSel2 = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        int coder_id = 0;
        int round_id = 0;
        int division_id = 0;
        int problem_id = 0;

        try {
            fSql.setLength(0);
            fSql.append("SELECT ps.coder_id ");                                 // 1
            fSql.append("       ,ps.round_id ");                                // 2
            // 3: division_id
            fSql.append("       ,(SELECT r.division_id ");                      // 3
            fSql.append("           FROM room r ");
            fSql.append("                ,room_result rr ");
            fSql.append("          WHERE rr.coder_id = ps.coder_id ");
            fSql.append("            AND rr.round_id = ps.round_id ");
            fSql.append("            AND r.room_type_id = " + CONTEST_ROOM);
            fSql.append("            AND r.room_id = rr.room_id) ");
            fSql.append("       ,ps.problem_id ");                              // 4
            fSql.append("       ,s.submission_points ");                        // 5
            fSql.append("       ,ps.points ");                                  // 6
            fSql.append("       ,ps.status_id ");                               // 7
            // 8: end_status_text
            fSql.append("       ,(SELECT status_desc ");                        // 8
            fSql.append("           FROM problem_status ");
            fSql.append("          WHERE problem_status_id = ps.status_id) ");
            fSql.append("       ,c.open_time ");                                // 9
            fSql.append("       ,s.submit_time ");                              // 10
            fSql.append("       ,s.submit_time - c.open_time ");                // 11
            fSql.append("       ,ps.language_id ");                             // 12
            // 13: challenge_points
            fSql.append("       ,(SELECT sum(c.challenger_points) ");           // 13
            fSql.append("           FROM challenge c ");
            fSql.append("          WHERE c.round_id = ps.round_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.challenger_id = ps.coder_id ");
            fSql.append("            AND c.problem_id = ps.problem_id) ");
            // 14: system_test_points
            fSql.append("       ,(SELECT sum(deduction_amount) ");              // 14
            fSql.append("           FROM system_test_result str ");
            fSql.append("          WHERE str.round_id = ps.round_id ");
            fSql.append("            AND str.coder_id = ps.coder_id ");
            fSql.append("            AND str.problem_id = ps.problem_id) ");
            // 15: defense_points
            fSql.append("       ,(SELECT sum(defendant_points) ");              // 15
            fSql.append("           FROM challenge c ");
            fSql.append("          WHERE c.round_id = ps.round_id ");
            fSql.append("          AND c.status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("            AND c.defendant_id = ps.coder_id ");
            fSql.append("            AND c.problem_id = ps.problem_id) ");
            fSql.append("       ,(SELECT rs.end_time");                         // 16
            fSql.append("           FROM round_segment rs");
            fSql.append("          WHERE rs.round_id = ps.round_id");
            fSql.append("            AND rs.segment_id = 2)");                  // coding segment...need constant
            fSql.append(" FROM problem_state ps ");
            fSql.append(" LEFT OUTER JOIN submission s ");
            fSql.append(" ON ps.problem_state_id = s.problem_state_id");
            fSql.append(" AND s.submission_number = ps.submission_number");
            fSql.append(" LEFT OUTER JOIN compilation c ");
            fSql.append(" ON ps.problem_state_id = c.problem_state_id");
            fSql.append(" JOIN room_result rr ");
            fSql.append(" ON rr.round_id = ps.round_id");
            fSql.append(" AND rr.coder_id = ps.coder_id");
            fSql.append(" AND rr.attended = 'Y'");
            fSql.append(" AND ps.round_id = ?");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = ps.coder_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = ps.coder_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("SELECT rp.open_order ");     // 1
            fSql.append("       ,rp.submit_order ");  // 2
            fSql.append("  FROM round_problem rp ");
            fSql.append(" WHERE rp.problem_id = ? ");
            fSql.append("   AND rp.round_id = ? ");
            fSql.append("   AND rp.division_id = ? ");
            psSelOpenSubmitOrder = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("SELECT rp.difficulty_id ");    // 1
            fSql.append("       ,d.difficulty_desc ");  // 2
            fSql.append("  FROM round_problem rp ");
            fSql.append("       ,difficulty d ");
            fSql.append(" WHERE rp.problem_id = ? ");
            fSql.append("   AND rp.division_id = ? ");
            fSql.append("   AND rp.round_id = ? ");
            fSql.append("   AND rp.difficulty_id = d.difficulty_id ");
            psSel2 = prepareStatement(fSql.toString(), SOURCE_DB);

            // Need to add these in later if we determine we need them
            fSql.setLength(0);
            fSql.append("INSERT INTO coder_problem ");
            fSql.append("      (coder_id ");             // 1
            fSql.append("       ,round_id ");            // 2
            fSql.append("       ,division_id ");         // 3
            fSql.append("       ,problem_id ");          // 4
            fSql.append("       ,submission_points ");   // 5
            fSql.append("       ,final_points ");        // 6
            fSql.append("       ,end_status_id ");       // 7
            fSql.append("       ,end_status_text ");     // 8
            fSql.append("       ,open_time ");           // 9
            fSql.append("       ,submit_time ");         // 10
            fSql.append("       ,time_elapsed ");        // 11
            fSql.append("       ,language_id ");         // 12
            fSql.append("       ,challenge_points ");    // 13
            fSql.append("       ,system_test_points ");  // 14
            fSql.append("       ,defense_points ");      // 15
            fSql.append("       ,open_order ");          // 16
            fSql.append("       ,submit_order ");        // 17
            fSql.append("       ,level_id ");            // 18
            fSql.append("       ,level_desc) ");         // 19
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?,?,?,?,?,?,?)");    // 19 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM coder_problem ");
            fSql.append(" WHERE coder_id = ? ");
            fSql.append("   AND round_id = ? ");
            fSql.append("   AND division_id = ? ");
            fSql.append("   AND problem_id = ?");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();


            while (rs.next()) {
                coder_id = rs.getInt(1);
                round_id = rs.getInt(2);
                division_id = rs.getInt(3);
                problem_id = rs.getInt(4);
                // if they didn't submit, use the difference between open time and the end of the coding phase
                // otherwise use the difference between open time and submit time
                long elapsed_time = rs.getLong(10) == 0?rs.getDate(16).getTime() - rs.getLong(9):rs.getLong(11);

                psSel2.clearParameters();
                psSel2.setInt(1, problem_id);
                psSel2.setInt(2, division_id);
                psSel2.setInt(3, fRoundId);
                int level_id = -1;
                String level_desc = null;
                rs2 = psSel2.executeQuery();

                // Get level_id and level_desc
                if (rs2.next()) {
                    level_id = rs2.getInt(1);
                    level_desc = rs2.getString(2);
                } else {
                    throw new SQLException("Unable to find level_id and level_desc " +
                            "for problem_id " + problem_id +
                            " and division_id " + division_id);
                }

                close(rs2);

                // Get open_order and submit_order
                psSelOpenSubmitOrder.clearParameters();
                psSelOpenSubmitOrder.setInt(1, problem_id);
                psSelOpenSubmitOrder.setInt(2, fRoundId);
                psSelOpenSubmitOrder.setInt(3, division_id);
                rs2 = psSelOpenSubmitOrder.executeQuery();

                int open_order = 0, submit_order = 0;
                if (rs2.next()) {
                    open_order = rs2.getInt(1);
                    submit_order = rs2.getInt(2);
                } else {
                    throw new SQLException("Unable to find open_order and submit_order " +
                            "for problem_id " + problem_id +
                            " and division_id " + division_id);
                }

                close(rs2);

                psDel.clearParameters();
                psDel.setInt(1, coder_id);
                psDel.setInt(2, round_id);
                psDel.setInt(3, division_id);
                psDel.setInt(4, problem_id);
                psDel.executeUpdate();

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // coder_id
                psIns.setInt(2, rs.getInt(2));  // round_id
                psIns.setInt(3, rs.getInt(3));  // division_id
                psIns.setInt(4, rs.getInt(4));  // problem_id
                psIns.setFloat(5, rs.getFloat(5));  // submission_points
                psIns.setFloat(6, rs.getFloat(6));  // final_points
                psIns.setInt(7, rs.getInt(7));  // end_status_id
                psIns.setString(8, rs.getString(8));  // end_status_text
                psIns.setLong(9, rs.getLong(9));  // open_time
                psIns.setLong(10, rs.getLong(10));  // submit_time
                psIns.setLong(11, elapsed_time);  // time_elapsed
                psIns.setInt(12, rs.getInt(12));  // language_id
                psIns.setFloat(13, rs.getFloat(13));  // challenge_points
                psIns.setFloat(14, rs.getFloat(14));  // system_test_points
                psIns.setFloat(15, rs.getFloat(15));  // defense_points
                psIns.setInt(16, open_order);  // open_order
                psIns.setInt(17, submit_order);  // submit_order
                psIns.setInt(18, level_id);
                psIns.setString(19, level_desc);

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for coder_id " +
                            coder_id + ", round_id " + round_id +
                            ", division_id " + division_id +
                            ", problem_id " + problem_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "coder_problem");
            }

            log.info("Coder_problem records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_problem' table failed.\n" +
                    "coder: " + coder_id + ", round_id " + round_id +
                    ", division_id " + division_id +
                    ", problem_id " + problem_id +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(rs2);
            close(psSel);
            close(psSel2);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This populates the 'challenge' table
     */
    private void loadChallenge() throws Exception {
        int retVal = 0;
        int count = 0;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;

        try {
            fSql.setLength(0);
            fSql.append("SELECT challenge_id ");        // 1
            fSql.append("       ,defendant_id ");       // 2
            fSql.append("       ,problem_id ");         // 3
            fSql.append("       ,round_id ");           // 4
            fSql.append("       ,succeeded ");          // 5
            fSql.append("       ,submit_time ");        // 6
            fSql.append("       ,challenger_id ");      // 7
            fSql.append("       ,args ");               // 8
            fSql.append("       ,message ");            // 9
            fSql.append("       ,challenger_points ");  // 10
            fSql.append("       ,defendant_points ");   // 11
            fSql.append("       ,expected ");           // 12
            fSql.append("       ,received ");           // 13
            fSql.append("  FROM challenge ");
            fSql.append(" WHERE round_id = ? ");
            fSql.append("   AND status_id <> " + CHALLENGE_NULLIFIED);
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = defendant_id ");
            fSql.append("           AND gu.group_id = 13)");
            fSql.append("   AND NOT EXISTS ");
            fSql.append("       (SELECT * ");
            fSql.append("          FROM group_user gu ");
            fSql.append("         WHERE gu.user_id = challenger_id ");
            fSql.append("           AND gu.group_id = 14)");

            psSel = prepareStatement(fSql.toString(), SOURCE_DB);

            fSql.setLength(0);
            fSql.append("INSERT INTO challenge ");
            fSql.append("      (challenge_id ");        // 1
            fSql.append("       ,defendant_id ");       // 2
            fSql.append("       ,problem_id ");         // 3
            fSql.append("       ,round_id ");           // 4
            fSql.append("       ,succeeded ");          // 5
            fSql.append("       ,submit_time ");        // 6
            fSql.append("       ,challenger_id ");      // 7
            fSql.append("       ,args ");               // 8
            fSql.append("       ,message ");            // 9
            fSql.append("       ,challenger_points ");  // 10
            fSql.append("       ,defendant_points ");   // 11
            fSql.append("       ,expected ");           // 12
            fSql.append("       ,received) ");          // 13
            fSql.append("VALUES (");
            fSql.append("?,?,?,?,?,?,?,?,?,?,");  // 10 values
            fSql.append("?,?,?)");                // 13 total values
            psIns = prepareStatement(fSql.toString(), TARGET_DB);

            fSql.setLength(0);
            fSql.append("DELETE FROM challenge ");
            fSql.append(" WHERE round_id = ? ");
            psDel = prepareStatement(fSql.toString(), TARGET_DB);

            // On to the load
            psSel.setInt(1, fRoundId);
            rs = psSel.executeQuery();

            // First thing we do is delete all the challenge entries for this round
            psDel.setInt(1, fRoundId);
            psDel.executeUpdate();

            while (rs.next()) {
                int challenger_id = rs.getInt(7);
                int defendant_id = rs.getInt(2);

                psIns.clearParameters();
                psIns.setInt(1, rs.getInt(1));  // challenge_id
                psIns.setInt(2, rs.getInt(2));  // defendant_id
                psIns.setInt(3, rs.getInt(3));  // problem_id
                psIns.setInt(4, rs.getInt(4));  // round_id
                psIns.setInt(5, rs.getInt(5));  // succeeded
                psIns.setLong(6, rs.getLong(6));  // submit_time
                psIns.setInt(7, rs.getInt(7));  // challenger_id
                setBytes(psIns, 8, getBlobObject(rs, 8));  // args
                psIns.setString(9, rs.getString(9));  // message
                psIns.setFloat(10, rs.getFloat(10));  // challenger_points
                psIns.setFloat(11, rs.getFloat(11));  // defendant_points
                setBytes(psIns, 12, getBlobObject(rs, 12));  // expected
                setBytes(psIns, 13, getBlobObject(rs, 13));  // received

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    throw new SQLException("TCLoadRound: Insert for challenge_id " +
                            rs.getInt(1) +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "challenge");
            }

            log.info("Challenge records copied = " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'challenge' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }

    /**
     * This method places the start time of the load into the update_log table
     */
    private void setLastUpdateTime() throws Exception {
        PreparedStatement psUpd = null;

        try {
            int retVal = 0;
            fSql.setLength(0);
            fSql.append("INSERT INTO update_log ");
            fSql.append("      (log_id ");        // 1
            fSql.append("       ,calendar_id ");  // 2
            fSql.append("       ,timestamp  ");   // 3
            fSql.append("       ,log_type_id) ");   // 4
            fSql.append("VALUES (0, ?, ?, " + ROUND_LOG_TYPE + ")");
            psUpd = prepareStatement(fSql.toString(), TARGET_DB);

            int calendar_id = lookupCalendarId(fStartTime, TARGET_DB);
            psUpd.setInt(1, calendar_id);
            psUpd.setTimestamp(2, fStartTime);

            retVal = psUpd.executeUpdate();
            if (retVal != 1) {
                throw new SQLException("SetLastUpdateTime updated " + retVal +
                        " rows, not just one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" +
                    sqle.getMessage());
        } finally {
            close(psUpd);
        }
    }

    private java.sql.Date getRoundStart(int roundId)
            throws SQLException {
        Integer iRoundId = new Integer(roundId);
        if (fRoundStartHT.get(iRoundId) != null)
            return (java.sql.Date) fRoundStartHT.get(iRoundId);

        fSql.setLength(0);
        fSql.append("SELECT rs.start_time ");
        fSql.append("  FROM round_segment rs ");
        fSql.append(" WHERE rs.round_id = ? ");
        fSql.append("   AND rs.segment_id = " + CODING_SEGMENT_ID);
        PreparedStatement pSel = prepareStatement(fSql.toString(), SOURCE_DB);

        pSel.setInt(1, roundId);
        ResultSet rs = pSel.executeQuery();

        if (rs.next()) {
            java.sql.Date date = rs.getDate(1);
            fRoundStartHT.put(new Integer(roundId), date);
            return date;
        } else {
            throw new SQLException("Unable to determine start for " + roundId);
        }
    }
}
