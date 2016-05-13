/*
 * Copyright (C) 2004 - 2015 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.ContestResultCalculator;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;
import com.topcoder.utilities.dwload.contestresult.TopPerformersCalculator;
import com.topcoder.utilities.dwload.contestresult.drv2.ContestResultCalculatorV2;

import java.sql.Date;
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
 * <p><strong>Purpose</strong>:
 * Extends from <strong>TCLoad</strong> to load TCS date to the DW.</p>
 *
 * <p>
 *   Version 1.1.0 Change notes:
 *   <ol>
 *     <li>Added columns to project, project_result.</li>
 *     <li>Added table rookie.</li>
 *     <li>Non rated project left out of DR points.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.2 Change notes:
 *   <ol>
 *     <li>Deleted project are processed to physically delete all related info in the dw.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.3 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.4 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.5 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.6 (Bugfix) Change notes:
 *   <ol>
 *     <li>Broke up project loading in chunks to get past an Informix statement size limitation.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.7 (Direct Data Load Tool assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #doLoadDirectProjectStats()} method.</li>
 *     <li>Updated {@link #doLoadProjects()} method to copy newly added columns for admin fee, contest cost total
 *     and TC Direc project ID added to tcs_dw.project table.</li>
 *   </ol>
 * </p>
 * <p>
 *  Version 1.1.8 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>
 *        Added support for new Copilot Posting contest type : 
 *        add copilot posting category into LOAD_CATEGORIES.
 *     </li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.1.9 (TopCoder Data Load Tool Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #doLoadClientProjectDim()} method to load data to tcs_dw.client_project_dim table.</li>
 *     <li>Updated {@link #doLoadProjects()} method to copy new added colums for client_project_id, start_date_calendar_id,
 *     duration and fulfillment added to tcs_dw.projcet table.</li>
 *     <li>UPdated {@link #performLoad()} method to call {@link #doLoadClientProjectDim()} methods
 *     before calling {@link #doLoadProjects()} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.0 (TC Cockpit Contest Duration Calculation Updates Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #doLoadProjects()} method to exclude duration of <code>Approval</code> phases from contest 
 *     duration.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.1 (Module Assembly - Contest Fee Based on % of Member Cost Cockpit Pages Update) Change notes:
 *   <ol>
 *     <li>Updated {@link #doLoadProjects()} method to use percentage based admin fee if its enabled.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.2 (Release Assembly - TC Cockpit JIRA Report Update)
 * <ul>
 *     <li>Updated {@link #doLoadDirectProjectDim()} to load new column direct_project_dim::billing_project_id</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.2.3 (TCS Data Loader Updates Assembly)
 * <ul>
 *     <li>Updated {@link #doLoadProjects()} to load data for newly added column in tcs_dw:project
 *     (1)first_place_prize (2) num_checkpoint_submissions (3) num_valid_checkpoint_submissions </li>
 *     <li>Added {@link #doLoadProjectPlatforms()} to load project platforms </li>
 *     <li>Added {@link #doLoadProjectTechnologies()} to load project technologies</li>
 *     <li>Updated {@link #deleteProject(long)} to delete project tech/platform</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.2.4 (TC Design Contest Loader)
 * <ul>
 *    <li>Added {@link #STUDIO_DR_PERCENTAGE_TABLE}</li>
 *    <li>Added {@link #CHECKPOINT_SUBMISSION_TYPE_ID}</li>
 *    <li>Added method {@link #loadDRContestResults(int, java.sql.Timestamp, java.sql.Timestamp, int, int, String, double)}</li>
 *    <li>Added method {@link #getDesignContestUserDRPoints(double, int, int)}</li>
 *    <li>Updated {@link #performLoad()} to add calling of new method {@link #doLoadDesignProjectResults()}</li>
 *    <li>Updated {@link #deleteProject(long)} to delete records in design_project_result for the project to delete</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.2.5 (TopCoder DW Load Update - Load Marathon Match as challenge)
 * <ul>
 *     <li>Added method {@link #doLoadMarathonMatches()}</li>
 *     <li>Updated method {@llink #performLoad()}</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.3 (TopCoder Data Warehouse Loading Update 1)
 * <ul>
 *     <li>Update {@link #doLoadProjects()} to load data for new columns: challenge_manager,
 *     challenge_creator, challenge_launcher, copilot, checkpoint_start_date, checkpiont_end_date</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.4 (TopCoder Data Warehouse Loading Update 2)
 * <ul>
 *     <li>Update {@link #doLoadProjects()} to load data for new columns: (registration_end_date, scheduled_end_date,
 *     checkpoint_prize_amount, checkpoint_prize_number, dr_points, reliability_cost,
 *     review_cost, forum_id, submission_viewable, is_private)</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.4.1 (TopCoder Data Warehouse - Update Design Project Results and Add User Stats Update Time Log)
 * <ul>
 *     <li>Update {@link #doLoadDesignProjectResults()} to load new data fields: (inquire_timestamp, submit_ind,
 *     valid_submission_ind)</li>
 *     <li>Fixed bug in the {@link #doLoadDesignProjectResults()} method that caused submissions with no prize
 *     being skipped.</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.4.2 (TCS Loader Project Load - Add Cost Estimation Load)
 * <ul>
 *     <li>Update {@link #doLoadProjects()} to load data for new columns: estimated_reliability_cost, estimated_review_cost,
 *     estimated_copilot_cost, estimated_admin_fee, actual_total_prize,  copilot_cost</li>
 *     <li>Added method {@link #loadNewColumns3ForProjectFirstTime()} to load new columns data for existing project records</li>
 * </ul>
 * </p>
 *
 * <p>
 * Version 1.4.3 (TCS Loader Project Result Load - Update For First2Finish )
 * <li>Update {#link #doLoadProjectResults} to load the correct results for First2Finish</li>
 * </p>
 *
 * @author rfairfax, pulky, ivern, VolodymyrK, moonli, isv, minhu, Blues, Veve, Veve
 * @version 1.4.3
 */
public class TCLoadTCS extends TCLoad {

    /**
     * <p>A <code>String</code> representing all those project categories than should be loaded to the
     * data warehouse.</p>
     */
    private static final String LOAD_CATEGORIES = "(1, 2, 5, 6, 7, 13, 14, 23, 19, 24, 25, 26, 29, 35, 16, 17, 18, 20, 21, 30, 31, 32, 34, 22, 36, 9, 39, 38, 40)";

    /**
     * <p>An <code>int</code> array representing all project categories that are currently being rated.
     * IF YOU CHANGE THIS LIST, YOU MUST ALSO UPDATE THE <code>getCurrentRatings</code> METHOD!</p>
     */
    private static final int[] RATED_CATEGORIES = new int[] {1, 2, 6, 7, 13, 14, 23, 26, 19, 24, 35, 36};

    /**
     * The DR percentage table of the studio contests.
     *
     * @since 1.2.4
     */
    private static final double[][] STUDIO_DR_PERCENTAGE_TABLE = new double[][]{
            new double[]{1, 0, 0, 0, 0},
            new double[]{0.7, 0.3, 0, 0, 0},
            new double[]{0.65, 0.25, 0.1, 0, 0},
            new double[]{0.6, 0.22, 0.1, 0.08, 0},
            new double[]{0.56, 0.2, 0.1, 0.08, 0.06}
    };

    /**
     * <p>We have too many projects to fit in a single IN statement in a retrieval query any more, so we'll split the
     * project result load into steps of this size.</p>
     */
    private static final int PROJECT_RESULT_LOAD_STEP_SIZE = 500;

    /**
     * The submission type id of checkpoint submission.
     *
     * @since 1.2.4
     */
    private static final int CHECKPOINT_SUBMISSION_TYPE_ID = 3;

    private static Logger log = Logger.getLogger(TCLoadTCS.class);

    private static final int OVERALL_RATING_RANK_TYPE_ID = 1;
    private static final int ACTIVE_RATING_RANK_TYPE_ID = 2;

    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;

    private int TCS_LOG_TYPE = 4;

    private static final String PROJECT_SELECT =
            "select distinct project_id from project_result";

    /**
     * SQL fragment to be added to a where clause to not select projects with eligibility constraints
     *
     * @since 1.1.5
     */
    private static final String ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT =
            " and p.project_id not in (select ce.contest_id from contest_eligibility ce " +
                    " where ce.is_studio = 0) ";

    /**
     * Confirmed status.
     *
     * @since 1.1.0
     */
    //private static final int CONFIRMED = 1;

    public static final int INT1 = 3;
    /**
     * Passed review threshold for being eligible for the ROTY season.
     *
     * @since 1.1.0
     */
    //private static final int PASSED_REVIEW_THRESHOLD = 6;

    public static final int INT = 3;
    /**
     * Potential status.
     *
     * @since 1.1.0
     */
    //private static final int POTENTIAL = 0;


    private static final long DELETED_PROJECT_STATUS = 3;

    public TCLoadTCS() {
        DEBUG = false;
    }

    private String submissionDir = null;

    /**
     * Return if it will load moved project which not be covered by last old_dw load.
     *
     * @return true if load log time is before the 2006-11-4.
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

            log.info("[TCS LOAD] TCS load running");

            PreparedStatement ps = null;
            try {
                ps = prepareStatement("set lock mode to wait 5", SOURCE_DB);
                ps.execute();
            } finally {
                close(ps);
            }

            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());
            getLastUpdateTime();

            doLoadEvent();

            doLoadUserEvent();

            doLoadContests();

            doLoadContestPrize();

            doLoadUserContestPrize();

            doLoadClientProjectDim();

            doLoadDirectProjectDim();

            doLoadProjects();

            doLoadMarathonMatches();

            doLoadProjectPlatforms();

            doLoadProjectTechnologies();

            doLoadSpecReviews();

            // load scorecard template before submission review because submission_review will use this table
            doLoadScorecardTemplate();

            //load submission review before project result because the project result load will use the submission review table
            doLoadSubmissionReview();


            doLoadProjectResults();

            doLoadDesignProjectResults();

//            doLoadRookies();

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

            List<CoderRating> list = getCurrentRatings();

            for (int cat : RATED_CATEGORIES) {
                final int phase = cat + 111;
                doLoadRank(phase, ACTIVE_RATING_RANK_TYPE_ID, list);
                doLoadRank(phase, OVERALL_RATING_RANK_TYPE_ID, list);
                loadSchoolRatingRank(phase, ACTIVE_RATING_RANK_TYPE_ID, list);
                loadSchoolRatingRank(phase, OVERALL_RATING_RANK_TYPE_ID, list);
                loadCountryRatingRank(phase, ACTIVE_RATING_RANK_TYPE_ID, list);
                loadCountryRatingRank(phase, OVERALL_RATING_RANK_TYPE_ID, list);
            }

            doLoadSeason();

            doLoadStage();

            doLoadStageResults();
            doLoadDRTracks();

            doLoadDRTrackContests();

            doLoadDRTrackPoints();

            doLoadDRTrackResults();

            //doLoadDirectProjectStats();

            doLoadParticipationStats();

            doClearCache();

            setLastUpdateTime();

            log.info("[TCS LOAD] SUCCESS: TCS load ran successfully.");
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


    public void doClearCache() {
        try {
            String[] keys = new String[]{
                    "member_projects", "project_results_all", "contest_prizes", "contest_projects", "project_details",
                    "tccc05_", "tccc06_", "tco07_", "usdc_", "component_history", "tcs_ratings_history",
                    "member_profile", "Coder_Data", "Coder_Track_Data", "Coder_Dev_Data", "Coder_Des_Data", "Component_",
                    "public_home_data", "top_designers", "top_developers", "tco04",
                    "coder_all_ratings", "tco05", "coder_dev", "coder_des", "coder_algo", "dd_track",
                    "dd_design", "dd_development", "dd_component", "comp_list", "find_projects", "get_review_scorecard",
                    "get_screening_scorecard", "project_info", "reviewers_for_project", "scorecard_details", "submissions",
                    "comp_contest_details", "dr_leader_board", "competition_history", "algo_competition_history",
                    "dr_current_period", "dr_stages", "dr_seasons", "component_color_change", "stage_outstanding_projects",
                    "season_outstanding_projects", "dr_results", "dr_stages", "dr_contests_for_stage",
                    "outstanding_projects", "dr_points_detail", "drv2_results", "dr_track_details", "dr_track_list",
                    "dr_concurrent_track", "event_", "software_"
            };

            HashSet<String> s = new HashSet<String>();
            for (String key : keys) {
                s.add(key);
            }
            CacheClearer.removelike(s);
        } catch (Exception e) {
            log.error("An error caught while clearing the cache (ignored).", e);
        }
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

    /**
     * This method loads submissions
     *
     * @throws Exception if any error occurs
     */
    public void doLoadSubmission() throws Exception {
        log.info("load submissions");
        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        PreparedStatement delete = null;
        ResultSet rs = null;
        int submissionId=0;

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
                            ",  s.submission_status_id " +
                            ",  1 as submission_type " +
                            "from submission s" +
                            "   ,upload u" +
                            "   ,project p " +
                            "   ,resource r" +
                            "   ,resource_info ri " +
                            "where s.upload_id = u.upload_id " +
                            "   and s.submission_type_id = 1 " +
                            "   and u.project_id = p.project_id " +
                            "   and p.project_status_id <> 3 " +
                            "   and p.project_category_id in " + LOAD_CATEGORIES +
                            "   and u.resource_id = r.resource_id " +
                            "   and r.resource_id = ri.resource_id " +
                            "   and ri.resource_info_type_id = 1 " +
                            "   and u.upload_type_id = 1 " +
                            ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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

            final String UPDATE = "update submission set submission_url=? where submission_id=?";

            final String INSERT = "insert into submission (submitter_id, project_id, submission_url, submission_type, submission_id)" +
                    "values (?, ?, ?, ?, ?) ";

            final String DELETE = "delete from submission where submission_id=?";

            select = prepareStatement(SELECT, SOURCE_DB);

            if (!firstRun) {
                select.setTimestamp(1, fLastLogTime);
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
            }

            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            delete = prepareStatement(DELETE, TARGET_DB);
            rs = select.executeQuery();

            int count = 0;
            while (rs.next()) {
                submissionId = rs.getInt("submission_id");

                // If the submission was deleted in the source DB then delete it from the target DB as well
                if (rs.getInt("submission_status_id") == 5) {
                    delete.clearParameters();
                    delete.setInt(1, submissionId);
                    delete.executeUpdate();
                    continue;
                }

                count++;

                // make sure submission dir exist
                String submissionUrl = rs.getString("submission_url");
                if (submissionUrl != null && submissionUrl.indexOf("/") <= 0) {
                    // submission_dir does not prefix
                    submissionUrl = this.submissionDir + submissionUrl;
                }

                update.clearParameters();
                update.setString(1, submissionUrl);
                update.setInt(2, submissionId);

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
            throw new Exception("Load of 'submission' table failed submission id " + submissionId + " .\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(insert);
            close(update);
            close(delete);
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

    /**
     * Loads user ratings
     *
     * @throws Exception if any error occurs
     */
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
                    " from project_result pr, project p " +
                    " where pr.user_id = ur.user_id " +
                    " and pr.project_id = p.project_id " +
                    " and pr.rating_ind = 1 " +
                    ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
                    " and p.project_category_id+111 = ur.phase_id) as highest_rating " +
                    " , (select min(pr.new_rating) " +
                    " from project_result pr, project p " +
                    " where pr.user_id = ur.user_id " +
                    " and pr.project_id = p.project_id " +
                    " and pr.rating_ind = 1 " +
                    ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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


    private void setLongParameter(ResultSet rs, PreparedStatement statement, String name, int index) throws SQLException {
        if (rs.getObject(name) != null) {
            statement.setLong(index, rs.getLong(name));
        } else {
            statement.setNull(index, Types.DECIMAL);
        }
    }

    private void setTimestampParameter(ResultSet rs, PreparedStatement statement, String name, int index) throws SQLException {
        if (rs.getObject(name) != null) {
            statement.setTimestamp(index, rs.getTimestamp(name));
        } else {
            statement.setNull(index, Types.TIMESTAMP);
        }
    }


    /**
     * Loads the new columns (challenge_manager, challenge_creator, challenge_launcher, copilot, checkpoint_start_date,
     * checkpoint_end_date) data for the existing tcs_dw:project records.
     *
     * @throws Exception if any error.
     * @since 1.3
     */
    private void loadNewColumnsForProjectFirstTime() throws Exception {
        PreparedStatement countChallengeCreatorPS = null;
        PreparedStatement selectExistingProjectToUpdatePS = null;
        PreparedStatement selectNewColumnsDataPS = null;
        PreparedStatement updateProjectPS = null;


        ResultSet rs = null;
        ResultSet projectDataRS = null;

        StringBuffer query = null;
        int totalCount = 0;
        long projectId = -1;


        try {

            query = new StringBuffer(100);
            // check if there're existing any records in tcs_dw:project which have challenge_creator populated
            query.append("SELECT count(*) from project WHERE challenge_creator IS NOT NULL");
            countChallengeCreatorPS = prepareStatement(query.toString(), TARGET_DB);

            rs = countChallengeCreatorPS.executeQuery();
            rs.next();

            boolean firstRun = (rs.getInt(1) == 0);

            if(firstRun) {

                log.info("Start to do the first full load of challenge_manager, challenge_creator, challenge_launcher, copilot, checkpoint_start_date and checkpoint_end_date for the existing DW project records");

                // load project_id for the existing project records in tcs_dw
                query.delete(0, query.length());
                query.append("SELECT project_id FROM project");
                selectExistingProjectToUpdatePS = prepareStatement(query.toString(), TARGET_DB);
                rs = selectExistingProjectToUpdatePS.executeQuery();

                // query to get challenge_manager, challenge_creator, challenge_launcher, copilot,
                // checkpoint_start_date and checkpoint_end_date data to update from source DB
                String selectNewColumnsDataSQL = "SELECT (SELECT u.user_id\n" +
                        "    FROM resource r,\n" +
                        "      resource_info ri,\n" +
                        "      user u\n" +
                        "    WHERE r.project_id = p.project_id AND r.\n" +
                        "      resource_id = ri.resource_id AND ri.\n" +
                        "      resource_info_type_id = 1 AND r.\n" +
                        "      resource_role_id = 13 AND ri.value = u.\n" +
                        "      user_id AND r.resource_id = (\n" +
                        "        SELECT min(r2.resource_id)\n" +
                        "        FROM resource_info ri2,\n" +
                        "          resource r2\n" +
                        "        WHERE r2.project_id = p.project_id AND \n" +
                        "          r2.resource_id = ri2.resource_id \n" +
                        "          AND ri2.resource_info_type_id = 1 \n" +
                        "          AND r2.resource_role_id = 13 AND \n" +
                        "          ri2.value NOT IN (22770213, 22719217\n" +
                        "            )\n" +
                        "        )\n" +
                        "    )::lvarchar AS challenge_manager,\n" +
                        "  (\n" +
                        "    SELECT u.user_id\n" +
                        "    FROM project p2,\n" +
                        "      user u\n" +
                        "    WHERE p2.create_user = u.user_id AND p2.\n" +
                        "      project_id = p.project_id\n" +
                        "    ) AS challenge_creator,\n" +
                        "  (\n" +
                        "    SELECT u.user_id\n" +
                        "    FROM project_info pi58,\n" +
                        "      user u\n" +
                        "    WHERE pi58.project_id = p.project_id AND pi58.\n" +
                        "      project_info_type_id = 58 AND pi58.value::\n" +
                        "      INT = u.user_id\n" +
                        "    ) AS challenge_launcher,\n" +
                        "  (\n" +
                        "    SELECT u.user_id\n" +
                        "    FROM resource r,\n" +
                        "      user u\n" +
                        "    WHERE r.project_id = p.project_id AND r.user_id \n" +
                        "      = u.user_id AND r.resource_role_id = 14 AND r\n" +
                        "      .resource_id = (\n" +
                        "        SELECT min(r2.resource_id)\n" +
                        "        FROM resource r2\n" +
                        "        WHERE r2.project_id = p.project_id AND \n" +
                        "          r2.resource_role_id = 14\n" +
                        "        )\n" +
                        "    ) AS copilot,\n" +
                        "  CASE WHEN pcsd.actual_start_time IS NOT NULL THEN \n" +
                        "        pcsd.actual_start_time ELSE pcsd.\n" +
                        "      scheduled_start_time END AS \n" +
                        "  checkpoint_start_date,\n" +
                        "  CASE WHEN pced.actual_end_time IS NOT NULL THEN pced.\n" +
                        "        actual_end_time ELSE pced.\n" +
                        "      scheduled_end_time END AS \n" +
                        "  checkpoint_end_date\n" +
                        "from project p, OUTER project_phase pcsd, OUTER project_phase pced\n" +
                        "WHERE pcsd.project_id = p.project_id and pcsd.phase_type_id = 15 and pced.project_id = p.project_id and pced.phase_type_id = 17\n" +
                        "and p.project_id = ?";
                selectNewColumnsDataPS = prepareStatement(selectNewColumnsDataSQL, SOURCE_DB);

                // query to update the existing payment records in topcoder_dw
                query.delete(0, query.length());
                query.append("UPDATE project SET challenge_manager = ?, challenge_creator = ?, challenge_launcher = ?, copilot = ?, checkpoint_start_date = ?, checkpoint_end_date = ?  WHERE project_id = ?");
                updateProjectPS = prepareStatement(query.toString(), TARGET_DB);

                while (rs.next()) {
                    projectId = rs.getLong(1);

                    selectNewColumnsDataPS.clearParameters();
                    selectNewColumnsDataPS.setLong(1, projectId);
                    projectDataRS = selectNewColumnsDataPS.executeQuery();
                    boolean hasNext = projectDataRS.next();

                    if(!hasNext) continue;

                    updateProjectPS.clearParameters();

                    setLongParameter(projectDataRS, updateProjectPS, "challenge_manager", 1);
                    setLongParameter(projectDataRS, updateProjectPS, "challenge_creator", 2);
                    setLongParameter(projectDataRS, updateProjectPS, "challenge_launcher", 3);
                    setLongParameter(projectDataRS, updateProjectPS, "copilot", 4);

                    Timestamp checkpointStartDate = projectDataRS.getTimestamp("checkpoint_start_date");
                    Timestamp checkpointEndDate = projectDataRS.getTimestamp("checkpoint_end_date");

                    if (checkpointStartDate != null) {
                        updateProjectPS.setTimestamp(5, checkpointStartDate);
                    } else {
                        updateProjectPS.setNull(5, Types.TIMESTAMP);
                    }

                    if (checkpointEndDate != null) {
                        updateProjectPS.setTimestamp(6, checkpointEndDate);
                    } else {
                        updateProjectPS.setNull(6, Types.TIMESTAMP);
                    }

                    updateProjectPS.setLong(7, projectId);

                    int countUpdated = updateProjectPS.executeUpdate();

                    if (countUpdated == 1) {
                        log.info(String.format("Update Project %s with new columns data", projectId));
                        totalCount++;
                    }
                }
            }

            log.info("total project records updated with new columns data = " + totalCount);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Full Load of new columns data for existing records in 'project' table failed.\n"
                    + "project_id = " + projectId + "\n" + sqle.getMessage());
        } finally {
            DBMS.close(projectDataRS);
            DBMS.close(rs);
            DBMS.close(countChallengeCreatorPS);
            DBMS.close(selectExistingProjectToUpdatePS);
            DBMS.close(selectNewColumnsDataPS);
            DBMS.close(updateProjectPS);
        }
    }

    /**
     * Loads the new columns (registration_end_date, scheduled_end_date, checkpoint_prize_amount,
     * checkpoint_prize_number, dr_points, reliability_cost, review_cost, forum_id,
     * submission_viewable, is_private) data for the existing tcs_dw:project records.
     *
     * @throws Exception if any error.
     * @since 1.4
     */
    private void loadNewColumns2ForProjectFirstTime() throws Exception {
        PreparedStatement countChallengeCreatorPS = null;
        PreparedStatement selectExistingProjectToUpdatePS = null;
        PreparedStatement selectNewColumnsDataPS = null;
        PreparedStatement updateProjectPS = null;


        ResultSet rs = null;
        ResultSet projectDataRS = null;

        StringBuffer query = null;
        int totalCount = 0;
        long projectId = -1;


        try {

            query = new StringBuffer(100);
            // check if there're existing any records in tcs_dw:project which have review_cost populated
            query.append("SELECT count(*) from project WHERE review_cost IS NOT NULL");
            countChallengeCreatorPS = prepareStatement(query.toString(), TARGET_DB);

            rs = countChallengeCreatorPS.executeQuery();
            rs.next();

            boolean firstRun = (rs.getInt(1) == 0);

            if(firstRun) {

                log.info("Start to do the first full load of (registration_end_date, scheduled_end_date, " +
                        "checkpoint_prize_amount, checkpoint_prize_number, dr_points, " +
                        "reliability_cost, review_cost, forum_id, submission_viewable, is_private)" +
                        "for the existing DW project records");

                // load project_id for the existing project records in tcs_dw
                query.delete(0, query.length());
                query.append("SELECT project_id FROM project");
                selectExistingProjectToUpdatePS = prepareStatement(query.toString(), TARGET_DB);
                rs = selectExistingProjectToUpdatePS.executeQuery();

                // query to get (registration_end_date, scheduled_end_date, checkpoint_prize_amount, checkpoint_prize_number,
                // dr_points, reliability_cost, review_cost, forum_id, submission_viewable, is_private)  data to update from source DB
                String selectNewColumnsDataSQL = "SELECT (select CASE when pi53.value == 'true' THEN 1 ELSE 0 END FROM project_info pi53 where pi53.project_info_type_id = 53 and pi53.project_id = p.project_id) as submission_viewable\n" +
                        ", NVL(ppd.actual_end_time, ppd.scheduled_end_time) as registration_end_date\n" +
                        ",(SELECT MAX(scheduled_end_time) FROM project_phase phet WHERE phet.project_id = p.project_id) as scheduled_end_date\n" +
                        ", NVL((SELECT SUM(pr.number_of_submissions) FROM prize pr WHERE pr.project_id = p.project_id AND pr.prize_type_id = 14), 0) AS checkpoint_prize_number\n" +
                        ", (SELECT NVL(MAX(prize_amount), 0) FROM prize pr WHERE pr.project_id = p.project_id AND pr.prize_type_id = 14) AS checkpoint_prize_amount\n" +
                        ",(CASE WHEN pict.value = 'On' THEN NVL((SELECT value::decimal FROM project_info pidr WHERE pidr.project_id = p.project_id AND pidr.project_info_type_id = 30), 0) ELSE 0 END) as dr_points\n" +
                        ",(NVL((SELECT sum(total_amount)         FROM  informixoltp:payment_detail pmd, informixoltp:payment pm          \n" +
                        "WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1         \n" +
                        " and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id = 24         \n" +
                        " AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +    NVL((SELECT sum(pmd2.total_amount)            \n" +
                        "  FROM  informixoltp:payment_detail pmd,   \n" +
                        "informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,    \n" +
                        "informixoltp:payment pm2  \n" +
                        "WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1  \n" +
                        "  and pm.most_recent_detail_id = pmd.payment_detail_id   \n" +
                        "and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id = 24 \n" +
                        "AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as reliability_cost\n" +
                        ",(NVL((SELECT sum(total_amount)         FROM  informixoltp:payment_detail pmd, informixoltp:payment pm  \n" +
                        " WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1  \n" +
                        "and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id IN (7,26,28,36)\n" +
                        " AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +    NVL((SELECT sum(pmd2.total_amount)  \n" +
                        "  FROM  informixoltp:payment_detail pmd,   \n" +
                        "informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,   \n" +
                        " informixoltp:payment pm2               WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1  \n" +
                        "and pm.most_recent_detail_id = pmd.payment_detail_id   \n" +
                        " and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id IN (7,26,28,36)  \n" +
                        " AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as review_cost\n" +
                        ",(SELECT value::INTEGER FROM project_info piforum WHERE piforum.project_id = p.project_id and piforum.project_info_type_id = 4) as forum_id\n" +
                        ", (select CASE when pi53.value == 'true' THEN 1 ELSE 0 END FROM project_info pi53 where pi53.project_info_type_id = 53 and pi53.project_id = p.project_id) as submission_viewable\n" +
                        ", NVL((SELECT MAX(1) FROM contest_eligibility WHERE contest_id = p.project_id), 0) AS is_private\n" +
                        "FROM project p,\n" +
                        "OUTER project_phase ppd,\n" +
                        "OUTER project_info pict\n" +
                        "WHERE ppd.project_id = p.project_id and ppd.phase_type_id = 1 and p.project_status_id = 7\n" +
                        "AND pict.project_id = p.project_id and pict.project_info_type_id = 26 and p.project_id = ?";

                selectNewColumnsDataPS = prepareStatement(selectNewColumnsDataSQL, SOURCE_DB);

                // query to update the existing payment records in topcoder_dw
                query.delete(0, query.length());
                query.append("UPDATE project SET registration_end_date = ?, scheduled_end_date = ?, checkpoint_prize_amount = ?, checkpoint_prize_number = ?, dr_points = ?, " +
                        "reliability_cost = ?, review_cost = ?, forum_id = ?, submission_viewable = ?, is_private = ?  WHERE project_id = ?");
                updateProjectPS = prepareStatement(query.toString(), TARGET_DB);

                while (rs.next()) {
                    projectId = rs.getLong(1);

                    selectNewColumnsDataPS.clearParameters();
                    selectNewColumnsDataPS.setLong(1, projectId);
                    projectDataRS = selectNewColumnsDataPS.executeQuery();
                    boolean hasNext = projectDataRS.next();

                    if(!hasNext) continue;

                    updateProjectPS.clearParameters();

                    setTimestampParameter(projectDataRS,   updateProjectPS, "registration_end_date", 1);
                    setTimestampParameter(projectDataRS,   updateProjectPS, "scheduled_end_date", 2);
                    updateProjectPS.setDouble(3, projectDataRS.getDouble("checkpoint_prize_amount"));
                    updateProjectPS.setDouble(4, projectDataRS.getDouble("checkpoint_prize_number"));
                    updateProjectPS.setDouble(5, projectDataRS.getDouble("dr_points"));
                    updateProjectPS.setDouble(6, projectDataRS.getDouble("reliability_cost"));
                    updateProjectPS.setDouble(7, projectDataRS.getDouble("review_cost"));

                    setLongParameter(projectDataRS,   updateProjectPS, "forum_id", 8);
                    setLongParameter(projectDataRS,   updateProjectPS, "submission_viewable", 9);
                    setLongParameter(projectDataRS,   updateProjectPS, "is_private", 10);

                    updateProjectPS.setLong(11, projectId);

                    int countUpdated = updateProjectPS.executeUpdate();

                    if (countUpdated == 1) {
                        log.info(String.format("Update Project %s with new columns data", projectId));
                        totalCount++;
                    }
                }
            }

            log.info("total project records updated with new columns data = " + totalCount);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Full Load of new columns data for existing records in 'project' table failed.\n"
                    + "project_id = " + projectId + "\n" + sqle.getMessage());
        } finally {
            DBMS.close(projectDataRS);
            DBMS.close(rs);
            DBMS.close(countChallengeCreatorPS);
            DBMS.close(selectExistingProjectToUpdatePS);
            DBMS.close(selectNewColumnsDataPS);
            DBMS.close(updateProjectPS);
        }
    }

    /**
     * Loads the new columns (estimated_reliability_cost, estimated_review_cost, estimated_copilot_cost, estimated_admin_fee, actual_total_prize,  copilot_cost)
     * data for the existing tcs_dw:project records.
     *
     * @throws Exception if any error.
     * @since 1.4.2
     */
    private void loadNewColumns3ForProjectFirstTime() throws Exception {
        PreparedStatement countEstimatedReviewCostPS = null;
        PreparedStatement selectExistingProjectToUpdatePS = null;
        PreparedStatement selectNewColumnsDataPS = null;
        PreparedStatement updateProjectPS = null;


        ResultSet rs = null;
        ResultSet projectDataRS = null;

        StringBuffer query = null;
        int totalCount = 0;
        long projectId = -1;


        try {

            query = new StringBuffer(100);
            // check if there're existing any records in tcs_dw:project which have estimated_review_cost populated
            query.append("SELECT count(*) from project WHERE estimated_review_cost IS NOT NULL");
            countEstimatedReviewCostPS = prepareStatement(query.toString(), TARGET_DB);

            rs = countEstimatedReviewCostPS.executeQuery();
            rs.next();

            boolean firstRun = (rs.getInt(1) == 0);

            if(firstRun) {

                log.info("Start to do the first full load of (estimated_reliability_cost, estimated_review_cost, " +
                        " estimated_copilot_cost, estimated_admin_fee, actual_total_prize,  copilot_cost)");

                // load project_id for the existing project records in tcs_dw
                query.delete(0, query.length());
                query.append("SELECT project_id FROM project WHERE project_category_id IN " + LOAD_CATEGORIES);
                selectExistingProjectToUpdatePS = prepareStatement(query.toString(), TARGET_DB);
                rs = selectExistingProjectToUpdatePS.executeQuery();

                // query to get (estimated_reliability_cost, estimated_review_cost, estimated_copilot_cost,
                // estimated_admin_fee, actual_total_prize,  copilot_cost)  data to update from source DB
                String selectNewColumnsDataSQL = "SELECT (\n" +
                        "    CASE WHEN pire.value = 'true' THEN NVL((\n" +
                        "              SELECT value::DECIMAL\n" +
                        "              FROM project_info pi38\n" +
                        "              WHERE pi38.project_id = p\n" +
                        "                .project_id AND pi38\n" +
                        "                .\n" +
                        "                project_info_type_id \n" +
                        "                = 38\n" +
                        "              ), 0) ELSE 0 END\n" +
                        "    ) AS estimated_reliability_cost,\n" +
                        "  NVL((\n" +
                        "      SELECT value::DECIMAL\n" +
                        "      FROM project_info pi33\n" +
                        "      WHERE pi33.project_id = p.project_id AND \n" +
                        "        pi33.project_info_type_id = 33\n" +
                        "      ), 0) AS estimated_review_cost,\n" +
                        "  NVL((\n" +
                        "      SELECT value::DECIMAL\n" +
                        "      FROM project_info pi49\n" +
                        "      WHERE pi49.project_id = p.project_id AND \n" +
                        "        pi49.project_info_type_id = 49\n" +
                        "      ), 0) AS estimated_copilot_cost,\n" +
                        "  NVL((\n" +
                        "      SELECT value::DECIMAL\n" +
                        "      FROM project_info pi31\n" +
                        "      WHERE pi31.project_id = p.project_id AND \n" +
                        "        pi31.project_info_type_id = 31\n" +
                        "      ), 0) AS estimated_admin_fee,\n" +
                        "  (\n" +
                        "    NVL((\n" +
                        "        SELECT sum(total_amount)\n" +
                        "        FROM informixoltp: payment_detail pmd\n" +
                        "          ,\n" +
                        "          informixoltp: payment pm\n" +
                        "        WHERE pmd.component_project_id = p.\n" +
                        "          project_id AND pmd.\n" +
                        "          installment_number = 1 AND pm.\n" +
                        "          most_recent_detail_id = pmd.\n" +
                        "          payment_detail_id AND pmd.\n" +
                        "          payment_type_id IN (\n" +
                        "            6, 29, 10, 42, 43, 44, 49, 50, 51, \n" +
                        "            55, 61, 64, 65, 60, 13, 21\n" +
                        "            ) AND NOT pmd.\n" +
                        "          payment_status_id IN (65, 68, 69\n" +
                        "            )\n" +
                        "        ), 0) + NVL((\n" +
                        "        SELECT sum(pmd2.total_amount)\n" +
                        "        FROM informixoltp: payment_detail pmd\n" +
                        "          ,\n" +
                        "          informixoltp: payment pm\n" +
                        "        LEFT JOIN informixoltp: \n" +
                        "          payment_detail pmd2 ON pm.\n" +
                        "          payment_id = pmd2.\n" +
                        "          parent_payment_id,\n" +
                        "          informixoltp: payment pm2\n" +
                        "        WHERE pmd.component_project_id = p.\n" +
                        "          project_id AND pmd2.\n" +
                        "          installment_number = 1 AND pm.\n" +
                        "          most_recent_detail_id = pmd.\n" +
                        "          payment_detail_id AND pm2.\n" +
                        "          most_recent_detail_id = pmd2.\n" +
                        "          payment_detail_id AND pmd2.\n" +
                        "          payment_type_id IN (\n" +
                        "            6, 29, 10, 42, 43, 44, 49, 50, 51, \n" +
                        "            55, 61, 64, 65, 60, 13, 21\n" +
                        "            ) AND NOT pmd2.\n" +
                        "          payment_status_id IN (65, 68, 69\n" +
                        "            )\n" +
                        "        ), 0)\n" +
                        "    ) AS actual_total_prize,\n" +
                        "  (\n" +
                        "    NVL((\n" +
                        "        SELECT sum(total_amount)\n" +
                        "        FROM informixoltp: payment_detail pmd\n" +
                        "          ,\n" +
                        "          informixoltp: payment pm\n" +
                        "        WHERE pmd.component_project_id = p.\n" +
                        "          project_id AND pmd.\n" +
                        "          installment_number = 1 AND pm.\n" +
                        "          most_recent_detail_id = pmd.\n" +
                        "          payment_detail_id AND pmd.\n" +
                        "          payment_type_id IN (45, 57\n" +
                        "            ) AND NOT pmd.\n" +
                        "          payment_status_id IN (65, 68, 69\n" +
                        "            )\n" +
                        "        ), 0) + NVL((\n" +
                        "        SELECT sum(pmd2.total_amount)\n" +
                        "        FROM informixoltp: payment_detail pmd\n" +
                        "          ,\n" +
                        "          informixoltp: payment pm\n" +
                        "        LEFT JOIN informixoltp: \n" +
                        "          payment_detail pmd2 ON pm.\n" +
                        "          payment_id = pmd2.\n" +
                        "          parent_payment_id,\n" +
                        "          informixoltp: payment pm2\n" +
                        "        WHERE pmd.component_project_id = p.\n" +
                        "          project_id AND pmd2.\n" +
                        "          installment_number = 1 AND pm.\n" +
                        "          most_recent_detail_id = pmd.\n" +
                        "          payment_detail_id AND pm2.\n" +
                        "          most_recent_detail_id = pmd2.\n" +
                        "          payment_detail_id AND pmd2.\n" +
                        "          payment_type_id IN (45, 57\n" +
                        "            ) AND NOT pmd2.\n" +
                        "          payment_status_id IN (65, 68, 69\n" +
                        "            )\n" +
                        "        ), 0)\n" +
                        "    ) AS copilot_cost\n" +
                        "FROM project p, \n" +
                        "OUTER project_info pire\n" +
                        "WHERE \n" +
                        "pire.project_id = p.project_id\n" +
                        "AND pire.project_info_type_id = 45\n" +
                        "AND p.project_id = ?";

                selectNewColumnsDataPS = prepareStatement(selectNewColumnsDataSQL, SOURCE_DB);

                // query to update the existing payment records in topcoder_dw
                query.delete(0, query.length());
                query.append("UPDATE project SET estimated_reliability_cost = ?, estimated_review_cost = ?, estimated_copilot_cost = ?, estimated_admin_fee = ?, actual_total_prize = ?, " +
                        "copilot_cost = ? WHERE project_id = ?");
                updateProjectPS = prepareStatement(query.toString(), TARGET_DB);

                while (rs.next()) {
                    projectId = rs.getLong(1);

                    selectNewColumnsDataPS.clearParameters();
                    selectNewColumnsDataPS.setLong(1, projectId);
                    projectDataRS = selectNewColumnsDataPS.executeQuery();
                    boolean hasNext = projectDataRS.next();

                    if(!hasNext) continue;

                    updateProjectPS.clearParameters();

                    updateProjectPS.setDouble(1, projectDataRS.getDouble("estimated_reliability_cost"));
                    updateProjectPS.setDouble(2, projectDataRS.getDouble("estimated_review_cost"));
                    updateProjectPS.setDouble(3, projectDataRS.getDouble("estimated_copilot_cost"));
                    updateProjectPS.setDouble(4, projectDataRS.getDouble("estimated_admin_fee"));
                    updateProjectPS.setDouble(5, projectDataRS.getDouble("actual_total_prize"));
                    updateProjectPS.setDouble(6, projectDataRS.getDouble("copilot_cost"));

                    updateProjectPS.setLong(7, projectId);

                    int countUpdated = updateProjectPS.executeUpdate();

                    if (countUpdated == 1) {
                        log.info(String.format("Update Project %s with new columns data", projectId));
                        totalCount++;
                    }
                }
            }

            log.info("total project records updated with new columns data = " + totalCount);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Full Load of new columns data for existing records in 'project' table failed.\n"
                    + "project_id = " + projectId + "\n" + sqle.getMessage());
        } finally {
            DBMS.close(projectDataRS);
            DBMS.close(rs);
            DBMS.close(countEstimatedReviewCostPS);
            DBMS.close(selectExistingProjectToUpdatePS);
            DBMS.close(selectNewColumnsDataPS);
            DBMS.close(updateProjectPS);
        }
    }

    /**
     * <p/>
     * Load projects to the DW.
     * </p>
     *
     * @throws Exception if any error occurs
     */
    public void doLoadProjects() throws Exception {
        log.info("load projects");
        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        PreparedStatement updateAgain = null;
        ResultSet rs = null;

        try {
            //log.debug("PROCESSING PROJECT " + project_id);
            long start = System.currentTimeMillis();

            loadNewColumnsForProjectFirstTime();

            loadNewColumns2ForProjectFirstTime();

            loadNewColumns3ForProjectFirstTime();

            //get data from source DB
            final String SELECT =
                    "select p.project_id " +
                            "   ,cc.component_id " +
                            "   ,cc.component_name " +
                            "   ,(select count(*) from resource where project_id = p.project_id and resource_role_id = 1) as num_registrations " +
                            "   ,(select count(*) from submission sub, upload where sub.submission_type_id = 1 and sub.upload_id = upload.upload_id and project_id = p.project_id and submission_status_id <> 5) as num_submissions " +
                            //todo this should probably use the flag on project result in the dw, not got back to the submission table in transactional
                            "   ,(select count(*) from submission s, upload where s.submission_type_id = 1 and upload.upload_id = s.upload_id and project_id = p.project_id and submission_status_id in (1, 3, 4)) as num_valid_submissions " +

                            "   ,(select count(*) from submission sub, upload where sub.submission_type_id = 3 and sub.upload_id = upload.upload_id and project_id = p.project_id and submission_status_id <> 5) as num_checkpoint_submissions " +
                            "   ,(select count(*) from submission s, upload where s.submission_type_id = 3 and upload.upload_id = s.upload_id and project_id = p.project_id and submission_status_id in (1, 3, 4, 7)) as num_valid_checkpoint_submissions " +
                            "   ,(select SUM(prize_amount) from prize pr where pr.prize_type_id = 15 and  pr.project_id = p.project_id and pr.place = 1) as first_place_prize " +

                            //todo this should use the flag on project result, not go back to transactional
                            "   ,(select count(*) from submission s, upload u where s.submission_type_id = 1 and u.upload_id = s.upload_id and project_id = p.project_id and submission_status_id in (1, 4)) as num_submissions_passed_review " +
                            //todo again...none of this aggregate data should come from transactional
                            "   ,(select avg(case when raw_score is null then 0 else raw_score end) from project_result where project_id = p.project_id and raw_score is not null) as avg_raw_score " +
                            "   ,(select avg(case when final_score is null then 0 else final_score end) from project_result where project_id = p.project_id and final_score is not null) as avg_final_score " +
                            "   ,p.project_category_id + 111 as phase_id " +
                            "   ,pcl.name as phase_desc " +
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
                            "   ,p.project_category_id " +
                            "   ,pcl.name " +
                            "   ,p.tc_direct_project_id " +
                            "   ,piaf.value::DECIMAL(10,2) AS admin_fee " +
                            "   ,nvl((select cast (nvl(pi57.value, '0') as DECIMAL (10,2)) from project_info pi57" +
                            "       where p.project_id = pi57.project_id and pi57.project_info_type_id = 57),0) as contest_fee_percentage " +
//                            "   ,(SELECT SUM(value::decimal(10,2)) " +
//                            "     FROM project_info costs " +
//                            "     WHERE costs.project_id = p.project_id " +
//                            "     AND costs.project_info_type_id IN (30, 33, 35, 36, 37, 38, 39)) " +
//                            "     AS contest_prizes_total " +
            /*                "   ,(SELECT SUM(total_amount) " +
                            "     FROM informixoltp:payment pm INNER JOIN informixoltp:payment_detail pmd ON pm.most_recent_detail_id = pmd.payment_detail_id " +
                            "     WHERE pmd.component_project_id::int = p.project_id " +
                            "     AND NOT pmd.payment_status_id IN (65, 69)) " + */
                            "   , case when p.project_status_id = 7 then " +
                            "   NVL((SELECT sum(total_amount) " +
                            "       FROM  informixoltp:payment_detail pmd, informixoltp:payment pm " +
                            "        WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1 " +
                            "        and pm.most_recent_detail_id = pmd.payment_detail_id  " +
                            "        AND NOT pmd.payment_status_id IN (65, 68, 69)), 0) " +
                            "    + " +
                            "    NVL((SELECT sum(pmd2.total_amount)  " +
                            "           FROM  informixoltp:payment_detail pmd,   " +
                            "                 informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,  " +
                            "                 informixoltp:payment pm2  " +
                            "            WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1  " +
                            "            and pm.most_recent_detail_id = pmd.payment_detail_id   " +
                            "            and pm2.most_recent_detail_id = pmd2.payment_detail_id  " +
                            "            AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0) " +
                            "     + " +
                            "    nvl((select nvl(sum (cast (nvl (pi30.value, '0') as DECIMAL (10,2))), 0) from project_info pi30, project_info pi26 " +
                            "        where pi30.project_info_type_id = 30 and pi26.project_info_type_id = 26 and pi26.project_id = pi30.project_id  " +
                            "        and pi26.value = 'On' " +
                            "        and pi26.project_id =  p.project_id ), 0) " +
                            "   else NVL((SELECT sum(total_amount) " +
                            "        FROM  informixoltp:payment_detail pmd, informixoltp:payment pm " +
                            "         WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1 " +
                            "         and pm.most_recent_detail_id = pmd.payment_detail_id  " +
                            "         AND NOT pmd.payment_status_id IN (65, 68, 69)), 0) " +
                            "     + " +
                            "     NVL((SELECT sum(pmd2.total_amount)  " +
                            "            FROM  informixoltp:payment_detail pmd,   " +
                            "                  informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,  " +
                            "                  informixoltp:payment pm2  " +
                            "             WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1  " +
                            "             and pm.most_recent_detail_id = pmd.payment_detail_id   " +
                            "             and pm2.most_recent_detail_id = pmd2.payment_detail_id  " +
                            "             AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0) " +
                            "   end AS contest_prizes_total " +
                            ", (select NVL( SUM(pr.number_of_submissions * pr.prize_amount) , 0 ) from prize pr where pr.project_id = p.project_id and pr.prize_type_id IN (14, 15)) AS total_prize " +
                            "   , pib.value AS billing_project_id " +
                            "   , case when pcl.project_type_id != 3 and p.project_category_id not in (9,29,39) then  " +
                            "         (SELECT MAX(ppfr.actual_end_time) " +
                            "          FROM project_phase ppfr " +
                            "           WHERE ppfr.project_id = p.project_id " +
                            "           AND ppfr.phase_type_id = 10 " +
                            "           AND ppfr.phase_status_id = 3 " +
                            "           AND ppfr.actual_end_time <= (SELECT MIN(NVL(actual_start_time, scheduled_start_time)) " +
                            "                                   FROM project_phase ppappr " +
                            "                                   WHERE ppappr.project_id = p.project_id " +
                            "                                   AND ppappr.phase_type_id = 11)) " +
                            "     else (select actual_end_time from project_phase ph3 " +
                            "           where ph3.project_id = p.project_id and ph3.phase_type_id = 4 and ph3.phase_status_id = 3) " +
                            "     end as actual_complete_date  " +
                            "   , (SELECT u.user_id " +
                            "                FROM resource r, resource_info ri, user  u " +
                            "                    WHERE r.project_id = p.project_id and r.resource_id = ri.resource_id  " +
                            "                        and ri.resource_info_type_id = 1 and r.resource_role_id = 13 and ri.value=u.user_id " +
                            "                        and r.resource_id = " +
                            "                            (select min(r2.resource_id) from resource_info ri2, resource r2  " +
                            "                                 where  r2.project_id = p.project_id and r2.resource_id = ri2.resource_id  " +
                            "                                       and ri2.resource_info_type_id = 1 and r2.resource_role_id = 13 " +
                            "   and ri2.value not in (22770213,22719217)))::lvarchar " +
                            "         AS challenge_manager  " +
                            ", (SELECT u.user_id FROM project p2, user u WHERE p2.create_user = u.user_id and p2.project_id = p.project_id) AS challenge_creator " +
                            "        , (SELECT u.user_id FROM project_info pi58, user u WHERE pi58.project_id = p.project_id and pi58.project_info_type_id = 58 and pi58.value::integer = u.user_id) AS challenge_launcher " +
                            "        , (SELECT u.user_id " +
                            "                FROM resource r, user  u " +
                            "                    WHERE r.project_id = p.project_id and r.user_id = u.user_id " +
                            "                        and r.resource_role_id = 14  " +
                            "                        and r.resource_id = " +
                            "                            (select min(r2.resource_id) from resource r2  " +
                            "                                 where  r2.project_id = p.project_id   " +
                            "                                       and r2.resource_role_id = 14)) as copilot" +
                            ", CASE WHEN pcsd.actual_start_time IS NOT NULL THEN pcsd.actual_start_time ELSE pcsd.scheduled_start_time END as checkpoint_start_date" +
                            ", CASE WHEN pced.actual_end_time   IS NOT NULL THEN pced.actual_end_time ELSE pced.scheduled_end_time END as checkpoint_end_date" +
                            ", NVL(ppd.actual_end_time, ppd.scheduled_end_time) as registration_end_date" +
                            ", (SELECT MAX(scheduled_end_time) FROM project_phase phet WHERE phet.project_id = p.project_id) as scheduled_end_date" +
                            ", NVL((SELECT SUM(pr.number_of_submissions) FROM prize pr WHERE pr.project_id = p.project_id AND pr.prize_type_id = 14), 0) AS checkpoint_prize_number" +
                            ", (SELECT NVL(MAX(prize_amount), 0) FROM prize pr WHERE pr.project_id = p.project_id AND pr.prize_type_id = 14) AS checkpoint_prize_amount" +
                            ",(CASE WHEN pict.value = 'On' THEN NVL((SELECT value::decimal FROM project_info pidr WHERE pidr.project_id = p.project_id AND pidr.project_info_type_id = 30), 0) ELSE 0 END) as dr_points" +
                            ",(NVL((SELECT sum(total_amount)  " +
                            "       FROM  informixoltp:payment_detail pmd, informixoltp:payment pm  " +
                            "        WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1  " +
                            "        and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id = 24  " +
                            "        AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +" +
                            "    NVL((SELECT sum(pmd2.total_amount)   " +
                            "           FROM  informixoltp:payment_detail pmd,    " +
                            "                 informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,   " +
                            "                 informixoltp:payment pm2   " +
                            "            WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1   " +
                            "            and pm.most_recent_detail_id = pmd.payment_detail_id    " +
                            "            and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id = 24  " +
                            "            AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as reliability_cost" +
                            ",(NVL((SELECT sum(total_amount)  " +
                            "       FROM  informixoltp:payment_detail pmd, informixoltp:payment pm  " +
                            "        WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1  " +
                            "        and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id IN (7,26,28,36)  " +
                            "        AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +" +
                            "    NVL((SELECT sum(pmd2.total_amount)   " +
                            "           FROM  informixoltp:payment_detail pmd,    " +
                            "                 informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,   " +
                            "                 informixoltp:payment pm2   " +
                            "            WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1   " +
                            "            and pm.most_recent_detail_id = pmd.payment_detail_id    " +
                            "            and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id IN (7,26,28,36)  " +
                            "            AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as review_cost" +
                            ", (SELECT value::INTEGER FROM project_info piforum WHERE piforum.project_id = p.project_id and piforum.project_info_type_id = 4) as forum_id" +
                            ", (select CASE when pi53.value == 'true' THEN 1 ELSE 0 END FROM project_info pi53 where pi53.project_info_type_id = 53 and pi53.project_id = p.project_id) as submission_viewable" +
                            ", NVL((SELECT 1 FROM contest_eligibility WHERE contest_id = p.project_id), 0) AS is_private" +

                            // estimated_reliability_cost
                            ",(CASE WHEN pire.value = 'true' THEN NVL((SELECT value::decimal FROM project_info pi38 WHERE pi38.project_id = p.project_id AND pi38.project_info_type_id = 38), 0) ELSE 0 END) as estimated_reliability_cost" +

                            // estimated_review_cost
                            ",(NVL((SELECT value::decimal FROM project_info pi33 WHERE pi33.project_id = p.project_id AND pi33.project_info_type_id = 33), 0) " +

                            "+ NVL((SELECT value::decimal FROM project_info pi35 WHERE pi35.project_id = p.project_id AND pi35.project_info_type_id = 35), 0)) as estimated_review_cost" +

                            // estimated_copilot_cost
                            ",NVL((SELECT value::decimal FROM project_info pi49 WHERE pi49.project_id = p.project_id AND pi49.project_info_type_id = 49), 0) as estimated_copilot_cost" +

                            // estimated_admin_fee
                            ",NVL((SELECT value::decimal FROM project_info pi31 WHERE pi31.project_id = p.project_id AND pi31.project_info_type_id = 31), 0) as estimated_admin_fee" +

                            // actual_total_prize
                            ",(NVL((SELECT sum(total_amount)  " +
                            "       FROM  informixoltp:payment_detail pmd, informixoltp:payment pm  " +
                            "        WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1  " +
                            "        and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id IN (6, 29, 10, 42, 43, 44, 49, 50, 51, 55, 61, 64, 65, 60, 13, 21)  " +
                            "        AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +" +
                            "    NVL((SELECT sum(pmd2.total_amount)   " +
                            "           FROM  informixoltp:payment_detail pmd,    " +
                            "                 informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,   " +
                            "                 informixoltp:payment pm2   " +
                            "            WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1   " +
                            "            and pm.most_recent_detail_id = pmd.payment_detail_id    " +
                            "            and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id IN (6, 29, 10, 42, 43, 44, 49, 50, 51, 55, 61, 64, 65, 60, 13, 21)  " +
                            "            AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as actual_total_prize" +

                            // copilot_cost
                            ",(NVL((SELECT sum(total_amount)  " +
                            "       FROM  informixoltp:payment_detail pmd, informixoltp:payment pm  " +
                            "        WHERE pmd.component_project_id = p.project_id and pmd.installment_number = 1  " +
                            "        and pm.most_recent_detail_id = pmd.payment_detail_id and pmd.payment_type_id IN (45, 57)  " +
                            "        AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)  +" +
                            "    NVL((SELECT sum(pmd2.total_amount)   " +
                            "           FROM  informixoltp:payment_detail pmd,    " +
                            "                 informixoltp:payment pm LEFT OUTER JOIN informixoltp:payment_detail pmd2 on pm.payment_id = pmd2.parent_payment_id,   " +
                            "                 informixoltp:payment pm2   " +
                            "            WHERE pmd.component_project_id = p.project_id and pmd2.installment_number = 1   " +
                            "            and pm.most_recent_detail_id = pmd.payment_detail_id    " +
                            "            and pm2.most_recent_detail_id = pmd2.payment_detail_id and pmd2.payment_type_id IN (45, 57)  " +
                            "            AND NOT pmd2.payment_status_id IN (65, 68, 69)), 0)) as copilot_cost" +

                            "   from project p , " +
                            "   project_info pir, " +
                            "   project_info pivers, " +
                            "   outer project_info pivi," +
                            "   outer project_info pivt," +
                            "   outer project_info pict," +
                            "   outer project_info pire," +
                            "   outer project_info pi1," +
                            "   outer project_info pi2," +
                            "   outer project_info piaf," +
                            "   outer project_info pib," +
                            "   categories cat, " +
                            "   comp_catalog cc, " +
                            "   comp_versions cv, " +
                            "   project_status_lu psl, " +
                            "   OUTER project_phase psd, " +
                            "   OUTER project_phase ppd, " +
                            "   OUTER project_phase pcsd, " +
                            "   OUTER project_phase pced, " +
                            "   project_category_lu pcl " +
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
                            "   and pire.project_id = p.project_id " +
                            "   and pire.project_info_type_id = 45 " +
                            "   and pi1.project_id = p.project_id " +
                            "   and pi1.project_info_type_id = 21 " +
                            "   and pi2.project_id = p.project_id " +
                            "   and pi2.project_info_type_id = 3 " +
                            "   and piaf.project_id = p.project_id " +
                            "   and piaf.project_info_type_id = 31 " +
                            "   and pib.project_id = p.project_id " +
                            "   and pib.project_info_type_id = 32 and pib.value > 0 " +
                            ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
                            "   and cc.component_id = pir.value " +
                            "   and cc.root_category_id = cat.category_id " +
                            "   and psl.project_status_id = p.project_status_id " +
                            "   and pcl.project_category_id = p.project_category_id " +
                            "   and psd.project_id = p.project_id " +
                            "   and psd.phase_type_id = 2 " +
                            "   and ppd.project_id = p.project_id " +
                            "   and ppd.phase_type_id = 1 " +
                            "   and pcsd.project_id = p.project_id " +
                            "   and pcsd.phase_type_id = 15 " +
                            "   and pced.project_id = p.project_id " +
                            "   and pced.phase_type_id = 17 " +
                            // we need to process deleted project, otherwise there's a possibility
                            // they will keep living in the DW.
                            //" and p.project_status_id <> 3 " +
                            "   and p.project_category_id in " + LOAD_CATEGORIES +
                            "   and (p.modify_date > ? " +
                            // comp versions with modified date
                            "   or cv.modify_date > ? " +
                            // add projects who have modified resources
                            "   or p.project_id in (select distinct r.project_id from resource r where (r.create_date > ? or r.modify_date > ?)) " +
                            // add projects who have modified upload and submissions
                            "   or p.project_id in (select distinct u.project_id from upload u, submission s where s.submission_type_id = 1 and u.upload_id = s.upload_id and " +
                            "   (u.create_date > ? or u.modify_date > ? or s.create_date > ? or s.modify_date > ?)) " +
                            // add projects who have modified results
                            "   or p.project_id in (select distinct pr.project_id from project_result pr where (pr.create_date > ? or pr.modify_date > ?)) " +
                            "   or p.project_id in (select distinct pi.project_id from project_info pi where project_info_type_id in  (2, 3, 21, 22, 23, 26, 31, 32, 33, 38, 45, 49) and (pi.create_date > ? or pi.modify_date > ?)) " +
                            "   or p.project_id in (select distinct pmd.component_project_id::int " +
                            "      FROM informixoltp:payment pm INNER JOIN informixoltp:payment_detail pmd ON pm.most_recent_detail_id = pmd.payment_detail_id " +
                            "      WHERE NOT pmd.payment_status_id IN (65, 69) AND (pmd.create_date > ? or pmd.date_modified > ? or pm.create_date > ? or pm.modify_date > ?)) " +
                            (needLoadMovedProject() ? " OR p.modify_user <> 'Converter'  OR pir.modify_user <> 'Converter' )" : ")");

            final String UPDATE = "update project set component_name = ?,  num_registrations = ?, " +
                    "num_submissions = ?, num_valid_submissions = ?, avg_raw_score = ?, avg_final_score = ?, " +
                    "phase_id = ?, phase_desc = ?, category_id = ?, category_desc = ?, posting_date = ?, submitby_date " +
                    "= ?, complete_date = ?, component_id = ?, review_phase_id = ?, review_phase_name = ?, " +
                    "status_id = ?, status_desc = ?, level_id = ?, viewable_category_ind = ?, version_id = ?, version_text = ?, " +
                    "rating_date = ?, num_submissions_passed_review=?, winner_id=?, stage_id = ?, digital_run_ind = ?, " +
                    "suspended_ind = ?, project_category_id = ?, project_category_name = ?, " +
                    "tc_direct_project_id = ?, admin_fee = ?, contest_prizes_total = ?, " +
                    "client_project_id = ?, duration = ? , last_modification_date = current, " +
                    "first_place_prize = ?, num_checkpoint_submissions = ? , num_valid_checkpoint_submissions = ?, total_prize = ?, " +
                    "challenge_manager = ?, challenge_creator = ?, challenge_launcher = ?, copilot = ?, checkpoint_start_date = ?, checkpoint_end_date = ?, " +
                    "registration_end_date = ?, scheduled_end_date = ?, checkpoint_prize_amount = ?, checkpoint_prize_number = ?, dr_points = ?, " +
                    "reliability_cost = ?, review_cost = ?, forum_id = ?, submission_viewable = ?, is_private = ?," +
                    "estimated_reliability_cost = ?, estimated_review_cost = ?, estimated_copilot_cost = ?, estimated_admin_fee = ?, actual_total_prize = ?, copilot_cost = ?" +
                    "where project_id = ? ";

            final String INSERT = "insert into project (project_id, component_name, num_registrations, num_submissions, " +
                    "num_valid_submissions, avg_raw_score, avg_final_score, phase_id, phase_desc, " +
                    "category_id, category_desc, posting_date, submitby_date, complete_date, component_id, " +
                    "review_phase_id, review_phase_name, status_id, status_desc, level_id, viewable_category_ind, version_id, " +
                    "version_text, rating_date, num_submissions_passed_review, winner_id, stage_id, digital_run_ind, suspended_ind, project_category_id, project_category_name, " +
                    "tc_direct_project_id, admin_fee, contest_prizes_total, client_project_id, duration, " +
                    "last_modification_date, first_place_prize, num_checkpoint_submissions, num_valid_checkpoint_submissions, total_prize, " +
                    "challenge_manager, challenge_creator, challenge_launcher, copilot, checkpoint_start_date, checkpoint_end_date," +
                    "registration_end_date, scheduled_end_date, checkpoint_prize_amount, checkpoint_prize_number, dr_points," +
                    "reliability_cost, review_cost, forum_id, submission_viewable, is_private," +
                    "estimated_reliability_cost, estimated_review_cost, estimated_copilot_cost, estimated_admin_fee, actual_total_prize, copilot_cost)" +
                    "values (?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                    "?, ?, current, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

            // Statements for updating the duration, fulfillment, start_date_calendar_id fields
            final String UPDATE_AGAIN = "UPDATE project SET " +
                    "fulfillment = (CASE WHEN status_id = 7 THEN 1 ELSE 0 END), " +
                    "start_date_calendar_id = (SELECT calendar_id FROM calendar c WHERE YEAR(project.posting_date) = c.year " +
                    "                          AND MONTH(project.posting_date) = c.month_numeric " +
                    "                          AND DAY(project.posting_date) = c.day_of_month) " +
                    "WHERE complete_date IS NOT NULL AND tc_direct_project_id > 0 AND posting_date IS NOT NULL";

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
            select.setTimestamp(12, fLastLogTime);
            select.setTimestamp(13, fLastLogTime);
            select.setTimestamp(14, fLastLogTime);
            select.setTimestamp(15, fLastLogTime);
            select.setTimestamp(16, fLastLogTime);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            updateAgain = prepareStatement(UPDATE_AGAIN, TARGET_DB);
            rs = select.executeQuery();
            int count = 0;
            while (rs.next()) {

                if (rs.getLong("project_stat_id") != DELETED_PROJECT_STATUS) {
                    if (rs.getLong("version_id") > 999) {
                        log.info("the version id is more than 999");
                        continue;
                        // throw new Exception("component " + rs.getString("component_name") + " has a version > 999");
                    }

                    long duration = -1;

                    Timestamp postingDate = rs.getTimestamp("posting_date");
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
                    if (postingDate != null) {
                        update.setDate(11, new Date(postingDate.getTime()));
                    } else {
                        update.setNull(11, Types.DATE);
                    }
                    update.setDate(12, rs.getDate("submitby_date"));
                    Timestamp completeDate = convertToDate(rs.getString("complete_date"));
                    Timestamp actualCompleteDate = convertToDate(rs.getString("actual_complete_date"));
                    if (completeDate != null) {
                        update.setTimestamp(13, completeDate);
                    } else {
                        update.setNull(13, Types.TIMESTAMP);
                    }

                    if (actualCompleteDate != null && postingDate != null) {
                        duration = actualCompleteDate.getTime() - postingDate.getTime();
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


                    if (postingDate == null) {
                        update.setNull(26, Types.DATE);
                    } else {
                        try {
                            update.setLong(26, calculateStage(new java.sql.Date(postingDate.getTime())));
                        } catch (Exception e) {
                            update.setNull(26, Types.DATE);
                        }
                    }
                    String digitRun = rs.getString("digital_run_ind");
                    update.setInt(27, "On".equals(digitRun) || "Yes".equals(digitRun) ? 1 : 0);
                    update.setInt(28, rs.getInt("suspended_ind"));

                    update.setInt(29, rs.getInt("project_category_id"));
                    update.setString(30, rs.getString("name"));
                    update.setLong(31, rs.getLong("tc_direct_project_id"));

                    double prizeTotal = rs.getDouble("contest_prizes_total");
                    double percentage = rs.getDouble("contest_fee_percentage");
                    double adminFee = rs.getDouble("admin_fee");
                    long projectStatusId = rs.getLong("project_stat_id");
                    if (projectStatusId == 4 ||  projectStatusId == 5 || projectStatusId == 6 || projectStatusId == 8 || projectStatusId == 11)
                    {
                        adminFee = 0;
                    }
                    update.setDouble(32, (percentage < 1e-5 ? adminFee : percentage * prizeTotal));
                    update.setDouble(33, prizeTotal);
                    if (rs.getString("billing_project_id") != null
                            && !rs.getString("billing_project_id").equals("0"))
                    {
                        update.setLong(34, rs.getLong("billing_project_id"));
                    }
                    else
                    {
                        update.setNull(34, Types.DECIMAL);
                    }

                    if (duration >= 0) {
                        update.setLong(35, duration / 1000 / 60);
                    } else {
                        update.setNull(35, Types.DECIMAL);
                    }

                    update.setDouble(36, rs.getDouble("first_place_prize"));
                    update.setInt(37, rs.getInt("num_checkpoint_submissions"));
                    update.setInt(38, rs.getInt("num_valid_checkpoint_submissions"));
                    update.setDouble(39, rs.getDouble("total_prize"));

                    setLongParameter(rs, update, "challenge_manager", 40);
                    setLongParameter(rs, update, "challenge_creator", 41);
                    setLongParameter(rs, update, "challenge_launcher", 42);
                    setLongParameter(rs, update, "copilot", 43);


                    Timestamp checkpointStartDate = rs.getTimestamp("checkpoint_start_date");
                    Timestamp checkpointEndDate = rs.getTimestamp("checkpoint_end_date");

                    if (checkpointStartDate != null) {
                        update.setTimestamp(44, checkpointStartDate);
                    } else {
                        update.setNull(44, Types.TIMESTAMP);
                    }

                    if (checkpointEndDate != null) {
                        update.setTimestamp(45, checkpointEndDate);
                    } else {
                        update.setNull(45, Types.TIMESTAMP);
                    }

                    setTimestampParameter(rs, update, "registration_end_date", 46);
                    setTimestampParameter(rs, update, "scheduled_end_date", 47);
                    update.setDouble(48, rs.getDouble("checkpoint_prize_amount"));
                    update.setDouble(49, rs.getDouble("checkpoint_prize_number"));
                    update.setDouble(50, rs.getDouble("dr_points"));
                    update.setDouble(51, rs.getDouble("reliability_cost"));
                    update.setDouble(52, rs.getDouble("review_cost"));

                    setLongParameter(rs, update, "forum_id", 53);
                    setLongParameter(rs, update, "submission_viewable", 54);
                    setLongParameter(rs, update, "is_private", 55);


                    update.setDouble(56, rs.getDouble("estimated_reliability_cost"));
                    update.setDouble(57, rs.getDouble("estimated_review_cost"));
                    update.setDouble(58, rs.getDouble("estimated_copilot_cost"));
                    update.setDouble(59, rs.getDouble("estimated_admin_fee"));
                    update.setDouble(60, rs.getDouble("actual_total_prize"));
                    update.setDouble(61, rs.getDouble("copilot_cost"));


                    update.setLong(62, rs.getLong("project_id"));
                    System.out.println("------------project id --------------------------"+rs.getLong("project_id"));

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
                        if (postingDate != null) {
                            insert.setDate(12, new Date(postingDate.getTime()));
                        } else {
                            insert.setNull(12, Types.DATE);
                        }
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
                        if (postingDate == null) {
                            insert.setNull(27, Types.DATE);
                        } else {
                            try {
                                insert.setLong(27, calculateStage(new java.sql.Date(postingDate.getTime())));
                            } catch (Exception e) {
                                insert.setNull(27, Types.DATE);
                            }
                        }
                        digitRun = rs.getString("digital_run_ind");
                        insert.setInt(28, "On".equals(digitRun) || "Yes".equals(digitRun) ? 1 : 0);
                        insert.setInt(29, rs.getInt("suspended_ind"));
                        insert.setInt(30, rs.getInt("project_category_id"));
                        insert.setString(31, rs.getString("name"));
                        insert.setLong(32, rs.getLong("tc_direct_project_id"));
                        insert.setDouble(33, (percentage < 1e-7 ? adminFee : percentage * prizeTotal));
                        insert.setDouble(34, prizeTotal);
                        if (rs.getString("billing_project_id") != null
                                && !rs.getString("billing_project_id").equals("0"))
                        {    //System.out.println("------------billing id-------------------"+rs.getString("billing_project_id")+"!!!");
                            insert.setLong(35, rs.getLong("billing_project_id"));
                        }
                        else
                        {
                            insert.setNull(35, Types.DECIMAL);
                        }
                        if (duration >= 0) {
                            insert.setLong(36, duration / 1000 / 60);
                        } else {
                            insert.setNull(36, Types.DECIMAL);
                        }


                        insert.setDouble(37, rs.getDouble("first_place_prize"));
                        insert.setInt(38, rs.getInt("num_checkpoint_submissions"));
                        insert.setInt(39, rs.getInt("num_valid_checkpoint_submissions"));
                        insert.setDouble(40, rs.getDouble("total_prize"));


                        setLongParameter(rs, insert, "challenge_manager", 41);
                        setLongParameter(rs, insert, "challenge_creator", 42);
                        setLongParameter(rs, insert, "challenge_launcher", 43);
                        setLongParameter(rs, insert, "copilot", 44);


                        if (checkpointStartDate != null) {
                            insert.setTimestamp(45, checkpointStartDate);
                        } else {
                            insert.setNull(45, Types.TIMESTAMP);
                        }

                        if (checkpointEndDate != null) {
                            insert.setTimestamp(46, checkpointEndDate);
                        } else {
                            insert.setNull(46, Types.TIMESTAMP);
                        }

                        setTimestampParameter(rs, insert, "registration_end_date", 47);
                        setTimestampParameter(rs, insert, "scheduled_end_date", 48);
                        insert.setDouble(49, rs.getDouble("checkpoint_prize_amount"));
                        insert.setDouble(50, rs.getDouble("checkpoint_prize_number"));
                        insert.setDouble(51, rs.getDouble("dr_points"));
                        insert.setDouble(52, rs.getDouble("reliability_cost"));
                        insert.setDouble(53, rs.getDouble("review_cost"));

                        setLongParameter(rs, insert, "forum_id", 54);
                        setLongParameter(rs, insert, "submission_viewable", 55);
                        setLongParameter(rs, insert, "is_private", 56);

                        insert.setDouble(57, rs.getDouble("estimated_reliability_cost"));
                        insert.setDouble(58, rs.getDouble("estimated_review_cost"));
                        insert.setDouble(59, rs.getDouble("estimated_copilot_cost"));
                        insert.setDouble(60, rs.getDouble("estimated_admin_fee"));
                        insert.setDouble(61, rs.getDouble("actual_total_prize"));
                        insert.setDouble(62, rs.getDouble("copilot_cost"));

                        insert.executeUpdate();
                    }
                } else {
                    // we need to delete this project and all related objects in the database.
                    log.info("Found project to delete: " + rs.getLong("project_id"));
                    deleteProject(rs.getLong("project_id"));
                }
                count++;
            }

            // update the start_date_calendar_id, duration, fulfillment fields
            updateAgain.executeUpdate();
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            DBMS.printSqlException(true, sqle);
            log.error("Load of 'project_result / project' table failed.", sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
            close(updateAgain);
        }
    }


    /**
     * <p/>
     * Load Marathon Matches to the DW.
     * </p>
     *
     * @throws Exception if any error occurs
     * @since 1.2.5
     */
    public void doLoadMarathonMatches() throws Exception {
        log.info("load marathon matches");
        PreparedStatement select = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        PreparedStatement updateAgain = null;
        ResultSet rs = null;

        try {
            //log.debug("PROCESSING PROJECT " + project_id);
            long start = System.currentTimeMillis();

            select = prepareStatement("select count(*) from project where project_category_id = 37", TARGET_DB);
            rs = select.executeQuery();
            rs.next();

            boolean firstRun = rs.getInt(1) == 0;

            if (firstRun) log.info("Loading marathon matches for the first time.  A complete load will be performed.");

            //get data from source DB
            final String SELECT =
                    "SELECT p.project_id ,\n" +
                            "       cc.component_id ,\n" +
                            "       cc.component_name ,\n" +
                            "\n" +
                            "  ( SELECT COUNT(*)\n" +
                            "   FROM informixoltp:round_registration rr\n" +
                            "   WHERE rr.round_id = pimatchid.value::INTEGER) AS num_registrations,\n" +
                            "\n" +
                            "  ( SELECT COUNT(*)\n" +
                            "   FROM informixoltp:long_component_state cs,\n" +
                            "                                          informixoltp:long_submission s\n" +
                            "   WHERE s.example = 0\n" +
                            "     AND s.long_component_state_id = cs.long_component_state_id\n" +
                            "     AND cs.round_id = pimatchid.value::INTEGER) AS num_submissions ,\n" +
                            "\n" +
                            "  ( SELECT SUM(prize_amount)\n" +
                            "   FROM prize pr\n" +
                            "   WHERE pr.prize_type_id = 15\n" +
                            "     AND pr.project_id = p.project_id\n" +
                            "     AND pr.place = 1) AS first_place_prize ,\n" +
                            "       p.project_category_id + 111 AS phase_id ,\n" +
                            "       pcl.NAME AS phase_desc ,\n" +
                            "       cat.category_id ,\n" +
                            "       cat.category_name AS category_desc ,\n" +
                            "\n" +
                            "  ( SELECT rs1.start_time::DATETIME YEAR TO SECOND\n" +
                            "   FROM informixoltp:round_segment rs1\n" +
                            "   WHERE rs1.round_id = pimatchid.value::INTEGER\n" +
                            "     AND rs1.segment_id = 1) AS posting_date -- registration start\n" +
                            "\n" +
                            "                                           ,\n" +
                            "\n" +
                            "  ( SELECT rs2.end_time::DATETIME YEAR TO SECOND\n" +
                            "   FROM informixoltp:round_segment rs2\n" +
                            "   WHERE rs2.round_id = pimatchid.value::INTEGER\n" +
                            "     AND rs2.segment_id = 2) AS submitby_date -- submission end\n" +
                            "\n" +
                            "    ,\n" +
                            "    1 AS level_id ,\n" +
                            "    picompletitiontime.value AS complete_date ,\n" +
                            "    p.project_status_id AS project_stat_id ,\n" +
                            "    psl.NAME AS project_stat_name ,\n" +
                            "    cat.viewable AS viewable ,\n" +
                            "    cv.version AS version_id ,\n" +
                            "    cv.version_text ,\n" +
                            "    p.project_category_id ,\n" +
                            "    pcl.NAME AS project_category_name ,\n" +
                            "    p.tc_direct_project_id ,\n" +
                            "    piadminfee.value::DECIMAL(10, 2) AS admin_fee ,\n" +
                            "    NVL(\n" +
                            "          ( SELECT CAST(NVL(pi57.value, '0') AS DECIMAL(10, 2))\n" +
                            "           FROM project_info pi57\n" +
                            "           WHERE p.project_id = pi57.project_id\n" +
                            "             AND pi57.project_info_type_id = 57), 0) AS contest_fee_percentage ,\n" +
                            "    NVL(\n" +
                            "          ( SELECT SUM(total_amount)\n" +
                            "           FROM informixoltp:payment_detail pmd, informixoltp:payment pm, project_info pi56\n" +
                            "           WHERE pi56.project_id = p.project_id\n" +
                            "             AND pi56.project_info_type_id = 56\n" +
                            "             AND pmd.algorithm_round_id = pi56.value::INTEGER\n" +
                            "             AND pmd.installment_number = 1\n" +
                            "             AND pmd.component_project_id IS NULL\n" +
                            "             AND pm.most_recent_detail_id = pmd.payment_detail_id\n" +
                            "             AND NOT pmd.payment_status_id IN (65, 68, 69)), 0) AS contest_prizes_total ,\n" +
                            "\n" +
                            "  ( SELECT NVL(SUM(pr.number_of_submissions * pr.prize_amount), 0)\n" +
                            "   FROM prize pr\n" +
                            "   WHERE pr.project_id = p.project_id\n" +
                            "     AND pr.prize_type_id IN (14,\n" +
                            "                              15)) AS total_prize ,\n" +
                            "                                            pibilling.value AS billing_project_id ,\n" +
                            "\n" +
                            "  ( SELECT rs4.end_time::DATETIME YEAR TO SECOND\n" +
                            "   FROM informixoltp:round_segment rs4\n" +
                            "   WHERE rs4.round_id = pimatchid.value::INTEGER\n" +
                            "     AND rs4.segment_id = 4) AS actual_complete_date\n" +
                            "FROM project p ,\n" +
                            "     project_info pimatchid ,\n" +
                            "     project_info pir ,\n" +
                            "     project_info pivers ,\n" +
                            "     OUTER project_info picompletitiontime ,\n" +
                            "     OUTER project_info piadminfee ,\n" +
                            "     OUTER project_info pibilling ,\n" +
                            "     categories cat ,\n" +
                            "     comp_catalog cc ,\n" +
                            "     comp_versions cv ,\n" +
                            "     project_status_lu psl ,\n" +
                            "     project_category_lu pcl\n" +
                            "WHERE pir.project_id = p.project_id\n" +
                            "  AND pir.project_info_type_id = 2\n" +
                            "  AND pimatchid.project_id = p.project_id\n" +
                            "  AND pimatchid.project_info_type_id = 56\n" +
                            "  AND pivers.project_id = p.project_id\n" +
                            "  AND pivers.project_info_type_id = 1\n" +
                            "  AND pivers.value = cv.comp_vers_id\n" +
                            "  AND picompletitiontime.project_id = p.project_id\n" +
                            "  AND picompletitiontime.project_info_type_id = 21\n" +
                            "  AND piadminfee.project_id = p.project_id\n" +
                            "  AND piadminfee.project_info_type_id = 31\n" +
                            "  AND pibilling.project_id = p.project_id\n" +
                            "  AND pibilling.project_info_type_id = 32\n" +
                            "  AND pibilling.value > 0\n" +
                            "  AND p.project_id NOT IN\n" +
                            "    ( SELECT ce.contest_id\n" +
                            "     FROM contest_eligibility ce\n" +
                            "     WHERE ce.is_studio = 0)\n" +
                            "  AND cc.component_id = pir.value\n" +
                            "  AND cc.root_category_id = cat.category_id\n" +
                            "  AND psl.project_status_id = p.project_status_id\n" +
                            "  AND pcl.project_category_id = p.project_category_id\n" +
                            "  AND p.project_category_id = 37 -- marathon match only\n" +
                            "AND p.project_status_id = 7 -- completed only\n" + (!firstRun ?
                            "AND (\n" +
                            "    p.modify_date > ?\n" +
                            "    OR cv.modify_date > ?\n" +
                            "    OR p.project_id IN (\n" +
                            "      SELECT DISTINCT pi.project_id\n" +
                            "      FROM project_info pi\n" +
                            "      WHERE project_info_type_id IN (\n" +
                            "          2\n" +
                            "          ,3\n" +
                            "          ,21\n" +
                            "          ,22\n" +
                            "          ,23\n" +
                            "          ,26\n" +
                            "          ,31\n" +
                            "          ,32\n" +
                            "          ,57\n" +
                            "          ,56\n" +
                            "          )\n" +
                            "        AND (\n" +
                            "          pi.create_date > ?\n" +
                            "          OR pi.modify_date > ?\n" +
                            "          )\n" +
                            "      )\n" +
                            "    OR pimatchid.value::INT IN (\n" +
                            "      SELECT DISTINCT pmd.algorithm_round_id::INT\n" +
                            "      FROM informixoltp: payment pm\n" +
                            "      INNER JOIN informixoltp: payment_detail pmd ON pm.most_recent_detail_id = pmd.payment_detail_id\n" +
                            "      WHERE NOT pmd.payment_status_id IN (65,69)\n" +
                            "        AND (\n" +
                            "          pmd.create_date > ?\n" +
                            "          OR pmd.date_modified > ?\n" +
                            "          OR pm.create_date > ?\n" +
                            "          OR pm.modify_date > ?\n" +
                            "          )\n" +
                            "      )\n" +
                            "    )\n" : "");

            final String UPDATE = "update project set component_name = ?,  num_registrations = ?, " +
                    "num_submissions = ?," +
                    "phase_id = ?, phase_desc = ?, category_id = ?, category_desc = ?, posting_date = ?, submitby_date " +
                    "= ?, complete_date = ?, component_id = ?, " +
                    "status_id = ?, status_desc = ?, level_id = ?, viewable_category_ind = ?, version_id = ?, version_text = ?, " +
                    "project_category_id = ?, project_category_name = ?, " +
                    "tc_direct_project_id = ?, admin_fee = ?, contest_prizes_total = ?, " +
                    "client_project_id = ?, duration = ? , last_modification_date = current, " +
                    "first_place_prize = ?, total_prize = ? " +
                    "where project_id = ? ";

            final String INSERT = "insert into project (project_id, component_name, num_registrations, num_submissions, " +
                    "phase_id, phase_desc, " +
                    "category_id, category_desc, posting_date, submitby_date, complete_date, component_id, " +
                    "status_id, status_desc, level_id, viewable_category_ind, version_id, " +
                    "version_text, project_category_id, project_category_name, " +
                    "tc_direct_project_id, admin_fee, contest_prizes_total, client_project_id, duration, last_modification_date, first_place_prize, total_prize) " +
                    "values (?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, " +
                    "current, ?, ?) ";

            // Statements for updating the duration, fulfillment, start_date_calendar_id fields
            final String UPDATE_AGAIN = "UPDATE project SET " +
                    "fulfillment = (CASE WHEN status_id = 7 THEN 1 ELSE 0 END), " +
                    "start_date_calendar_id = (SELECT calendar_id FROM calendar c WHERE YEAR(project.posting_date) = c.year " +
                    "                          AND MONTH(project.posting_date) = c.month_numeric " +
                    "                          AND DAY(project.posting_date) = c.day_of_month) " +
                    "WHERE complete_date IS NOT NULL AND tc_direct_project_id > 0 AND posting_date IS NOT NULL";

            select = prepareStatement(SELECT, SOURCE_DB);

            if(!firstRun) {
                select.setTimestamp(1, fLastLogTime);
                select.setTimestamp(2, fLastLogTime);
                select.setTimestamp(3, fLastLogTime);
                select.setTimestamp(4, fLastLogTime);
                select.setTimestamp(5, fLastLogTime);
                select.setTimestamp(6, fLastLogTime);
                select.setTimestamp(7, fLastLogTime);
                select.setTimestamp(8, fLastLogTime);
            }

            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);
            updateAgain = prepareStatement(UPDATE_AGAIN, TARGET_DB);
            rs = select.executeQuery();
            int count = 0;
            while (rs.next()) {

                if (rs.getLong("project_stat_id") != DELETED_PROJECT_STATUS) {
                    if (rs.getLong("version_id") > 999) {
                        log.info("the version id is more than 999");
                        continue;
                        // throw new Exception("component " + rs.getString("component_name") + " has a version > 999");
                    }

                    long duration = -1;

                    Timestamp postingDate = rs.getTimestamp("posting_date");
                    //update record, if 0 rows affected, insert record
                    update.setString(1, rs.getString("component_name"));
                    update.setObject(2, rs.getObject("num_registrations"));
                    update.setInt(3, rs.getInt("num_submissions"));
                    update.setInt(4, rs.getInt("phase_id"));
                    update.setString(5, rs.getString("phase_desc"));
                    update.setInt(6, rs.getInt("category_id"));
                    update.setString(7, rs.getString("category_desc"));
                    if (postingDate != null) {
                        update.setDate(8, new Date(postingDate.getTime()));
                    } else {
                        update.setNull(8, Types.DATE);
                    }
                    update.setDate(9, rs.getDate("submitby_date"));
                    Timestamp completeDate = convertToDate(rs.getString("complete_date"));
                    Timestamp actualCompleteDate = convertToDate(rs.getString("actual_complete_date"));
                    if (completeDate != null) {
                        update.setTimestamp(10, completeDate);
                    } else {
                        update.setNull(10, Types.TIMESTAMP);
                    }

                    if (actualCompleteDate != null && postingDate != null) {
                        duration = actualCompleteDate.getTime() - postingDate.getTime();
                    }

                    update.setLong(11, rs.getLong("component_id"));
                    update.setLong(12, rs.getInt("project_stat_id"));
                    update.setString(13, rs.getString("project_stat_name"));
                    update.setLong(14, rs.getLong("level_id"));
                    update.setInt(15, rs.getInt("viewable"));
                    update.setInt(16, (int) rs.getLong("version_id"));
                    update.setString(17, rs.getString("version_text"));

                    update.setInt(18, rs.getInt("project_category_id"));
                    update.setString(19, rs.getString("project_category_name"));
                    update.setLong(20, rs.getLong("tc_direct_project_id"));

                    double prizeTotal = rs.getDouble("contest_prizes_total");
                    double percentage = rs.getDouble("contest_fee_percentage");
                    double adminFee = rs.getDouble("admin_fee");
                    long projectStatusId = rs.getLong("project_stat_id");
                    if (projectStatusId == 4 ||  projectStatusId == 5 || projectStatusId == 6 || projectStatusId == 8 || projectStatusId == 11)
                    {
                        adminFee = 0;
                    }
                    update.setDouble(21, (percentage < 1e-5 ? adminFee : percentage * prizeTotal));
                    update.setDouble(22, prizeTotal);
                    if (rs.getString("billing_project_id") != null
                            && !rs.getString("billing_project_id").equals("0"))
                    {
                        update.setLong(23, rs.getLong("billing_project_id"));
                    }
                    else
                    {
                        update.setNull(23, Types.DECIMAL);
                    }

                    if (duration >= 0) {
                        update.setLong(24, duration / 1000 / 60);
                    } else {
                        update.setNull(24, Types.DECIMAL);
                    }

                    update.setDouble(25, rs.getDouble("first_place_prize"));
                    update.setDouble(26, rs.getDouble("total_prize"));

                    update.setLong(27, rs.getLong("project_id"));

                    System.out.println("------------marathon match project id --------------------------" + rs.getLong("project_id"));

                    int retVal = update.executeUpdate();

                    if (retVal == 0) {
                        //need to insert
                        insert.setLong(1, rs.getLong("project_id"));
                        insert.setString(2, rs.getString("component_name"));
                        insert.setObject(3, rs.getObject("num_registrations"));
                        insert.setInt(4, rs.getInt("num_submissions"));
                        insert.setInt(5, rs.getInt("phase_id"));
                        insert.setString(6, rs.getString("phase_desc"));
                        insert.setInt(7, rs.getInt("category_id"));
                        insert.setString(8, rs.getString("category_desc"));
                        if (postingDate != null) {
                            insert.setDate(9, new Date(postingDate.getTime()));
                        } else {
                            insert.setNull(9, Types.DATE);
                        }
                        insert.setDate(10, rs.getDate("submitby_date"));
                        completeDate = convertToDate(rs.getString("complete_date"));
                        if (completeDate != null) {
                            insert.setDate(11, new java.sql.Date(completeDate.getTime()));
                        } else {
                            insert.setNull(11, Types.DATE);
                        }
                        insert.setLong(12, rs.getLong("component_id"));
                        insert.setLong(13, rs.getInt("project_stat_id"));
                        insert.setString(14, rs.getString("project_stat_name"));
                        insert.setLong(15, rs.getLong("level_id"));
                        insert.setInt(16, rs.getInt("viewable"));
                        insert.setInt(17, (int) rs.getLong("version_id"));
                        insert.setString(18, rs.getString("version_text"));
                        insert.setInt(19, rs.getInt("project_category_id"));
                        insert.setString(20, rs.getString("project_category_name"));
                        insert.setLong(21, rs.getLong("tc_direct_project_id"));
                        insert.setDouble(22, (percentage < 1e-7 ? adminFee : percentage * prizeTotal));
                        insert.setDouble(23, prizeTotal);
                        if (rs.getString("billing_project_id") != null
                                && !rs.getString("billing_project_id").equals("0"))
                        {    //System.out.println("------------billing id-------------------"+rs.getString("billing_project_id")+"!!!");
                            insert.setLong(24, rs.getLong("billing_project_id"));
                        }
                        else
                        {
                            insert.setNull(24, Types.DECIMAL);
                        }
                        if (duration >= 0) {
                            insert.setLong(25, duration / 1000 / 60);
                        } else {
                            insert.setNull(25, Types.DECIMAL);
                        }


                        insert.setDouble(26, rs.getDouble("first_place_prize"));
                        insert.setDouble(27, rs.getDouble("total_prize"));

                        insert.executeUpdate();
                    }
                } else {
                    // we need to delete this project and all related objects in the database.
                    log.info("Found marathon match project to delete: " + rs.getLong("project_id"));
                    deleteProject(rs.getLong("project_id"));
                }
                count++;
            }

            // update the start_date_calendar_id, duration, fulfillment fields
            updateAgain.executeUpdate();
            log.info("loaded " + count + " marathon match records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            DBMS.printSqlException(true, sqle);
            log.error("Load marathon match into 'project' table failed.", sqle);
            throw new Exception("Load marathon match into 'project' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
            close(updateAgain);
        }

    }


    /**
     * Load the project platforms data
     *
     * @throws Exception if any error.
     * @since 1.2.3
     */
    public void doLoadProjectPlatforms() throws Exception {
        log.info("load project platforms");

        PreparedStatement firstTimeSelect = null;
        PreparedStatement deletePlatforms = null;
        PreparedStatement selectPlatforms = null;
        PreparedStatement insertPlatforms = null;
        ResultSet rs = null;
        Set<Long> deletedProjects = new HashSet<Long>();

        try {
            long start = System.currentTimeMillis();

            firstTimeSelect = prepareStatement("SELECT count(*) from project_platform", TARGET_DB);
            rs = firstTimeSelect.executeQuery();
            rs.next();

            // no records, it's the first run of loading platforms
            boolean firstRun = rs.getInt(1) == 0;

            if(firstRun) log.info("Loading project platform table for the first time. A complete load will be performed");

            final String SELECT = "select pp.project_id, pp.project_platform_id, ppl.name from project_platform pp, project_platform_lu ppl, project p where pp.project_platform_id = ppl.project_platform_id and pp.project_id = p.project_id \n" +
                    (firstRun ? "" : " and (p.create_date > ? OR p.modify_date > ?);");

            selectPlatforms = prepareStatement(SELECT, SOURCE_DB);

            if(!firstRun) {
                // no the first time, set last loading time
                selectPlatforms.setTimestamp(1, fLastLogTime);
                selectPlatforms.setTimestamp(2, fLastLogTime);
            }


            final String DELETE = "delete from project_platform where project_id = ?";
            deletePlatforms = prepareStatement(DELETE, TARGET_DB);

            final String INSERT = "insert into project_platform (project_id, project_platform_id, name) VALUES(?, ?, ?)";
            insertPlatforms = prepareStatement(INSERT, TARGET_DB);

            rs = selectPlatforms.executeQuery();

            int countRecords = 0;

            while (rs.next()) {
                long projectID = rs.getLong("project_id");
                long projectPlatformID = rs.getLong("project_platform_id");
                String name = rs.getString("name");

                if(!firstRun && !deletedProjects.contains(projectID)) {
                    // the load is not run for the first time && it's not processed in this load, clear the old platforms for the project
                    deletePlatforms.clearParameters();
                    deletePlatforms.setLong(1, projectID);
                    deletePlatforms.executeUpdate();
                    deletedProjects.add(projectID);
                }

                insertPlatforms.clearParameters();
                insertPlatforms.setLong(1, projectID);
                insertPlatforms.setLong(2, projectPlatformID);
                insertPlatforms.setString(3, name);

                insertPlatforms.executeUpdate();
                countRecords ++;
            }

            log.info("Loaded " + countRecords + " records in "  + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch(SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load Project Platforms failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(firstTimeSelect);
            close(selectPlatforms);
            close(deletePlatforms);
            close(insertPlatforms);
            deletedProjects.clear();
            deletedProjects = null;
        }

    }

    /**
     * Loads the project technologies.
     *
     * @throws Exception if any error.
     * @since 1.2.3
     */
    public void doLoadProjectTechnologies() throws Exception {
        log.info("load project technologies");

        PreparedStatement firstTimeSelect = null;
        PreparedStatement deleteTechnologies = null;
        PreparedStatement selectTechnologies = null;
        PreparedStatement insertTechnologies = null;
        ResultSet rs = null;
        Set<Long> deletedProjects = new HashSet<Long>();

        try {
            long start = System.currentTimeMillis();

            firstTimeSelect = prepareStatement("SELECT count(*) from project_technology", TARGET_DB);
            rs = firstTimeSelect.executeQuery();
            rs.next();

            // no records, it's the first run of loading technologies
            boolean firstRun = rs.getInt(1) == 0;

            if(firstRun) log.info("Loading project technology table for the first time. A complete load will be performed");

            final String SELECT = "select p.project_id, ct.technology_type_id, ttl.technology_name from project p, project_info pi, comp_technology ct, technology_types ttl \n" +
                    "where p.project_id = pi.project_id AND pi.project_info_type_id = 1 AND pi.value = ct.comp_vers_id and ct.technology_type_id = ttl.technology_type_id " +
                    (firstRun ? "" : " AND (p.create_date > ? OR p.modify_date > ?)");

            selectTechnologies = prepareStatement(SELECT, SOURCE_DB);

            if(!firstRun) {
                // no the first time, set last loading time
                selectTechnologies.setTimestamp(1, fLastLogTime);
                selectTechnologies.setTimestamp(2, fLastLogTime);
            }


            final String DELETE = "delete from project_technology where project_id = ?";
            deleteTechnologies = prepareStatement(DELETE, TARGET_DB);

            final String INSERT = "insert into project_technology (project_id, project_technology_id, name) VALUES(?, ?, ?)";
            insertTechnologies = prepareStatement(INSERT, TARGET_DB);

            rs = selectTechnologies.executeQuery();

            int countRecords = 0;

            while (rs.next()) {
                long projectID = rs.getLong("project_id");
                long projectTechnologyID = rs.getLong("technology_type_id");
                String name = rs.getString("technology_name");

                if(!firstRun && !deletedProjects.contains(projectID)) {
                    // the load is not run for the first time && it's not processed in this load, clear the old technologies for the project
                    deleteTechnologies.clearParameters();
                    deleteTechnologies.setLong(1, projectID);
                    deleteTechnologies.executeUpdate();
                    deletedProjects.add(projectID);
                }

                insertTechnologies.clearParameters();
                insertTechnologies.setLong(1, projectID);
                insertTechnologies.setLong(2, projectTechnologyID);
                insertTechnologies.setString(3, name);

                insertTechnologies.executeUpdate();
                countRecords ++;
            }

            log.info("Loaded " + countRecords + " records in "  + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch(SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load Project technologies failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(firstTimeSelect);
            close(selectTechnologies);
            close(deleteTechnologies);
            close(insertTechnologies);
            deletedProjects.clear();
            deletedProjects = null;
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
        simpleDelete("design_project_result", "project_id", projectId);
        simpleDelete("project_spec_review_xref", "project_id", projectId);
        simpleDelete("project_platform", "project_id", projectId);
        simpleDelete("project_technology", "project_id", projectId);
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

    /**
     * <p/>
     * Load links between projects and spec reviews to the DW.
     * IMPORTANT: This will deprecate with the new spec review process when spec reviews are just phases in the parent
     * project.
     * </p>
     *
     * @throws Exception if any error occurs
     */
    public void doLoadSpecReviews() throws Exception {
        log.info("load spec reviews");
        PreparedStatement select = null;
        PreparedStatement selectDW = null;
        PreparedStatement update = null;
        PreparedStatement insert = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();

            //get data from source DB
            final String SELECT = "select base_p.project_id as base_project_id, spec_review_p.project_id as spec_review_project_id " +
                    "from project base_p, project spec_review_p, linked_project_xref lpx where " +
                    "spec_review_p.project_category_id = 27 " +
                    "and spec_review_p.project_id = lpx.dest_project_id " +
                    "and lpx.link_type_id = 3 " +
                    "and lpx.source_project_id = base_p.project_id ";

            final String SELECT_DW = "select 1 from project where project_id = ? ";

            final String UPDATE = "update project_spec_review_xref set spec_review_project_id = ? where project_id = ? ";

            final String INSERT = "insert into project_spec_review_xref (project_id, spec_review_project_id) values (?, ?) ";

            select = prepareStatement(SELECT, SOURCE_DB);
            selectDW = prepareStatement(SELECT_DW, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            insert = prepareStatement(INSERT, TARGET_DB);

            rs = select.executeQuery();
            int count = 0;
            while (rs.next()) {
                selectDW.setLong(1, rs.getLong("base_project_id"));
                if (selectDW.executeQuery().next()==false) {
                    continue;
                }

                update.setLong(1, rs.getLong("spec_review_project_id"));
                update.setLong(2, rs.getLong("base_project_id"));
                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    //need to insert
                    insert.setLong(1, rs.getLong("base_project_id"));
                    insert.setLong(2, rs.getLong("spec_review_project_id"));
                    insert.executeUpdate();
                }
                count++;
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_spec_review_xref' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(selectDW);
            close(insert);
            close(update);
        }
    }

    private static final DateFormat[] DATE_FORMATS = new DateFormat[]{
            new SimpleDateFormat("MM/dd/yyyy hh:mm", Locale.US),
            new SimpleDateFormat("MM.dd.yyyy hh:mm a", Locale.US),
            new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US),
            new SimpleDateFormat("MM.dd.yyyy HH:mm z", Locale.US),
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
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
     *
     * @throws Exception if any error occurs
     */
    public void doLoadProjectResults() throws Exception {
        log.info("load project results");
        ResultSet projectResults = null;
        PreparedStatement projectSelect = null;
        PreparedStatement resultInsert = null;
        PreparedStatement drInsert = null;
        PreparedStatement resultSelect = null;
        PreparedStatement delete = null;
        PreparedStatement deleteDrPoints = null;
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
                        "comp_versions cv, " +
                        "comp_catalog cc " +
                        "where p.project_id = pr.project_id " +
                        "and p.project_id = pi.project_id " +
                        "and p.project_status_id <> 3 " +
                        "and p.project_category_id in " + LOAD_CATEGORIES +
                        "and pi.project_info_type_id = 1 " +
                        "and cv.comp_vers_id= pi.value " +
                        "and cc.component_id = cv.component_id " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
                        "and (p.modify_date > ? " +
                        "   OR cv.modify_date > ? " +
                        "   OR pi.modify_date > ? " +
                        "   OR cc.modify_date > ? " +
                        "   OR pr.modify_date > ?" +
                        (needLoadMovedProject() ? " OR p.modify_user <> 'Converter' " +
                                " OR pi.modify_user <> 'Converter' " +
                                ")"
                                : ")");

        final String RESULT_SELECT = "SELECT DISTINCT pr.project_id,  " +
                " pr.user_id,  " +
                " CASE WHEN EXISTS (  " +
                "    SELECT '1'  " +
                "    FROM submission s,  " +
                "     upload u  " +
                "    WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id AND s  " +
                "     .submission_status_id IN (1, 2, 3, 4)  " +
                "    ) THEN 1 ELSE 0 END AS submit_ind,  " +
                " CASE WHEN p.project_category_id = 38 THEN (  " +
                "    CASE WHEN EXISTS (  " +
                "       SELECT '1'  " +
                "       FROM submission s,  " +
                "        upload u  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id and s.placement = 1 and s.final_score = 100  " +
                "        AND submission_status_id IN (1, 2, 3, 4)  " +
                "       ) THEN 1 ELSE 0 END    " +
                "    " +
                " ) ELSE (  " +
                "    CASE WHEN EXISTS (  " +
                "       SELECT '1'  " +
                "       FROM submission s,  " +
                "        upload u  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id   " +
                "        AND submission_status_id IN (1, 2, 3, 4)  " +
                "       ) THEN pr.valid_submission_ind ELSE 0 END  " +
                "    ) END AS valid_submission_ind,  " +
                "      " +
                "CASE WHEN p.project_category_id = 38 THEN (  " +
                "       SELECT MAX(s.initial_score)  " +
                "       FROM submission s,  " +
                "        upload u  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id and s.placement = 1  " +
                "       AND submission_status_id IN (1, 2, 3, 4)  " +
                "    " +
                " ) ELSE (  " +
                "   " +
                "    pr.raw_score  " +
                "     " +
                ") END AS raw_score,      " +
                "  " +
                "CASE WHEN p.project_category_id = 38 THEN (  " +
                "     SELECT MAX(s.final_score)  " +
                "       FROM submission s,  " +
                "        upload u  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id and s.placement = 1  " +
                "       AND submission_status_id IN (1, 2, 3, 4)  " +
                "    " +
                " ) ELSE (  " +
                "   " +
                "    pr.final_score  " +
                "     " +
                ") END AS final_score,       " +
                "  " +
                " (  " +
                "  SELECT max(create_time)  " +
                "  FROM component_inquiry  " +
                "  WHERE project_id = p.project_id AND user_id = pr.user_id  " +
                "  ) AS inquire_timestamp,  " +
                " r2.value registrationd_date,  " +
                " (  " +
                "  SELECT max(u.create_date)  " +
                "  FROM submission s,  " +
                "   upload u  " +
                "  WHERE s.submission_type_id = 1 AND r.resource_id = u.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id AND   " +
                "   submission_status_id <> 5  " +
                "  ) AS submit_timestamp,  " +
                " (  " +
                "  SELECT max(rev.modify_date)  " +
                "  FROM review rev,  " +
                "   scorecard s,  " +
                "   submission sub,  " +
                "   upload u  " +
                "  WHERE sub.submission_type_id = 1 AND r.resource_id = u.resource_id AND u.upload_id = sub.upload_id AND sub.submission_id = rev.  " +
                "   submission_id AND rev.scorecard_id = s.scorecard_id AND s.scorecard_type_id IN (2,8) AND rev.COMMITTED = 1 AND u.project_id = pr.  " +
                "   project_id AND sub.submission_status_id <> 5  " +
                "  ) AS review_completed_timestamp,  " +
                " (  " +
                "  SELECT count(*)  " +
                "  FROM submission s,  " +
                "   upload u  " +
                "  WHERE s.submission_type_id = 1 AND u.upload_id = s.upload_id AND project_id = p.project_id AND submission_status_id IN (1, 4)  " +
                "  ) AS num_submissions_passed_review,  " +
                "   " +
                " CASE WHEN p.project_category_id = 38 THEN (  " +
                "    " +
                "       SELECT prz.prize_amount  " +
                "       FROM submission s,  " +
                "        upload u, prize prz  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id and s.placement = 1 and s.final_score = 100  " +
                "        AND submission_status_id IN (1, 2, 3, 4) and s.prize_id = prz.prize_id  " +
                "      " +
                "    " +
                " ) ELSE (  " +
                "     pr.payment  " +
                "    ) END AS payment,  " +
                "   " +
                " pr.old_rating,  " +
                " pr.new_rating,  " +
                " pre.reliability_before_resolution,  " +
                " pre.reliability_after_resolution,  " +
                " pr.placed,  " +
                " pr.rating_ind,  " +
                "  " +
                "   " +
                " CASE WHEN p.project_category_id = 38 THEN (  " +
                "    CASE WHEN EXISTS (  " +
                "       SELECT '1'  " +
                "       FROM submission s,  " +
                "        upload u  " +
                "       WHERE s.submission_type_id = 1 AND u.resource_id = r.resource_id AND u.upload_id = s.upload_id AND u.project_id = pr.project_id and s.placement = 1 and s.final_score = 100  " +
                "        AND submission_status_id IN (1, 2, 3, 4)  " +
                "       ) THEN 1 ELSE 0 END    " +
                "    " +
                " ) ELSE (  " +
                "     pr.passed_review_ind  " +
                "    ) END AS passed_review_ind,  " +
                "   " +
                " p.project_status_id AS project_stat_id,  " +
                " pr.point_adjustment,  " +
                " pre.reliable_ind,  " +
                " pr.rating_order,  " +
                " NVL((  " +
                "   SELECT value  " +
                "   FROM project_info pi_dr  " +
                "   WHERE pi_dr.project_info_type_id = 30 AND pi_dr.project_id = p.project_id  " +
                "   ), (  " +
                "   SELECT value  " +
                "   FROM project_info pi_am  " +
                "   WHERE pi_am.project_info_type_id = 16 AND pi_am.project_id = p.project_id  " +
                "   )) AS amount,  " +
                " (  " +
                "  SELECT value  " +
                "  FROM project_info  " +
                "  WHERE project_id = p.project_id AND project_info_type_id = 26  " +
                "  ) AS dr_ind,  " +
                " p.project_category_id,  " +
                " CASE WHEN ppd.actual_start_time IS NOT NULL THEN ppd.actual_start_time ELSE psd.actual_start_time END AS posting_date,  " +
                " (cc.component_name || ' - ' || cv.version_text) AS project_desc,  " +
                " nvl(pwa.actual_end_time, pwa.scheduled_end_time) AS winner_announced,  " +
                " (  " +
                "  SELECT max(s.create_date) AS submission_date  " +
                "  FROM submission s,  " +
                "   upload u  " +
                "  WHERE s.submission_type_id = 1 AND s.upload_id = u.upload_id AND u.project_id = p.project_id AND u.resource_id = r.resource_id AND u.  " +
                "   upload_status_id = 1 AND u.upload_type_id = 1  " +
                "  ) AS submission_date  " +
                "FROM project_result pr,  " +
                " project p,  " +
                " project_info pi,  " +
                " comp_catalog cc,  " +
                " resource r,  " +
                " resource_info r1,  " +
                " project_info pivers,  " +
                " comp_versions cv,  " +
                " OUTER resource_info r2,  " +
                " OUTER project_phase psd,  " +
                " OUTER project_phase ppd,  " +
                " OUTER project_phase pwa,  " +
                " OUTER project_reliability pre  " +
                "WHERE p.project_id = pr.project_id AND p.project_id = pi.project_id AND pi.project_info_type_id = 2 AND r.project_id = p.project_id AND r  " +
                " .resource_role_id = 1 AND r.resource_id = r1.resource_id AND r1.resource_info_type_id = 1 AND r1.value = pr.user_id AND r.resource_id =   " +
                " r2.resource_id AND r2.resource_info_type_id = 6 AND cc.component_id = pi.value AND pivers.project_id = p.project_id AND pivers.  " +
                " project_info_type_id = 1 AND pivers.value = cv.comp_vers_id AND pwa.project_id = p.project_id AND pwa.phase_type_id IN (6, 21) AND psd  " +
                " .project_id = p.project_id AND psd.phase_type_id = 2 AND ppd.project_id = p.project_id AND ppd.phase_type_id = 1 AND pre.project_id = pr.  " +
                " project_id AND pre.user_id = pr.user_id";
//                " select distinct pr.project_id " +
//                        "    ,pr.user_id " +
//                        "    ,case when exists(select '1' from submission s,upload u  " +
//                        "           where s.submission_type_id = 1 and u.resource_id = r.resource_id " +
//                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and s.submission_status_id in (1,2,3,4))  " +
//                        "    then 1 else 0 end as submit_ind " +
//                        "    ,case when exists(select '1' from submission s,upload u " +
//                        "           where s.submission_type_id = 1 and u.resource_id = r.resource_id  " +
//                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and submission_status_id in (1,2,3,4)) then pr.valid_submission_ind  " +
//                        "    else 0 end as valid_submission_ind " +
//                        "    ,pr.raw_score " +
//                        "    ,pr.final_score " +
//                        "    ,(select max(create_time) from component_inquiry where project_id = p.project_id and user_id = pr.user_id)  as inquire_timestamp " +
//                        "    ,r2.value registrationd_date" +
//                        //todo improve this data in transactional.  many records are 11/2/2006 which isn't correct.
//                        "    ,(select max(u.create_date) from submission s,upload u " +
//                        "           where s.submission_type_id = 1 and r.resource_id = u.resource_id " +
//                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and submission_status_id <> 5) as submit_timestamp " +
//                        //todo this is no good, modify date shouldn't be used in this way.  it could be updated for any reason, so it's misleading.  perhaps we should
//                        //todo use the actual review phase end (or the most recent one) instead
//                        "    ,(select max(rev.modify_date) from review rev,scorecard s,submission sub, upload u  " +
//                        "           where sub.submission_type_id = 1 and r.resource_id = u.resource_id  " +
//                        "           and u.upload_id = sub.upload_id and sub.submission_id = rev.submission_id and rev.scorecard_id = s.scorecard_id  " +
//                        "           and s.scorecard_type_id = 2 and rev.committed = 1 and u.project_id = pr.project_id and sub.submission_status_id <> 5) as review_completed_timestamp " +
////                        "    ,(select count(*) from project_result pr where project_id = p.project_id and pr.passed_review_ind = 1) as num_submissions_passed_review " +
//                        "       ,(select count(*) from submission s, upload u  " +
//                        "         where s.submission_type_id = 1 and u.upload_id = s.upload_id and project_id = p.project_id  " +
//                        "         and submission_status_id in (1, 4) " +
//                        "        ) as num_submissions_passed_review  " +
//                        "    , pr.payment " +
//                        "    , pr.old_rating " +
//                        "    , pr.new_rating " +
//                        "    , pre.reliability_before_resolution " +
//                        "    , pre.reliability_after_resolution " +
//                        "    , pr.placed " +
//                        "    , pr.rating_ind " +
//                        "    , pr.passed_review_ind " +
//                        "    , p.project_status_id as project_stat_id " +
//                        "    , pr.point_adjustment" +
//                        "    , pre.reliable_ind " +
//                        "    , pr.rating_order " +
//                        // first we try get the awarded points from project_info (DR points type)
//                        // then, we try to get it from comp_version_dates
//                        // finally, we get it from project_info (Payments type)
//                        // note: changing this affects loadDRContestResults method's query.
//                        "    , NVL((select value from project_info pi_dr where pi_dr.project_info_type_id = 30 and pi_dr.project_id = p.project_id), " +
//                        "          (select value from project_info pi_am where pi_am.project_info_type_id = 16 and pi_am.project_id = p.project_id)) as amount " +
//                        "     , (select value from project_info where project_id = p.project_id and project_info_type_id = 26) as dr_ind " +
//                        "     , p.project_category_id " +
//                        "     ,case when ppd.actual_start_time is not null then ppd.actual_start_time else psd.actual_start_time end as posting_date " +
//                        "     ,(cc.component_name || ' - ' || cv.version_text) as project_desc" +
//                        "     ,nvl(pwa.actual_end_time, pwa.scheduled_end_time) as winner_announced" +
//                        "     ,(select max(s.create_date) as submission_date from submission s, upload u where s.submission_type_id = 1 and s.upload_id = u.upload_id" +
//                        "             and u.project_id = p.project_id" +
//                        "             and u.resource_id = r.resource_id" +
//                        "             and u.upload_status_id = 1" +
//                        "             and u.upload_type_id = 1) as submission_date" +
//                        "    from project_result pr" +
//                        "       ,project p" +
//                        "       ,project_info pi" +
//                        "       ,comp_catalog cc " +
//                        "       ,resource r " +
//                        "       ,resource_info r1 " +
//                        "       ,project_info pivers " +
//                        "       ,comp_versions cv " +
//                        "       ,outer resource_info r2 " +
//                        "       ,outer project_phase psd " +
//                        "       ,outer project_phase ppd " +
//                        "       ,outer project_phase pwa " +
//                        "       ,outer project_reliability pre " +
//                        "    where p.project_id = pr.project_id " +
//                        "   and p.project_id = pi.project_id " +
//                        "   and pi.project_info_type_id = 2 " +
//                        "   and r.project_id = p.project_id " +
//                        "   and r.resource_role_id = 1 " + // make sure only submitter is joined
//                        "   and r.resource_id = r1.resource_id " +
//                        "   and r1.resource_info_type_id = 1 " +
//                        "   and r1.value = pr.user_id " +
//                        "   and r.resource_id = r2.resource_id " +
//                        "   and r2.resource_info_type_id = 6 " +
//                        "   and cc.component_id = pi.value " +
//                        "   and pivers.project_id = p.project_id " +
//                        "   and pivers.project_info_type_id = 1 " +
//                        "   and pivers.value = cv.comp_vers_id " +
//                        "   and pwa.project_id = p.project_id " +
//                        "   and pwa.phase_type_id in  (6, 21)" + // winner announcement (appeals response end)
//                        "   and psd.project_id = p.project_id " +
//                        "   and psd.phase_type_id = 2 " +
//                        "   and ppd.project_id = p.project_id " +
//                        "   and ppd.phase_type_id = 1 " +
//                        "   and pre.project_id = pr.project_id" +
//                        "   and pre.user_id = pr.user_id";

        final String RESULT_INSERT =
                "insert into project_result (project_id, user_id, submit_ind, valid_submission_ind, raw_score, final_score, inquire_timestamp," +
                        " submit_timestamp, review_complete_timestamp, payment, old_rating, new_rating, old_reliability, new_reliability, placed, rating_ind, " +
                        " passed_review_ind, points_awarded, final_points, reliable_submission_ind, old_rating_id, " +
                        "new_rating_id, num_ratings, rating_order, potential_points) " +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        final String DR_POINTS_INSERT =
                "insert into dr_points (dr_points_id, dr_points_status_id, track_id, dr_points_reference_type_id, "+
                        " dr_points_operation_id, dr_points_type_id, dr_points_desc, user_id," +
                        " amount, application_date, award_date, reference_id, is_potential) " +
                        "values (?, 1, ?, 1, 1, 1, ?, ?, ?, ?, ?, ?, ?)";

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
            Map<Integer, ContestResultCalculator> stageCalculators = getStageCalculators();

            Map<Long, Integer> dRProjects = getDRProjects();

            projectSelect = prepareStatement(PROJECTS_SELECT, SOURCE_DB);
            projectSelect.setTimestamp(1, fLastLogTime);
            projectSelect.setTimestamp(2, fLastLogTime);
            projectSelect.setTimestamp(3, fLastLogTime);
            projectSelect.setTimestamp(4, fLastLogTime);
            projectSelect.setTimestamp(5, fLastLogTime);

            resultInsert = prepareStatement(RESULT_INSERT, TARGET_DB);
            drInsert = prepareStatement(DR_POINTS_INSERT, SOURCE_DB);

            dwDataSelect = prepareStatement(DW_DATA_SELECT, TARGET_DB);
            dwDataUpdate = prepareStatement(DW_DATA_UPDATE, TARGET_DB);

            psNumRatings = prepareStatement(NUM_RATINGS, TARGET_DB);

            projects = projectSelect.executeQuery();

            while (projects.next()) {
                long start = System.currentTimeMillis();

                try {
                    StringBuffer buf = new StringBuffer(1000);
                    buf.append(RESULT_SELECT);
                    buf.append(" and p.project_id in (");

                    StringBuffer delQuery = new StringBuffer(300);
                    delQuery.append("delete from project_result where project_id in (");

                    StringBuffer delDrPointsQuery = new StringBuffer(300);
                    delDrPointsQuery.append("delete from dr_points where dr_points_reference_type_id = 1 and reference_id in (");

                    boolean projectsFound = false;
                    int numProjectsFound = 0;
                    do {
                        projectsFound = true;
                        ++numProjectsFound;
                        buf.append(projects.getLong("project_id"));
                        buf.append(",");
                        delQuery.append(projects.getLong("project_id"));
                        delQuery.append(",");
                        delDrPointsQuery.append(projects.getLong("project_id"));
                        delDrPointsQuery.append(",");
                    } while (numProjectsFound < PROJECT_RESULT_LOAD_STEP_SIZE && projects.next());
                    buf.setCharAt(buf.length() - 1, ')');
                    delQuery.setCharAt(delQuery.length() - 1, ')');
                    delDrPointsQuery.setCharAt(delDrPointsQuery.length() - 1, ')');

                    if (projectsFound) {
                        log.info("Loading next " + numProjectsFound + " projects...");

                        List<Track> activeTracks = getActiveTracks();

                        resultSelect = prepareStatement(buf.toString(), SOURCE_DB);

                        delete = prepareStatement(delQuery.toString(), TARGET_DB);
                        delete.executeUpdate();

                        // delete dr points for these projects.
                        deleteDrPoints = prepareStatement(delDrPointsQuery.toString(), SOURCE_DB);
                        deleteDrPoints.executeUpdate();


                        // get max dr points id
                        long drPointsId = getMaxDrPointsId();

                        int count = 0;
                        //log.debug("PROCESSING PROJECT RESULTS " + project_id);

                        projectResults = resultSelect.executeQuery();

                        HashMap<Long, Integer> ratingsMap;
                        while (projectResults.next()) {
                            long project_id = projectResults.getLong("project_id");

                            psNumRatings.clearParameters();
                            psNumRatings.setLong(1, project_id);
                            numRatings = psNumRatings.executeQuery();

                            ratingsMap = new HashMap<Long, Integer>();

                            while (numRatings.next()) {
                                ratingsMap.put(numRatings.getLong("user_id"), numRatings.getInt("count"));
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
                                            projectResults.getInt("project_stat_id") == 8 ||  // WINNER UNRESPONSIVE
                                            projectResults.getInt("project_stat_id") == 1) && // ACTIVE
                                    // Component Testing and RIA Build contests don't need to have the rating flag on to count
                                    // towards DR.
                                    (projectResults.getInt("rating_ind") == 1
                                            || projectResults.getInt("project_category_id") == 5
                                            || projectResults.getInt("project_category_id") == 24) &&
                                    "On".equals(projectResults.getString("dr_ind"))) {

                                hasDR = true;
                                ContestResultCalculator crc = stageCalculators.get(stage);
                                if (crc != null) {
                                    if (projectResults.getDouble("amount") < 0.01) {
                                        log.warn("Project " + project_id + " has amount=0! Please check it.");
                                    }
                                    ProjectResult pr = new ProjectResult(project_id, projectResults.getInt("project_stat_id"), projectResults.getLong("user_id"),
                                            projectResults.getDouble("final_score"), placed,
                                            0, projectResults.getDouble("amount"), numSubmissionsPassedReview, passedReview);

                                    if (projectResults.getInt("project_stat_id") == 7 || projectResults.getInt("project_stat_id") == 8) {
                                        pointsAwarded = crc.calculatePointsAwarded(pr);
                                    } else if (projectResults.getInt("valid_submission_ind") == 1) {
                                        potentialPoints = crc.calculatePotentialPoints(pr);
                                    }
                                }
                            } else if ((projectResults.getInt("project_stat_id") == 7 ||       // completed
                                    projectResults.getInt("project_stat_id") == 8 ||       // winner unresponsive
                                    projectResults.getInt("project_stat_id") == 1) &&       // active
                                    "On".equals(projectResults.getString("dr_ind")) &&      // counts towards DR
                                    projectResults.getObject("posting_date") != null &&     // has a posting date
                                    projectResults.getObject("submission_date") != null) {  // has a submission

                                hasDR = true;

                                // search for tracks where it belongs:
                                List<Track> tracks = getTracksForProject(activeTracks, projectResults.getInt("project_category_id"), projectResults.getTimestamp("posting_date"));

                                // calculate points for each track:
                                for (Track t : tracks) {
                                    if (projectResults.getDouble("amount") < 0.01) {
                                        log.warn("Project " + project_id + " has amount=0! Please check it.");
                                    }
                                    ProjectResult pr = new ProjectResult(project_id, projectResults.getInt("project_stat_id"), projectResults.getLong("user_id"),
                                            projectResults.getDouble("final_score"), placed,
                                            0, projectResults.getDouble("amount"), numSubmissionsPassedReview, passedReview);

                                    drInsert.clearParameters();
                                    if (projectResults.getInt("project_stat_id") == 7 || projectResults.getInt("project_stat_id") == 8) {
                                        pointsAwarded = t.getPointsCalculator().calculatePointsAwarded(pr);
                                        if (pointsAwarded + projectResults.getInt("point_adjustment") > 0) {
                                            drInsert.setLong(1, ++drPointsId);
                                            drInsert.setLong(2, t.getTrackId());
                                            drInsert.setString(3, "Digital Run Points won for " + projectResults.getString("project_desc"));
                                            drInsert.setLong(4, pr.getUserId());
                                            drInsert.setDouble(5, pointsAwarded + projectResults.getDouble("point_adjustment"));
                                            drInsert.setTimestamp(6, projectResults.getTimestamp("posting_date"));
                                            drInsert.setTimestamp(7, projectResults.getTimestamp("winner_announced"));
                                            drInsert.setLong(8, pr.getProjectId());
                                            drInsert.setBoolean(9, false);
                                            log.debug("Inserting DR points: " + t.getTrackId() + " - " + pr.getUserId() + " - " + pointsAwarded + " ("
                                                    + projectResults.getInt("point_adjustment") + ")");
                                            drInsert.executeUpdate();
                                        } else {
                                            log.debug("Awarded 0 points: " + t.getTrackId() + " - " + pr.getUserId() + " - " + pointsAwarded + " ("
                                                    + projectResults.getInt("point_adjustment") + ")");
                                        }
                                    } else if (projectResults.getInt("valid_submission_ind") == 1) {
                                        potentialPoints = t.getPointsCalculator().calculatePotentialPoints(pr);

                                        if (potentialPoints + projectResults.getInt("point_adjustment") > 0) {
                                            drInsert.setLong(1, ++drPointsId);
                                            drInsert.setLong(2, t.getTrackId());
                                            drInsert.setString(3, "Potential Digital Run Points for " + projectResults.getString("project_desc"));
                                            drInsert.setLong(4, pr.getUserId());
                                            drInsert.setDouble(5, potentialPoints + projectResults.getDouble("point_adjustment"));
                                            drInsert.setTimestamp(6, projectResults.getTimestamp("posting_date"));
                                            drInsert.setTimestamp(7, projectResults.getTimestamp("submission_date"));
                                            drInsert.setLong(8, pr.getProjectId());
                                            drInsert.setBoolean(9, true);
                                            log.debug("Inserting DR points: " + t.getTrackId() + " - " + pr.getUserId() + " - " + potentialPoints + " ("
                                                    + projectResults.getInt("point_adjustment") + ")");
                                            drInsert.executeUpdate();
                                        } else {
                                            log.debug("Potential 0 points: " + t.getTrackId() + " - " + pr.getUserId() + " - " + potentialPoints + " ("
                                                    + projectResults.getInt("point_adjustment") + ")");
                                        }
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
                            resultInsert.setObject(13, projectResults.getObject("reliability_before_resolution"));
                            resultInsert.setObject(14, projectResults.getObject("reliability_after_resolution"));

                            Object placement = projectResults.getObject("placed");
                            Object passedReviewInd = projectResults.getObject("passed_review_ind");

                            if (placement == null && projectResults.getInt("project_category_id") == 38 &&
                                    passedReviewInd != null && projectResults.getInt("passed_review_ind") == 1) {
                                placement = new Integer(1);
                            }

                            resultInsert.setObject(15, placement);
                            resultInsert.setObject(16, projectResults.getObject("rating_ind"));
                            resultInsert.setObject(17, passedReviewInd);

                            if (hasDR) {
                                resultInsert.setDouble(18, pointsAwarded);
                                resultInsert.setDouble(19, pointsAwarded + projectResults.getInt("point_adjustment"));
                            } else {
                                resultInsert.setNull(18, Types.DECIMAL);
                                resultInsert.setNull(19, Types.DECIMAL);
                            }
                            resultInsert.setInt(20, projectResults.getInt("reliable_ind"));

                            resultInsert.setInt(21, projectResults.getString("old_rating") == null ? -2 : projectResults.getInt("old_rating"));
                            resultInsert.setInt(22, projectResults.getString("new_rating") == null ? -2 : projectResults.getInt("new_rating"));
                            Long tempUserId = new Long(projectResults.getLong("user_id"));
                            int currNumRatings = 0;
                            if (ratingsMap.containsKey(tempUserId)) {
                                currNumRatings = ratingsMap.get(tempUserId);
                            }
                            resultInsert.setInt(23, projectResults.getInt("rating_ind") == 1 ? currNumRatings + 1 : currNumRatings);
                            resultInsert.setObject(24, projectResults.getObject("rating_order"));

                            if (hasDR) {
                                resultInsert.setDouble(25, potentialPoints);
                            } else {
                                resultInsert.setNull(25, Types.DECIMAL);
                            }

                            //log.debug("before result insert");
                            try {
                                resultInsert.executeUpdate();
                            } catch(Exception e) {
                                // Notes: it seems same user will appear in resource table twice
                                log.debug("project_id: " + project_id + " user_id: " + projectResults.getLong("user_id"));
                                throw(e);
                            }
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
                } finally {
                    close(delete);
                    close(deleteDrPoints);
                    close(resultSelect);
                }
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(projectResults);
            close(projects);
            close(projectSelect);
            close(resultInsert);
            close(dwDataSelect);
            close(dwDataUpdate);
            close(dwData);
        }
    }

    /**
     * Loads design project result
     *
     * @throws Exception if any error.
     *
     * @since 1.2.4
     */
    public void doLoadDesignProjectResults() throws Exception {
        log.info("load design project results");

        PreparedStatement firstTimeSelect = null;
        PreparedStatement projectSelect = null;
        PreparedStatement resultSelect = null;
        PreparedStatement resultInsert = null;
        PreparedStatement delete = null;

        ResultSet rs = null;
        ResultSet projects = null;
        ResultSet projectResults = null;


        try {

            firstTimeSelect = prepareStatement("SELECT count(*) from design_project_result", TARGET_DB);
            rs = firstTimeSelect.executeQuery();
            rs.next();

            // no records, it's the first run of loading design project result
            boolean firstRun = rs.getInt(1) == 0;

            final String PROJECTS_SELECT =
                    "select distinct p.project_id " +
                            "from project p, " +
                            "project_info pi, " +
                            "comp_versions cv, " +
                            "comp_catalog cc, " +
                            "project_category_lu pcl " +
                            "where " +
                            " p.project_id = pi.project_id " +
                            " and p.project_category_id = pcl.project_category_id " +
                            " and pcl.project_type_id = 3 " +
                            "and p.project_status_id NOT IN (1, 2, 3, 9, 10, 11)" +
                            "and pi.project_info_type_id = 1 " +
                            "and cv.comp_vers_id= pi.value " +
                            "and cc.component_id = cv.component_id " +
                            ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
                            (!firstRun ?
                                    ("and (p.modify_date > ? " +
                                            "   OR cv.modify_date > ? " +
                                            "   OR pi.modify_date > ? " +
                                            "   OR cc.modify_date > ? " +
                                            (needLoadMovedProject() ? " OR p.modify_user <> 'Converter' " +
                                                    " OR pi.modify_user <> 'Converter' " +
                                                    ")"
                                                    : ")")) : "");

            final String RESULT_SELECT = "SELECT  pj.project_id       , " +
                    "        s.submission_id    , " +
                    "        s.submission_type_id, " +
                    "        s.submission_status_id, " +
                    "        u.upload_id        , " +
                    "        r.create_date as inquire_date, " +
                    "        u.create_date as submit_date, " +
                    "        r.user_id          , " +
                    "        p.prize_id         , " +
                    "        p.prize_amount     , " +
                    "        p.prize_type_id    , " +
                    "        p.place            , " +
                    "        s.placement        , " +
                    "        s.mark_for_purchase, " +
                    "        (SELECT MAX(rev.modify_date) " +
                    "        FROM    review rev " +
                    "        WHERE   rev.submission_id = s.submission_id " +
                    "            AND rev.committed     = 1 " +
                    "        ) AS review_date, " +
                    "        (SELECT NVL(pi30.value::DECIMAL(10,2), 0) " +
                    "        FROM    project_info pi30, " +
                    "                project_info pi26 " +
                    "        WHERE   pi30.project_id           = pj.project_id " +
                    "            AND pi30.project_info_type_id = 30 " +
                    "            AND pi26.project_id           = pj.project_id " +
                    "            AND pi26.project_info_type_id = 26 " +
                    "            AND pi26.value                = 'On' " +
                    "        ) AS total_dr_points, " +
                    "        (SELECT COUNT(submission_id) " +
                    "        FROM    submission sub, " +
                    "                prize pri     , " +
                    "                upload upl " +
                    "        WHERE   upl.project_id        = pj.project_id " +
                    "            AND sub.upload_id         = upl.upload_id " +
                    "            AND sub.prize_id          = pri.prize_id " +
                    "            AND sub.submission_type_id = 1 " +
                    "            AND (sub.mark_for_purchase = 'f' OR sub.mark_for_purchase is NULL) " +
                    "        ) AS total_placements " +
                    "FROM    project pj " +
                    "INNER JOIN resource r ON r.project_id = pj.project_id and r.resource_role_id = 1 " +
                    "LEFT OUTER JOIN upload u ON pj.project_id = u.project_id and u.resource_id = r.resource_id and u.upload_status_id = 1 and u.upload_type_id = 1 " +
                    "LEFT OUTER JOIN submission s ON s.upload_id = u.upload_id and s.submission_status_id != 5 and s.submission_type_id in (1, 3) " +
                    "LEFT OUTER JOIN prize p ON s.prize_id = p.prize_id ";

            final String RESULT_INSERT =
                    "INSERT INTO design_project_result (project_id, user_id, submission_id, upload_id, prize_id, prize_amount, placement, dr_points, is_checkpoint, client_selection, submit_timestamp, review_complete_timestamp, inquire_timestamp, submit_ind, valid_submission_ind) " +
                            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";



            projectSelect = prepareStatement(PROJECTS_SELECT, SOURCE_DB);
            resultInsert = prepareStatement(RESULT_INSERT, TARGET_DB);


            if (!firstRun) {
                projectSelect.setTimestamp(1, fLastLogTime);
                projectSelect.setTimestamp(2, fLastLogTime);
                projectSelect.setTimestamp(3, fLastLogTime);
                projectSelect.setTimestamp(4, fLastLogTime);
            }

            projects = projectSelect.executeQuery();


            while(projects.next()) {

                long start = System.currentTimeMillis();

                try {
                    StringBuffer buf = new StringBuffer(1000);
                    buf.append(RESULT_SELECT);
                    buf.append(" WHERE pj.project_id in (");


                    StringBuffer delQuery = new StringBuffer(300);
                    delQuery.append("delete from design_project_result where project_id in (");


                    boolean projectsFound = false;
                    int numProjectsFound = 0;
                    do {
                        projectsFound = true;
                        ++numProjectsFound;
                        buf.append(projects.getLong("project_id"));
                        buf.append(",");
                        delQuery.append(projects.getLong("project_id"));
                        delQuery.append(",");
                    } while (numProjectsFound < PROJECT_RESULT_LOAD_STEP_SIZE && projects.next());


                    buf.setCharAt(buf.length() - 1, ')');
                    delQuery.setCharAt(delQuery.length() - 1, ')');


                    if(projectsFound) {
                        log.info("Loading results of next " + numProjectsFound + " design projects...");

                        resultSelect = prepareStatement(buf.toString(), SOURCE_DB);

                        delete = prepareStatement(delQuery.toString(), TARGET_DB);
                        delete.executeUpdate();


                        int count = 0;

                        projectResults = resultSelect.executeQuery();

                        while(projectResults.next()) {

                            int index = 0;
                            resultInsert.clearParameters();

                            if (projectResults.getObject("submission_id") != null) { // if submitted
                                boolean isCheckPointSubmission = (projectResults.getLong("submission_type_id") ==
                                        CHECKPOINT_SUBMISSION_TYPE_ID);
                                boolean markForPurchase = projectResults.getBoolean("mark_for_purchase");
                                int placement = projectResults.getInt("placement");
                                int totalPlacement = projectResults.getInt("total_placements");
                                double totalDRPoints = 0;

                                if(projectResults.getObject("total_dr_points") != null) {
                                    totalDRPoints = projectResults.getDouble("total_dr_points");
                                }

                                Double userDRPoints = null;

                                if (!markForPurchase && !isCheckPointSubmission) {
                                    userDRPoints =
                                            getDesignContestUserDRPoints(totalDRPoints, totalPlacement,
                                                    placement);
                                }

                                resultInsert.setLong(++index, projectResults.getLong("project_id"));
                                resultInsert.setLong(++index, projectResults.getLong("user_id"));
                                resultInsert.setLong(++index, projectResults.getLong("submission_id"));
                                resultInsert.setLong(++index, projectResults.getLong("upload_id"));

                                if(projectResults.getObject("prize_id") != null) {
                                    resultInsert.setLong(++index, projectResults.getLong("prize_id"));
                                } else {
                                    resultInsert.setNull(++index, Types.DECIMAL);
                                }

                                if(projectResults.getObject("prize_amount") != null) {
                                    resultInsert.setDouble(++index, projectResults.getDouble("prize_amount"));
                                } else {
                                    resultInsert.setNull(++index, Types.DECIMAL);
                                }

                                if(!isCheckPointSubmission && !markForPurchase) {
                                    // checkpoint submission and client extra purchase does not count placement
                                    resultInsert.setLong(++index, placement);
                                } else {
                                    resultInsert.setNull(++index, Types.DECIMAL);
                                }

                                if(userDRPoints != null && projectResults.getObject("prize_id") != null) {
                                    resultInsert.setDouble(++index, userDRPoints);
                                } else {
                                    resultInsert.setNull(++index, Types.DECIMAL);
                                }

                                resultInsert.setInt(++index, isCheckPointSubmission ? 1 : 0);
                                resultInsert.setInt(++index, markForPurchase ? 1 : 0);

                                resultInsert.setTimestamp(++index, projectResults.getTimestamp("submit_date"));
                                resultInsert.setTimestamp(++index, projectResults.getTimestamp("review_date"));
                                resultInsert.setTimestamp(++index, projectResults.getTimestamp("inquire_date"));
                                resultInsert.setLong(++index, 1);

                                long submission_status_id = projectResults.getLong("submission_status_id");
                                long submission_valid_ind = (submission_status_id == 1 || submission_status_id == 4) ? 1 : 0;
                                resultInsert.setLong(++index, submission_valid_ind);
                            } else { // if not submitted

                                if(projectResults.getObject("upload_id") != null || 
                                    designProjectResultExists(projectResults.getLong("project_id"), projectResults.getLong("user_id"), 0l)) 
                                    continue;

                                resultInsert.setLong(++index, projectResults.getLong("project_id"));
                                resultInsert.setLong(++index, projectResults.getLong("user_id"));
                                resultInsert.setLong(++index, 0);
                                resultInsert.setNull(++index, Types.DECIMAL);
                                resultInsert.setNull(++index, Types.DECIMAL);
                                resultInsert.setNull(++index, Types.DECIMAL);
                                resultInsert.setNull(++index, Types.DECIMAL);
                                resultInsert.setNull(++index, Types.FLOAT);

                                resultInsert.setNull(++index, Types.INTEGER);
                                resultInsert.setNull(++index, Types.INTEGER);

                                resultInsert.setNull(++index, Types.TIMESTAMP);
                                resultInsert.setNull(++index, Types.TIMESTAMP);

                                resultInsert.setTimestamp(++index, projectResults.getTimestamp("inquire_date"));
                                resultInsert.setLong(++index, 0);
                                resultInsert.setLong(++index, 0);
                            }

                            resultInsert.executeUpdate();
                            count++;
                        }

                        log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
                    }

                }  finally {
                    close(delete);
                    close(resultSelect);
                }
            }


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'design_project_result' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(projects);
            close(projectResults);
            close(firstTimeSelect);
            close(projectSelect);
            close(resultInsert);
        }

    }

    /**
    * Verifies if a design project result record of a given project id, user id, and submisison id already exists in the database
    * @param projectId Id of the project
    * @param userId Id of the user
    * @param submissionId Id of the submission
    * @return true if a design project result already exists, false otherwise
    */
    private boolean designProjectResultExists(Long projectId, Long userId, Long submissionId) throws SQLException {
        boolean exists = false;
        PreparedStatement resultQuery = null;
        ResultSet result = null;

        try {
            resultQuery = prepareStatement("select count(*) ct from design_project_result where project_id = ? and user_id = ? and submission_id = ?", TARGET_DB);
            resultQuery.setLong(1, projectId);
            resultQuery.setLong(2, userId);
            resultQuery.setLong(3, submissionId);

            result = resultQuery.executeQuery();

            result.next();

            exists = result.getLong("ct") != 0;
        } finally {
            close(result);
            close(resultQuery);
        }

        return exists;
    }

    /**
     * Helper method to calculate the DR points for each design project result
     *
     * @param totalDRPoints the total DR points.
     * @param totalPlacements the number of placement submission
     * @param userPlacement the placement to calculation
     * @return the calcualted DR points.
     * @since 1.2.4
     */
    private static double getDesignContestUserDRPoints(double totalDRPoints, int totalPlacements, int userPlacement) {
        if(totalDRPoints <= 0 || userPlacement > 5 || userPlacement <= 0 || totalPlacements <= 0) {
            return 0;
        }

        if(totalPlacements > 5) {
            totalPlacements = 5;
        }

        return Math.round(totalDRPoints * STUDIO_DR_PERCENTAGE_TABLE[totalPlacements - 1][userPlacement - 1] * 100.0) / 100.0;
    }

    // private helper method to get maximum dr_points id.
    private long getMaxDrPointsId() throws Exception {
        PreparedStatement select = null;
        ResultSet rs = null;

        try {
            //get data from source DB
            final String SELECT = "select max(dr_points_id) as max_id from dr_points";

            select = prepareStatement(SELECT, SOURCE_DB);

            rs = select.executeQuery();
            if (rs.next()) {
                log.debug("getMaxDrPointsId: " + rs.getLong("max_id"));
                return rs.getLong("max_id");
            } else {
                log.debug("getMaxDrPointsId: 1000 ");
                return 1000;
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("could not get max dr points id.");
        } finally {
            close(rs);
            close(select);
        }
    }

    // private helper method to get active tracks
    private List<Track> getActiveTracks() throws Exception {
        PreparedStatement select = null;
        ResultSet rs = null;

//        log.debug("getActiveTracks ");

        List<Track> activeTracks = new ArrayList<Track>();
        try {
            //get data from source DB
            final String SELECT = "select t.track_id, tpcx.project_category_id, t.track_start_date, t.track_end_date, pcl.class_name" +
                    " from track t, track_project_category_xref tpcx, points_calculator_lu pcl" +
                    " where t.track_id = tpcx.track_id" +
                    " and t.points_calculator_id = pcl.points_calculator_id" +
                    " and t.track_status_id = 1"; // Active

            select = prepareStatement(SELECT, SOURCE_DB);

            rs = select.executeQuery();
            while (rs.next()) {
                activeTracks.add(new Track(rs.getLong("track_id"),
                        rs.getLong("project_category_id"),
                        rs.getTimestamp("track_start_date"),
                        rs.getTimestamp("track_end_date"),
                        (ContestResultCalculatorV2) Class.forName(rs.getString("class_name")).newInstance()));

//                log.debug("getActiveTracks: Add: " + rs.getLong("track_id"));
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("could not get active tracks.");
        } finally {
            close(rs);
            close(select);
        }
        return activeTracks;
    }

    // private helper method to get active tracks for a particular project type.
    private List<Track> getTracksForProject(List<Track> activeTracks, int projectCategoryId,
                                            Timestamp applicationDate) {

//        log.debug("getTracksForProject: " + projectCategoryId);
//        log.debug("applicationDate: " + applicationDate);

        List<Track> tracksForProject = new ArrayList<Track>();
        for (Track t : activeTracks) {

//            log.debug("t.getProjectCategoryId(): " + t.getProjectCategoryId());
//            log.debug("t.getStart(): " + t.getStart());
//            log.debug("t.getEnd(): " + t.getEnd());

            if (t.getProjectCategoryId() == projectCategoryId &&
                    t.getStart().compareTo(applicationDate) <= 0 &&
                    t.getEnd().compareTo(applicationDate) >= 0) {
                tracksForProject.add(t);
//                log.debug("getTracksForProject: Add: " + t.getTrackId());
            }
        }
        return tracksForProject;
    }

    /**
     * Loads submission reviews
     *
     * @throws Exception if any error occurs
     */
    public void doLoadSubmissionReview() throws Exception {
        log.info("load submission review");
        ResultSet submissionInfo = null;
        PreparedStatement submissionSelect = null;
        PreparedStatement submissionUpdate = null;
        PreparedStatement submissionInsert = null;
        PreparedStatement reviewRespSelect = null;
        PreparedStatement maxReviewRespSelect = null;
        PreparedStatement reviewRespUpdate = null;

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
                        "  ,resource_info ri1" +
                        "  ,resource_info ri2" +
                        "   ,resource res " +
                        "where r.submission_id = s.submission_id " +
                        "   and s.submission_type_id = 1 " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
                        "   and res.resource_id = r.resource_id " +
                        "   and resource_role_id in (4, 5, 6, 7) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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
                                : ")") +
                        " order by u.project_id";

        final String SUBMISSION_UPDATE =
                "update submission_review set raw_score = ?, final_score = ?, num_appeals = ?, num_successful_appeals = ?, review_resp_id = ?,  scorecard_id = ?, scorecard_template_id = ? " +
                        "where project_id = ? and user_id = ? and reviewer_id = ?";

        final String SUBMISSION_INSERT =
                "insert into submission_review (project_id, user_id, reviewer_id, raw_score, final_score, num_appeals, " +
                        "num_successful_appeals, review_resp_id, scorecard_id, scorecard_template_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        final String REVIEW_RESP_UPDATE =
                "update submission_review set review_resp_id = ? where project_id = ? and reviewer_id = ?";

        try {
            long start = System.currentTimeMillis();

            submissionSelect = prepareStatement(SUBMISSION_SELECT, SOURCE_DB);
            submissionUpdate = prepareStatement(SUBMISSION_UPDATE, TARGET_DB);
            submissionInsert = prepareStatement(SUBMISSION_INSERT, TARGET_DB);
            reviewRespUpdate = prepareStatement(REVIEW_RESP_UPDATE, TARGET_DB);

            int count = 0;
            submissionSelect.clearParameters();
            submissionSelect.setTimestamp(1, fLastLogTime);
            submissionSelect.setTimestamp(2, fLastLogTime);
            submissionSelect.setTimestamp(3, fLastLogTime);
            submissionSelect.setTimestamp(4, fLastLogTime);
            submissionSelect.setTimestamp(5, fLastLogTime);
            submissionSelect.setTimestamp(6, fLastLogTime);
            submissionSelect.setTimestamp(7, fLastLogTime);
            //log.debug("before submission select");
            submissionInfo = submissionSelect.executeQuery();
            //log.debug("after submission select");

            int nextFreeReviewRespId = 4;
            Map<Long, Integer> reviewerResps = new HashMap<Long, Integer>();

            boolean nextResultExists = submissionInfo.next();
            while (nextResultExists) {
                long projectId = submissionInfo.getLong("project_id");
                count++;

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

                long reviewerId = submissionInfo.getLong("reviewer_id");
                if (reviewerResps.containsKey(reviewerId) == false) {
                    if (reviewRespId == 4) {
                        reviewRespId = nextFreeReviewRespId;
                        nextFreeReviewRespId++;
                    }
                    reviewerResps.put(reviewerId, reviewRespId);
                }


                nextResultExists = submissionInfo.next();

                if (!nextResultExists || submissionInfo.getLong("project_id") != projectId) {
                    for (Long reviewerId2 : reviewerResps.keySet()) {
                        reviewRespUpdate.clearParameters();
                        reviewRespUpdate.setLong(1, reviewerResps.get(reviewerId2));
                        reviewRespUpdate.setLong(2, projectId);
                        reviewRespUpdate.setLong(3, reviewerId2);
                        reviewRespUpdate.executeUpdate();
                    }

                    nextFreeReviewRespId = 4;
                    reviewerResps.clear();
                }

            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'submission review' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(submissionInfo);
            close(submissionSelect);
            close(submissionUpdate);
            close(submissionInsert);
            close(reviewRespSelect);
            close(maxReviewRespSelect);
            close(reviewRespUpdate);
        }
    }

    /**
     * Loads submission screening
     *
     * @throws Exception if any error occurs
     */
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
                        "   resource_info ri1," +
                        "   resource_info ri2," +
                        "   resource res " +
                        "where r.submission_id = s.submission_id " +
                        "   and s.submission_type_id = 1 " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
                        "   and res.resource_id = r.resource_id " +
                        "   and resource_role_id in (2, 3) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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


    /**
     * Loads contest projects
     *
     * @throws Exception if any error occurs
     */
    public void doLoadContestProject() throws Exception {
        log.info("load contest project");
        //load contest_project_xref
        long start = System.currentTimeMillis();

        final String SELECT = "select x.contest_id, x.project_id  " +
                "from contest_project_xref x, project p " +
                "where x.project_id = ? and p.project_id = x.project_id " +
                ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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
                    "c.event_id," +
                    "c.project_category_id," +
                    "pcl.name " +
                    "from contest c, " +
                    "contest_type_lu ct, " +
                    "project_category_lu pcl " +
                    "where ct.contest_type_id = c.contest_type_id " +
                    "and pcl.project_category_id = c.project_category_id " +
                    "and (c.modify_date > ?)";
            final String UPDATE = "update contest set contest_name = ?,  contest_start_timestamp = ?, contest_end_timestamp = ?, contest_type_id = ?, contest_type_desc = ?, phase_id = ?, event_id = ?, project_category_id = ?, project_category_name = ? " +
                    " where contest_id = ? ";
            final String INSERT = "insert into contest (contest_id, contest_name, contest_start_timestamp, contest_end_timestamp, contest_type_id, contest_type_desc, phase_id, event_id, project_category_id, project_category_name) " +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

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
                update.setObject(8, rs.getObject("project_category_id"));
                update.setObject(9, rs.getObject("name"));
                update.setLong(10, rs.getLong("contest_id"));

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
                    insert.setObject(9, rs.getObject("project_category_id"));
                    insert.setObject(10, rs.getObject("name"));

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
     * Get a sorted list (by rating_desc) of all the active coders
     * and their ratings.
     *
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List<CoderRating> getCurrentRatings() throws Exception {
        StringBuffer query;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List<CoderRating> ret = null;

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
            query.append(" , case");
            query.append(" when ur.phase_id = 134 and exists (select '1' from active_conceptualizers acon where acon.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_con");
            query.append(" , case");
            query.append(" when ur.phase_id = 117 and exists (select '1' from active_specifiers aspe where aspe.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_spe");
            query.append(" , case");
            query.append(" when ur.phase_id = 118 and exists (select '1' from active_architects aarc where aarc.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_arc");
            query.append(" , case");
            query.append(" when ur.phase_id = 125 and exists (select '1' from active_assemblers aass where aass.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_ass");
            query.append(" , case");
            query.append(" when ur.phase_id = 124 and exists (select '1' from active_application_testers ates where ates.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_tes");
            query.append(" , case");
            query.append(" when ur.phase_id = 137 and exists (select '1' from active_test_scenarios_competitors asce where asce.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_sce");
            query.append(" , case");
            query.append(" when ur.phase_id = 130 and exists (select '1' from active_ui_prototypes_competitors auip where auip.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_uip");
            query.append(" , case");
            query.append(" when ur.phase_id = 135 and exists (select '1' from active_ria_builds_competitors arbu where arbu.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_rbu");
            query.append(" , case");
            query.append(" when ur.phase_id = 146 and exists (select '1' from active_content_creation_competitors acc where acc.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_cc");
            query.append(" , case");
            query.append(" when ur.phase_id = 147 and exists (select '1' from active_reporting_competitors arep where arep.user_id = ur.user_id)");
            query.append(" then 1 else 0 end as active_rep");
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
            ret = new ArrayList<CoderRating>();
            while (rs.next()) {
                //pros
                if (rs.getInt("coder_type_id") == 2) {
                    if (rs.getInt("phase_id") == 113) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_dev") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 112) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_des") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 134) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_con") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 117) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_spe") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 118) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_arc") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 125) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_ass") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 124) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_tes") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 137) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_sce") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 130) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_uip") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 135) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_rbu") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 146) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_cc") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 147) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"),
                                rs.getInt("active_rep") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    }
                } else {
                    //students
                    if (rs.getInt("phase_id") == 113) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_dev") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 112) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_des") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 134) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_con") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 117) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_spe") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 118) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_arc") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 125) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_ass") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 124) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_tes") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 137) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_sce") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 130) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_uip") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 135) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_rbu") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 146) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_cc") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
                    } else if (rs.getInt("phase_id") == 147) {
                        ret.add(new CoderRating(rs.getLong("user_id"), rs.getInt("rating"), rs.getLong("school_id"),
                                rs.getInt("active_rep") == 1, rs.getInt("phase_id"), rs.getString("comp_country_code")));
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

    private class CoderRating implements Comparable<CoderRating> {
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

        public int compareTo(CoderRating other) {
            if (other.getRating() > rating)
                return 1;
            else if (other.getRating() < rating)
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

    private void doLoadRank(int phaseId, int rankTypeId, List<CoderRating> list) throws Exception {
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
            ArrayList<CoderRating> ratings = new ArrayList<CoderRating>(list.size() / 2);
            CoderRating cr = null;
            for (int i = 0; i < list.size(); i++) {
                cr = list.get(i);
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
    private void loadSchoolRatingRank(int phaseId, int rankTypeId, List<CoderRating> list) throws Exception {
        log.debug("loadSchoolRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List<CoderRating> ratings = null;

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

            HashMap<Long, List<CoderRating>> schools = new HashMap<Long, List<CoderRating>>();
            Long tempId;
            List<CoderRating> tempList;
            CoderRating temp;
            /**
             * iterate through our big list and pluck out only those where:
             * the phase lines up
             * they have a school
             * and their status lines up
             */
            for (int i = 0; i < list.size(); i++) {
                temp = list.get(i);
                if (phaseId == temp.getPhaseId() && temp.getSchoolId() > 0) {
                    if ((rankTypeId == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankTypeId != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempId = new Long(temp.getSchoolId());
                        if (schools.containsKey(tempId)) {
                            tempList = schools.get(tempId);
                        } else {
                            tempList = new ArrayList<CoderRating>(10);
                        }
                        tempList.add(list.get(i));
                        schools.put(tempId, tempList);
                        tempList = null;
                    }
                }
            }

            for (Iterator<Map.Entry<Long,List<CoderRating>>> it = schools.entrySet().iterator(); it.hasNext();) {
                ratings = it.next().getValue();
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

    private void loadCountryRatingRank(int phaseId, int rankTypeId, List<CoderRating> list) throws Exception {
        log.debug("loadCountryRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount;
        List<CoderRating> ratings;

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

            HashMap<String, List<CoderRating>> countries = new HashMap<String, List<CoderRating>>();
            String tempCode = null;
            List<CoderRating> tempList = null;
            CoderRating temp = null;
            /**
             * iterate through our big list and pluck out only those where:
             * the phase lines up
             * they have a school
             * and their status lines up
             */
            for (int i = 0; i < list.size(); i++) {
                temp = list.get(i);
                if (temp.getPhaseId() == phaseId) {
                    if ((rankTypeId == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankTypeId != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempCode = temp.getCountryCode();
                        if (countries.containsKey(tempCode)) {
                            tempList = countries.get(tempCode);
                        } else {
                            tempList = new ArrayList<CoderRating>(100);
                        }
                        tempList.add(list.get(i));
                        countries.put(tempCode, tempList);
                        tempList = null;
                    }
                }
            }

            for (Iterator<Map.Entry<String, List<CoderRating>>> it = countries.entrySet().iterator(); it.hasNext();) {
                ratings = it.next().getValue();
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

    /**
     * Loads scorecard responses
     *
     * @throws Exception if any error occurs
     */
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
                        "       scorecard_question sq" +
                        "    where  ri.scorecard_question_id = sq.scorecard_question_id " +
                        "   and s.submission_type_id = 1 " +
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
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
                        "   and sq.scorecard_question_type_id in (1,2,4) " +
                        "   and answer <> '' " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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

    /**
     * Loads testcase responses
     *
     * @throws Exception if any error occurs
     */
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
                        "    resource_info ri1," +
                        "    resource_info ri2," +
                        "    scorecard_question sq " +
                        "  where ri.review_id = r.review_id " +
                        "   and s.submission_type_id = 1 " +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (4,5,6,7) " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
                        "   and sq.scorecard_question_id = ri.scorecard_question_id " +
                        "   and sq.scorecard_question_type_id = 3 " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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


    /**
     * Loads subjective responses
     *
     * @throws Exception if any error occurs
     */
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
                        "       resource_info ri1," +
                        "       resource_info ri2," +
                        "       resource res " +
                        "    where  ric.comment_type_id = ctl.comment_type_id " +
                        "   and s.submission_type_id = 1 " +
                        "   and ric.review_item_id = ri.review_item_id " +
                        "   and ri.review_id = r.review_id " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
                        "   and r.resource_id = res.resource_id " +
                        "   and res.resource_role_id in (2, 3, 4, 5, 6, 7) " +
                        "   and ric.comment_type_id in (1, 2, 3) " +
                        "   and ri1.resource_id = u.resource_id " +
                        "   and ri1.resource_info_type_id = 1 " +
                        "   and ri2.resource_id = r.resource_id " +
                        "   and ri2.resource_info_type_id = 1 " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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


    /**
     * Loads appeals
     *
     * @throws Exception if any error occurs
     */
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
                        "       resource res,  " +
                        "       resource_info res1,  " +
                        "       resource_info res2,  " +
                        "       outer review_item_comment ric_resp," +
                        "       scorecard_question sq" +
                        "    where ric.review_item_id = ri.review_item_id and " +
                        "   s.submission_type_id = 1 and " +
                        "   ri.review_id = r.review_id and " +
                        "   ri.scorecard_question_id = sq.scorecard_question_id and " +
                        "   r.submission_id = s.submission_id and " +
                        "   u.upload_id = s.upload_id and " +
                        "   u.project_id = p.project_id and " +
                        "   p.project_status_id <> 3 and " +
                        "   p.project_category_id in " + LOAD_CATEGORIES + " and " +
                        "   r.resource_id = res.resource_id and " +
                        "   res.resource_role_id in (4, 5, 6, 7) and " +
                        "   res1.resource_id = u.resource_id and " +
                        "   res1.resource_info_type_id = 1 and " +
                        "   res2.resource_id = r.resource_id and " +
                        "   res2.resource_info_type_id = 1 and " +
                        "   ric_resp.review_item_id = ri.review_item_id and " +
                        "   ric_resp.comment_type_id = 5 and " +
                        "   ric.comment_type_id = 4 " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT + " and " +
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

            int count = 0;
            select.clearParameters();
            select.setTimestamp(1, fLastLogTime);
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
                String appealText = rs.getString("appeal_text");
                if (appealText == null) {
                    update.setNull(8, Types.BLOB);
                } else {
                    update.setBytes(8, DBMS.serializeTextString(appealText));
                }

                String appeal_response = rs.getString("appeal_response");
                if (appeal_response == null) {
                    update.setNull(9, Types.BLOB);
                } else {
                    update.setBytes(9, DBMS.serializeTextString(appeal_response));
                }

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

                    if (appealText == null) {
                        insert.setNull(8, Types.BLOB);
                    } else {
                        insert.setBytes(8, DBMS.serializeTextString(appealText));
                    }

                    if (appeal_response == null) {
                        insert.setNull(9, Types.BLOB);
                    } else {
                        insert.setBytes(9, DBMS.serializeTextString(appeal_response));
                    }

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

    /**
     * Loads testcase appeals
     *
     * @throws Exception if any error occurs
     */
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
                        "   resource res, " +
                        "   resource_info ri1," +
                        "   resource_info ri2," +
                        "   scorecard_question sq, " +
                        "   review_item_comment ric_resp " +
                        "where ric.review_item_id = ri.review_item_id " +
                        "   and s.submission_type_id = 1 " +
                        "   and ri.review_id = r.review_id " +
                        "   and r.submission_id = s.submission_id " +
                        "   and u.upload_id = s.upload_id " +
                        "   and u.project_id = p.project_id " +
                        "   and p.project_status_id <> 3 " +
                        "   and p.project_category_id in " + LOAD_CATEGORIES +
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
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
                        "   and u.project_id in (select distinct project_id from project_result) " +
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

            select.clearParameters();
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

            rs = select.executeQuery();

            int count = 0;
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
                " and p.phase_id in (112,113)  " +
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
     *
     * @throws Exception
     */
    public void doLoadDRTracks() throws Exception {
        log.debug("load digital run tracks");

        final String SELECT_TRACKS =
                " select t.track_id, ttl.track_type_id, ttl.track_type_desc, tsl.track_status_id, tsl.track_status_desc, " +
                        " t.track_desc, t.track_start_date, t.track_end_date " +
                        " from track t, track_status_lu tsl, track_type_lu ttl " +
                        " where t.track_status_id = tsl.track_status_id " +
                        " and t.track_type_id = ttl.track_type_id " +
                        " and t.create_date > ?";

        final String UPDATE =
                "update track set track_type_id = ?, track_type_desc = ?, track_status_id = ?, track_status_desc = ?, track_desc = ?, track_start_date = ?, track_end_date = ? " +
                        " where track_id = ?";

        final String INSERT =
                "insert into track (track_id, track_type_id, track_type_desc, track_status_id, track_status_desc, track_desc, track_start_date, track_end_date) " +
                        " values (?,?,?,?,?,?,?,?)";

        PreparedStatement selectTracks = prepareStatement(SELECT_TRACKS, SOURCE_DB);
        PreparedStatement update = prepareStatement(UPDATE, TARGET_DB);
        PreparedStatement insert = prepareStatement(INSERT, TARGET_DB);
        ResultSet rsTracks = null;

        int count = 0;

        try {
            long start = System.currentTimeMillis();

            selectTracks.setTimestamp(1, fLastLogTime);

            rsTracks = selectTracks.executeQuery();
            while (rsTracks.next()) {

                update.clearParameters();
                update.setInt(1, rsTracks.getInt("track_type_id"));
                update.setString(2, rsTracks.getString("track_type_desc"));
                update.setInt(3, rsTracks.getInt("track_status_id"));
                update.setString(4, rsTracks.getString("track_status_desc"));
                update.setString(5, rsTracks.getString("track_desc"));
                update.setDate(6, rsTracks.getDate("track_start_date"));
                update.setDate(7, rsTracks.getDate("track_end_date"));
                update.setInt(8, rsTracks.getInt("track_id"));

                int retVal = update.executeUpdate();
                if (retVal == 0) {
                    insert.clearParameters();
                    insert.setInt(1, rsTracks.getInt("track_id"));
                    insert.setInt(2, rsTracks.getInt("track_type_id"));
                    insert.setString(3, rsTracks.getString("track_type_desc"));
                    insert.setInt(4, rsTracks.getInt("track_status_id"));
                    insert.setString(5, rsTracks.getString("track_status_desc"));
                    insert.setString(6, rsTracks.getString("track_desc"));
                    insert.setDate(7, rsTracks.getDate("track_start_date"));
                    insert.setDate(8, rsTracks.getDate("track_end_date"));

                    insert.executeUpdate();
                }

                count++;
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'tracks' failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rsTracks);
            close(insert);
            close(update);
            close(selectTracks);
        }

    }



    /**
     *
     * @throws Exception
     */
    public void doLoadDRTrackContests() throws Exception {
        log.debug("load digital run track contests");

        final String SELECT_CONTESTS =
                " select tc.track_contest_id, tc.track_id, tc.track_contest_desc, tctl.track_contest_type_id, tctl.track_contest_type_desc " +
                        " from track_contest tc, track_contest_type_lu tctl " +
                        " where tc.track_contest_type_id = tctl.track_contest_type_id " +
                        " and tc.create_date > ?";

        final String UPDATE =
                "update track_contest set track_id = ?, track_contest_desc = ?, track_contest_type_id = ?, track_contest_type_desc = ? " +
                        " where track_contest_id = ?";

        final String INSERT =
                "insert into track_contest (track_contest_id, track_id, track_contest_desc, track_contest_type_id, track_contest_type_desc) " +
                        " values (?,?,?,?,?)";

        PreparedStatement selectContests = prepareStatement(SELECT_CONTESTS, SOURCE_DB);
        PreparedStatement update = prepareStatement(UPDATE, TARGET_DB);
        PreparedStatement insert = prepareStatement(INSERT, TARGET_DB);
        ResultSet rsContests = null;

        int count = 0;

        try {
            long start = System.currentTimeMillis();

            selectContests.setTimestamp(1, fLastLogTime);

            rsContests = selectContests.executeQuery();
            while (rsContests.next()) {
                update.clearParameters();
                update.setInt(1, rsContests.getInt("track_id"));
                update.setString(2, rsContests.getString("track_contest_desc"));
                update.setInt(3, rsContests.getInt("track_contest_type_id"));
                update.setString(4, rsContests.getString("track_contest_type_desc"));
                update.setInt(5, rsContests.getInt("track_contest_id"));

                int retVal = update.executeUpdate();
                if (retVal == 0) {
                    insert.clearParameters();
                    insert.setInt(1, rsContests.getInt("track_contest_id"));
                    insert.setInt(2, rsContests.getInt("track_id"));
                    insert.setString(3, rsContests.getString("track_contest_desc"));
                    insert.setInt(4, rsContests.getInt("track_contest_type_id"));
                    insert.setString(5, rsContests.getString("track_contest_type_desc"));

                    insert.executeUpdate();
                }

                count++;
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'track contests' failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rsContests);
            close(update);
            close(insert);
            close(selectContests);
        }

    }



    /**
     *
     * @throws Exception
     */
    public void doLoadDRTrackPoints() throws Exception {
        log.debug("load digital run track points");

        StringBuffer selectPointsQuery = new StringBuffer(300);
        selectPointsQuery.append(" select dp.dr_points_id, dp.track_id, dprtl.dr_points_reference_type_id, dprtl.dr_points_reference_type_desc, dpol.dr_points_operation_id, " +
                " dpol.dr_points_operation_desc, dptl.dr_points_type_id, dptl.dr_points_type_desc, dpsl.dr_points_status_id, dpsl.dr_points_status_desc, " +
                " dp.dr_points_desc, dp.user_id, dp.amount, dp.application_date, dp.award_date, dp.reference_id, dp.is_potential, " +
                " (case when dp.dr_points_reference_type_id = 2 then (select dp2.amount from dr_points dp2 where dp2.dr_points_id = dp.reference_id) else 0 end) as parent_amount  " +
                " from dr_points dp, dr_points_status_lu dpsl, dr_points_type_lu dptl, dr_points_operation_lu dpol, dr_points_reference_type_lu dprtl " +
                " where dp.dr_points_status_id = dpsl.dr_points_status_id " +
                " and dp.dr_points_type_id = dptl.dr_points_type_id " +
                " and dp.dr_points_operation_id = dpol.dr_points_operation_id " +
                " and dp.dr_points_reference_type_id = dprtl.dr_points_reference_type_id " +
                " and dp.track_id in (");

        final String INSERT =
                "insert into dr_points (dr_points_id, track_id, dr_points_reference_type_id, dr_points_reference_type_desc, dr_points_operation_id, dr_points_operation_desc, dr_points_type_id, dr_points_type_desc, dr_points_status_id, dr_points_status_desc, dr_points_desc, user_id, amount, application_date, award_date, reference_id, is_potential) " +
                        " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        final String SELECT_TRACKS =
                " select distinct track_id " +
                        " from dr_points " +
                        " where (modify_date > ? " +
                        "     OR create_date > ?) ";

        PreparedStatement selectPoints= null;
        PreparedStatement insert = prepareStatement(INSERT, TARGET_DB);
        PreparedStatement tracksSelect= prepareStatement(SELECT_TRACKS, SOURCE_DB);;
        PreparedStatement delete= null;
        ResultSet rsPoints = null;
        ResultSet tracks = null;

        int count = 0;

        try {
            long start = System.currentTimeMillis();

            StringBuffer delQuery = new StringBuffer(300);
            delQuery.append("delete from dr_points where track_id in (");

            tracksSelect.setTimestamp(1, fLastLogTime);
            tracksSelect.setTimestamp(2, fLastLogTime);

            tracks = tracksSelect.executeQuery();
            boolean tracksFound = false;
            while (tracks.next()) {
                tracksFound = true;
                delQuery.append(tracks.getLong("track_id"));
                delQuery.append(",");
                selectPointsQuery.append(tracks.getLong("track_id"));
                selectPointsQuery.append(",");
            }
            delQuery.setCharAt(delQuery.length() - 1, ')');
            selectPointsQuery.setCharAt(selectPointsQuery.length() - 1, ')');

            if (tracksFound) {
                log.debug("clean up: "+ delQuery.toString());
                delete = prepareStatement(delQuery.toString(), TARGET_DB);
                delete.executeUpdate();

                selectPoints = prepareStatement(selectPointsQuery.toString(), SOURCE_DB);

                rsPoints = selectPoints.executeQuery();
                while (rsPoints.next()) {
                    int j = 1;
                    insert.setInt(j++, rsPoints.getInt("dr_points_id"));
                    insert.setInt(j++, rsPoints.getInt("track_id"));
                    insert.setInt(j++, rsPoints.getInt("dr_points_reference_type_id"));
                    insert.setString(j++, rsPoints.getString("dr_points_reference_type_desc"));
                    insert.setInt(j++, rsPoints.getInt("dr_points_operation_id"));
                    insert.setString(j++, rsPoints.getString("dr_points_operation_desc"));
                    insert.setInt(j++, rsPoints.getInt("dr_points_type_id"));
                    insert.setString(j++, rsPoints.getString("dr_points_type_desc"));
                    insert.setInt(j++, rsPoints.getInt("dr_points_status_id"));
                    insert.setString(j++, rsPoints.getString("dr_points_status_desc"));
                    insert.setString(j++, rsPoints.getString("dr_points_desc"));
                    insert.setLong(j++, rsPoints.getLong("user_id"));
                    insert.setDouble(j++, calculatePointsAmount(rsPoints.getInt("dr_points_operation_id"),
                            rsPoints.getDouble("amount"),
                            rsPoints.getDouble("parent_amount")));
                    insert.setDate(j++, rsPoints.getDate("application_date"));
                    insert.setDate(j++, rsPoints.getDate("award_date"));
                    insert.setInt(j++, rsPoints.getInt("reference_id"));
                    insert.setBoolean(j++, rsPoints.getBoolean("is_potential"));

                    insert.executeUpdate();
                    count++;
                }
            }
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'track points' failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rsPoints);
            close(tracks);
            close(delete);
            close(tracksSelect);
            close(insert);
            close(selectPoints);
        }

    }


    private double calculatePointsAmount(int operationType, double amount, double parentAmount) {
        if (operationType == 2) {
            return ((parentAmount * amount) / 100);
        }
        return amount;
    }

    /**
     *
     * @throws Exception
     */
    public void doLoadDRTrackResults() throws Exception {
        log.debug("load digital run track results");

        final String SELECT_TRACKS =
                " select distinct track_id " +
                        " from dr_points " +
                        " where (modify_date > ? " +
                        "     OR create_date > ?) ";

        final String SELECT_CONTESTS =
                " select tc.track_contest_id, tctl.track_contest_type_id, tcrcl.class_name " +
                        " from track_contest tc " +
                        " ,track_contest_type_lu tctl " +
                        " ,track_contest_result_calculator_lu tcrcl " +
                        " where tc.track_contest_type_id = tctl.track_contest_type_id " +
                        " and tc.track_contest_result_calculator_id = tcrcl.track_contest_result_calculator_id " +
                        " and tc.track_id = ? ";


        PreparedStatement selectTracks = null;
        PreparedStatement selectContests = null;
        ResultSet rsTracks = null;
        ResultSet rsContests = null;

        try {
            selectTracks = prepareStatement(SELECT_TRACKS, SOURCE_DB);
            selectContests = prepareStatement(SELECT_CONTESTS, SOURCE_DB);

            selectTracks.setTimestamp(1, fLastLogTime);
            selectTracks.setTimestamp(2, fLastLogTime);

            rsTracks = selectTracks.executeQuery();
            int trackId = 0;
            while (rsTracks.next()) {
                trackId = rsTracks.getInt("track_id");
                selectContests.clearParameters();
                selectContests.setInt(1, trackId);
                rsContests = selectContests.executeQuery();

                while (rsContests.next()) {
                    loadTrackContestResults(trackId,
                            rsContests.getInt("track_contest_id"),
                            rsContests.getInt("track_contest_type_id"),
                            rsContests.getString("class_name"));
                }

            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'track results' failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rsContests);
            close(rsTracks);
            close(selectContests);
            close(selectTracks);
        }

    }



    private void loadTrackContestResults(int trackId, int trackContestId, int trackContestTypeId,
                                         String calculatorClassName) throws Exception {
        log.debug("loading track results for track =" + trackId + ", contest=" + trackContestId + ", trackContestTypeId=" + trackContestTypeId);

        final String SELECT_POINTS =
                " select dp.user_id, dp.amount, dp.is_potential, " +
                        " (case when dp.dr_points_reference_type_id = 1 then (select pr.placed from project_result pr where pr.user_id = dp.user_id and pr.project_id = dp.reference_id) else 0 end) as placed, " +
                        " (case when dp.dr_points_reference_type_id = 1 then (select pr.final_score from project_result pr where pr.user_id = dp.user_id and pr.project_id = dp.reference_id) else 0 end) as final_score, " +
                        " (case when dp.dr_points_reference_type_id = 1 then (select (case when pr.payment is null or pr.payment=0 then 't' else 'f' end) from project_result pr where " +
                        " pr.user_id = dp.user_id and pr.project_id = dp.reference_id) else 'f' end) as taxable " +
                        " from dr_points dp where dp.track_id = ? ";

        final String INSERT =
                "insert into track_contest_results (track_contest_id, user_id, track_contest_placement, track_contest_prize, taxable_track_contest_prize) " +
                        " values (?,?,?,?,?)";

        PreparedStatement insert = prepareStatement(INSERT, TARGET_DB);

        ResultSet rs = null;
        PreparedStatement selectPoints = null;

        long start = System.currentTimeMillis();

        try {
            selectPoints = prepareStatement(SELECT_POINTS, TARGET_DB);

            ContestResultCalculatorV2 calc = (ContestResultCalculatorV2) Class.forName(calculatorClassName).newInstance();
            if (calc instanceof TopPerformersCalculator) {
                ((TopPerformersCalculator) calc).setFactor(2);
            }

            selectPoints.setInt(1, trackId);
            rs = selectPoints.executeQuery();

            Map<Long, ContestResult> results = new HashMap<Long, ContestResult>();
            while (rs.next()) {
                ContestResult cr = results.get(rs.getLong("user_id"));

                if (cr == null)  {
                    cr = new ContestResult(rs.getLong("user_id"));
                    results.put(rs.getLong("user_id"), cr);
                }

                if (rs.getBoolean("is_potential")) {
                    cr.addPotentialPoints(rs.getDouble("amount"));
                } else {
                    cr.addPoints(rs.getDouble("amount"), rs.getBoolean("taxable"));
                }

                if (rs.getInt("placed") > 0) {
                    cr.addResult(new ProjectResult(rs.getDouble("final_score"), rs.getInt("placed")));
                }
            }
            close(rs);

            List<ContestResult> finalResults = calc.calculateResults(new ArrayList<ContestResult>(results.values()));

            simpleDelete("track_contest_results", "track_contest_id", trackContestId);
            int count = 0;
            log.debug("Results...");
            log.debug("==========");
            for (ContestResult result : finalResults) {
                log.debug("" + result.getPlace() + ") " + result.getCoderId() + " | " + result.getFinalPoints() + "|" + result.getPotentialPoints() + "|" + (result.getPrize() != null ? result.getPrize() : ""));
                insert.setInt(1, trackContestId);
                insert.setLong(2, result.getCoderId());
                insert.setInt(3, result.getPlace());
                if (result.getPrize() == null) {
                    insert.setNull(4, Types.DOUBLE);
                    insert.setNull(5, Types.DOUBLE);
                } else {
                    insert.setDouble(4, result.getPrize());
                    insert.setDouble(5, result.getPrize() * (result.getTaxableFinalPoints() / result.getFinalPoints()));
                }
                insert.executeUpdate();
                count++;
            }
            log.debug("==========");
            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } finally {
            close(rs);
            close(selectPoints);
            close(insert);
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
     * @throws Exception if any error occurs
     */
    public void doLoadStageResults() throws Exception {
        log.debug("load stage results");

        final String SELECT_STAGES =
                " select distinct s.season_id, s.stage_id, s.start_date, s.end_date " +
                        " from project_result pr, " +
                        "      stage s, " +
                        "      project p  " +
                        " where p.project_id = pr.project_id  " +
                        " and p.project_status_id <> 3  " +
                        " and p.project_category_id in " + LOAD_CATEGORIES +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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
                " select c.contest_id, c.project_category_id, c.contest_type_id, crc.class_name, x.top_performers_factor " +
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
                    loadDRContestResults(seasonId, startDate, endDate, rsContests.getInt("project_category_id"), rsContests.getInt("contest_id"),
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
     * <p>Load the client project dimension data to DW.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since 1.1.9
     */
    public void doLoadClientProjectDim() throws Exception {
        log.info("Load client project dimension data");

        long start = System.currentTimeMillis();

        // Statement for selecting the records from time_oltp table in source database
        final String SELECT
                = "SELECT a.client_id, a.name as client_name, a.creation_date as client_create_date, a.modification_date as client_modification_date, " +
                " b.project_id as billing_project_id, b.name as project_name, b.creation_date as project_create_date, b.modification_date as project_modification_date, " +
                " b.po_box_number as billing_account_code, a.cmc_account_id, a.customer_number " +
                " FROM time_oltp:client a, time_oltp:project b, time_oltp:client_project c" +
                " WHERE c.client_id = a.client_id AND c.project_id = b.project_id" +
                "  AND (a.modification_date > ? OR b.modification_date > ? OR c.modification_date > ?)";

        // Statement for updating the records in tcs_dw.client_project_dim table
        final String UPDATE = "UPDATE client_project_dim SET client_name = ?, client_create_date = ?, client_modification_date = ?, " +
                "project_name = ?, project_create_date = ?, project_modification_date = ?, billing_account_code = ? , client_id = ?, cmc_account_id = ?, customer_number = ? " +
                "WHERE billing_project_id = ?";

        // Statement for inserting the records to tcs_dw.client_project_dim table in target database
        final String INSERT
                = "INSERT INTO client_project_dim (client_id, client_name, client_create_date, client_modification_date," +
                "                                billing_project_id, project_name, project_create_date, project_modification_date, billing_account_code, client_project_id, cmc_account_id, customer_number)" +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        int count = 0;

        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            if (fLastLogTime == null) {
                fLastLogTime = new Timestamp(0);
            }
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            select.setTimestamp(3, fLastLogTime);
            insert = prepareStatement(INSERT, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            rs = select.executeQuery();


            while (rs.next()) {
                update.clearParameters();
                // client_name
                update.setString(1, rs.getString("client_name"));
                // client creation date
                update.setDate(2, rs.getDate("client_create_date"));
                // client modification date
                update.setDate(3, rs.getDate("client_modification_date"));
                // project name
                update.setString(4, rs.getString("project_name"));
                // project creation date
                update.setDate(5, rs.getDate("project_create_date"));
                // project modification date
                update.setDate(6, rs.getDate("project_modification_date"));
                // billing account code
                update.setString(7, rs.getString("billing_account_code"));
                // client id
                update.setLong(8, rs.getLong("client_id"));
                // cmc account id
                update.setString(9, rs.getString("cmc_account_id"));
                // customer number
                update.setString(10, rs.getString("customer_number"));

                // billing project id
                update.setLong(11, rs.getLong("billing_project_id"));

                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    // need to insert
                    insert.clearParameters();
                    // client id
                    insert.setLong(1, rs.getLong("client_id"));
                    // client name
                    insert.setString(2, rs.getString("client_name"));
                    // client creation date
                    insert.setDate(3, rs.getDate("client_create_date"));
                    // client modification date
                    insert.setDate(4, rs.getDate("client_modification_date"));
                    // billing project id
                    insert.setLong(5, rs.getLong("billing_project_id"));
                    // project name
                    insert.setString(6, rs.getString("project_name"));
                    // project creation date
                    insert.setDate(7, rs.getDate("project_create_date"));
                    // project modification date
                    insert.setDate(8, rs.getDate("project_modification_date"));
                    // billing account code
                    insert.setString(9, rs.getString("billing_account_code"));
                    // billing project id as client project id
                    insert.setLong(10, rs.getLong("billing_project_id"));
                    // billing account code
                    insert.setString(11, rs.getString("cmc_account_id"));
                    // customer number
                    insert.setString(12, rs.getString("customer_number"));     System.out.println("------billing_project_id--------"+rs.getLong("billing_project_id"));
                    insert.executeUpdate();
                }
                count++;
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            log.error("Load of Client Project Dimension data failed.", sqle);
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of Client Project Dimension data failed.\n" + sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }


    /**
     * <p>Load the direct project dimension data to DW.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since 1.1.9
     */
    public void doLoadDirectProjectDim() throws Exception {
        log.info("Load direct project dimension data");

        long start = System.currentTimeMillis();

        // Statement for selecting the records from time_oltp table in source database
        final String SELECT
                = "SELECT project_id, name, description, project_status_id, create_date, modify_date,"  +
                "(SELECT max(dpa.billing_account_id) from corporate_oltp:direct_project_account dpa where dpa.project_id = tdp.project_id) as billing_project_id" +
                " FROM tc_direct_project tdp" +
                " WHERE tdp.modify_date > ? ";

        // Statement for updating the records in tcs_dw.client_project_dim table
        final String UPDATE = "UPDATE direct_project_dim SET name = ?, description = ?, project_status_id = ?," +
                " project_create_date = ?, project_modification_date = ?, billing_project_id = ?" +
                " WHERE direct_project_id = ?";

        // Statement for inserting the records to tcs_dw.client_project_dim table in target database
        final String INSERT
                = "INSERT INTO direct_project_dim (direct_project_id, name, description, project_status_id," +
                "                                project_create_date, project_modification_date, billing_project_id)" +
                "VALUES (?,?,?,?,?,?,?)";

        PreparedStatement select = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        int count = 0;

        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            if (fLastLogTime == null) {
                fLastLogTime = new Timestamp(0);
            }
            select.setTimestamp(1, fLastLogTime);
            insert = prepareStatement(INSERT, TARGET_DB);
            update = prepareStatement(UPDATE, TARGET_DB);
            rs = select.executeQuery();

            while (rs.next()) {
                update.clearParameters();
                // name
                update.setString(1, rs.getString("name"));
                // description
                update.setString(2, rs.getString("description"));
                // project_status_id
                update.setLong(3, rs.getLong("project_status_id"));
                // project_create_date
                update.setDate(4, rs.getDate("create_date"));
                // project_modification_date
                update.setDate(5, rs.getDate("modify_date"));
                // billing_project_id
                update.setLong(6, rs.getLong("billing_project_id"));
                // direct project id
                update.setLong(7, rs.getLong("project_id"));


                int retVal = update.executeUpdate();

                if (retVal == 0) {
                    // need to insert
                    insert.clearParameters();
                    // direct project id
                    insert.setLong(1, rs.getLong("project_id"));
                    // name
                    insert.setString(2, rs.getString("name"));
                    // description
                    insert.setString(3, rs.getString("description"));
                    // project_status_id
                    insert.setLong(4, rs.getLong("project_status_id"));
                    // project_create_date
                    insert.setDate(5, rs.getDate("create_date"));
                    // project_modification_date
                    insert.setDate(6, rs.getDate("modify_date"));
                    // billing_project_id
                    insert.setLong(7, rs.getLong("billing_project_id"));
                    insert.executeUpdate();
                }
                count++;
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            log.error("Load of Direct Project Dimension data failed.", sqle);
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of Direct Project Dimension data failed.\n" + sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
            close(update);
        }
    }

    /**
     * <p>Loads the statistics for completed projects grouped by their respective <code>TC Direct Projects</code>,
     * project categories and dates of completion.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since 1.1.7
     */
    public void doLoadDirectProjectStats() throws Exception {
        log.debug("load TC Direct project statistics");

        // Statement for inserting the records from tcs_dw.project table into tcs_dw.tcd_project_stat table
        final String INSERT
                = "INSERT INTO tcd_project_stat (tcd_project_id, project_category_id, stat_date, cost, duration, fulfillment, total_project, create_user, create_date, modify_user, modify_date) " +
                "SELECT tc_direct_project_id, project_category_id, DATE(p.complete_date), " +
                "       SUM(p.admin_fee + p.contest_prizes_total), " +
                "       SUM((p.complete_date - p.posting_date)::interval minute(9) to minute::char(20)::decimal(10,2)), " +
                "       SUM(CASE WHEN status_id = 7 THEN 1 ELSE 0 END), " +
                "       COUNT(p.project_id), " +
                "       'TCLoadTCS', CURRENT, 'TCLoadTCS', CURRENT " +
                "FROM project p " +
                "WHERE p.complete_date IS NOT NULL and p.tc_direct_project_id > 0 and p.posting_date IS NOT NULL  " +
                "GROUP BY 1, 2, 3";

        // Statement for inserting new records into tcs_dw.tcd_project_stat table
        final String TRUNCATE_STAT_TABLE = "TRUNCATE TABLE tcd_project_stat";

        PreparedStatement insert = null;
        PreparedStatement truncate = null;
        ResultSet rs = null;

        try {
            long start = System.currentTimeMillis();

            // Truncate stats table
            truncate = prepareStatement(TRUNCATE_STAT_TABLE, TARGET_DB);
            truncate.executeUpdate();
            truncate.close();

            // Insert most recent stats for TC Direct projects
            insert = prepareStatement(INSERT, TARGET_DB);
            insert.executeUpdate();
            int count = insert.getUpdateCount();
            insert.close();

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of TC Direct project statistics failed.\n" + sqle.getMessage());
        } finally {
            close(rs);
            close(truncate);
            close(insert);
        }
    }

    /**
     * <p>Loads the statistics for user participation in all types of contests: studio, software, algo and marathon.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void doLoadParticipationStats() throws Exception {
        log.info("Load participation stats data");

        long start = System.currentTimeMillis();

        // Statement for selecting records from the source database
        final String SELECT
                = "SELECT rr.coder_id as user_id, rs.start_time::DATETIME YEAR TO DAY as participation_date, 1 as participation_type " +
                "FROM informixoltp:round r " +
                "INNER JOIN informixoltp:room_result rr ON  rr.round_id = r.round_id and rr.attended = 'Y' and rr.room_seed is not null " +
                "INNER JOIN informixoltp:round_segment rs ON rs.round_id = r.round_id and rs.segment_id = 1 " +
                "WHERE r.round_type_id in (1,2,10) and rs.start_time > ? " +
                "UNION " +
                "SELECT lcr.coder_id as user_id, rs.start_time::DATETIME YEAR TO DAY as participation_date, 2 as participation_type " +
                "FROM informixoltp:round r " +
                "INNER JOIN informixoltp:long_comp_result lcr ON lcr.round_id = r.round_id and lcr.attended = 'Y' " +
                "INNER JOIN informixoltp:round_segment rs ON rs.round_id = r.round_id and rs.segment_id = 1 " +
                "WHERE round_type_id in (13, 15, 19, 22, 25) and rs.start_time > ? " +
                "UNION " +
                "SELECT ri.value::int as user_id, r.create_date::DATETIME YEAR TO DAY as participation_date, " +
                "(CASE WHEN pcl.project_type_id in (1,2) THEN 3 ELSE 4 END) as participation_type " +
                "FROM resource r " +
                "INNER JOIN resource_info ri ON r.resource_id=ri.resource_id and ri.resource_info_type_id=1 " +
                "INNER JOIN project p ON r.project_id=p.project_id " +
                "INNER JOIN project_category_lu pcl ON p.project_category_id=pcl.project_category_id and pcl.project_type_id in (1,2,3) " +
                "WHERE r.resource_role_id in (1,2,4,5,6,7,8,9) and r.create_date > ? and " +
                "not exists (select 1 from contest_eligibility where r.project_id=contest_id)";

        // Statement for inserting the records to tcs_dw.participation table in target database
        final String INSERT
                = "INSERT INTO participation (user_id, participation_type, participation_date) VALUES (?,?,?)";

        PreparedStatement select = null;
        PreparedStatement insert = null;
        ResultSet rs = null;
        int count = 0;

        try {
            select = prepareStatement(SELECT, SOURCE_DB);
            if (fLastLogTime == null) {
                fLastLogTime = new Timestamp(0);
            }
            select.setTimestamp(1, fLastLogTime);
            select.setTimestamp(2, fLastLogTime);
            select.setTimestamp(3, fLastLogTime);
            insert = prepareStatement(INSERT, TARGET_DB);
            rs = select.executeQuery();

            while (rs.next()) {
                insert.clearParameters();
                insert.setLong(1, rs.getLong("user_id"));
                insert.setLong(2, rs.getLong("participation_type"));
                insert.setDate(3, rs.getDate("participation_date"));

                insert.executeUpdate();
                count++;
            }

            log.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            log.error("Load of Participation Stats data failed.", sqle);
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of Participation Stats data failed.\n" + sqle.getMessage());
        } finally {
            close(rs);
            close(select);
            close(insert);
        }
    }

    /**
     * Helper method to load contest results for the specified contest.
     *
     * @param seasonId the season id
     * @param startDate the start date
     * @param endDate the end date
     * @param phaseId the phase id
     * @param contestId the contest id
     * @param className the class name
     * @param factor the factor
     *
     * @throws Exception if any error occurs
     */
    private void loadDRContestResults(int seasonId, Timestamp startDate, Timestamp endDate, int projectCategoryId,
                                      int contestId, String className, double factor) throws Exception {

        log.debug("loading contest_result for dr contest_id=" + contestId + ", project category=" + projectCategoryId + " from " + startDate + " to " + endDate);
        final String SELECT_RESULTS =
                " select p.project_id " +
                        "       ,p.project_status_id " +
                        "       ,pr.user_id " +
                        "       ,pr.placed " +
                        "       ,pr.point_adjustment " +
                        "       ,pr.final_score " +
                        "       ,pr.passed_review_ind " +
                        "       , NVL((select value from project_info pi_dr where pi_dr.project_info_type_id = 30 and pi_dr.project_id = p.project_id), " +
                        "          (select value from project_info pi_am where pi_am.project_info_type_id = 16 and pi_am.project_id = p.project_id)) as amount " +
                        "       ,(select count(*) from submission s, upload u  " +
                        "         where s.submission_type_id = 1 and u.upload_id = s.upload_id and project_id = p.project_id  " +
                        "         and submission_status_id in (1, 4) " +
                        "        ) as num_submissions_passed_review  " +
                        "    ,case when exists(select '1' from submission s,upload u,resource r, resource_info ri " +
                        "           where s.submission_type_id = 1 and r.resource_id = ri.resource_id and ri.resource_info_type_id = 1 and u.resource_id = r.resource_id " +
                        "           and u.upload_id = s.upload_id and u.project_id = pr.project_id and ri.value = pr.user_id and submission_status_id in (1,2,3,4)) then pr.valid_submission_ind  " +
                        "    else 0 end as valid_submission_ind " +
                        " from project p " +
                        "    ,project_result pr " +
                        "    ,project_info pi_dr " +
                        " where pi_dr.project_id = p.project_id " +
                        " and pi_dr.project_info_type_id = 26 " +
                        " and pi_dr.value = 'On' " +
                        " and p.project_id = pr.project_id " +
                        // component testing doesn't need to check for rating
                        " and (pr.rating_ind=1 or p.project_category_id = 5)" +
                        // for development board, load development and component testing
                        " and p.project_category_id in (" + ((projectCategoryId == 2) ? "2, 5" : String.valueOf(projectCategoryId)) + ") " +
                        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
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
            // for dev contests, load also component testing projects results
            selectResults.setTimestamp(1, startDate);
            selectResults.setTimestamp(2, endDate);

            insert = prepareStatement(INSERT, TARGET_DB);

            ContestResultCalculator calc = (ContestResultCalculator) Class.forName(className).newInstance();
            if (calc instanceof TopPerformersCalculator) {
                ((TopPerformersCalculator) calc).setFactor(factor);
            }

            rs = selectResults.executeQuery();

            List<ProjectResult> pr = new ArrayList<ProjectResult>();
            int count = 0;
            while (rs.next()) {
                if (rs.getDouble("amount") < 0.01) {
                    log.warn("Project: " + rs.getLong("project_id") + " has zero amount!");
                }

                if (rs.getInt("valid_submission_ind") == 1 || rs.getInt("project_status_id") == 7) {
                    ProjectResult res = new ProjectResult(rs.getLong("project_id"), rs.getInt("project_status_id"), rs.getLong("user_id"),
                            rs.getDouble("final_score"), rs.getInt("placed"), rs.getInt("point_adjustment"), rs.getDouble("amount"),
                            rs.getInt("num_submissions_passed_review"), rs.getBoolean("passed_review_ind"));

                    pr.add(res);
                }
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

    private static class Track {
        long trackId;
        long projectCategoryId;
        Timestamp start;
        Timestamp end;
        ContestResultCalculatorV2 pointsCalculator;

        public Track(long trackId, long projectCategoryId, Timestamp start, Timestamp end, ContestResultCalculatorV2 pointsCalculator) {
            super();
            this.trackId = trackId;
            this.projectCategoryId = projectCategoryId;
            this.start = start;
            this.end = end;
            this.pointsCalculator = pointsCalculator;
        }

        protected long getTrackId() {
            return trackId;
        }

        protected void setTrackId(long trackId) {
            this.trackId = trackId;
        }

        protected long getProjectCategoryId() {
            return projectCategoryId;
        }

        protected void setProjectCategoryId(long projectCategoryId) {
            this.projectCategoryId = projectCategoryId;
        }

        protected Timestamp getStart() {
            return start;
        }

        protected void setStart(Timestamp start) {
            this.start = start;
        }

        protected Timestamp getEnd() {
            return end;
        }

        protected void setEnd(Timestamp end) {
            this.end = end;
        }

        protected ContestResultCalculatorV2 getPointsCalculator() {
            return pointsCalculator;
        }

        protected void setPointsCalculator(ContestResultCalculatorV2 pointsCalculator) {
            this.pointsCalculator = pointsCalculator;
        }

    }

}
