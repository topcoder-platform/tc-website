/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.dwload;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.ContestResultCalculator;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;
import com.topcoder.utilities.dwload.contestresult.RookieContest;
import com.topcoder.utilities.dwload.contestresult.TopPerformersCalculator;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * <strong>Purpose</strong>:
 * Extends from <strong>TCLoad</strong> to load TCS date to the DW.
 * <p/>
 * Version 1.1.2 Change notes:
 * <ol>
 * <li>
 * Deleted project are processed to fisically delete all related info in the dw.
 * </li>
 * </ol>
 * <p/>
 * Version 1.1.0 Change notes:
 * <ol>
 * <li>
 * Added columns to project, project_result.
 * </li>
 * <li>
 * Added table rookie.
 * </li>
 * <li>
 * Non rated project left out of DR points.
 * </li>
 * </ol>
 *
 * @author rfairfax, pulky
 * @version 1.1.2
 */
public class TCLoadTCS extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadTCS.class);

    private static final int OVERALL_RATING_RANK_TYPE_ID = 1;
    private static final int ACTIVE_RATING_RANK_TYPE_ID = 2;

    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;

    private int TCS_LOG_TYPE = 4;

    private static final String PROJECT_SELECT =
            "select distinct project_id from project_result";

    /**
     * First cut date for rookies in JDBC date escape format.
     *
     * @since 1.1.0
     */
    private static final String FIRST_CUT_DATE = "2006-5-11";

    /**
     * Id of the first season for rookies.
     *
     * @since 1.1.0
     */
    private static final long FIRST_SEASON_ID = 1;

    /**
     * Confirmed status.
     *
     * @since 1.1.0
     */
    private static final int CONFIRMED = 1;

    /**
     * Passed review threshold for being elegible for the ROTY season..
     *
     * @since 1.1.0
     */
    private static final int PASSED_REVIEW_THRESHOLD = 6;

    /**
     * Potential status.
     *
     * @since 1.1.0
     */
    private static final int POTENTIAL = 0;


    private static final long DELETED_PROJECT_STATUS = 3;

    public TCLoadTCS() {
        DEBUG = false;
    }

    private String submissionDir = null;

    /**
     * Return if it will load moved project which not be covered by last old_dw load.
     *
     * @return true if loat log time is before the 2006-11-4.
     */
    private boolean needLoadMovedProject() {
        return this.fLastLogTime == null ? true : this.fLastLogTime.before(java.sql.Date.valueOf("2006-11-11"));
        //return false;
    }

    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        String temp = (String) params.get("submission_dir");
        if (temp == null) {
            submissionDir = "file:/tcssubmissions/";
            log.info("Use default submissionDir: file:/tcssubmissions/");
        } else {
            log.info("set submissionDir: " + temp);
            if (!temp.endsWith("/")) {
                temp += "/";
            }
            submissionDir = temp;
        }

        return true;
    }

    /**
     * This method performs the load for the coder information tables
     */
    public void performLoad() throws Exception {
        try {

            PreparedStatement ps = null;
            try {
                ps = prepareStatement("set lock mode to wait 5", SOURCE_DB);
                ps.execute();
            } finally {
                close(ps);
            }

            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());
            getLastUpdateTime();

            doLoadReviewResp();

            doLoadEvent();
            doLoadUserEvent();

            doLoadContests();

            doLoadContestPrize();

            doLoadUserContestPrize();

            doLoadProjects();

            // load scorecard template before subission review because submission_review will use this table
            doLoadScorecardTemplate();

            //load submission review before project result because the project result load will use the submission review table
            doLoadSubmissionReview();


            doLoadProjectResults();

            doLoadRookies();

            doLoadSubmissionScreening();

            doLoadContestProject();

            doLoadUserRating();

            doLoadUserReliability();

            doLoadRoyalty();

            // the evaluation is removed doLoadEvaluationLU();

            doLoadScorecardQuestion();

            doLoadScorecardResponse();

            doLoadTestcaseResponse();

            doLoadSubjectiveResponse();

            doLoadAppeal();
            doLoadTestcaseAppeal();

            doLoadSubmission();

            doLoadStreak();

            List list = getCurrentRatings();
            doLoadRank(112, ACTIVE_RATING_RANK_TYPE_ID, list);
            doLoadRank(112, OVERALL_RATING_RANK_TYPE_ID, list);
            doLoadRank(113, ACTIVE_RATING_RANK_TYPE_ID, list);
            doLoadRank(113, OVERALL_RATING_RANK_TYPE_ID, list);

            loadSchoolRatingRank(112, ACTIVE_RATING_RANK_TYPE_ID, list);
            loadSchoolRatingRank(112, OVERALL_RATING_RANK_TYPE_ID, list);
            loadSchoolRatingRank(113, ACTIVE_RATING_RANK_TYPE_ID, list);
            loadSchoolRatingRank(113, OVERALL_RATING_RANK_TYPE_ID, list);

            loadCountryRatingRank(112, ACTIVE_RATING_RANK_TYPE_ID, list);
            loadCountryRatingRank(112, OVERALL_RATING_RANK_TYPE_ID, list);
            loadCountryRatingRank(113, ACTIVE_RATING_RANK_TYPE_ID, list);
            loadCountryRatingRank(113, OVERALL_RATING_RANK_TYPE_ID, list);

            //fix problems with submission date

            //todo what the hell is this?  do we need it?
/*
            final String sSQL = "update project_result " +
                    "         set submit_timestamp = (select max(u.submission_date) " +
                    "         from project p, " +
                    "         user_component_score u " +
                    "         where p.project_id = project_result.project_id " +
                    "         and u.component_name = p.component_name " +
                    "         and u.phase_id = p.phase_id " +
                    "         and u.component_id = p.component_id " +
                    "         and u.user_id = project_result.user_id " +
                    "         and u.score = project_result.final_score " +
                    "         group by p.project_id), submit_ind = 1 " +
                    " where exists(  " +
                    "         select max(u.submission_date) " +
                    "         from project p, " +
                    "         user_component_score u " +
                    "         where p.project_id = project_result.project_id " +
                    "         and u.component_name = p.component_name " +
                    "         and u.phase_id = p.phase_id " +
                    "         and u.component_id = p.component_id " +
                    "         and u.user_id = project_result.user_id " +
                    "         and u.score = project_result.final_score " +
                    "         group by p.project_id " +
                    " )";

            try {
                ps = prepareStatement(sSQL, TARGET_DB);
                ps.executeUpdate();
            } finally {
                close(ps);
            }
*/

            doLoadSeason();

            doLoadStage();

            doLoadSeasonResults();

            doLoadStageResults();

            doClearCache();

            setLastUpdateTime();

            log.info("SUCCESS: TCS load ran successfully.");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            setReasonFailed(("Load failed.\n" +
                    sqle.getMessage()));
            throw sqle;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            throw ex;
        }
    }


    public void doClearCache() throws Exception {

/*
        CacheClient cc = CacheClientFactory.createCacheClient();

        String tempKey;
*/

        String[] keys = new String[]{"member_projects", "project_results_all", "contest_prizes", "contest_projects", "project_details",
                "tccc05_", "tccc06_", "tco07_", "usdc_", "component_history", "tcs_ratings_history",
                "member_profile", "Coder_Dev_Data", "Coder_Des_Data", "Component_",
                "public_home_data", "top_designers", "top_developers", "tco04",
                "coder_all_ratings", "tco05", "coder_dev", "coder_des", "coder_algo",
                "dd_design", "dd_development", "dd_component", "comp_list", "find_projects", "get_review_scorecard",
                "get_screening_scorecard", "project_info", "reviewers_for_project", "scorecard_details", "submissions",
                "comp_contest_details", "dr_leader_board", "dr_rookie_board", "competition_history", "algo_competition_history",
                "dr_current_period", "dr_stages", "dr_seasons", "component_color_change", "stage_outstanding_projects",
                "season_outstanding_projects", "dr_results", "dr_rookie_results", "dr_rookie_seasons", "dr_stages", "dr_contests_for_stage",
                "outstanding_projects"
        };

        HashSet<String> s = new HashSet<String>();
        for (String key : keys) {
            s.add(key);
        }
        CacheClearer.removelike(s);

/*

        ArrayList list = cc.getKeys();
        for (int i = 0; i < list.size(); i++) {
            tempKey = (String) list.get(i);
            for (int j = 0; j < keys.length; j++) {
                if (tempKey.indexOf(keys[j]) > -1) {
                    cc.remove(tempKey);
                    break;
                }
            }
        }
*/
    }

    protected void getLastUpdateTime() throws Exception {
        Statement stmt = null;
        ResultSet rs = null;
        StringBuffer query;

        query = new StringBuffer(100);
        query.append("select timestamp from update_log where log_id = ");
        query.append("(select max(log_id) from update_log where log_type_id = " + TCS_LOG_TYPE + ")");

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

    private void setLastUpdateTime() throws Exception {
        PreparedStatement psUpd = null;
        StringBuffer query;

        try {
            int retVal;
            query = new StringBuffer(100);
            query.append("INSERT INTO update_log ");
            query.append("      (log_id ");        // 1
            query.append("       ,calendar_id ");  // 2
            query.append("       ,timestamp ");   // 3
            query.append("       ,log_type_id) ");   // 4
            query.append("VALUES (0, ?, ?, ").append(TCS_LOG_TYPE).append(")");
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


    public void doLoadReviewResp() throws Exception {
        log.info("load review resp");
        ResultSet reviewResp;

        PreparedStatement reviewRespSelect = null;
        PreparedStatement reviewRespUpdate = null;
        PreparedStatement reviewRespInsert = null;

        final String REVIEW_RESP_SELECT = "select review_resp_id, review_resp_name from review_resp";

        final String REVIEW_RESP_UPDATE =
                "update review_resp set review_resp_desc=? where review_resp_id=?";

        final String REVIEW_RESP_INSERT =
                "insert into review_resp (review_resp_id, review_resp_desc) values (?, ?)";


        try {
            long start = System.currentTimeMillis();

            reviewRespSelect = prepareStatement(REVIEW_RESP_SELECT, SOURCE_DB);
            reviewRespUpdate = prepareStatement(REVIEW_RESP_UPDATE, TARGET_DB);
            reviewRespInsert = prepareStatement(REVIEW_RESP_INSERT, TARGET_DB);

            int count = 0;

            reviewResp = reviewRespSelect.executeQuery();

            while (reviewResp.next()) {

                reviewRespUpdate.clearParameters();

                reviewRespUpdate.setObject(1, reviewResp.getObject("review_resp_name"));
                reviewRespUpdate.setLong(2, reviewResp.getLong("review_resp_id"));

                int retVal = reviewRespUpdate.executeUpdate();

                if (retVal == 0) {
                    reviewRespInsert.clearParameters();

                    reviewRespInsert.setLong(1, reviewResp.getLong("review_resp_id"));
                    reviewRespInsert.setObject(2, reviewResp.getObject("review_resp_name"));

                    reviewRespInsert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'review_resp' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(reviewRespInsert);
            close(reviewRespUpdate);
            close(reviewRespSelect);
        }
    }


    public void doLoadRoyalty() throws Exception {
        log.info("load royalties");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        try {
            long start = System.currentTimeMillis();
            final String SELECT = "select user_id, amount, description, royalty_date from royalty " +
                    "where modify_date > ?";
            final String UPDATE = "update royalty set amount = ?, description = ? where royalty_date = ? " +
                    " and user_id = ? ";
            final String INSERT = "insert into royalty (user_id, amount, description, royalty_date) " +
                    "values (?, ?, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);

            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //log.debug("PROCESSING USER " + rs.getInt("user_id"));

                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("amount"));
                update.setObject(2, rs.getObject("description"));
                update.setObject(3, rs.getObject("royalty_date"));
                update.setLong(4, rs.getLong("user_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("user_id"));
                    insert.setObject(2, rs.getObject("amount"));
                    insert.setObject(3, rs.getObject("description"));
                    insert.setObject(4, rs.getObject("royalty_date"));
                    insert.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'royalty' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(insert);
            close(update);
            close(select);
        }
    }

    public void doLoadSubmission() throws Exception {
        log.info("load submissions");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        try {
            long start = System.currentTimeMillis();

            // check if submission table is empty, if yes, do a complete load (assume that is the first time a load is done)
            select = prepareStatement("select count(*) from submission", TARGET_DB);
            rs = select.executeQuery();
            rs.next();

            boolean firstRun = rs.getInt(1) == 0;

            if (firstRun) log.info("Loading submission table for the first time.  A complete load will be performed.");

            final String SELECT =
                    "select submission_id " +
                            "   ,ri.value as submitter_id" +
                            ",  u.project_id" +
                            ",  u.parameter as submission_url" +
                            ",  1 as submission_type " +
                            "from submission s" +
                            "   ,upload u" +
                            "   ,project p " +
                            "   ,resource r" +
                            "   ,resource_info ri " +
                            "   ,project_info piel " +
                            "where s.upload_id = u.upload_id " +
                            "   and u.project_id = p.project_id " +
                            "   and p.project_status_id <> 3 " +
                            "   and p.project_category_id in (1, 2) " +
                            "   and u.resource_id = r.resource_id " +
                            "   and r.resource_id = ri.resource_id " +
                            "   and ri.resource_info_type_id = 1 " +
                            "   and u.upload_type_id = 1 " +
                            "   and s.submission_status_id <> 5 " +
                            "   and piel.project_info_type_id = 14 " +
                            "   and piel.value = 'Open' " +
                            "   and piel.project_id = p.project_id " +
                            (firstRun ? "" :
                                    "and (s.modify_date > ? " +
                                            "OR u.modify_date > ? " +
                                            "OR r.modify_date >= ? " +
                                            "OR ri.modify_date >= ? " +
                                            (needLoadMovedProject() ? " OR s.modify_user <> 'Converter' " +
                                                    " OR u.modify_user <> 'Converter' " +
                                                    " OR r.modify_user <> 'Converter' " +
                                                    " OR ri.modify_user <> 'Converter' " +
                                                    ")"
                                                    : ")"));

            final String UPDATE = "update submission set submission_url=? " +
                    "where submitter_id=? and project_id=? and submission_type=?";

            final String INSERT = "insert into submission (submitter_id, project_id, submission_url, submission_type, submission_id)" +
                    "values (?, ?, ?, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);

            if (!firstRun) {
                select.setTimestamp(1, fLastLogTime);
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
            }

            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;

                update.clearParameters();

                // make sure submission dir exist
                String submissionUrl = rs.getString("submission_url");
                if (submissionUrl != null && submissionUrl.indexOf("/") <= 0) {
                    // submission_dir does not prefix
                    submissionUrl = this.submissionDir + submissionUrl;
                }
                update.setString(1, submissionUrl);
                update.setInt(2, rs.getInt("submitter_id"));
                update.setInt(3, rs.getInt("project_id"));
                update.setInt(4, rs.getInt("submission_type"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setInt(1, rs.getInt("submitter_id"));
                    insert.setInt(2, rs.getInt("project_id"));
                    insert.setString(3, submissionUrl);
                    insert.setInt(4, rs.getInt("submission_type"));
                    insert.setInt(5, rs.getInt("submission_id"));
                    insert.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'submission' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(insert);
            close(update);
            close(select);
        }
    }

    public void doLoadUserReliability() throws Exception {
        log.info("load user reliability");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();
            final String SELECT = "select user_id, rating, phase_id from user_reliability where modify_date > ? ";
            final String INSERT = "insert into user_reliability (user_id, rating, phase_id) " +
                    "values (?, ?, ?) ";
            final String UPDATE = "update user_reliability set rating = ?" +
                    " where user_id = ? and phase_id = ?";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);

            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //log.debug("PROCESSING USER " + rs.getInt("user_id"));

                update.clearParameters();
                update.setDouble(1, rs.getDouble("rating"));
                update.setLong(2, rs.getLong("user_id"));
                update.setLong(3, rs.getLong("phase_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("user_id"));
                    insert.setDouble(2, rs.getDouble("rating"));
                    insert.setLong(3, rs.getLong("phase_id"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_reliability' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }

    public void doLoadUserRating() throws Exception {
        log.info("load user rating");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        long userId = 0;
        try {

            long start = System.currentTimeMillis();
            final String SELECT = "select ur.rating " +
                    "  , ur.vol " +
                    "  , ur.rating_no_vol " +
                    "  , ur.num_ratings " +
                    "  , ur.last_rated_project_id " +
                    "  , ur.user_id " +
                    "  , ur.phase_id " +
                    "  , (select max(pr.new_rating) " +
                    " from project_result pr, project p, project_info piel " +
                    " where pr.user_id = ur.user_id " +
                    " and pr.project_id = p.project_id " +
                    " and pr.rating_ind = 1 " +
                    " and piel.project_info_type_id = 14 and piel.value = 'Open' and piel.project_id = p.project_id " +
                    " and p.project_category_id+111 = ur.phase_id) as highest_rating " +
                    " , (select min(pr.new_rating) " +
                    " from project_result pr, project p, project_info piel " +
                    " where pr.user_id = ur.user_id " +
                    " and pr.project_id = p.project_id " +
                    " and pr.rating_ind = 1 " +
                    " and piel.project_info_type_id = 14 and piel.value = 'Open' and piel.project_id = p.project_id " +
                    " and p.project_category_id+111 = ur.phase_id) as lowest_rating " +
                    " from user_rating ur " +
                    " where ur.mod_date_time > ?";

            final String UPDATE = "update user_rating set rating = ?,  vol = ?, rating_no_vol = ?, num_ratings = ?, last_rated_project_id = ?, mod_date_time = CURRENT, highest_rating = ?, lowest_rating = ? " +
                    " where user_id = ? and phase_id = ?";
            final String INSERT = "insert into user_rating (user_id, rating, phase_id, vol, rating_no_vol, num_ratings, last_rated_project_id, mod_date_time, create_date_time, highest_rating, lowest_rating) " +
                    "values (?, ?, ?, ?, ?, ?, ?, CURRENT, CURRENT, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);

            insert = prepareStatement(INSERT, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                userId = rs.getLong("user_id");
                //log.debug("PROCESSING USER " + rs.getInt("user_id"));

                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("rating"));
                update.setObject(2, rs.getObject("vol"));
                update.setObject(3, rs.getObject("rating_no_vol"));
                update.setObject(4, rs.getObject("num_ratings"));
                //ps2.setObject(6, rs.getObject("last_component_rated"));
                update.setObject(5, rs.getObject("last_rated_project_id"));
                update.setInt(6, rs.getInt("highest_rating"));
                update.setInt(7, rs.getInt("lowest_rating"));
                update.setLong(8, userId);
                update.setObject(9, rs.getObject("phase_id"));


                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, userId);
                    insert.setObject(2, rs.getObject("rating"));
                    insert.setObject(3, rs.getObject("phase_id"));
                    insert.setObject(4, rs.getObject("vol"));
                    insert.setObject(5, rs.getObject("rating_no_vol"));
                    insert.setObject(6, rs.getObject("num_ratings"));
                    insert.setObject(7, rs.getObject("last_rated_project_id"));
                    insert.setInt(8, rs.getInt("highest_rating"));
                    insert.setInt(9, rs.getInt("lowest_rating"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_rating' table failed. for user " + userId + " \n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(update);
            close(insert);
        }
    }

    /**
     * <p/>
     * Calculates stage based on a date.
     * </p>
     *
     * @param date The date used to calculate the stage.
     * @return the stage ID.
     * @since 1.1.0
     */
    private long calculateStage(java.sql.Date date) throws Exception {
        PreparedStatement select = null;
        ResultSet rs = null;

        try {
            //get data from source DB
            final String SELECT = "select " +
                    "   stage_id " +
                    "from " +
                    "   stage s, calendar c1, calendar c2 " +
                    "where " +
                    "   s.start_calendar_id = c1.calendar_id and " +
                    "   s.end_calendar_id = c2.calendar_id and " +
                    "   c1.date <= DATE(?) and " +
                    "   c2.date >= DATE(?)";

            select = prepareStatement(SELECT, TARGET_DB);
            select.setDate(1, date);
            select.setDate(2, date);

            rs = select.executeQuery();
            if (!rs.next()) {
                throw new Exception("Stage calculation failed for date: " + date.toString() + ". (no stage found)");
            }

            //log.debug("Date " + date.toString() + " has been assigned stageId = " + rs.getLong("stage_id"));
            return (rs.getLong("stage_id"));

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Stage calculation failed for date: " + date.toString() + ".\n" + sqle.getMessage());
        } finally {
            close(rs);
            close(select);
        }
    }

    /**
     * <p/>
     * Load projects to the DW.
     * </p>
     */
    public void doLoadProjects() throws Exception {
        log.info("load projects");
        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet rs = null;

        try {
            //log.debug("PROCESSING PROJECT " + project_id);
            long start = System.currentTimeMillis();

            //get data from source DB
            final String SELECT =
                    "select p.project_id " +
                            "   ,cc.component_id " +
                            "   ,cc.component_name " +
                            "   ,(select count(*) from resource where project_id = p.project_id and resource_role_id = 1) as num_registrations " +
                            "   ,(select count(*) from submission sub, upload where sub.upload_id = upload.upload_id and project_id = p.project_id and submission_status_id <> 5) as num_submissions " +
                            //todo this should probably use the flag on project result in the dw, not got back to the submission table in transactoinal
                            "   ,(select count(*) from submission s, upload where upload.upload_id = s.upload_id and project_id = p.project_id and submission_status_id in (1, 3, 4)) as num_valid_submissions " +
                            //todo this should use the flag on project result, not go back to transactional
                            "   ,(select count(*) from submission s, upload u where u.upload_id = s.upload_id and project_id = p.project_id and submission_status_id in (1, 4)) as num_submissions_passed_review " +
                            //todo again...none of this aggregate data should come from transactional
                            "   ,(select avg(case when raw_score is null then 0 else raw_score end) from project_result where project_id = p.project_id and raw_score is not null) as avg_raw_score " +
                            "   ,(select avg(case when final_score is null then 0 else final_score end) from project_result where project_id = p.project_id and final_score is not null) as avg_final_score " +
                            "   ,case when p.project_category_id = 1 then 112 when p.project_category_id = 2 then 113 else null end  as phase_id " +
                            "   ,case when p.project_category_id = 1 then 'Design' when p.project_category_id = 2 then 'Development' else null end as phase_desc " +
                            "   ,cat.category_id " +
                            "   ,cat.category_name as category_desc " +
                            "   ,case when ppd.actual_start_time is not null then ppd.actual_start_time else psd.actual_start_time end as posting_date " +
                            "   ,psd.actual_end_time as submitby_date " +
                            "   ,1 as level_id " +
                            "   ,pi1.value as complete_date  " +
                            "   ,(select phase_type_id from project_phase where project_phase_id = (select min(project_phase_id) from project_phase where project_id = p.project_id and phase_status_id = 2)) as review_phase_id " +
                            "   ,(select name from phase_type_lu where phase_type_id = (select phase_type_id from project_phase where project_phase_id = (select min(project_phase_id) from project_phase where project_id = p.project_id and phase_status_id = 2))) as review_phase_name " +
                            "   ,p.project_status_id as project_stat_id " +
                            "   ,psl.name as project_stat_name " +
                            "   ,cat.viewable as viewable " +
                            "   ,cv.version as version_id " +
                            "   ,cv.version_text " +
                            "   ,pivi.value as rating_date " +
                            "   ,case when pivt.value is not null then substr(pivt.value,1,20) else null end as winner_id" +
                            "   ,case when pict.value is not null then substr(pict.value,1,4) else 'On' end as digital_run_ind   " +
                            "   ,cv.suspended_ind " +
                            "   from project p , " +
                            "   project_info pir, " +
                            "   project_info piel, " +
                            "   project_info pivers, " +
                            "   outer project_info pivi," +
                            "   outer project_info pivt," +
                            "   outer project_info pict," +
                            "   outer project_info pi1," +
                            "   outer project_info pi2," +
                            "   categories cat, " +
                            "   comp_catalog cc, " +
                            "   comp_versions cv, " +
                            "   project_status_lu psl, " +
                            "   OUTER project_phase psd, " +
                            "   OUTER project_phase ppd " +
                            " where pir.project_id = p.project_id " +
                            "   and pir.project_info_type_id = 2 " +
                            "   and pivi.project_id = p.project_id " +
                            "   and pivi.project_info_type_id = 22 " +
                            "   and pivers.project_id = p.project_id " +
                            "   and pivers.project_info_type_id = 1 " +
                            "   and pivers.value = cv.comp_vers_id " +
                            "   and pivt.project_id = p.project_id " +
                            "   and pivt.project_info_type_id = 23 " +
                            "   and pict.project_id = p.project_id " +
                            "   and pict.project_info_type_id = 26 " +
                            "   and pi1.project_id = p.project_id " +
                            "   and pi1.project_info_type_id = 21 " +
                            "   and pi2.project_id = p.project_id " +
                            "   and pi2.project_info_type_id = 3 " +
                            "   and piel.project_info_type_id = 14 " +
                            "   and piel.value = 'Open' " +
                            "   and p.project_id = piel.project_id " +
                            "   and cc.component_id = pir.value " +
                            "   and cc.root_category_id = cat.category_id " +
                            "   and psl.project_status_id = p.project_status_id " +
                            "   and psd.project_id = p.project_id " +
                            "   and psd.phase_type_id = 2 " +
                            "   and ppd.project_id = p.project_id " +
                            "   and ppd.phase_type_id = 1 " +
                            // we need to process deleted project, otherwise there's a possibility
                            // they will keep living in the DW.
                            //" and p.project_status_id <> 3 " +
                            "   and p.project_category_id in (1, 2) " +
                            "   and (p.modify_date > ? " +
                            // comp versions with modified date
                            "   or cv.modify_date > ? " +
                            // add projects who have modified resources
                            "   or p.project_id in (select distinct r.project_id from resource r where (r.create_date > ? or r.modify_date > ?)) " +
                            // add projects who have modified upload and submissions
                            "   or p.project_id in (select distinct u.project_id from upload u, submission s where u.upload_id = s.upload_id and " +
                            "   (u.create_date > ? or u.modify_date > ? or s.create_date > ? or s.modify_date > ?)) " +
                            // add projects who have modified results
                            "   or p.project_id in (select distinct pr.project_id from project_result pr where (pr.create_date > ? or pr.modify_date > ?)) " +
                            "   OR pir.modify_date > ? " +
                            (needLoadMovedProject() ? " OR p.modify_user <> 'Converter' " +
                                    " OR pir.modify_user <> 'Converter' " +
                                    ")"
                                    : ")");

            final String UPDATE = "update project set component_name = ?,  num_registrations = ?, " +
                    "num_submissions = ?, num_valid_submissions = ?, avg_raw_score = ?, avg_final_score = ?, " +
                    "phase_id = ?, phase_desc = ?, category_id = ?, category_desc = ?, posting_date = ?, submitby_date " +
                    "= ?, complete_date = ?, component_id = ?, review_phase_id = ?, review_phase_name = ?, " +
                    "status_id = ?, status_desc = ?, level_id = ?, viewable_category_ind = ?, version_id = ?, version_text = ?, " +
                    "rating_date = ?, num_submissions_passed_review=?, winner_id=?, stage_id = ?, digital_run_ind = ?, suspended_ind = ? where project_id = ? ";

            final String INSERT = "insert into project (project_id, component_name, num_registrations, num_submissions, " +
                    "num_valid_submissions, avg_raw_score, avg_final_score, phase_id, phase_desc, " +
                    "category_id, category_desc, posting_date, submitby_date, complete_date, component_id, " +
                    "review_phase_id, review_phase_name, status_id, status_desc, level_id, viewable_category_ind, version_id, " +
                    "version_text, rating_date, num_submissions_passed_review, winner_id, stage_id, digital_run_ind, suspended_ind) " +
                    "values (?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            select.setTimestamp(3, fLastLogTime);
            select.setTimestamp(4, fLastLogTime);
            select.setTimestamp(5, fLastLogTime);
            select.setTimestamp(6, fLastLogTime);
            select.setTimestamp(7, fLastLogTime);
            select.setTimestamp(8, fLastLogTime);
            select.setTimestamp(9, fLastLogTime);
            select.setTimestamp(10, fLastLogTime);
            select.setTimestamp(11, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();
            int count = 0;
            while (rs.next()) {

                if (rs.getLong("project_stat_id") != DELETED_PROJECT_STATUS) {
                    if (rs.getLong("version_id") > 999) {
                        log.info("the version id is more than 999");
                        continue;
                        // throw new Exception("component " + rs.getString("component_name") + " has a version > 999");
                    }

                    //update record, if 0 rows affected, insert record
                    update.setString(1, rs.getString("component_name"));
                    update.setObject(2, rs.getObject("num_registrations"));
                    update.setInt(3, rs.getInt("num_submissions"));
                    update.setInt(4, rs.getInt("num_valid_submissions"));
                    update.setObject(5, rs.getObject("avg_raw_score"));
                    update.setObject(6, rs.getObject("avg_final_score"));
                    update.setInt(7, rs.getInt("phase_id"));
                    update.setString(8, rs.getString("phase_desc"));
                    update.setInt(9, rs.getInt("category_id"));
                    update.setString(10, rs.getString("category_desc"));
                    update.setDate(11, rs.getDate("posting_date"));
                    update.setDate(12, rs.getDate("submitby_date"));
                    Timestamp completeDate = convertToDate(rs.getString("complete_date"));
                    if (completeDate != null) {
                        update.setTimestamp(13, completeDate);
                    } else {
                        update.setNull(13, Types.TIMESTAMP);
                    }
                    update.setLong(14, rs.getLong("component_id"));
                    update.setLong(15, rs.getLong("review_phase_id"));
                    update.setString(16, rs.getString("review_phase_name"));
                    update.setLong(17, rs.getInt("project_stat_id"));
                    update.setString(18, rs.getString("project_stat_name"));
                    update.setLong(19, rs.getLong("level_id"));
                    update.setInt(20, rs.getInt("viewable"));
                    update.setInt(21, (int) rs.getLong("version_id"));
                    update.setString(22, rs.getString("version_text"));
                    Timestamp ratingDate = convertToDate(rs.getString("rating_date"));
                    if (ratingDate != null) {
                        update.setTimestamp(23, ratingDate);
                    } else {
                        update.setNull(23, Types.TIMESTAMP);
                    }
                    update.setInt(24, rs.getInt("num_submissions_passed_review"));
                    if (rs.getString("winner_id") == null) {
                        update.setNull(25, Types.DECIMAL);
                    } else {
                        update.setLong(25, rs.getLong("winner_id"));
                    }


                    if (rs.getDate("posting_date") == null) {
                        update.setNull(26, Types.DATE);
                    } else {
                        try {
                            update.setLong(26, calculateStage(rs.getDate("posting_date")));
                        } catch (Exception e) {
                            update.setNull(26, Types.DATE);
                        }
                    }
                    String digitRun = rs.getString("digital_run_ind");
                    update.setInt(27, "On".equals(digitRun) || "Yes".equals(digitRun) ? 1 : 0);
                    update.setInt(28, rs.getInt("suspended_ind"));

                    update.setLong(29, rs.getLong("project_id"));
                    int retVal = update.executeUpdate();

                    if (retVal == 0) {
                        //need to insert
                        insert.setLong(1, rs.getLong("project_id"));
                        insert.setString(2, rs.getString("component_name"));
                        insert.setObject(3, rs.getObject("num_registrations"));
                        insert.setInt(4, rs.getInt("num_submissions"));
                        insert.setInt(5, rs.getInt("num_valid_submissions"));
                        insert.setDouble(6, rs.getDouble("avg_raw_score"));
                        insert.setDouble(7, rs.getDouble("avg_final_score"));
                        insert.setInt(8, rs.getInt("phase_id"));
                        insert.setString(9, rs.getString("phase_desc"));
                        insert.setInt(10, rs.getInt("category_id"));
                        insert.setString(11, rs.getString("category_desc"));
                        insert.setDate(12, rs.getDate("posting_date"));
                        insert.setDate(13, rs.getDate("submitby_date"));
                        completeDate = convertToDate(rs.getString("complete_date"));
                        if (completeDate != null) {
                            insert.setDate(14, new java.sql.Date(completeDate.getTime()));
                        } else {
                            insert.setNull(14, Types.DATE);
                        }
                        insert.setLong(15, rs.getLong("component_id"));
                        insert.setLong(16, rs.getLong("review_phase_id"));
                        insert.setString(17, rs.getString("review_phase_name"));
                        insert.setLong(18, rs.getInt("project_stat_id"));
                        insert.setString(19, rs.getString("project_stat_name"));
                        insert.setLong(20, rs.getLong("level_id"));
                        insert.setInt(21, rs.getInt("viewable"));
                        insert.setInt(22, (int) rs.getLong("version_id"));
                        insert.setString(23, rs.getString("version_text"));
                        ratingDate = convertToDate(rs.getString("rating_date"));
                        if (ratingDate != null) {
                            insert.setDate(24, new java.sql.Date(ratingDate.getTime()));
                        } else {
                            insert.setNull(24, Types.DATE);
                        }
                        insert.setInt(25, rs.getInt("num_submissions_passed_review"));
                        if (rs.getString("winner_id") == null) {
                            insert.setNull(26, Types.DECIMAL);
                        } else {
                            insert.setLong(26, rs.getLong("winner_id"));
                        }
                        if (rs.getDate("posting_date") == null) {
                            insert.setNull(27, Types.DATE);
                        } else {
                            try {
                                insert.setLong(27, calculateStage(rs.getDate("posting_date")));
                            } catch (Exception e) {
                                insert.setNull(27, Types.DATE);
                            }
                        }
                        digitRun = rs.getString("digital_run_ind");
                        insert.setInt(28, "On".equals(digitRun) || "Yes".equals(digitRun) ? 1 : 0);
                        insert.setInt(29, rs.getInt("suspended_ind"));

                        insert.executeUpdate();
                    }
                } else {
                    // we need to delete this project and all related objects in the database.
                    log.info("Found project to delete: " + rs.getLong("project_id"));
                    deleteProject(rs.getLong("project_id"));
                }
                count++;
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            sqle.printStackTrace();
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }

    /**
     * Helper method that deletes all project related objects in the dw.
     *
     * @param projectId the projectId to delete
     * @since 1.1.2
     */
    private void deleteProject(long projectId) throws SQLException {
        simpleDelete("subjective_response", "project_id", projectId);
        simpleDelete("testcase_response", "project_id", projectId);
        simpleDelete("scorecard_response", "project_id", projectId);
        simpleDelete("submission_screening", "project_id", projectId);
        simpleDelete("submission_review", "project_id", projectId);
        simpleDelete("testcase_appeal", "project_id", projectId);
        simpleDelete("streak", "start_project_id", projectId);
        simpleDelete("streak", "end_project_id", projectId);
        simpleDelete("user_rating", "last_rated_project_id", projectId);
        simpleDelete("contest_project_xref", "project_id", projectId);
        simpleDelete("project_review", "project_id", projectId);
        simpleDelete("submission", "project_id", projectId);
        simpleDelete("appeal", "project_id", projectId);
        simpleDelete("project_result", "project_id", projectId);
        simpleDelete("project", "project_id", projectId);
    }

    /**
     * Simple helper method to delete rows from a table using an id column
     *
     * @param table  the target table
     * @param column the target column
     * @param id     the the id value to delete
     * @throws SQLException if delete execution fails
     * @since 1.1.2
     */
    private void simpleDelete(String table, String column, long id) throws SQLException {
        PreparedStatement delete = prepareStatement("delete from " + table + " where " + column + " = ?", TARGET_DB);
        delete.setLong(1, id);
        long count = delete.executeUpdate();
        log.info("" + count + " records deleted in " + table + " table");
    }

    private static final DateFormat[] DATE_FORMATS = new DateFormat[]{
            new SimpleDateFormat("MM/dd/yyyy hh:mm", Locale.US),
            new SimpleDateFormat("MM.dd.yyyy hh:mm a", Locale.US),
            new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US),
    };

    private static Timestamp convertToDate(String str) {
        if (str == null) {
            return null;
        }
        for (int i = 0; i < DATE_FORMATS.length; i++) {
            try {
                return new Timestamp(DATE_FORMATS[i].parse(str).getTime());
            } catch (Exception e) {
            }
        }
        return null;
    }


    /**
     * <p/>
     * Gets all projects with a defined stage.
     * </p>
     *
     * @return a list containing the DR project IDs.
     * @since 1.1.0
     */
    private Map<Long, Integer> getDRProjects() throws Exception {
        PreparedStatement select = null;
        ResultSet rs = null;

        Map<Long, Integer> dRProjects = new HashMap<Long, Integer>();
        try {
            //get data from source DB
            final String SELECT = "select " +
                    "   project_id, stage_id " +
                    "from " +
                    "   project " +
                    "where " +
                    "   stage_id is not null and digital_run_ind = 1";

            select = prepareStatement(SELECT, TARGET_DB);

            rs = select.executeQuery();
            while (rs.next()) {
                dRProjects.put(rs.getLong("project_id"), rs.getInt("stage_id"));
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("could not get DR projects.");
        } finally {
            close(rs);
            close(select);
        }
        return dRProjects;
    }

    /**
     * <p/>
     * Load projects results to the DW.
     * </p>
     */
    public void doLoadProjectResults() throws Exception {
        log.info("load project results");
        ResultSet projectResults = null;
        PreparedStatement projectSelect = null;
        PreparedStatement resultInsert = null;
        PreparedStatement resultSelect = null;
        PreparedStatement delete = null;
        PreparedStatement dwDataSelect = null;
        PreparedStatement dwDataUpdate = null;
        PreparedStatement psNumRatings = null;
        ResultSet numRatings = null;
        ResultSet projects = null;
        ResultSet dwData = null;

        final String PROJECTS_SELECT =
                "select distinct pr.project_id " +
                        "from project_result pr, " +
                        "project p, " +
                        "project_info pi, " +
                        "project_info piel, " +
                        "comp_versions cv, " +
                        "comp_catalog cc " +
                        "where p.project_id = pr.project_id " +
                        "and p.project_id = pi.project_id " +
                        "and p.project_status_id <> 3 " +
                        "and p.project_category_id in (1, 2) " +
                        "and pi.project_info_type_id = 1 " +
                        "and cv.comp_vers_id= pi.value " +
                        "and cc.component_id = cv.component_id " +
                        "and piel.project_info_type_id = 14 " +
                        "and piel.value = 'Open' " +
                        "and p.project_id = piel.project_id " +
                        "and (p.modify_date > ? " +
                        "   OR cv.modify_date > ? " +
                        "   OR pi.modify_date > ? " +
                        "   OR cc.modify_date > ? " +
                        "   OR pr.modify_date > ?" +
                        (needLoadMovedProject() ? " OR p.modify_user <> 'Converter' " +
                                " OR pi.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String RESULT_SELECT =
                " select distinct pr.project_id " +
                        "    ,pr.user_id " +
                        "    ,case when exists(select '1' from submission s,upload u,resource r, resource_info ri  " +
                        "           where r.resource_id = ri.resource_id and ri.resource_info_type_id = 1 and u.resource_id = r.resource_id " +
                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and ri.value = pr.user_id and s.submission_status_id in (1,2,3,4))  " +
                        "    then 1 else 0 end as submit_ind " +
                        "    ,case when exists(select '1' from submission s,upload u,resource r, resource_info ri " +
                        "           where r.resource_id = ri.resource_id and ri.resource_info_type_id = 1 and u.resource_id = r.resource_id " +
                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and ri.value = pr.user_id and submission_status_id in (1,2,3,4)) then pr.valid_submission_ind  " +
                        "    else 0 end as valid_submission_ind " +
                        "    ,pr.raw_score " +
                        "    ,pr.final_score " +
                        "    ,(select max(create_time) from component_inquiry where project_id = p.project_id and user_id = pr.user_id)  as inquire_timestamp " +
                        "    ,r2.value registrationd_date" +
                        //todo improve this data in transactional.  many records are 11/2/2006 which isn't correct.
                        "    ,(select max(u.create_date) from submission s,upload u,resource r,resource_info ri " +
                        "           where ri.resource_id = r.resource_id and ri.resource_info_type_id = 1 and r.resource_id = u.resource_id " +
                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and ri.value = pr.user_id and submission_status_id <> 5) as submit_timestamp  " +
                        //todo this is no good, modify date shouldn't be used in this way.  it could be updated for any reason, so it's misleading.  perhaps we should
                        //todo use the actual review phase end (or the most recent one) instead
                        "    ,(select max(r.modify_date) from review r,scorecard s,submission sub, upload u,resource res,resource_info ri  " +
                        "           where ri.resource_id = res.resource_id and ri.resource_info_type_id = 1 and res.resource_id = u.resource_id " +
                        "           and u.upload_id = sub.upload_id and sub.submission_id = r.submission_id and r.scorecard_id = s.scorecard_id " +
                        "           and s.scorecard_type_id = 2 and r.committed = 1 and u.project_id = pr.project_id and ri.value = pr.user_id and sub.submission_status_id <> 5) as review_completed_timestamp " +
//                        "    ,(select count(*) from project_result pr where project_id = p.project_id and pr.passed_review_ind = 1) as num_submissions_passed_review " +
                        "       ,(select count(*) from submission s, upload u  " +
                        "         where u.upload_id = s.upload_id and project_id = p.project_id  " +
                        "         and submission_status_id in (1, 4) " +
                        "        ) as num_submissions_passed_review  " +
                        "    , pr.payment " +
                        "    , pr.old_rating " +
                        "    , pr.new_rating " +
                        "    , pr.old_reliability " +
                        "    , pr.new_reliability " +
                        "    , pr.placed " +
                        "    , pr.rating_ind " +
                        "    , pr.reliability_ind " +
                        "    , pr.passed_review_ind " +
                        "    , p.project_status_id as project_stat_id " +
                        "    , pr.point_adjustment" +
                        "    , pr.current_reliability_ind " +
                        "    , pr.reliable_submission_ind " +
                        "    , pr.rating_order " +
                        // first we try get the awarded points from project_info (DR points type)
                        // then, we try to get it from comp_version_dates
                        // finally, we get it from project_info (Payments type)
                        // note: changing this affects loadDRContestResults method's query.
                        "    , NVL((select value from project_info pi_dr where pi_dr.project_info_type_id = 30 and pi_dr.project_id = p.project_id), NVL ((select max(cvd.price) " +
                        "             from comp_version_dates cvd  " +
                        "             , project_info pi_ci " +
                        "             where pi_ci.value = cvd.comp_vers_id " +
                        "             and cvd.phase_id = p.project_category_id+111 " +
                        "             and pi_ci.project_id = p.project_id  " +
                        "             and pi_ci.project_info_type_id = 1), " +
                        "          (select value from project_info pi_am where pi_am.project_info_type_id = 16 and pi_am.project_id = p.project_id) " +
                        "                )) as amount  " +
                        "     , (select value from project_info where project_id = p.project_id and project_info_type_id = 26) as dr_ind " +
                        "    from project_result pr" +
                        "       ,project p" +
                        "       ,project_info pi" +
                        "       ,comp_catalog cc " +
                        "       ,resource r " +
                        "       ,resource_info r1 " +
                        "       ,outer resource_info r2 " +
                        "    where p.project_id = pr.project_id " +
                        "   and p.project_id = pi.project_id " +
                        "   and pi.project_info_type_id = 2 " +
                        "   and r.project_id = p.project_id " +
                        "   and r.resource_role_id = 1 " + // make sure only submitter is joined
                        "   and r.resource_id = r1.resource_id " +
                        "   and r1.resource_info_type_id = 1 " +
                        "   and r1.value = pr.user_id " +
                        "   and r.resource_id = r2.resource_id " +
                        "   and r2.resource_info_type_id = 6 " +
                        "   and cc.component_id = pi.value ";

        final String RESULT_INSERT =
                "insert into project_result (project_id, user_id, submit_ind, valid_submission_ind, raw_score, final_score, inquire_timestamp," +
                        " submit_timestamp, review_complete_timestamp, payment, old_rating, new_rating, old_reliability, new_reliability, placed, rating_ind, " +
                        "reliability_ind, passed_review_ind, points_awarded, final_points,current_reliability_ind, reliable_submission_ind, old_rating_id, " +
                        "new_rating_id, num_ratings, rating_order, potential_points) " +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?, ?)";

        final String DW_DATA_SELECT =
                "select sum(num_appeals) as num_appeals" +
                        " , sum(num_successful_appeals) as num_successful_appeals" +
                        " from submission_review " +
                        " where project_id = ? " +
                        " and user_id = ?";
        final String DW_DATA_UPDATE =
                "update project_result set num_appeals = ?, num_successful_appeals = ? where project_id = ? and user_id = ?";

        final String NUM_RATINGS =
                " select count(*) as count " +
                        "  , pr2.user_id " +
                        " from project_result pr2 " +
                        "  , project p1 " +
                        "  , project p2 " +
                        " where pr2.project_id = p2.project_id " +
                        " and p1.project_id = ? " +
                        " and pr2.rating_ind = 1 " +
                        " and p1.phase_id = p2.phase_id " +
                        " and (p2.rating_date < p1.rating_date " +
                        "  or (p2.rating_date = p1.rating_date and p2.project_id < p1.project_id)) " +
                        " group by pr2.user_id ";

        try {
            long start = System.currentTimeMillis();

            Map<Integer, ContestResultCalculator> stageCalculators = getStageCalculators();

            Map<Long, Integer> dRProjects = getDRProjects();


            projectSelect = prepareStatement(PROJECTS_SELECT, SOURCE_DB);
            projectSelect.setTimestamp(1, fLastLogTime);
            projectSelect.setTimestamp(2, fLastLogTime);
            projectSelect.setTimestamp(3, fLastLogTime);
            projectSelect.setTimestamp(4, fLastLogTime);
            projectSelect.setTimestamp(5, fLastLogTime);

            resultInsert = prepareStatement(RESULT_INSERT, TARGET_DB);

            dwDataSelect = prepareStatement(DW_DATA_SELECT, TARGET_DB);
            dwDataUpdate = prepareStatement(DW_DATA_UPDATE, TARGET_DB);

            psNumRatings = prepareStatement(NUM_RATINGS, TARGET_DB);

            StringBuffer buf = new StringBuffer(1000);
            buf.append(RESULT_SELECT);
            buf.append(" and p.project_id in (");

            StringBuffer delQuery = new StringBuffer(300);
            delQuery.append("delete from project_result where project_id in (");

            projects = projectSelect.executeQuery();
            boolean projectsFound = false;
            while (projects.next()) {
                projectsFound = true;
                buf.append(projects.getLong("project_id"));
                buf.append(",");
                delQuery.append(projects.getLong("project_id"));
                delQuery.append(",");
            }
            buf.setCharAt(buf.length() - 1, ')');
            delQuery.setCharAt(delQuery.length() - 1, ')');

            if (projectsFound) {


                resultSelect = prepareStatement(buf.toString(), SOURCE_DB);

                delete = prepareStatement(delQuery.toString(), TARGET_DB);
                delete.executeUpdate();

                int count = 0;
                //log.debug("PROCESSING PROJECT RESULTS " + project_id);

                projectResults = resultSelect.executeQuery();

                HashMap ratingsMap;
                while (projectResults.next()) {
                    long project_id = projectResults.getLong("project_id");

                    psNumRatings.clearParameters();
                    psNumRatings.setLong(1, project_id);
                    numRatings = psNumRatings.executeQuery();

                    ratingsMap = new HashMap();

                    while (numRatings.next()) {
                        ratingsMap.put(new Long(numRatings.getLong("user_id")), new Integer(numRatings.getInt("count")));
                    }

                    boolean passedReview = false;
                    try {
                        passedReview = projectResults.getInt("passed_review_ind") == 1;
                    } catch (Exception e) {
                        // do nothing
                    }

                    int placed = 0;
                    try {
                        placed = projectResults.getInt("placed");
                    } catch (Exception e) {
                        // do nothing
                    }

                    int numSubmissionsPassedReview = 0;
                    try {
                        numSubmissionsPassedReview = projectResults.getInt("num_submissions_passed_review");
                    } catch (Exception e) {
                        // do nothing
                    }

                    count++;

                    double pointsAwarded = 0;
                    double potentialPoints = 0;
                    Integer stage = dRProjects.get(project_id);
                    boolean hasDR = false;

                    if (stage != null &&
                            (projectResults.getInt("project_stat_id") == 7 ||  // COMPLETED
                                    projectResults.getInt("project_stat_id") == 1) && // ACTIVE
                            projectResults.getInt("rating_ind") == 1 &&
                            !"Off".equals(projectResults.getString("dr_ind"))) {

                        hasDR = true;
                        ContestResultCalculator crc = stageCalculators.get(stage);
                        if (crc != null) {
                            if (projectResults.getDouble("amount") < 0.01) {
                                log.warn("Project " + project_id + " has amount=0! Please check it.");
                            }
                            ProjectResult pr = new ProjectResult(project_id, projectResults.getInt("project_stat_id"), projectResults.getLong("user_id"),
                                    projectResults.getDouble("final_score"), placed,
                                    0, projectResults.getDouble("amount"), numSubmissionsPassedReview, passedReview);

                            if (projectResults.getInt("project_stat_id") == 7) {
                                pointsAwarded = crc.calculatePointsAwarded(pr);
                            } else {
                                potentialPoints = crc.calculatePotentialPoints(pr);
                            }
                        }
                    }
                    resultInsert.clearParameters();

                    resultInsert.setLong(1, project_id);
                    resultInsert.setLong(2, projectResults.getLong("user_id"));
                    resultInsert.setObject(3, projectResults.getObject("submit_ind"));
                    resultInsert.setObject(4, projectResults.getObject("valid_submission_ind"));
                    resultInsert.setObject(5, projectResults.getObject("raw_score"));
                    resultInsert.setObject(6, projectResults.getObject("final_score"));
                    if (projectResults.getObject("inquire_timestamp") != null) {
                        resultInsert.setObject(7, projectResults.getObject("inquire_timestamp"));
                    } else {
                        Timestamp regDate = convertToDate(projectResults.getString("registrationd_date"));
                        if (regDate != null) {
                            resultInsert.setTimestamp(7, regDate);
                        } else {
                            resultInsert.setNull(7, Types.TIMESTAMP);
                        }
                    }
                    resultInsert.setObject(8, projectResults.getObject("submit_timestamp"));
                    resultInsert.setObject(9, projectResults.getObject("review_completed_timestamp"));
                    resultInsert.setObject(10, projectResults.getObject("payment"));
                    resultInsert.setObject(11, projectResults.getObject("old_rating"));
                    resultInsert.setObject(12, projectResults.getObject("new_rating"));
                    resultInsert.setObject(13, projectResults.getObject("old_reliability"));
                    resultInsert.setObject(14, projectResults.getObject("new_reliability"));
                    resultInsert.setObject(15, projectResults.getObject("placed"));
                    resultInsert.setObject(16, projectResults.getObject("rating_ind"));
                    resultInsert.setObject(17, projectResults.getObject("reliability_ind"));
                    resultInsert.setObject(18, projectResults.getObject("passed_review_ind"));

                    if (hasDR) {
                        resultInsert.setDouble(19, pointsAwarded);
                        resultInsert.setDouble(20, pointsAwarded + projectResults.getInt("point_adjustment"));
                    } else {
                        resultInsert.setNull(19, Types.DECIMAL);
                        resultInsert.setNull(20, Types.DECIMAL);
                    }
                    resultInsert.setInt(21, projectResults.getInt("current_reliability_ind"));
                    resultInsert.setInt(22, projectResults.getInt("reliable_submission_ind"));

                    resultInsert.setInt(23, projectResults.getString("old_rating") == null ? -2 : projectResults.getInt("old_rating"));
                    resultInsert.setInt(24, projectResults.getString("new_rating") == null ? -2 : projectResults.getInt("new_rating"));
                    Long tempUserId = new Long(projectResults.getLong("user_id"));
                    int currNumRatings = 0;
                    if (ratingsMap.containsKey(tempUserId)) {
                        currNumRatings = ((Integer) ratingsMap.get(tempUserId)).intValue();
                    }
                    resultInsert.setInt(25, projectResults.getInt("rating_ind") == 1 ? currNumRatings + 1 : currNumRatings);
                    resultInsert.setObject(26, projectResults.getObject("rating_order"));

                    if (hasDR) {
                        resultInsert.setDouble(27, potentialPoints);
                    } else {
                        resultInsert.setNull(27, Types.DECIMAL);
                    }

                    //log.debug("before result insert");
                    //try {
                    resultInsert.executeUpdate();
                    // } catch(Exception e) {
                    // Notes: it seems same user will appear in resource table twice
                    //  log.debug("project_id: " + project_id + " user_id: " + projectResults.getLong("user_id"));
                    //  continue;
                    // }
                    //log.debug("after result insert");

                    //printLoadProgress(count, "project result");

                    dwDataSelect.clearParameters();
                    dwDataSelect.setLong(1, project_id);
                    dwDataSelect.setLong(2, projectResults.getLong("user_id"));
                    dwData = dwDataSelect.executeQuery();
                    if (dwData.next()) {
                        dwDataUpdate.clearParameters();
                        if (dwData.getString("num_appeals") == null) {
                            dwDataUpdate.setNull(1, Types.DECIMAL);
                        } else {
                            dwDataUpdate.setInt(1, dwData.getInt("num_appeals"));
                        }
                        if (dwData.getString("num_successful_appeals") == null) {
                            dwDataUpdate.setNull(2, Types.DECIMAL);
                        } else {
                            dwDataUpdate.setInt(2, dwData.getInt("num_successful_appeals"));
                        }
                        dwDataUpdate.setLong(3, project_id);
                        dwDataUpdate.setLong(4, projectResults.getLong("user_id"));
                        dwDataUpdate.executeUpdate();
                    }

                }
                log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
            } else {
                log.info("loaded " + 0 + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(delete);
            close(projectResults);
            close(projects);
            close(projectSelect);
            close(resultInsert);
            close(resultSelect);
            close(dwDataSelect);
            close(dwDataUpdate);
            close(dwData);

        }
    }

    /**
     * <p/>
     * Retrieves the seasons ID's from DB sorted by date.
     * </p>
     *
     * @return a sorted list by date of the seasons ID's.
     * @since 1.1.0
     */
    private List getSeasons() throws Exception {
        PreparedStatement selectSeasons = null;
        ResultSet rsSeasons = null;
        final String SELECT_SEASONS = "select season_id, start_calendar_id from season order by start_calendar_id asc";
        selectSeasons = prepareStatement(SELECT_SEASONS, TARGET_DB);
        rsSeasons = selectSeasons.executeQuery();
        List arrayList = new ArrayList();
        while (rsSeasons.next()) {
            arrayList.add(new Long(rsSeasons.getLong("season_id")));
            // log.info("New season: " + rsSeasons.getLong("season_id"));
        }
        return (arrayList);
    }


    /**
     * <p/>
     * Load rookies to the DW.
     *
     * @since 1.1.0
     *        </p>
     */
    public void doLoadRookies() throws Exception {
        log.info("regenerating rookies");
        PreparedStatement selectEdge = null;
        PreparedStatement selectUsers = null;
        PreparedStatement selectSubmissions = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        ResultSet rsEdge = null;
        ResultSet rsUsers = null;
        ResultSet rsSubmissions = null;

        try {
            long start = System.currentTimeMillis();

            final String SELECT_EDGE = "select pr.user_id, p.phase_id, count(*) num_passed_review from project_result pr, project p " +
                    "where pr.project_id = p.project_id and pr.passed_review_ind = 1 and DATE(p.posting_date) <= ? " +
                    "and not exists (select 'rookie_already_inserted' from rookie where " +
                    "user_id = pr.user_id and phase_id = p.phase_id and season_id = ?) " +
                    "group by pr.user_id, p.phase_id having count(*) < " + PASSED_REVIEW_THRESHOLD;

            // this query will retrieve users and their first season (when can be calculated), discriminating between
            // development and design.
            final String SELECT_USERS = "select distinct project_result.user_id, project.phase_id, " +
                    "( " +
                    "select distinct s.season_id from project p, season s, stage st " +
                    "where s.season_id = st.season_id and p.stage_id = st.stage_id and  " +
                    "p.posting_date = ( " +
                    "   select min(p.posting_date) from project p, project_result pr where   " +
                    "       p.project_id = pr.project_id and p.phase_id = project.phase_id and   " +
                    "       pr.passed_review_ind = 1 and user_id = project_result.user_id " +
                    ") " +
                    ") as first_season " +
                    "from project, project_result " +
                    "where project.project_id = project_result.project_id and " +
                    "exists     (    " +
                    "   select s.season_id from project p, season s, stage st " +
                    "   where s.season_id = st.season_id and p.stage_id = st.stage_id and  " +
                    "   p.posting_date = ( " +
                    "       select min(p.posting_date) from project p, project_result pr where   " +
                    "               p.project_id = pr.project_id and p.phase_id = project.phase_id and   " +
                    "               pr.passed_review_ind = 1 and user_id = project_result.user_id " +
                    "   ) " +
                    ")";

            // this query will retrieve the number of passing submissions for a particular user and phase
            // for his first and second season (previously calculated)
            final String SELECT_SUBMISSIONS = "select st.season_id, count(*) as num_submissions from project_result pr, " +
                    "project p, stage st " +
                    "where passed_review_ind = 1 and pr.project_id = p.project_id and p.stage_id = st.stage_id and " +
                    "user_id = ? and p.phase_id = ? and " +
                    "st.season_id in (?, ?) " +
                    "group by st.season_id " +
                    "order by st.season_id asc";

            final String DELETE = "delete from rookie";

            final String INSERT = "insert into rookie (user_id, season_id, phase_id, confirmed_ind) " +
                    "values (?, ?, ?, ?) ";

            selectEdge = prepareStatement(SELECT_EDGE, TARGET_DB);
            selectEdge.setDate(1, java.sql.Date.valueOf(FIRST_CUT_DATE));
            selectEdge.setLong(2, FIRST_SEASON_ID);
            selectUsers = prepareStatement(SELECT_USERS, TARGET_DB);
            delete = prepareStatement(DELETE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            selectSubmissions = prepareStatement(SELECT_SUBMISSIONS, TARGET_DB);

            // the process will delete all rookies and reload them again completly.
            delete.executeUpdate();

            Map<Integer, Integer> nextSeason = getRookieNextSeasonMap();

            // Stationary state:
            // - if the user had in his first season more than PASSED_REVIEW_THRESHOLD submissions,
            //   he is confirmed for that season.
            // - Otherwise he is potential for that season and confirmed for the next one.
            rsUsers = selectUsers.executeQuery();
            int count = 0;
            while (rsUsers.next()) {
                long subFirstSeason = 0;
                int firstSeason = rsUsers.getInt("first_season");
                Integer secondSeason = nextSeason.get(firstSeason);
                long userId = rsUsers.getLong("user_id");
                long phaseId = rsUsers.getLong("phase_id");

                // log.info("New rookie: " + userId + "(" + phaseId + ") - " + firstSeason);
                // log.info("Next season: "  +  secondSeason);

                selectSubmissions.setLong(1, userId);
                selectSubmissions.setLong(2, phaseId);
                selectSubmissions.setLong(3, firstSeason);
                selectSubmissions.setLong(4, secondSeason != null ? secondSeason : firstSeason);
                rsSubmissions = selectSubmissions.executeQuery();

                // this should be always, since if it's the first season, it must have submissions.
                if (rsSubmissions.next()) {
                    subFirstSeason = rsSubmissions.getLong("num_submissions");
                }

                // if in his first season, he had more than PASSED_REVIEW_THRESHOLD submissions, he is confirmed for that season.
                if (subFirstSeason >= PASSED_REVIEW_THRESHOLD) {
                    insert.setLong(1, userId);
                    insert.setLong(2, firstSeason);
                    insert.setLong(3, phaseId);
                    insert.setInt(4, CONFIRMED);
                    insert.executeUpdate();
                    count++;
                    // log.info("(1) First submissions: "  + subFirstSeason + " - Second submissions: " + subSecondSeason);
                } else {
                    // else, he is potential for firstSeason and confirmed for secondSeason
                    insert.setLong(1, userId);
                    insert.setLong(2, firstSeason);
                    insert.setLong(3, phaseId);
                    insert.setInt(4, POTENTIAL);
                    insert.executeUpdate();
                    count++;

                    if (secondSeason != null) {
                        insert.setLong(2, secondSeason);
                        insert.setInt(4, CONFIRMED);
                        insert.executeUpdate();

                        count++;
                    }

                    // log.info("(2) First submissions: "  + subFirstSeason + " - Second submissions: " + subSecondSeason);
                }
            }

            // Edge case: First rookies will be those having less than PASSED_REVIEW_THRESHOLD submissions prior to the
            // FIRST_CUT_DATE.
            rsEdge = selectEdge.executeQuery();
            while (rsEdge.next()) {
                insert.setLong(1, rsEdge.getLong("user_id"));
                // fixed to the first season
                insert.setLong(2, FIRST_SEASON_ID);
                insert.setLong(3, rsEdge.getLong("phase_id"));
                insert.setInt(4, CONFIRMED);

                insert.executeUpdate();
                count++;
            }

            log.info("" + count + " records generated in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Generation of rookie table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rsEdge);
            close(rsUsers);
            close(rsSubmissions);
            close(selectEdge);
            close(selectUsers);
            close(selectSubmissions);
            close(insert);
            close(delete);
        }
    }

    private Map<Integer, Integer> getRookieNextSeasonMap() throws Exception {
        Map<Integer, Integer> result = new HashMap<Integer, Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = prepareStatement("select season_id, next_rookie_season_id from season", SOURCE_DB);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString("next_rookie_season_id") != null) {
                    result.put(rs.getInt("season_id"), rs.getInt("next_rookie_season_id"));
                }
            }
        } finally {
            close(rs);
            close(ps);
        }
        return result;
    }

    public void doLoadSubmissionReview() throws Exception {
        log.info("load submission review");
        ResultSet submissionInfo = null;
        ResultSet projects = null;
        PreparedStatement submissionSelect = null;
        PreparedStatement submissionUpdate = null;
        PreparedStatement submissionInsert = null;
        PreparedStatement reviewRespSelect = null;
        PreparedStatement maxReviewRespSelect = null;
        PreparedStatement reviewRespUpdate = null;
        PreparedStatement projectSelect = null;

        final String SUBMISSION_SELECT =
                "select u.project_id " +
                        "  ,ri1.value as user_id " +
                        "  ,ri2.value as reviewer_id " +
                        "   ,r.initial_score as raw_score " +
                        "   ,r.score as final_score " +
                        "   ,(select count(*) from review_item_comment ric,review_item ri " +
                        "       where ric.review_item_id = ri.review_item_id and ri.review_id = r.review_id and ric.comment_type_id = 4) as num_appeals " +
                        "   ,(select count(*) from review_item_comment ric,review_item ri  " +
                        "       where ric.review_item_id = ri.review_item_id and ri.review_id = r.review_id and ric.comment_type_id = 4 and ric.extra_info = 'Succeeded')  " +
                        "       as num_successful_appeals " +
                        "   ,(select count(*) from review_item_comment ric,review_item ri " +
                        "       where ric.review_item_id = ri.review_item_id " +
                        "       and ri.review_id = r.review_id and ric.comment_type_id = 4 and ric.extra_info is not null)  " +
                        "       as non_null_successful_appeals " +
                        "   ,case  " +
                        "       when exists (select 1 from resource where resource_id = r.resource_id and resource_role_id = 7) then 1 " +
                        "       when exists (select 1 from resource where resource_id = r.resource_id and resource_role_id = 6) then 2 " +
                        "       when exists (select 1 from resource where resource_id = r.resource_id and resource_role_id = 5) then 3 " +
                        "       else 4 end as review_resp_id " +
                        "   ,r.review_id as scorecard_id " +
                        "   ,r.scorecard_id as scorecard_template_id " +
                        " from review r " +
                        "   ,submission s " +
                        "   ,upload u " +
                        "  ,project p " +
                        "  ,project_info piel " +
                        "  ,resource_info ri1" +
                        "  ,resource_info ri2" +
                        "   ,resource res " +
                        "where r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and res.resource_id = r.resource_id " +
                        "   and resource_role_id in (4, 5, 6, 7) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and u.project_id = ?" +
                        "   and (r.modify_date > ? " +
                        "   or s.modify_date > ? " +
                        "   or u.modify_date > ?" +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   or res.modify_date > ? " +
                        "  or (select max(ric.modify_date) " +
                        "       from review_item_comment ric, review_item ri" +
                        "       where ric.review_item_id = ri.review_item_id and ri.review_id = r.review_id and ric.comment_type_id = 4) > ? " +
                        (needLoadMovedProject() ? " OR r.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                ")"
                                : ")");
        ;

        final String SUBMISSION_UPDATE =
                "update submission_review set raw_score = ?, final_score = ?, num_appeals = ?, num_successful_appeals = ?, review_resp_id = ?,  scorecard_id = ?, scorecard_template_id = ? " +
                        "where project_id = ? and user_id = ? and reviewer_id = ?";

        final String SUBMISSION_INSERT =
                "insert into submission_review (project_id, user_id, reviewer_id, raw_score, final_score, num_appeals, " +
                        "num_successful_appeals, review_resp_id, scorecard_id, scorecard_template_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        final String REVIEW_RESP_4_COUNT =
                "select count(*) from submission_review where project_id = ? and user_id = ? and review_resp_id = 4";

        final String REVIEW_RESP_UPDATE =
                "update submission_review set review_resp_id = ? where project_id = ? and user_id = ? and reviewer_id = ?";

        final String MAX_REVIEW_RESP_ID_SELECT =
                "select max(review_resp_id) from submission_review where project_id = ? and user_id = ?";

        try {
            long start = System.currentTimeMillis();

            submissionSelect = prepareStatement(SUBMISSION_SELECT, SOURCE_DB);
            submissionUpdate = prepareStatement(SUBMISSION_UPDATE, TARGET_DB);
            submissionInsert = prepareStatement(SUBMISSION_INSERT, TARGET_DB);
            reviewRespSelect = prepareStatement(REVIEW_RESP_4_COUNT, TARGET_DB);
            maxReviewRespSelect = prepareStatement(MAX_REVIEW_RESP_ID_SELECT, TARGET_DB);
            reviewRespUpdate = prepareStatement(REVIEW_RESP_UPDATE, TARGET_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            int count = 0;
            //log.debug("PROCESSING PROJECT RESULTS " + project_id);

            projects = projectSelect.executeQuery();

            Map reviewerResps = new HashMap();
            while (projects.next()) {
                submissionSelect.clearParameters();
                submissionSelect.setLong(1, projects.getLong("project_id"));
                submissionSelect.setTimestamp(2, fLastLogTime);
                submissionSelect.setTimestamp(3, fLastLogTime);
                submissionSelect.setTimestamp(4, fLastLogTime);
                submissionSelect.setTimestamp(5, fLastLogTime);
                submissionSelect.setTimestamp(6, fLastLogTime);
                submissionSelect.setTimestamp(7, fLastLogTime);
                submissionSelect.setTimestamp(8, fLastLogTime);
                //log.debug("before submission select");
                submissionInfo = submissionSelect.executeQuery();
                //log.debug("after submission select");

                while (submissionInfo.next()) {

                    submissionUpdate.clearParameters();

                    int reviewRespId = submissionInfo.getInt("review_resp_id");

                    submissionUpdate.setObject(1, submissionInfo.getObject("raw_score"));
                    submissionUpdate.setObject(2, submissionInfo.getObject("final_score"));
                    submissionUpdate.setObject(3, submissionInfo.getObject("num_appeals"));
                    if (submissionInfo.getInt("non_null_successful_appeals") == 0) {
                        submissionUpdate.setNull(4, Types.DECIMAL);
                    } else {
                        submissionUpdate.setInt(4, submissionInfo.getInt("num_successful_appeals"));
                    }
                    submissionUpdate.setInt(5, reviewRespId);
                    submissionUpdate.setObject(6, submissionInfo.getObject("scorecard_id"));
                    submissionUpdate.setObject(7, submissionInfo.getObject("scorecard_template_id"));
                    submissionUpdate.setLong(8, submissionInfo.getLong("project_id"));
                    submissionUpdate.setLong(9, submissionInfo.getLong("user_id"));
                    submissionUpdate.setLong(10, submissionInfo.getLong("reviewer_id"));

                    //log.debug("before submission update");
                    int retVal = submissionUpdate.executeUpdate();
                    //log.debug("after submission update");

                    if (retVal == 0) {
                        submissionInsert.clearParameters();

                        submissionInsert.setLong(1, submissionInfo.getLong("project_id"));
                        submissionInsert.setLong(2, submissionInfo.getLong("user_id"));
                        submissionInsert.setLong(3, submissionInfo.getLong("reviewer_id"));
                        submissionInsert.setObject(4, submissionInfo.getObject("raw_score"));
                        submissionInsert.setObject(5, submissionInfo.getObject("final_score"));
                        submissionInsert.setObject(6, submissionInfo.getObject("num_appeals"));
                        if (submissionInfo.getInt("non_null_successful_appeals") == 0) {
                            submissionInsert.setNull(7, Types.DECIMAL);
                        } else {
                            submissionInsert.setObject(7, submissionInfo.getObject("num_successful_appeals"));
                        }

                        submissionInsert.setInt(8, reviewRespId);
                        submissionInsert.setObject(9, submissionInfo.getObject("scorecard_id"));
                        submissionInsert.setObject(10, submissionInfo.getObject("scorecard_template_id"));

                        //log.debug("before submission insert");
                        submissionInsert.executeUpdate();
                        //log.debug("after submission insert");
                    }

                    if (reviewRespId == 4) {
                        // need rearrange review_resp_id
                        long projectId = submissionInfo.getLong("project_id");
                        long userId = submissionInfo.getLong("user_id");
                        long reviewerId = submissionInfo.getLong("reviewer_id");
                        String key = String.valueOf(projectId) + "-" + String.valueOf(reviewerId);
                        Integer value = (Integer) reviewerResps.get(key);
                        if (value == null) {
                            // check current count which review_resp_id is 4 with project_id, user_id
                            reviewRespSelect.clearParameters();
                            reviewRespSelect.setLong(1, projectId);
                            reviewRespSelect.setLong(2, userId);
                            ResultSet rs = reviewRespSelect.executeQuery();
                            rs.next();

                            int countResp = rs.getInt(1);
                            if (countResp > 1) {
                                // the count of review_resp_id is 4 is large than 1
                                maxReviewRespSelect.clearParameters();
                                maxReviewRespSelect.setLong(1, projectId);
                                maxReviewRespSelect.setLong(2, userId);
                                rs = maxReviewRespSelect.executeQuery();
                                rs.next();
                                int maxRespId = rs.getInt(1);
                                maxRespId++;
                                if (maxRespId > 6) {
                                    maxRespId = 5;
                                }
                                reviewRespId = maxRespId;
                            }
                        } else {
                            reviewRespId = value.intValue();
                        }

                        if (reviewRespId != 4) {
                            reviewRespUpdate.clearParameters();
                            reviewRespUpdate.setLong(1, reviewRespId);
                            reviewRespUpdate.setLong(2, projectId);
                            reviewRespUpdate.setLong(3, userId);
                            reviewRespUpdate.setLong(4, reviewerId);
                            reviewRespUpdate.executeUpdate();
                        }
                        reviewerResps.put(key, new Integer(reviewRespId));
                    }
                    count++;
                    printLoadProgress(count, "submission review");
                }
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'submission review' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(projects);
            close(submissionInfo);
            close(submissionSelect);
            close(submissionUpdate);
            close(submissionInsert);
            close(reviewRespSelect);
            close(maxReviewRespSelect);
            close(reviewRespUpdate);
            close(projectSelect);
        }
    }

    public void doLoadSubmissionScreening() throws Exception {
        log.info("load submission screening");

        ResultSet screenings = null;
        PreparedStatement screeningUpdate = null;
        PreparedStatement screeningInsert = null;
        PreparedStatement screeningSelect = null;


        final String SCREENING_SELECT =
                "select u.project_id " +
                        "   ,ri1.value as user_id " +
                        "   ,ri2.value as reviewer_id " +
                        "   ,r.score as final_score " +
                        "   ,r.review_id as scorecard_id " +
                        "   ,r.scorecard_id as scorecard_template_id " +
                        "from review r," +
                        "   submission s," +
                        "   upload u," +
                        "   project p, " +
                        "   project_info piel, " +
                        "   resource_info ri1," +
                        "   resource_info ri2," +
                        "   resource res " +
                        "where r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and res.resource_id = r.resource_id " +
                        "   and resource_role_id in (2, 3) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and (r.modify_date > ? " +
                        "   OR s.modify_date > ? " +
                        "   or u.modify_date > ? " +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   or res.modify_date > ? " +
                        (needLoadMovedProject() ? " OR r.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String SCREENING_UPDATE =
                "update submission_screening set reviewer_id = ?, final_score = ?, scorecard_id = ?, scorecard_template_id = ? " +
                        "where project_id = ? and user_id = ?";

        final String SCREENING_INSERT =
                "insert into submission_screening (project_id, user_id, reviewer_id, final_score, scorecard_id, scorecard_template_id) " +
                        "values (?, ?, ?, ?, ?, ?)";

        try {
            long start = System.currentTimeMillis();

            screeningSelect = prepareStatement(SCREENING_SELECT, SOURCE_DB);
            screeningSelect.setTimestamp(1, fLastLogTime);
            screeningSelect.setTimestamp(2, fLastLogTime);
            screeningSelect.setTimestamp(3, fLastLogTime);
            screeningSelect.setTimestamp(4, fLastLogTime);
            screeningSelect.setTimestamp(5, fLastLogTime);
            screeningSelect.setTimestamp(6, fLastLogTime);
            screeningUpdate = prepareStatement(SCREENING_UPDATE, TARGET_DB);
            screeningInsert = prepareStatement(SCREENING_INSERT, TARGET_DB);

            int count = 0;

            screenings = screeningSelect.executeQuery();

            while (screenings.next()) {
                long project_id = screenings.getLong("project_id");
                count++;
                screeningUpdate.clearParameters();


                screeningUpdate.setObject(1, screenings.getObject("reviewer_id"));
                screeningUpdate.setObject(2, screenings.getObject("final_score"));
                screeningUpdate.setObject(3, screenings.getObject("scorecard_id"));
                screeningUpdate.setObject(4, screenings.getObject("scorecard_template_id"));
                screeningUpdate.setLong(5, project_id);
                screeningUpdate.setLong(6, screenings.getLong("user_id"));

                int retVal = screeningUpdate.executeUpdate();

                if (retVal == 0) {

                    screeningInsert.clearParameters();

                    screeningInsert.setLong(1, project_id);
                    screeningInsert.setLong(2, screenings.getLong("user_id"));
                    screeningInsert.setObject(3, screenings.getObject("reviewer_id"));
                    screeningInsert.setObject(4, screenings.getObject("final_score"));
                    screeningInsert.setObject(5, screenings.getObject("scorecard_id"));
                    screeningInsert.setObject(6, screenings.getObject("scorecard_template_id"));

                    screeningInsert.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of submission_screening table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(screenings);
            close(screeningUpdate);
            close(screeningInsert);
            close(screeningSelect);
        }
    }


    public void doLoadContestProject() throws Exception {
        log.info("load contest project");
        //load contest_project_xref
        long start = System.currentTimeMillis();

        final String SELECT = "select x.contest_id, x.project_id  " +
                "from contest_project_xref x, project p, project_info piel " +
                "where x.project_id = ? and p.project_id = x.project_id " +
                "and piel.project_info_type_id = 14 and piel.value = 'Open' and p.project_id = piel.project_id " +
                " and (p.modify_date > ? or x.create_date > ?)";

        final String INSERT = "insert into contest_project_xref (contest_id, project_id) " +
                "values (?, ?)";
        final String DELETE = "delete from contest_project_xref where contest_id = ? and project_id = ?";


        PreparedStatement delete = null;
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement projectSelect = null;
        ResultSet rs = null;
        ResultSet projects = null;

        long projectId = 0;
        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            insert = prepareStatement(INSERT, TARGET_DB);
            delete = prepareStatement(DELETE, TARGET_DB);

            projects = projectSelect.executeQuery();
            int count = 0;
            while (projects.next()) {
                projectId = projects.getLong("project_id");
                select.clearParameters();
                select.setLong(1, projectId);
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);

                rs = select.executeQuery();
                while (rs.next()) {
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("contest_id"));
                    insert.setLong(2, projectId);
                    try {
                        insert.executeUpdate();
                    } catch (SQLException e) {
                        delete.setLong(1, rs.getLong("contest_id"));
                        delete.setLong(2, projectId);
                        delete.executeUpdate();
                        insert.executeUpdate();
                    }
                    count++;

                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new Exception("Load of 'contest_project_xref' failed on project " + projectId);
        } finally {
            close(rs);
            close(projects);
            close(delete);
            close(select);
            close(insert);
            close(projectSelect);
        }
    }


    public void doLoadContests() throws Exception {
        log.info("load contests");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();
            final String SELECT = "select c.contest_id, c.contest_name, " +
                    "c.start_date as contest_start_timestamp, " +
                    "c.end_date as contest_end_timestamp, " +
                    "c.contest_type_id, " +
                    "ct.contest_type_desc," +
                    "c.phase_id," +
                    "c.event_id  " +
                    "from contest c, " +
                    "contest_type_lu ct " +
                    "where ct.contest_type_id = c.contest_type_id " +
                    "and (c.modify_date > ?)";
            final String UPDATE = "update contest set contest_name = ?,  contest_start_timestamp = ?, contest_end_timestamp = ?, contest_type_id = ?, contest_type_desc = ?, phase_id = ?, event_id = ? " +
                    " where contest_id = ? ";
            final String INSERT = "insert into contest (contest_id, contest_name, contest_start_timestamp, contest_end_timestamp, contest_type_id, contest_type_desc, phase_id, event_id) " +
                    "values (?, ?, ?, ?, ?, ?, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //log.debug("PROCESSING CONTEST " + rs.getInt("contest_id"));

                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("contest_name"));
                update.setObject(2, rs.getObject("contest_start_timestamp"));
                update.setObject(3, rs.getObject("contest_end_timestamp"));
                update.setObject(4, rs.getObject("contest_type_id"));
                update.setObject(5, rs.getObject("contest_type_desc"));
                update.setObject(6, rs.getObject("phase_id"));
                update.setObject(7, rs.getObject("event_id"));
                update.setLong(8, rs.getLong("contest_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("contest_id"));
                    insert.setObject(2, rs.getObject("contest_name"));
                    insert.setObject(3, rs.getObject("contest_start_timestamp"));
                    insert.setObject(4, rs.getObject("contest_end_timestamp"));
                    insert.setObject(5, rs.getObject("contest_type_id"));
                    insert.setObject(6, rs.getObject("contest_type_desc"));
                    insert.setObject(7, rs.getObject("phase_id"));
                    insert.setObject(8, rs.getObject("event_id"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contest' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }

    }

    public void doLoadContestPrize() throws Exception {
        log.info("load contest prize");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();
            final String SELECT =
                    "select cp.contest_prize_id, cp.contest_id, cp.prize_type_id, " +
                            "ptl.prize_type_desc, cp.place, cp.prize_amount, cp.prize_desc " +
                            "from contest_prize cp, prize_type_lu ptl " +
                            "where cp.prize_type_id = ptl.prize_type_id " +
                            "and (cp.modify_date > ?) ";

            final String INSERT = "insert into contest_prize (contest_prize_id, contest_id, prize_type_id, " +
                    "prize_type_desc, place, prize_amount, prize_desc) " +
                    "values (?, ?, ?, ?, ?, ?, ?) ";

            final String UPDATE = "update contest_prize set contest_id = ?, prize_type_id = ?,  prize_type_desc = ?, " +
                    "place = ?, prize_amount = ?, prize_desc = ? " +
                    " where contest_prize_id = ? ";

            //load prizes
            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            insert = prepareStatement(INSERT, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("contest_id"));
                update.setObject(2, rs.getObject("prize_type_id"));
                update.setObject(3, rs.getObject("prize_type_desc"));
                update.setObject(4, rs.getObject("place"));
                update.setObject(5, rs.getObject("prize_amount"));
                update.setObject(6, rs.getObject("prize_desc"));
                update.setLong(7, rs.getLong("contest_prize_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("contest_prize_id"));
                    insert.setLong(2, rs.getLong("contest_id"));
                    insert.setObject(3, rs.getObject("prize_type_id"));
                    insert.setObject(4, rs.getObject("prize_type_desc"));
                    insert.setObject(5, rs.getObject("place"));
                    insert.setObject(6, rs.getObject("prize_amount"));
                    insert.setObject(7, rs.getObject("prize_desc"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contest_prize' table failed.\n" +
                    sqle.getMessage());

        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }


    public void doLoadUserContestPrize() throws Exception {
        log.info("load user contest prize");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();
            final String SELECT =
                    "select ucp.user_id, " +
                            "cp.contest_id, " +
                            "cp.prize_type_id, " +
                            "cp.prize_desc as prize_description, " +
                            "cp.place, " +
                            "cp.prize_amount, " +
                            "ucp.payment as prize_payment " +
                            "from user_contest_prize ucp, " +
                            "contest_prize cp, " +
                            "prize_type_lu pt " +
                            "where cp.contest_prize_id = ucp.contest_prize_id " +
                            "and pt.prize_type_id = cp.prize_type_id " +
                            "and (cp.modify_date > ?) ";
            final String INSERT = "insert into user_contest_prize (contest_id, user_id, prize_type_id, " +
                    "prize_description, place, prize_amount, prize_payment) " +
                    "values (?, ?, ?, ?, ?, ?, ?) ";

            final String UPDATE = "update user_contest_prize set prize_type_id = ?,  prize_description = ?, " +
                    "place = ?, prize_amount = ?, prize_payment = ? " +
                    " where contest_id = ? and user_id = ?";

            //load prizes
            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            insert = prepareStatement(INSERT, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("prize_type_id"));
                update.setObject(2, rs.getObject("prize_description"));
                update.setObject(3, rs.getObject("place"));
                update.setObject(4, rs.getObject("prize_amount"));
                update.setObject(5, rs.getObject("prize_payment"));
                update.setLong(6, rs.getLong("contest_id"));
                update.setLong(7, rs.getLong("user_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("contest_id"));
                    insert.setLong(2, rs.getLong("user_id"));
                    insert.setObject(3, rs.getObject("prize_type_id"));
                    insert.setObject(4, rs.getObject("prize_description"));
                    insert.setObject(5, rs.getObject("place"));
                    insert.setObject(6, rs.getObject("prize_amount"));
                    insert.setObject(7, rs.getObject("prize_payment"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_contest_prize' table failed.\n" +
                    sqle.getMessage());

        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }


    public void doLoadEvent() throws Exception {
        log.info("load event");
        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();

            final String SELECT =
                    "select e.event_desc as event_name, e.event_id " +
                            "from event e where e.event_type_id = 5 and modify_date > ?";

            final String UPDATE = "update event set event_name = ? " +
                    " where event_id = ? ";

            final String INSERT = "insert into event (event_id, event_name) " +
                    "values (?, ?) ";


            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //log.debug("PROCESSING EVENT " + rs.getInt("event_id"));

                //update record, if 0 rows affected, insert record
                update.clearParameters();
                update.setObject(1, rs.getObject("event_name"));
                update.setLong(2, rs.getLong("event_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("event_id"));
                    insert.setObject(2, rs.getObject("event_name"));

                    insert.executeUpdate();
                }

            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'events' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }


    public void doLoadUserEvent() throws Exception {
        log.info("load user event");
        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet rs = null;

        try {

            long start = System.currentTimeMillis();
            final String SELECT = "select create_date, event_id, user_id " +
                    "from user_event_xref where modify_date > ?";
            final String UPDATE = "update user_event_xref set create_date = ? " +
                    " where event_id = ? and user_id = ?";

            final String INSERT = "insert into user_event_xref (event_id, user_id, create_date) " +
                    "values (?, ?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
                //log.debug("PROCESSING EVENT " + rs.getInt("event_id"));

                update.clearParameters();
                update.setObject(1, rs.getObject("create_date"));
                update.setLong(2, rs.getLong("event_id"));
                update.setLong(3, rs.getLong("user_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.clearParameters();
                    insert.setLong(1, rs.getLong("event_id"));
                    insert.setLong(2, rs.getLong("user_id"));
                    insert.setObject(3, rs.getObject("create_date"));

                    insert.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_event_xref' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }


    /**
     * Get a sorted list (by rating desc) of all the active coders
     * and their ratings.
     *
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List getCurrentRatings() throws Exception {
        StringBuffer query;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);


            query.append(" select ur.user_id");
            query.append(" , ur.rating");
            query.append(" , ur.phase_id");
            query.append(" , case");
            query.append(" when ur.phase_id = 113 and exists (select '1' from active_developers adev where adev.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_dev");
            query.append(" , case");
            query.append(" when ur.phase_id = 112 and exists (select '1' from active_designers ades where ades.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_des");
            query.append(" , cs.school_id");
            query.append(" , c.coder_type_id");
            query.append(" , c.comp_country_code");
            query.append(" from user_rating ur");
            query.append(" , outer current_school cs");
            query.append(" , coder c");
            query.append(" where ur.user_id = cs.coder_id");
            query.append(" and ur.user_id = c.coder_id");
            query.append(" and c.status = 'A'");

            psSel = prepareStatement(query.toString(), TARGET_DB);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                //pros
                if (rs.getInt("coder_type_id") == 2) {
                    if (rs.getInt("phase_id") == 113) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_dev") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_des") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    }
                } else {
                    //students
                    if (rs.getInt("phase_id") == 113) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_dev") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_des") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    }
                }
            }


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Getting list of ratings failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }

    private class CoderRating implements Comparable {
        private long coderId = 0;
        private int rating = 0;
        private long schoolId = 0;
        private boolean active = false;
        private int phaseId = 0;
        private String countryCode = null;

        CoderRating(long coderId, int rating, long schoolId, boolean active, int phaseId, String countryCode) {
            this.coderId = coderId;
            this.rating = rating;
            this.schoolId = schoolId;
            this.active = active;
            this.phaseId = phaseId;
            this.countryCode = countryCode;
        }

        CoderRating(long coderId, int rating, boolean active, int phaseId, String countryCode) {
            this.coderId = coderId;
            this.rating = rating;
            this.active = active;
            this.phaseId = phaseId;
            this.countryCode = countryCode;
        }

        public int compareTo(Object other) {
            if (((CoderRating) other).getRating() > rating)
                return 1;
            else if (((CoderRating) other).getRating() < rating)
                return -1;
            else
                return 0;
        }

        long getCoderId() {
            return coderId;
        }

        int getRating() {
            return rating;
        }

        void setCoderId(long coderId) {
            this.coderId = coderId;
        }

        void setRating(int rating) {
            this.rating = rating;
        }

        long getSchoolId() {
            return schoolId;
        }

        void setSchoolId(long schoolId) {
            this.schoolId = schoolId;
        }

        boolean isActive() {
            return active;
        }

        void setActive(boolean active) {
            this.active = active;
        }

        int getPhaseId() {
            return phaseId;
        }

        void setPhaseId(int phaseId) {
            this.phaseId = phaseId;
        }

        String getCountryCode() {
            return countryCode;
        }

        void setCountryCode(String countryCode) {
            this.countryCode = countryCode;
        }

        public String toString() {
            return coderId + ":" + rating + ":" + schoolId + ":" + active + ":" + phaseId;
        }
    }

    private void doLoadRank(int phaseId, int rankTypeId, List list) throws Exception {
        log.info("load rank");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;

        try {

            long start = System.currentTimeMillis();
            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM user_rank");
            query.append(" WHERE phase_id = " + phaseId);
            query.append("  AND user_rank_type_id = " + rankTypeId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO user_rank (user_id, percentile, rank, phase_id, user_rank_type_id)");
            query.append(" VALUES (?, ?, ?, " + phaseId + ", " + rankTypeId + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            /* coder_rank table should be kept "up-to-date" so get the most recent stuff
             * from the rating table
             */
            ArrayList ratings = new ArrayList(list.size() / 2);
            CoderRating cr = null;
            for (int i = 0; i < list.size(); i++) {
                cr = (CoderRating) list.get(i);
                if (cr.getPhaseId() == phaseId) {
                    if ((rankTypeId == ACTIVE_RATING_RANK_TYPE_ID && cr.isActive()) ||
                            rankTypeId != ACTIVE_RATING_RANK_TYPE_ID) {
                        ratings.add(cr);
                    }
                }
            }
            Collections.sort(ratings);

            coderCount = ratings.size();

            psDel.executeUpdate();

            int i = 0;
            int rating = 0;
            int rank = 0;
            int size = ratings.size();
            int tempRating;
            long tempCoderId;
            for (int j = 0; j < size; j++) {
                i++;
                tempRating = ((CoderRating) ratings.get(j)).getRating();
                tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setLong(1, tempCoderId);
                psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                psIns.setInt(3, rank);
                count += psIns.executeUpdate();
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_rank' table failed for rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }

    /**
     * Loads the school_coder_rank table with information about
     * rating rank within a school.
     */
    private void loadSchoolRatingRank(int phaseId, int rankTypeId, List list) throws Exception {
        log.debug("loadSchoolRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {
            long start = System.currentTimeMillis();
            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM school_user_rank");
            query.append(" WHERE user_rank_type_id = " + rankTypeId);
            query.append(" and phase_id = " + phaseId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO school_user_rank (user_id, percentile, rank, rank_no_tie, school_id, user_rank_type_id, phase_id)");
            query.append(" VALUES (?, ?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();

            HashMap schools = new HashMap();
            Long tempId;
            List tempList;
            CoderRating temp;
            /**
             * iterate through our big list and pluck out only those where:
             * the phase lines up
             * they have a school
             * and their status lines up
             */
            for (int i = 0; i < list.size(); i++) {
                temp = (CoderRating) list.get(i);
                if (phaseId == temp.getPhaseId() && temp.getSchoolId() > 0) {
                    if ((rankTypeId == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankTypeId != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempId = new Long(temp.getSchoolId());
                        if (schools.containsKey(tempId)) {
                            tempList = (List) schools.get(tempId);
                        } else {
                            tempList = new ArrayList(10);
                        }
                        tempList.add(list.get(i));
                        schools.put(tempId, tempList);
                        tempList = null;
                    }
                }
            }

            for (Iterator it = schools.entrySet().iterator(); it.hasNext();) {
                ratings = (List) ((Map.Entry) it.next()).getValue();
                Collections.sort(ratings);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                long tempCoderId = 0;
                for (int j = 0; j < size; j++) {
                    i++;
                    tempRating = ((CoderRating) ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setLong(1, tempCoderId);
                    psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j + 1);
                    psIns.setLong(5, ((CoderRating) ratings.get(j)).getSchoolId());
                    psIns.setInt(6, rankTypeId);
                    psIns.setInt(7, ((CoderRating) ratings.get(j)).getPhaseId());
                    count += psIns.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'school_coder_rank' table failed for school coder rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psIns);
            close(psDel);
        }

    }

    private void loadCountryRatingRank(int phaseId, int rankTypeId, List list) throws Exception {
        log.debug("loadCountryRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount;
        List ratings;

        try {
            long start = System.currentTimeMillis();
            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM country_user_rank");
            query.append(" WHERE user_rank_type_id = " + rankTypeId);
            query.append(" and phase_id = " + phaseId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO country_user_rank (user_id, percentile, rank, rank_no_tie, user_rank_type_id, phase_id, country_code)");
            query.append(" VALUES (?, ?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();

            HashMap countries = new HashMap();
            String tempCode = null;
            List tempList = null;
            CoderRating temp = null;
            /**
             * iterate through our big list and pluck out only those where:
             * the phase lines up
             * they have a school
             * and their status lines up
             */
            for (int i = 0; i < list.size(); i++) {
                temp = (CoderRating) list.get(i);
                if (temp.getPhaseId() == phaseId) {
                    if ((rankTypeId == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankTypeId != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempCode = temp.getCountryCode();
                        if (countries.containsKey(tempCode)) {
                            tempList = (List) countries.get(tempCode);
                        } else {
                            tempList = new ArrayList(100);
                        }
                        tempList.add(list.get(i));
                        countries.put(tempCode, tempList);
                        tempList = null;
                    }
                }
            }

            for (Iterator it = countries.entrySet().iterator(); it.hasNext();) {
                ratings = (List) ((Map.Entry) it.next()).getValue();
                Collections.sort(ratings);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating;
                long tempCoderId;
                for (int j = 0; j < size; j++) {
                    i++;
                    tempRating = ((CoderRating) ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setLong(1, tempCoderId);
                    psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j + 1);
                    psIns.setInt(5, rankTypeId);
                    psIns.setInt(6, ((CoderRating) ratings.get(j)).getPhaseId());
                    psIns.setString(7, ((CoderRating) ratings.get(j)).getCountryCode());
                    count += psIns.executeUpdate();
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'school_coder_rank' table failed for school coder rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psIns);
            close(psDel);
        }

    }


    public void doLoadScorecardTemplate() throws Exception {
        log.info("load scorecard template");
        ResultSet rs = null;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;


        final String SELECT = "select scorecard_id as scorecard_template_id, " +
                "s.scorecard_type_id,   " +
                "stl.name as scorecard_type_desc " +
                "from scorecard s, " +
                "   scorecard_type_lu stl " +
                "where s.scorecard_type_id = stl.scorecard_type_id " +
                "   and (s.modify_date > ?  " +
                "   or stl.modify_date > ? " +
                (needLoadMovedProject() ? " OR s.modify_user <> 'Converter' " +
                        " OR stl.modify_user <> 'Converter' " +
                        ")"
                        : ")"); // TODO make sure all scorecard that moved are loaded which modify date is too earlier

        final String UPDATE =
                "update scorecard_template set scorecard_type_id=?, scorecard_type_desc=? where scorecard_template_id = ?";

        final String INSERT =
                "insert into scorecard_template (scorecard_type_id, scorecard_type_desc, scorecard_template_id) values (?, ?, ?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            rs = select.executeQuery();

            while (rs.next()) {

                update.clearParameters();

                update.setObject(1, rs.getObject("scorecard_type_id"));
                update.setObject(2, rs.getObject("scorecard_type_desc"));
                update.setLong(3, rs.getLong("scorecard_template_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    insert.setObject(1, rs.getObject("scorecard_type_id"));
                    insert.setObject(2, rs.getObject("scorecard_type_desc"));
                    insert.setLong(3, rs.getLong("scorecard_template_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'scorecard_template' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }


    public void doLoadEvaluationLU() throws Exception {
        log.info("load evaluation_lu");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;


        final String SELECT = "select evaluation_id, " +
                "evaluation_name as evaluation_desc, " +
                "value as evaluation_value, " +
                "evaluation_type_id, " +
                "(select eval_type_name from evaluation_type where evaluation_type_id = e.evaluation_type_id) as evaluation_type_desc " +
                "from evaluation e ";

        final String UPDATE =
                "update evaluation_lu set evaluation_desc=?,evaluation_value=?,evaluation_type_id=?, evaluation_type_desc=? where evaluation_id = ?";

        final String INSERT =
                "insert into evaluation_lu (evaluation_desc, evaluation_value, evaluation_type_id,evaluation_type_desc,  evaluation_id) values (?, ?, ?, ?, ?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            rs = select.executeQuery();

            while (rs.next()) {

                update.clearParameters();

                update.setObject(1, rs.getObject("evaluation_desc"));
                update.setObject(2, rs.getObject("evaluation_value"));
                update.setObject(3, rs.getObject("evaluation_type_id"));
                update.setObject(4, rs.getObject("evaluation_type_desc"));
                update.setLong(5, rs.getLong("evaluation_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    insert.setObject(1, rs.getObject("evaluation_desc"));
                    insert.setObject(2, rs.getObject("evaluation_value"));
                    insert.setObject(3, rs.getObject("evaluation_type_id"));
                    insert.setObject(4, rs.getObject("evaluation_type_desc"));
                    insert.setLong(5, rs.getLong("evaluation_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'evaluation_lu' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }


    public void doLoadScorecardQuestion() throws Exception {
        log.info("load scorecard_question");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;


        final String SELECT =
                "select qt.scorecard_question_id " +
                        "   ,sg.scorecard_id as scorecard_template_id " +
                        "   ,qt.description || qt.guideline as question_text " +
                        "   ,qt.weight as question_weight " +
                        "   ,qt.scorecard_section_id as section_id " +
                        "   ,ss.name as section_desc " +
                        "   ,(ss.weight*sg.weight/100) as section_weight " +
                        "   ,ss.scorecard_group_id as section_group_id " +
                        "   ,sg.name as section_group_desc " +
                        "   ,(sg.sort + 1) || '.' || (ss.sort + 1) || '.' || (qt.sort + 1)  as question_desc " +
                        "   ,sg.sort + 1 as group_seq_loc " +
                        "   ,ss.sort + 1 as section_seq_loc  " +
                        "   ,qt.sort + 1 as question_seq_loc " +
                        "from scorecard_question qt," +
                        "   scorecard_section ss," +
                        "   scorecard_group sg " +
                        "where qt.scorecard_section_id = ss.scorecard_section_id " +
                        "   and ss.scorecard_group_id = sg.scorecard_group_id " +
                        "   and (qt.modify_date > ? " +
                        "   or ss.modify_date > ? " +
                        "   or sg.modify_date > ? " +
                        (needLoadMovedProject() ? " OR qt.modify_user <> 'Converter' " +
                                " OR ss.modify_user <> 'Converter' " +
                                " OR sg.modify_user <> 'Converter' " +
                                ")"
                                : ")") +
                        "    order by scorecard_template_id, group_seq_loc, section_seq_loc, question_seq_loc ";

        final String UPDATE =
                "update scorecard_question set scorecard_template_id=?, question_text=?,question_weight=?, section_id=?,section_desc=?, " +
                        "section_weight=?, section_group_id=?, section_group_desc=?, question_desc=?, sort=?, question_header = ? " +
                        "where scorecard_question_id = ?";

        final String INSERT =
                "insert into scorecard_question (scorecard_template_id, question_text,question_weight, section_id, section_desc, " +
                        "section_weight, section_group_id, section_group_desc, question_desc, sort, question_header, scorecard_question_id)" +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


        long questionId = 0;
        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            select.setTimestamp(3, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            rs = select.executeQuery();

            long prevTemplate = -1;
            int sort = 0;

            while (rs.next()) {
                if (rs.getLong("scorecard_template_id") != prevTemplate) {
                    sort = 0;
                    prevTemplate = rs.getLong("scorecard_template_id");
                } else {
                    sort++;
                }

                String questionHeader = (String) rs.getObject("question_text");
                if (questionHeader != null) {
                    int p = questionHeader.lastIndexOf("\n", 250);

                    if (p >= 0) {
                        questionHeader = questionHeader.substring(0, p + 1) + "...";
                    } else {
                        p = questionHeader.lastIndexOf(" ", 250);
                        if (p >= 0) {
                            questionHeader = questionHeader.substring(0, p) + "...";
                        }
                    }

                }

                update.clearParameters();

                questionId = rs.getLong("scorecard_template_id");

                update.setLong(1, questionId);
                update.setObject(2, rs.getObject("question_text"));
                update.setObject(3, rs.getObject("question_weight"));
                update.setObject(4, rs.getObject("section_id"));
                update.setObject(5, rs.getObject("section_desc"));
                update.setObject(6, rs.getObject("section_weight"));
                update.setObject(7, rs.getObject("section_group_id"));
                update.setObject(8, rs.getObject("section_group_desc"));
                update.setObject(9, rs.getObject("question_desc"));
                update.setInt(10, sort);
                update.setObject(11, questionHeader);
                update.setLong(12, rs.getLong("scorecard_question_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    insert.setObject(1, rs.getObject("scorecard_template_id"));
                    insert.setObject(2, rs.getObject("question_text"));
                    insert.setObject(3, rs.getObject("question_weight"));
                    insert.setObject(4, rs.getObject("section_id"));
                    insert.setObject(5, rs.getObject("section_desc"));
                    insert.setObject(6, rs.getObject("section_weight"));
                    insert.setObject(7, rs.getObject("section_group_id"));
                    insert.setObject(8, rs.getObject("section_group_desc"));
                    insert.setObject(9, rs.getObject("question_desc"));
                    insert.setInt(10, sort);
                    insert.setObject(11, questionHeader);
                    insert.setLong(12, rs.getLong("scorecard_question_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'scorecard_question' table failed on " + questionId + ".\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }

    private int getEvaluationId(int questionType, String answer) {
        if (answer == null || answer.trim().length() == 0) {
            return 0;
        }
        switch (questionType) {
            case 1: // scale 1-4
                if (answer.equals("1") || answer.equals("1/4")) {
                    return 1;
                }
                if (answer.equals("2") || answer.equals("2/4")) {
                    return 2;
                }
                if (answer.equals("3") || answer.equals("3/4")) {
                    return 3;
                }
                if (answer.equals("4") || answer.equals("4/4")) {
                    return 4;
                }
            case 2: // scale 1-10
                if (answer.equals("1") || answer.equals("1/10")) {
                    return 11;
                }
                if (answer.equals("2") || answer.equals("2/10")) {
                    return 12;
                }
                if (answer.equals("3") || answer.equals("3/10")) {
                    return 13;
                }
                if (answer.equals("4") || answer.equals("4/10")) {
                    return 14;
                }
                if (answer.equals("5") || answer.equals("5/10")) {
                    return 15;
                }
                if (answer.equals("6") || answer.equals("6/10")) {
                    return 16;
                }
                if (answer.equals("7") || answer.equals("7/10")) {
                    return 17;
                }
                if (answer.equals("8") || answer.equals("8/10")) {
                    return 18;
                }
                if (answer.equals("9") || answer.equals("9/10")) {
                    return 19;
                }
                if (answer.equals("10") || answer.equals("10/10")) {
                    return 20;
                }
            case 3: // test case
                return 0;
            case 4: // Yes/No
                if ("Yes".equals(answer) || "1".equals(answer)) {
                    return 5;
                } else {
                    return 6;
                }
        }
        try {
            return Integer.parseInt(answer);
        } catch (Exception e) {
            return 0;
        }
    }

    public void doLoadScorecardResponse() throws Exception {
        log.info("load scorecard_response");
        ResultSet rs = null;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet projects = null;
        PreparedStatement projectSelect;


        final String SELECT =
                "select ri.scorecard_question_id , " +
                        "    r.review_id as scorecard_id,   " +
                        "    ri1.value as user_id, " +
                        "    ri2.value as reviewer_id, " +
                        "    u.project_id,   " +
                        "    ri.answer answer," +
                        "    sq.scorecard_question_type_id  " +
                        "    from review_item  ri," +
                        "       review r," +
                        "       resource res," +
                        "       resource_info ri1," +
                        "       resource_info ri2," +
                        "       submission s," +
                        "       upload u," +
                        "       project p, " +
                        "       project_info piel, " +
                        "       scorecard_question sq" +
                        "    where  ri.scorecard_question_id = sq.scorecard_question_id " +
                        "   and ri.review_id = r.review_id " +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (2,3,4,5,6,7) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and sq.scorecard_question_type_id in (1,2,4) " +
                        "   and answer <> '' " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and  u.project_id = ?  " +
                        "   and (ri.modify_date > ? " +
                        "   OR r.modify_date > ? " +
                        "   OR res.modify_date > ? " +
                        "   OR u.modify_date > ? " +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   OR s.modify_date > ? " +
                        (needLoadMovedProject() ? " OR ri.modify_user <> 'Converter' " +
                                " OR r.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String UPDATE =
                "update scorecard_response set user_id=?, reviewer_id=?, project_id=?, evaluation_id=? where scorecard_question_id = ? and scorecard_id = ?";

        final String INSERT =
                "insert into scorecard_response (user_id, reviewer_id, project_id, evaluation_id, scorecard_question_id, scorecard_id) values (?, ?, ?, ?, ?, ?)";

        long questionId = 0;
        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            projects = projectSelect.executeQuery();

            int count = 0;

            while (projects.next()) {
                select.clearParameters();
                select.setLong(1, projects.getLong("project_id"));
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
                select.setTimestamp(5, fLastLogTime);
                select.setTimestamp(6, fLastLogTime);
                select.setTimestamp(7, fLastLogTime);
                select.setTimestamp(8, fLastLogTime);

                rs = select.executeQuery();

                while (rs.next()) {
                    update.clearParameters();
                    questionId = rs.getLong("scorecard_question_id");

                    String answer = rs.getString("answer");
                    int evaluationId = getEvaluationId(rs.getInt("scorecard_question_type_id"), answer);

                    update.setObject(1, rs.getObject("user_id"));
                    update.setObject(2, rs.getObject("reviewer_id"));
                    update.setObject(3, rs.getObject("project_id"));
                    if (evaluationId != 0) {
                        update.setInt(4, evaluationId);
                    } else {
                        update.setNull(4, Types.INTEGER);
                    }
                    update.setLong(5, questionId);
                    update.setLong(6, rs.getLong("scorecard_id"));

                    int retVal = update.executeUpdate();

                    if (retVal == 0) {
                        insert.clearParameters();

                        insert.setObject(1, rs.getObject("user_id"));
                        insert.setObject(2, rs.getObject("reviewer_id"));
                        insert.setObject(3, rs.getObject("project_id"));
                        if (evaluationId != 0) {
                            insert.setInt(4, evaluationId);
                        } else {
                            insert.setNull(4, Types.INTEGER);
                        }
                        insert.setLong(5, questionId);
                        insert.setLong(6, rs.getLong("scorecard_id"));

                        insert.executeUpdate();
                    }

                    count++;

                }
                close(rs);
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'scorecard_response' table failed for question " + questionId + " .\n" +
                    sqle.getMessage());
        } finally {
            close(projects);
            close(insert);
            close(update);
            close(select);
        }
    }

    public void doLoadTestcaseResponse() throws Exception {
        log.info("load testcase_response");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;

        final String SELECT =
                "select ri.scorecard_question_id" +
                        "   , r.review_id as scorecard_id" +
                        "   ,ri1.value as user_id " +
                        "   ,ri2.value as reviewer_id " +
                        "   ,u.project_id" +
                        "   ,ri.answer " +
                        "  from review_item  ri," +
                        "    review r," +
                        "    resource res," +
                        "    submission s," +
                        "    upload u," +
                        "    project p, " +
                        "    project_info piel, " +
                        "    resource_info ri1," +
                        "    resource_info ri2," +
                        "    scorecard_question sq " +
                        "  where ri.review_id = r.review_id " +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (4,5,6,7) " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and sq.scorecard_question_id = ri.scorecard_question_id " +
                        "   and sq.scorecard_question_type_id = 3 " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and (ri.modify_date > ? " +
                        "   OR r.modify_date > ? " +
                        "   OR res.modify_date > ? " +
                        "   OR s.modify_date > ? " +
                        "   OR u.modify_date > ? " +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   OR sq.modify_date > ? " +
                        (needLoadMovedProject() ? " OR ri.modify_user <> 'Converter' " +
                                " OR r.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR sq.modify_user <> 'Converter' " +
                                ")"
                                : ")");
        final String UPDATE =
                "update testcase_response set user_id=?, reviewer_id=?, project_id=?, num_tests=?, num_passed=? where scorecard_question_id = ? and scorecard_id = ?";

        final String INSERT =
                "insert into testcase_response (user_id, reviewer_id, project_id, num_tests, num_passed, scorecard_question_id, scorecard_id) values (?, ?, ?, ?, ?, ?, ?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            select.setTimestamp(3, fLastLogTime);
            select.setTimestamp(4, fLastLogTime);
            select.setTimestamp(5, fLastLogTime);
            select.setTimestamp(6, fLastLogTime);
            select.setTimestamp(7, fLastLogTime);
            select.setTimestamp(8, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            rs = select.executeQuery();

            while (rs.next()) {
                update.clearParameters();

                // The answer should be like num_passed/num_tests
                String answer = rs.getString("answer");
                String[] tests = answer == null ? new String[0] : answer.split("/");
                String numTests = "1";
                String numPassed = "1";
                if (tests.length >= 2) {
                    try {
                        Integer.parseInt(tests[0]);
                        Integer.parseInt(tests[1]);
                        numPassed = tests[0];
                        numTests = tests[1];
                    } catch (Exception e) {
                        log.debug("the answer for testcase is: " + answer);
                    }
                }
                update.setObject(1, rs.getObject("user_id"));
                update.setObject(2, rs.getObject("reviewer_id"));
                update.setObject(3, rs.getObject("project_id"));
                update.setObject(4, numTests);
                update.setObject(5, numPassed);
                update.setLong(6, rs.getLong("scorecard_question_id"));
                update.setLong(7, rs.getLong("scorecard_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    insert.setObject(1, rs.getObject("user_id"));
                    insert.setObject(2, rs.getObject("reviewer_id"));
                    insert.setObject(3, rs.getObject("project_id"));
                    insert.setObject(4, numTests);
                    insert.setObject(5, numTests);
                    insert.setLong(6, rs.getLong("scorecard_question_id"));
                    insert.setLong(7, rs.getLong("scorecard_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'testcase_response' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }


    public void doLoadSubjectiveResponse() throws Exception {
        log.info("load subjective_response");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        ResultSet projects;
        PreparedStatement projectSelect;


        final String SELECT =
                "select ri.scorecard_question_id " +
                        "    ,r.review_id as scorecard_id " +
                        "    ,ri1.value as user_id " +
                        "    ,ri2.value as reviewer_id " +
                        "    ,u.project_id " +
                        "    ,ric.content as response_text " +
                        "    ,case when ric.comment_type_id = 1 then 3 when ric.comment_type_id = 3 then 1 else 2 end as response_type_id " +
                        "    ,case when ric.comment_type_id = 1 then 'Comment' when ric.comment_type_id = 3 then 'Required' else 'Recommended' end as response_type_desc " +
                        "    ,ric.review_item_comment_id subjective_resp_id " +
                        "    from review_item_comment ric, " +
                        "       comment_type_lu ctl," +
                        "       review_item  ri, " +
                        "       review r," +
                        "       submission s," +
                        "       upload u," +
                        "       project p, " +
                        "       project_info piel, " +
                        "       resource_info ri1," +
                        "       resource_info ri2," +
                        "       resource res " +
                        "    where  ric.comment_type_id = ctl.comment_type_id " +
                        "   and ric.review_item_id = ri.review_item_id " +
                        "   and ri.review_id = r.review_id " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (2, 3, 4, 5, 6, 7) " +
                        "   and ric.comment_type_id in (1, 2, 3) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and u.project_id = ? " +
                        "   and (ric.modify_date > ? " +
                        "   OR ri.modify_date > ? " +
                        "   OR r.modify_date > ? " +
                        "   OR s.modify_date > ? " +
                        "   OR u.modify_date > ? " +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   OR res.modify_date > ? " +
                        (needLoadMovedProject() ? " OR ric.modify_user <> 'Converter' " +
                                " OR ri.modify_user <> 'Converter' " +
                                " OR r.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                ")"
                                : ")") +
                        "order by scorecard_question_id, scorecard_id, subjective_resp_id  ";
        final String DELETE =
                "delete from subjective_response where scorecard_question_id = ? and scorecard_id = ?";

        final String INSERT =
                "insert into subjective_response (user_id, reviewer_id, project_id, response_text, response_type_id, response_type_desc, sort, scorecard_question_id, scorecard_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            delete = prepareStatement(DELETE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            int count = 0;

            long prevScorecardQuestion = -1;
            long prevScorecard = -1;
            int sort = 0;


            projects = projectSelect.executeQuery();

            while (projects.next()) {
                select.clearParameters();
                select.setLong(1, projects.getLong("project_id"));
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
                select.setTimestamp(5, fLastLogTime);
                select.setTimestamp(6, fLastLogTime);
                select.setTimestamp(7, fLastLogTime);
                select.setTimestamp(8, fLastLogTime);
                select.setTimestamp(9, fLastLogTime);

                rs = select.executeQuery();

                while (rs.next()) {

                    if ((rs.getLong("scorecard_question_id") != prevScorecardQuestion) ||
                            (rs.getLong("scorecard_id") != prevScorecard)) {
                        sort = 0;
                        prevScorecardQuestion = rs.getLong("scorecard_question_id");
                        prevScorecard = rs.getLong("scorecard_id");
                        delete.clearParameters();

                        delete.setLong(1, rs.getLong("scorecard_question_id"));
                        delete.setLong(2, rs.getLong("scorecard_id"));

                        delete.executeUpdate();

                    } else {
                        sort++;
                    }

                    insert.clearParameters();

                    insert.setObject(1, rs.getObject("user_id"));
                    insert.setObject(2, rs.getObject("reviewer_id"));
                    insert.setObject(3, rs.getObject("project_id"));
                    insert.setObject(4, rs.getObject("response_text"));
                    insert.setObject(5, rs.getObject("response_type_id"));
                    insert.setObject(6, rs.getObject("response_type_desc"));
                    insert.setInt(7, sort);
                    insert.setLong(8, rs.getLong("scorecard_question_id"));
                    insert.setLong(9, rs.getLong("scorecard_id"));

                    insert.executeUpdate();
                    count++;
                }
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'subjective_response' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(delete);
            close(select);
        }
    }


    public void doLoadAppeal() throws Exception {
        log.info("load Appeal");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet projects;
        PreparedStatement projectSelect;

        final String SELECT =
                "select ric.review_item_comment_id as appeal_id " +
                        "    ,ri.scorecard_question_id  as scorecard_question_id " +
                        "    ,r.review_id as scorecard_id " +
                        "    ,res1.value as user_id " +
                        "    ,res2.value as reviewer_id " +
                        "    ,u.project_id " +
                        "    ,ri.answer as final_evaluation_id " +
                        "    ,ric.content as appeal_text " +
                        "    ,ric_resp.content as appeal_response " +
                        "    ,ric.extra_info as successful_ind " +
                        "    ,ric_resp.extra_info as raw_evaluation_id" +
                        "    ,sq.scorecard_question_type_id " +
                        "    from review_item_comment ric, " +
                        "       review_item  ri, " +
                        "       review r, " +
                        "       submission s,  " +
                        "       upload u, " +
                        "       project p, " +
                        "       project_info piel, " +
                        "       resource res,  " +
                        "       resource_info res1,  " +
                        "       resource_info res2,  " +
                        "       outer review_item_comment ric_resp," +
                        "       scorecard_question sq" +
                        "    where ric.review_item_id = ri.review_item_id and " +
                        "   ri.review_id = r.review_id and " +
                        "   ri.scorecard_question_id = sq.scorecard_question_id and " +
                        "   r.submission_id = s.submission_id and " +
                        "   u.upload_id = s.upload_id and " +
                        "   u.project_id = p.project_id and " +
                        "   p.project_status_id <> 3 and " +
                        "   p.project_category_id in (1, 2) and " +
                        "   r.resource_id = res.resource_id and " +
                        "   res.resource_role_id in (4, 5, 6, 7) and " +
                        "   res1.resource_id = u.resource_id and " +
                        "   res1.resource_info_type_id = 1 and " +
                        "   res2.resource_id = r.resource_id and " +
                        "   res2.resource_info_type_id = 1 and " +
                        "   ric_resp.review_item_id = ri.review_item_id and " +
                        "   ric_resp.comment_type_id = 5 and " +
                        "   ric.comment_type_id = 4  and " +
                        "   piel.project_info_type_id = 14 and " +
                        "   piel.value = 'Open' and " +
                        "   p.project_id = piel.project_id and " +
                        "   u.project_id = ? and " +
                        "   (ric.modify_date > ? OR " +
                        "   ri.modify_date > ? OR " +
                        "   r.modify_date > ? OR " +
                        "   s.modify_date > ? OR " +
                        "   u.modify_date > ? OR " +
                        "   res.modify_date > ? OR " +
                        "   res1.modify_date > ? OR " +
                        "   res2.modify_date > ? " +
                        //      "   OR ric_resp.modify_date > ?" +
                        (needLoadMovedProject() ? " OR ric.modify_user <> 'Converter' " +
                                " OR ri.modify_user <> 'Converter' " +
                                " OR r.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                " OR res1.modify_user <> 'Converter' " +
                                " OR res2.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String UPDATE =
                "update appeal set scorecard_question_id = ?, scorecard_id = ?, user_id=?, reviewer_id=?, project_id=?, " +
                        "raw_evaluation_id=?, final_evaluation_id=?, appeal_text=?, appeal_response=?, successful_ind = ? where appeal_id=?";

        final String INSERT =
                "insert into appeal (scorecard_question_id, scorecard_id, user_id, reviewer_id, project_id, " +
                        "raw_evaluation_id, final_evaluation_id, appeal_text, appeal_response, appeal_id, successful_ind) " +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            int count = 0;

            projects = projectSelect.executeQuery();

            while (projects.next()) {
                select.clearParameters();
                select.setLong(1, projects.getLong("project_id"));
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
                select.setTimestamp(5, fLastLogTime);
                select.setTimestamp(6, fLastLogTime);
                select.setTimestamp(7, fLastLogTime);
                select.setTimestamp(8, fLastLogTime);
                select.setTimestamp(9, fLastLogTime);
                //         select.setTimestamp(10, fLastLogTime);

                rs = select.executeQuery();

                while (rs.next()) {

                    update.clearParameters();

                    update.setLong(1, rs.getLong("scorecard_question_id"));
                    update.setLong(2, rs.getLong("scorecard_id"));
                    update.setObject(3, rs.getObject("user_id"));
                    update.setObject(4, rs.getObject("reviewer_id"));
                    update.setObject(5, rs.getObject("project_id"));

                    String answer = rs.getString("raw_evaluation_id");
                    int evaluationId = getEvaluationId(rs.getInt("scorecard_question_type_id"), answer);
                    if (evaluationId != 0) {
                        update.setInt(6, evaluationId);
                    } else {
                        update.setNull(6, Types.INTEGER);
                    }

                    answer = rs.getString("final_evaluation_id");
                    int finalEvaluationId = getEvaluationId(rs.getInt("scorecard_question_type_id"), answer);
                    if (finalEvaluationId != 0) {
                        update.setInt(7, finalEvaluationId);
                    } else {
                        update.setNull(7, Types.INTEGER);
                    }
                    update.setString(8, rs.getString("appeal_text"));
                    update.setString(9, rs.getString("appeal_response"));

                    String successfulInd = rs.getString("successful_ind");
                    if (successfulInd == null) {
                        update.setNull(10, Types.INTEGER);
                    } else {
                        if ("Succeeded".equals(successfulInd)) {
                            update.setInt(10, 1);
                        } else {
                            update.setInt(10, 0);
                        }
                    }
                    update.setLong(11, rs.getLong("appeal_id"));

                    int retVal = update.executeUpdate();

                    if (retVal == 0) {
                        insert.clearParameters();

                        insert.setLong(1, rs.getLong("scorecard_question_id"));
                        insert.setLong(2, rs.getLong("scorecard_id"));
                        insert.setObject(3, rs.getObject("user_id"));
                        insert.setObject(4, rs.getObject("reviewer_id"));
                        insert.setObject(5, rs.getObject("project_id"));
                        if (evaluationId != 0) {
                            insert.setInt(6, evaluationId);
                        } else {
                            insert.setNull(6, Types.INTEGER);
                        }
                        if (finalEvaluationId != 0) {
                            insert.setInt(7, finalEvaluationId);
                        } else {
                            insert.setNull(7, Types.INTEGER);
                        }
                        insert.setString(8, rs.getString("appeal_text"));
                        insert.setString(9, rs.getString("appeal_response"));
                        insert.setLong(10, rs.getLong("appeal_id"));
                        if (successfulInd == null) {
                            insert.setNull(11, Types.INTEGER);
                        } else {
                            if ("Succeeded".equals(successfulInd)) {
                                insert.setInt(11, 1);
                            } else {
                                insert.setInt(11, 0);
                            }
                        }

                        insert.executeUpdate();
                    }
                    count++;

                }
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'appeal' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }

    public void doLoadTestcaseAppeal() throws Exception {
        log.info("load Testcase Appeal");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet projects;
        PreparedStatement projectSelect;

        final String SELECT =
                "select ric.review_item_comment_id as appeal_id " +
                        "   ,ri.scorecard_question_id  " +
                        "   ,r.review_id as scorecard_id " +
                        "   ,ri1.value as user_id " +
                        "   ,ri2.value as reviewer_id " +
                        "   ,u.project_id " +
                        "   ,ri.answer " +
                        "   ,ric.content as appeal_text " +
                        "   ,ric.extra_info as successful_ind " +
                        "   ,ric_resp.content as appeal_response " +
                        "   ,ric_resp.extra_info as raw_answer " +
                        "from review_item_comment ric,  " +
                        "   review_item  ri, " +
                        "   review r, " +
                        "   submission s, " +
                        "   upload u, " +
                        "   project p, " +
                        "   project_info piel, " +
                        "   resource res, " +
                        "   resource_info ri1," +
                        "   resource_info ri2," +
                        "   scorecard_question sq, " +
                        "   review_item_comment ric_resp " +
                        "where ric.review_item_id = ri.review_item_id " +
                        "   and ri.review_id = r.review_id " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in (1, 2) " +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (4, 5, 6, 7) " +
                        "   and ri.scorecard_question_id = sq.scorecard_question_id " +
                        "   and sq.scorecard_question_type_id = 3 " +
                        "   and ric_resp.review_item_id = ri.review_item_id " +
                        "   and ric_resp.comment_type_id = 5 " +
                        "   and ric.comment_type_id = 4 " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        "   and piel.project_info_type_id = 14 " +
                        "   and piel.value = 'Open' " +
                        "   and p.project_id = piel.project_id " +
                        "   and u.project_id = ? " +
                        "   and (ric.modify_date > ? " +
                        "   OR ri.modify_date > ? " +
                        "   OR r.modify_date > ?" +
                        "   OR s.modify_date > ?" +
                        "   OR u.modify_date > ? " +
                        "   OR res.modify_date > ? " +
                        "   OR sq.modify_date > ? " +
                        "   OR ri1.modify_date > ? " +
                        "   OR ri2.modify_date > ? " +
                        "   OR ric_resp.modify_date > ? " +
                        (needLoadMovedProject() ? " OR ric.modify_user <> 'Converter' " +
                                " OR ri.modify_user <> 'Converter' " +
                                " OR r.modify_user <> 'Converter' " +
                                " OR s.modify_user <> 'Converter' " +
                                " OR u.modify_user <> 'Converter' " +
                                " OR res.modify_user <> 'Converter' " +
                                " OR sq.modify_user <> 'Converter' " +
                                " OR ri1.modify_user <> 'Converter' " +
                                " OR ri2.modify_user <> 'Converter' " +
                                " OR ric_resp.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String UPDATE =
                "update testcase_appeal set scorecard_question_id = ?, scorecard_id = ?, user_id=?, reviewer_id=?, project_id=?, " +
                        "raw_num_passed=?, raw_num_tests=?, final_num_passed=?, final_num_tests=?, appeal_text=?, appeal_response=?, successful_ind = ? where appeal_id=?";

        final String INSERT =
                "insert into testcase_appeal (scorecard_question_id, scorecard_id, user_id, reviewer_id, project_id, " +
                        "raw_num_passed, raw_num_tests, final_num_passed, final_num_tests, appeal_text, appeal_response, appeal_id, successful_ind) " +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            projectSelect = prepareStatement(PROJECT_SELECT, SOURCE_DB);

            int count = 0;

            projects = projectSelect.executeQuery();

            while (projects.next()) {
                select.clearParameters();
                select.setLong(1, projects.getLong("project_id"));
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
                select.setTimestamp(5, fLastLogTime);
                select.setTimestamp(6, fLastLogTime);
                select.setTimestamp(7, fLastLogTime);
                select.setTimestamp(8, fLastLogTime);
                select.setTimestamp(9, fLastLogTime);
                select.setTimestamp(10, fLastLogTime);
                select.setTimestamp(11, fLastLogTime);

                rs = select.executeQuery();

                while (rs.next()) {

                    update.clearParameters();

                    update.setLong(1, rs.getLong("scorecard_question_id"));
                    update.setLong(2, rs.getLong("scorecard_id"));
                    update.setObject(3, rs.getObject("user_id"));
                    update.setObject(4, rs.getObject("reviewer_id"));
                    update.setObject(5, rs.getObject("project_id"));

                    String answer = rs.getString("raw_answer");
                    String[] tests = answer == null ? new String[0] : answer.split("/");
                    String rawNumTests = "1";
                    String rawNumPassed = "1";
                    if (tests.length >= 2) {
                        rawNumPassed = tests[0];
                        rawNumTests = tests[1];
                    }

                    update.setObject(6, rawNumPassed);
                    update.setObject(7, rawNumTests);

                    answer = rs.getString("answer");
                    tests = answer == null ? new String[0] : answer.split("/");
                    String finalNumTests = "1";
                    String finalNumPassed = "1";
                    if (tests.length >= 2) {
                        finalNumPassed = tests[0];
                        finalNumTests = tests[1];
                    }

                    update.setObject(8, finalNumPassed);
                    update.setObject(9, finalNumTests);
                    update.setObject(10, rs.getObject("appeal_text"));
                    update.setObject(11, rs.getObject("appeal_response"));
                    String successfulInd = rs.getString("successful_ind");
                    if (successfulInd == null) {
                        update.setNull(12, Types.INTEGER);
                    } else {
                        if ("Succeeded".equals(successfulInd)) {
                            update.setInt(12, 1);
                        } else {
                            update.setInt(12, 0);
                        }
                    }

                    update.setLong(13, rs.getLong("appeal_id"));

                    int retVal = update.executeUpdate();

                    if (retVal == 0) {
                        insert.clearParameters();

                        insert.setLong(1, rs.getLong("scorecard_question_id"));
                        insert.setLong(2, rs.getLong("scorecard_id"));
                        insert.setObject(3, rs.getObject("user_id"));
                        insert.setObject(4, rs.getObject("reviewer_id"));
                        insert.setObject(5, rs.getObject("project_id"));
                        insert.setObject(6, rawNumPassed);
                        insert.setObject(7, rawNumTests);
                        insert.setObject(8, finalNumPassed);
                        insert.setObject(9, finalNumTests);
                        insert.setObject(10, rs.getObject("appeal_text"));
                        insert.setObject(11, rs.getObject("appeal_response"));
                        insert.setLong(12, rs.getLong("appeal_id"));
                        if (successfulInd == null) {
                            insert.setNull(13, Types.INTEGER);
                        } else {
                            if ("Succeeded".equals(successfulInd)) {
                                insert.setInt(13, 1);
                            } else {
                                insert.setInt(13, 0);
                            }
                        }

                        insert.executeUpdate();
                    }
                    count++;

                }
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'testcase_appeal' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }

    public void doLoadStreak() throws Exception {
        log.info("load streak");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement delete = null;

        final String DELETE = "delete from streak";

        final String SELECT = "select pr.user_id " +
                " , p.project_id " +
                " , pr.placed " +
                "  , round(pr.new_rating) as new_rating  " +
                "  , p.phase_id  " +
                "  , p.category_desc  " +
                " from project_result pr  " +
                "    , project p  " +
                " where p.project_id = pr.project_id  " +
                " and pr.valid_submission_ind = 1  " +
                " and pr.rating_ind = 1  " +
                " and p.status_id in (4,5,7)  " +
                " order by pr.user_id, pr.rating_order";

        final String INSERT = "INSERT INTO streak (coder_id, streak_type_id, phase_id, start_project_id, end_project_id, length, is_current) " +
                " VALUES(?,?,?,?,?,?,?)";

        int phases[] = {112, 113};
        Streak[][] streaks = new Streak[4][phases.length];

        for (int i = 0; i < phases.length; i++) {
            streaks[0][i] = new ConsecutiveWinningsStreak(phases[i]);
            streaks[1][i] = new ConsecutivePaidStreak(phases[i]);
            streaks[2][i] = new ConsecutiveRatingIncrease(phases[i]);
            streaks[3][i] = new ConsecutiveRatingDecrease(phases[i]);
        }

        try {

            long start = System.currentTimeMillis();
            delete = prepareStatement(DELETE, TARGET_DB);
            delete.executeUpdate();

            select = prepareStatement(SELECT, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            rs = select.executeQuery();

            long userId = 0;
            long projectId = 0;
            int placed = 0;
            int rating = 0;
            int phaseId = 0;
            String category = null;

            boolean hasNext = true;

            while (hasNext) {
                hasNext = rs.next();

                if (hasNext) {
                    userId = rs.getLong("user_id");
                    projectId = rs.getLong("project_id");
                    placed = rs.getInt("placed");
                    rating = rs.getInt("new_rating");
                    phaseId = rs.getInt("phase_id");
                    category = rs.getString("category_desc");
                }

                for (int k = 0; k < 4; k++) {
                    for (int i = 0; i < phases.length; i++) {
                        StreakRow sr = hasNext ? streaks[k][i].add(userId, projectId, placed, rating, phaseId, category) : streaks[k][i].flush();

                        if (sr != null) {
//                          log.debug("Save coder=" + sr.getCoderId() + " type= " + sr.getTypeId() + " length=" + sr.getLength());
                            insert.setLong(1, sr.getCoderId());
                            insert.setInt(2, sr.getTypeId());
                            insert.setInt(3, sr.getPhaseId());
                            insert.setLong(4, sr.getStartProjectId());
                            insert.setLong(5, sr.getEndProjectId());
                            insert.setInt(6, sr.getLength());
                            insert.setInt(7, sr.isCurrent() ? 1 : 0);

                            insert.executeUpdate();
                            count++;
                        }

                    }
                }
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'streak' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(select);
            close(delete);
        }
    }

    private void setCalendar(PreparedStatement ps, int parameterNumber, Timestamp value) throws SQLException {
        if (value != null) {
            ps.setInt(parameterNumber, lookupCalendarId(value, TARGET_DB));
        } else {
            ps.setNull(parameterNumber, Types.INTEGER);
        }
    }


    /**
     * Load the season table
     *
     * @throws Exception
     */
    public void doLoadSeason() throws Exception {
        log.info("load season");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;

        final String SELECT =
                " select season_id, name, rookie_competition_ind, next_rookie_season_id " +
                        "       , (select min(start_date) from stage st where st.season_id = s.season_id) as start_date " +
                        "       , (select max(end_date) from stage st where st.season_id = s.season_id) as end_date " +
                        " from season s " +
                        " where modify_date > ? ";


        final String UPDATE =
                "update season set start_calendar_id=?, end_calendar_id=?, name=?, rookie_competition_ind=?, next_rookie_season_id=? " +
                        " where season_id=?";

        final String INSERT =
                "insert into season (start_calendar_id, end_calendar_id, name, rookie_competition_ind, next_rookie_season_id, season_id) " +
                        " values (?,?,?,?,?,?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            select.setTimestamp(1, fLastLogTime);

            rs = select.executeQuery();

            while (rs.next()) {

                update.clearParameters();

                setCalendar(update, 1, rs.getTimestamp("start_date"));
                setCalendar(update, 2, rs.getTimestamp("end_date"));
                update.setString(3, rs.getString("name"));
                update.setInt(4, rs.getInt("rookie_competition_ind"));
                update.setInt(5, rs.getInt("next_rookie_season_id"));
                update.setInt(6, rs.getInt("season_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    setCalendar(insert, 1, rs.getTimestamp("start_date"));
                    setCalendar(insert, 2, rs.getTimestamp("end_date"));
                    insert.setString(3, rs.getString("name"));
                    insert.setInt(4, rs.getInt("rookie_competition_ind"));
                    insert.setInt(5, rs.getInt("next_rookie_season_id"));
                    insert.setInt(6, rs.getInt("season_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'season' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }

    /**
     * Load the stage table
     *
     * @throws Exception
     */
    public void doLoadStage() throws Exception {
        log.info("load stage");
        ResultSet rs;

        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;

        final String SELECT =
                " select stage_id, season_id, name, start_date, end_date " +
                        " from stage " +
                        " where modify_date > ? ";


        final String UPDATE =
                "update stage set season_id=?, start_calendar_id=?, end_calendar_id=?, name=? " +
                        " where stage_id=?";

        final String INSERT =
                "insert into stage (season_id, start_calendar_id, end_calendar_id, name, stage_id) " +
                        " values (?,?,?,?,?)";


        try {
            long start = System.currentTimeMillis();

            select = prepareStatement(SELECT, SOURCE_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            int count = 0;

            select.setTimestamp(1, fLastLogTime);
            rs = select.executeQuery();

            while (rs.next()) {

                update.clearParameters();

                update.setInt(1, rs.getInt("season_id"));
                setCalendar(update, 2, rs.getTimestamp("start_date"));
                setCalendar(update, 3, rs.getTimestamp("end_date"));
                update.setString(4, rs.getString("name"));
                update.setInt(5, rs.getInt("stage_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    insert.clearParameters();

                    insert.setInt(1, rs.getInt("season_id"));
                    setCalendar(insert, 2, rs.getTimestamp("start_date"));
                    setCalendar(insert, 3, rs.getTimestamp("end_date"));
                    insert.setString(4, rs.getString("name"));
                    insert.setInt(5, rs.getInt("stage_id"));

                    insert.executeUpdate();
                }
                count++;

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'stage' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(insert);
            close(update);
            close(select);
        }
    }


    /**
     * Load the contest_result table for the contests belonging to stages whose results were modified.
     *
     * @throws Exception
     */
    public void doLoadStageResults() throws Exception {
        log.debug("load stage results");

        final String SELECT_STAGES =
                " select distinct s.season_id, s.stage_id, s.start_date, s.end_date " +
                        " from project_result pr, " +
                        "      stage s, " +
                        "      project p,  " +
                        "      project_info piel " +
                        " where p.project_id = pr.project_id  " +
                        " and p.project_status_id <> 3  " +
                        " and p.project_category_id in (1, 2)  " +
                        " and piel.project_info_type_id = 14  " +
                        " and piel.value = 'Open'  " +
                        " and p.project_id = piel.project_id  " +
                        " and (p.modify_date > ? " +
                        "     OR pr.modify_date > ?) " +
                        " and ( " +
                        " select NVL(ppd.actual_start_time, psd.actual_start_time)  " +
                        " from project p " +
                        "     , OUTER project_phase psd " +
                        "     , OUTER project_phase ppd " +
                        " where  psd.project_id = p.project_id  " +
                        " and psd.phase_type_id = 2  " +
                        " and ppd.project_id = p.project_id  " +
                        " and ppd.phase_type_id = 1  " +
                        " and p.project_id = pr.project_id) between s.start_date and s.end_date ";

        final String SELECT_CONTESTS =
                " select c.contest_id, c.phase_id, c.contest_type_id, crc.class_name, x.top_performers_factor " +
                        " from contest_stage_xref x " +
                        " ,contest c " +
                        " ,contest_result_calculator_lu crc " +
                        " where c.contest_id = x.contest_id " +
                        " and c.contest_result_calculator_id = crc.contest_result_calculator_id  " +
                        " and x.stage_id = ? ";


        PreparedStatement selectStages = null;
        PreparedStatement selectContests = null;
        ResultSet rsStages = null;
        ResultSet rsContests = null;

        try {
            selectStages = prepareStatement(SELECT_STAGES, SOURCE_DB);
            selectContests = prepareStatement(SELECT_CONTESTS, SOURCE_DB);

            selectStages.setTimestamp(1, fLastLogTime);
            selectStages.setTimestamp(2, fLastLogTime);

            rsStages = selectStages.executeQuery();

            while (rsStages.next()) {
                selectContests.clearParameters();
                selectContests.setInt(1, rsStages.getInt("stage_id"));
                rsContests = selectContests.executeQuery();

                Timestamp startDate = rsStages.getTimestamp("start_date");
                Timestamp endDate = rsStages.getTimestamp("end_date");
                int seasonId = rsStages.getInt("season_id");

                while (rsContests.next()) {
                    loadDRContestResults(seasonId, startDate, endDate, rsContests.getInt("phase_id"), rsContests.getInt("contest_id"),
                            rsContests.getString("class_name"), rsContests.getDouble("top_performers_factor"));
                }

            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contest_result' table for stages failed.\n" +
                    sqle.getMessage());
        } finally {
            close(selectStages);
            close(rsStages);
        }

    }

    /**
     * Load the contest_result table for the contests belonging to season whose results were modified (rookie contests)
     *
     * @throws Exception
     */
    public void doLoadSeasonResults() throws Exception {
        log.debug("load season results");

        final String SELECT_SEASONS =
                " select distinct s.season_id, " +
                        "    (select min(start_date) from stage st where st.season_id = s.season_id) as start_date, " +
                        "    (select max(end_date) from stage st where st.season_id = s.season_id) as end_date " +
                        " from project_result pr,  " +
                        "      season s,   " +
                        "      project p,    " +
                        "      project_info piel   " +
                        " where p.project_id = pr.project_id    " +
                        " and p.project_status_id <> 3    " +
                        " and p.project_category_id in (1, 2)    " +
                        " and piel.project_info_type_id = 14   " +
                        " and piel.value = 'Open'   " +
                        " and p.project_id = piel.project_id  " +
                        " and (p.modify_date > ? " +
                        "     OR pr.modify_date > ?)  " +
                        " and (  " +
                        " select NVL(ppd.actual_start_time, psd.actual_start_time)   " +
                        " from project p  " +
                        "     , OUTER project_phase psd  " +
                        "     , OUTER project_phase ppd  " +
                        " where  psd.project_id = p.project_id   " +
                        " and psd.phase_type_id = 2   " +
                        " and ppd.project_id = p.project_id   " +
                        " and ppd.phase_type_id = 1   " +
                        " and p.project_id = pr.project_id) between  " +
                        "      (select min(start_date) from stage st where st.season_id = s.season_id) and " +
                        "      (select max(end_date) from stage st where st.season_id = s.season_id)  ";

        final String SELECT_CONTESTS =
                " select c.contest_id, c.phase_id, c.contest_type_id, crc.class_name " +
                        " from contest_season_xref x " +
                        " ,contest c " +
                        " ,contest_result_calculator_lu crc " +
                        " where c.contest_id = x.contest_id " +
                        " and c.contest_result_calculator_id = crc.contest_result_calculator_id  " +
                        " and x.season_id = ? ";


        PreparedStatement selectSeason = null;
        PreparedStatement selectContests = null;
        ResultSet rsSeasons = null;
        ResultSet rsContests = null;

        try {
            selectSeason = prepareStatement(SELECT_SEASONS, SOURCE_DB);
            selectContests = prepareStatement(SELECT_CONTESTS, SOURCE_DB);

            selectSeason.setTimestamp(1, fLastLogTime);
            selectSeason.setTimestamp(2, fLastLogTime);

            rsSeasons = selectSeason.executeQuery();

            while (rsSeasons.next()) {
                int seasonId = rsSeasons.getInt("season_id");
                selectContests.clearParameters();
                selectContests.setInt(1, seasonId);
                rsContests = selectContests.executeQuery();

                Timestamp startDate = rsSeasons.getTimestamp("start_date");
                Timestamp endDate = rsSeasons.getTimestamp("end_date");

                while (rsContests.next()) {
                    loadDRContestResults(seasonId, startDate, endDate, rsContests.getInt("phase_id"), rsContests.getInt("contest_id"),
                            rsContests.getString("class_name"), 0.0);
                }

            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contest_result' table for seasons failed.\n" +
                    sqle.getMessage());
        } finally {
            close(selectSeason);
            close(rsSeasons);
        }

    }


    /**
     * Helper method to load contest results for the specified contest.
     *
     * @param seasonId
     * @param startDate
     * @param endDate
     * @param phaseId
     * @param contestId
     * @param className
     * @param factor
     * @throws Exception
     */
    private void loadDRContestResults(int seasonId, Timestamp startDate, Timestamp endDate, int phaseId,
                                      int contestId, String className, double factor) throws Exception {

        log.debug("loading contest_result for dr contest_id=" + contestId + ", phase=" + phaseId + " from " + startDate + " to " + endDate);
        final String SELECT_RESULTS =
                " select p.project_id " +
                        "       ,p.project_status_id " +
                        "       ,pr.user_id " +
                        "       ,pr.placed " +
                        "       ,pr.point_adjustment " +
                        "       ,pr.final_score " +
                        "       ,pr.passed_review_ind " +
                        "       , NVL((select value from project_info pi_dr where pi_dr.project_info_type_id = 30 and pi_dr.project_id = p.project_id), NVL ((select max(cvd.price) " +
                        "           from project_info pi_ci " +
                        "                , comp_version_dates cvd " +
                        "           where pi_ci.project_info_type_id = 1 " +
                        "           and cvd.comp_vers_id = pi_ci.value " +
                        "           and cvd.phase_id = ? " +
                        "           and pi_ci.project_id = p.project_id)," +
                        "           (select value from project_info pi_am where pi_am.project_info_type_id = 16 and pi_am.project_id = p.project_id) " +
                        "            )) as amount " +
                        "       ,pi_dr.value as dr_ind " +
                        "       ,(select count(*) from submission s, upload u  " +
                        "         where u.upload_id = s.upload_id and project_id = p.project_id  " +
                        "         and submission_status_id in (1, 4) " +
                        "        ) as num_submissions_passed_review  " +
                        " from project p " +
                        "    ,project_result pr " +
                        "    ,project_info pi_el " +     // The digital run flag should be enough, but since it's not always set, we're checking for open projects as well.
                        "    ,outer project_info pi_dr " +
                        " where pi_dr.project_id = p.project_id " +
                        " and pi_dr.project_info_type_id = 26 " +
                        " and p.project_id = pr.project_id " +
                        " and pr.rating_ind=1 " +
                        " and p.project_category_id = ? " +
                        " and pi_el.project_info_type_id = 14 " +
                        " and pi_el.value = 'Open' " +
                        " and pi_el.project_id = p.project_id " +
                        " and ( " +
                        "      select NVL(ppd.actual_start_time, psd.actual_start_time)  " +
                        "      from project p1 " +
                        "        , OUTER project_phase psd " +
                        "        , OUTER project_phase ppd " +
                        "        where  psd.project_id = p1.project_id  " +
                        "        and psd.phase_type_id = 2  " +
                        "        and ppd.project_id = p1.project_id  " +
                        "        and ppd.phase_type_id = 1  " +
                        "        and p1.project_id = p.project_id) between ? and ? ";


        final String INSERT = "insert into contest_result(contest_id, coder_id, initial_points, final_points, potential_points, current_place, current_prize) " +
                " values(?,?,?,?,?,?,?)";

        ResultSet rs = null;
        PreparedStatement selectResults = null;
        PreparedStatement insert = null;

        try {
            selectResults = prepareStatement(SELECT_RESULTS, SOURCE_DB);
            selectResults.setInt(1, phaseId);
            selectResults.setInt(2, phaseId - 111);
            selectResults.setTimestamp(3, startDate);
            selectResults.setTimestamp(4, endDate);

            insert = prepareStatement(INSERT, TARGET_DB);

            ContestResultCalculator calc = (ContestResultCalculator) Class.forName(className).newInstance();
            if (calc instanceof TopPerformersCalculator) {
                ((TopPerformersCalculator) calc).setFactor(factor);
            }
            if (calc instanceof RookieContest) {
                Set<Long> rookies = getRookies(seasonId, phaseId);
                log.debug(rookies.size() + " rookies found for season " + seasonId + " phase " + phaseId);
                ((RookieContest) calc).setRookies(rookies);
            }

            rs = selectResults.executeQuery();

            List<ProjectResult> pr = new ArrayList<ProjectResult>();
            int count = 0;
            while (rs.next()) {
                // Skip non Digital Run projects
                if ("Off".equals(rs.getString("dr_ind"))) {
                    continue;
                }
                if (rs.getDouble("amount") < 0.01) {
                    log.warn("Project: " + rs.getLong("project_id") + " has zero amount!");
                }
                ProjectResult res = new ProjectResult(rs.getLong("project_id"), rs.getInt("project_status_id"), rs.getLong("user_id"),
                        rs.getDouble("final_score"), rs.getInt("placed"), rs.getInt("point_adjustment"), rs.getDouble("amount"),
                        rs.getInt("num_submissions_passed_review"), rs.getBoolean("passed_review_ind"));

                pr.add(res);
                count++;
            }
            close(rs);
            log.debug("    " + count + " projects processed for the contest");

            simpleDelete("contest_result", "contest_id", contestId);

            List<ContestResult> results = calc.calculateResults(pr, getContestPrizesAmount(contestId));

            count = 0;

            for (ContestResult result : results) {
                insert.clearParameters();
                insert.setInt(1, contestId);
                insert.setLong(2, result.getCoderId());
                insert.setDouble(3, result.getInitialPoints());
                insert.setDouble(4, result.getFinalPoints());
                insert.setDouble(5, result.getPotentialPoints());
                insert.setInt(6, result.getPlace());

                if (result.getPrize() != null) {
                    insert.setDouble(7, result.getPrize());
                } else {
                    insert.setNull(7, Types.DOUBLE);
                }

                insert.executeUpdate();

                count++;
            }

            log.debug(count + " results added for contest " + contestId);
        } finally {
            close(selectResults);
            close(insert);
        }

    }


    /**
     * Get a list of the rookies for a season and phase.
     *
     * @param seasonId
     * @param phaseId
     * @return
     * @throws Exception
     */
    private Set<Long> getRookies(int seasonId, int phaseId) throws Exception {
        PreparedStatement st = null;
        Set<Long> rookies = new HashSet<Long>();
        ResultSet rs = null;

        try {
            st = prepareStatement("select user_id from rookie where season_id = ? and phase_id = ?", TARGET_DB);
            st.setInt(1, seasonId);
            st.setInt(2, phaseId);

            rs = st.executeQuery();

            while (rs.next()) {
                rookies.add(rs.getLong("user_id"));
            }

        } finally {
            close(rs);
            close(st);
        }
        return rookies;
    }

    /**
     * Get the prizes for the specified contest.
     *
     * @param contestId
     * @return
     * @throws Exception
     */
    private List<Double> getContestPrizesAmount(long contestId) throws Exception {
        final String SELECT =
                "select  place, prize_amount " +
                        "from contest_prize  " +
                        "where contest_id = ? " +
                        "order by place";

        List<Double> prizes = new ArrayList<Double>();
        PreparedStatement select = null;

        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            select.setLong(1, contestId);
            ResultSet rs = select.executeQuery();

            int expectedPlace = 1;
            while (rs.next()) {
                if (rs.getString("place") != null && rs.getInt("place") != expectedPlace) {
                    throw new Exception("Error in prizes for contest " + contestId + " expected a prize for place " + expectedPlace);
                }

                prizes.add(rs.getDouble("prize_amount"));
                expectedPlace++;
            }
        } finally {
            close(select);
        }
        return prizes;
    }

    /**
     * Get a map with the class for calculating points and prizes for each stage id
     *
     * @return
     * @throws Exception
     */
    private Map<Integer, ContestResultCalculator> getStageCalculators() throws Exception {
        final String SELECT =
                " select  s.stage_id, min(class_name) as class_name " +
                        " from stage s " +
                        "      , contest_stage_xref x " +
                        "      , contest c " +
                        "      , contest_result_calculator_lu calc " +
                        " where s.stage_id = x.stage_id " +
                        " and x.contest_id = c.contest_id " +
                        " and c.contest_result_calculator_id = calc.contest_result_calculator_id " +
                        " and c.contest_type_id = 19 " +
                        " group by  s.stage_id ";

        Map<Integer, ContestResultCalculator> result = new HashMap<Integer, ContestResultCalculator>();
        PreparedStatement select = null;

        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            ResultSet rs = select.executeQuery();

            while (rs.next()) {
                String className = rs.getString("class_name");
                ContestResultCalculator calc = (ContestResultCalculator) Class.forName(className).newInstance();
                result.put(rs.getInt("stage_id"), calc);
            }
        } finally {
            close(select);
        }
        return result;
    }

    /**
     * Represents a Streak of rating or placement.
     *
     * @author Cucu
     */
    private static abstract class Streak {
        public static final String OVERALL = "Overall";

        public static final int CONSECUTIVE_WINNING = 1;
        public static final int CONSECUTIVE_PAID = 2;
        public static final int CONSECUTIVE_RATING_INCREASE = 3;
        public static final int CONSECUTIVE_RATING_DECREASE = 4;

        private int typeId;
        private int phaseId;
        private String category;

        protected long coderId = -1;
        private long startProjectId = -1;
        private long endProjectId = -1;
        private int length = 0;


        public Streak(int typeId, int phaseId, String category) {
            this.typeId = typeId;
            this.phaseId = phaseId;
            this.category = category;

        }

        public StreakRow flush() {
            return length > 1 ? new StreakRow(coderId, typeId, phaseId, category, startProjectId, endProjectId, length, true) : null;
        }

        public StreakRow add(long coderId, long projectId, int placed, int rating, int phaseId, String category) {
            StreakRow sr = null;

            if (this.coderId != coderId) {
                if (length > 1) {
                    sr = new StreakRow(this.coderId, typeId, this.phaseId, this.category, this.startProjectId, this.endProjectId, length, true);
                }
                length = 0;
                this.coderId = coderId;
                reset();
            }

            // check if the project belongs to the specified phase and category
            if (this.phaseId != phaseId ||
                    (!OVERALL.equals(this.category) && !this.category.equals(category))) {
                return sr;
            }

            if (addToStreak(placed, rating)) {
                if (length == 0) {
                    startProjectId = projectId;
                }
                endProjectId = projectId;
                length++;
            } else {
                if (length > 1) {
                    sr = new StreakRow(this.coderId, typeId, this.phaseId, this.category, startProjectId, endProjectId, length, false);
                }
                length = 0;
            }

            return sr;
        }


        protected abstract boolean addToStreak(int placed, int rating);

        protected void reset() {
        }
    }

    private static class ConsecutiveWinningsStreak extends Streak {

        public ConsecutiveWinningsStreak(int phaseId, String category) {
            super(CONSECUTIVE_WINNING, phaseId, category);
        }

        public ConsecutiveWinningsStreak(int phaseId) {
            this(phaseId, OVERALL);
        }

        protected boolean addToStreak(int placed, int rating) {
            return placed == 1;
        }
    }

    private static class ConsecutivePaidStreak extends Streak {

        public ConsecutivePaidStreak(int phaseId, String category) {
            super(CONSECUTIVE_PAID, phaseId, category);
        }

        public ConsecutivePaidStreak(int phaseId) {
            this(phaseId, OVERALL);
        }

        protected boolean addToStreak(int placed, int rating) {
            return placed == 1 || placed == 2;
        }
    }

    private static class ConsecutiveRatingIncrease extends Streak {
        private int currentRating = -1;

        public ConsecutiveRatingIncrease(int phaseId, String category) {
            super(CONSECUTIVE_RATING_INCREASE, phaseId, category);
        }

        public ConsecutiveRatingIncrease(int phaseId) {
            this(phaseId, OVERALL);
        }

        protected boolean addToStreak(int placed, int rating) {
            boolean accept = currentRating < 0 ? false : rating > currentRating;
            currentRating = rating;
            return accept;
        }

        protected void reset() {
            currentRating = -1;
        }

    }

    private static class ConsecutiveRatingDecrease extends Streak {
        private int currentRating = -1;

        public ConsecutiveRatingDecrease(int phaseId, String category) {
            super(CONSECUTIVE_RATING_DECREASE, phaseId, category);
        }

        public ConsecutiveRatingDecrease(int phaseId) {
            this(phaseId, OVERALL);
        }

        protected boolean addToStreak(int placed, int rating) {
            boolean accept = currentRating < 0 ? false : rating < currentRating;
            currentRating = rating;
            return accept;
        }

        protected void reset() {
            currentRating = -1;
        }
    }


    private static class StreakRow {
        long coderId;
        int typeId;
        int phaseId;
        String category;
        long startProjectId;
        long endProjectId;
        int length;
        boolean isCurrent;

        public StreakRow(long coderId, int typeId, int phaseId, String category, long startProjectId, long endProjectId, int length, boolean isCurrent) {
            super();
            this.coderId = coderId;
            this.typeId = typeId;
            this.phaseId = phaseId;
            this.category = category;
            this.startProjectId = startProjectId;
            this.endProjectId = endProjectId;
            this.length = length;
            this.isCurrent = isCurrent;
        }

        public String getCategory() {
            return category;
        }

        public long getCoderId() {
            return coderId;
        }

        public long getEndProjectId() {
            return endProjectId;
        }

        public boolean isCurrent() {
            return isCurrent;
        }

        public int getLength() {
            return length;
        }

        public int getPhaseId() {
            return phaseId;
        }

        public long getStartProjectId() {
            return startProjectId;
        }

        public int getTypeId() {
            return typeId;
        }
    }

}