/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.dde.util.DWLoad;


import com.topcoder.shared.util.logging.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.naming.Context;

/**
 * <p><strong>Purpose</strong>:
 * This class calculates Reliability Rating for old competition tracks.</p>
 *
 * <p>
 *   Version 1.1 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 Change notes:
 *   <ol>
 *     <li>Added constraints check for rated projects.</li>
 *   </ol>
 * </p>
 *
 * @author pulky, VolodymyrK
 * @version 1.2
 */
public class OldTracksReliabilityCalculator implements ReliabilityCalculator {
    protected static final Logger log = Logger.getLogger(ReliabilityRating.class);

    public static final int MIN_PASSING_SCORE = 75;
    public static final int MIN_RELIABLE_SCORE = 75;

    private static final int RELIABLE_COUNT_IDX = 0;
    private static final int PROJECT_COUNT_IDX = 1;
    private static final int MARKED_COUNT_IDX = 2;

    /* BUGR-852 modification */
    private static final int BEFORE_PIVOT_PROJECT_COUNT_IDX = 3;
    private static final int BEFORE_PIVOT_MARKED_COUNT_IDX = 4;

    /**
     * Base SQL fragment to be added to a where clause to not select projects with eligibility constraints
     * 
     * @since 1.1
     */
    private static final String ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_BASE =
        "project_id not in (select ce.contest_id from contest_eligibility ce " +
        " where ce.is_studio = 0) ";

    /**
     * SQL fragment to be added to a where clause to not select projects with eligibility constraints
     * 
     * @since 1.1
     */
    protected static final String ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT =
        " and p." + ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_BASE;

    /**
     * SQL fragment to be added to a where clause to not select projects with eligibility constraints
     * Removed project (p) prefix
     * 
     * @since 1.1
     */
    protected static final String ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX =
        " and " + ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_BASE;

    /**
     * Base SQL fragment to be added to a where clause to select only rated projects
     * 
     * @since 1.2
     */
    private static final String RATED_CONSTRAINTS_SQL_FRAGMENT_BASE =
        "project_id in (select pi.project_id from project_info pi where pi.project_info_type_id=13 " +
        "and (pi.value='Yes' or pi.value='yes')) ";

    /**
     * SQL fragment to be added to a where clause to select only rated projects
     * 
     * @since 1.2
     */
    protected static final String RATED_CONSTRAINTS_SQL_FRAGMENT =
        " and p." + RATED_CONSTRAINTS_SQL_FRAGMENT_BASE;

    /**
     * SQL fragment to be added to a where clause to select only rated projects
     * Removed project (p) prefix
     * 
     * @since 1.2
     */

    protected static final String RATED_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX =
        " and " + RATED_CONSTRAINTS_SQL_FRAGMENT_BASE;

    private static final String updateProjectResult =
        "UPDATE project_result SET old_reliability = ?, new_reliability = ?, current_reliability_ind = ? " +
        " WHERE project_id = ? and user_id = ? ";

    private static final String updateCurrentReliability = "update project_result set current_reliability_ind = ? " +
        " WHERE project_id = ? and user_id = ? ";

    private static final String updateUserReliability =
        "update user_reliability set rating = ? where user_id = ? and phase_id = ?";

    private static final String insertUserReliability =
        "insert into user_reliability (rating, user_id, phase_id) values (?,?,?)";

    /**
     * SQL query that clears current reliability
     */
    private static final String clearCurrentReliability = "update project_result set current_reliability_ind = 0 where project_id in " +
        "(select project_id from project where project_category_id+111 = ?) " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX +
        RATED_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX;

    /**
     * SQL query that marks records that should be included in the process
     */
    private final static String markIncluded =
        "update project_result " +
        "set reliability_ind = 1 " +
        "where reliability_ind is null " +
        "and final_score >= ? "+
        " and project_id in (select project_id from project where project_category_id = ?) " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX + 
        RATED_CONSTRAINTS_SQL_FRAGMENT_NO_PREFIX;

    /**
     * SQL query that retrieves unmarked records
     */
    private final static String getUnmarked =
        "select pr.user_id, pr.project_id, p.project_category_id, ci.create_time " +
        " from project_result pr " +
        " , project p " +
        " , component_inquiry ci " +
        "where ((pr.final_score is not null " +
        "and pr.final_score < ?) " +
        "or (pr.final_score is null and p.project_status_id in (4,5,6,7,8))) " +
        "and pr.reliability_ind is null  " +
        "and pr.project_id = p.project_id " +
        "and ci.project_id = pr.project_id " +
        "and ci.user_id = pr.user_id " +
        " and p.project_category_id = ? " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " order by ci.create_time";

    private final static String setReliability =
        "update project_result set reliability_ind = ? where project_id = ? and user_id = ?";

    /**
     * SQL query that retrieves prior projects
     *
     * BUGR-852 modification: add one item 'pi.scheduled_start_time' in the select clause
     */
    private static final String priorProjects =
        "select pr.reliability_ind, pr.project_id, pr.user_id, pi.scheduled_start_time " +
        "from component_inquiry ci " +
        ", project_result pr " +
        ", project p " +
        ", project_phase pi " +         // BUGR-852 modification: add this line
        "where ci.user_id = ? " +
        "and p.project_id = pr.project_id " +
        "and pr.user_id = ci.user_id " +
        "and p.project_category_id = ? " +
        "and pr.project_id = ci.project_id " +
        "and pi.project_id = p.project_id " +
        "and pi.phase_type_id = 1 " +
        "and ci.create_time < (select min(create_time) " +
        "from component_inquiry " +
        "where user_id = ci.user_id " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        "and project_id = ?)";

    public void calculateReliability(Connection conn, int historyLength, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        log.info("Calculating reliability for competition type " + competitionTypeId);

        int incExMarked = markForInclusionAndExclusion(conn, competitionTypeId, startDate, pivotDate);
        log.info(incExMarked + " records marked for inclusion/exclusion");

        Set<Long> users = getIncludedUsers(conn, competitionTypeId, startDate, pivotDate);
        log.info("there are " + users.size() + " competitors included");

        int newMarked = markNewReliableResults(conn, competitionTypeId, startDate, pivotDate);
        log.info(newMarked + " new records marked");

        int oldMarked = markOldReliableResults(conn, competitionTypeId, startDate, pivotDate);
        log.info(oldMarked + " old records marked");

        int oldUpdated = updateOldProjectResult(conn, competitionTypeId, startDate, pivotDate);
        log.info(oldUpdated + " old records updated");

        int updated = updateReliability(conn, users, historyLength, competitionTypeId, startDate, pivotDate);
        log.info(updated + " new project result competitor records updated");

        log.info("Finished calculating reliability for competition type " + competitionTypeId);
    }


    /**
     * mark all the records that should be included in the reliability calculations
     * <p/>
     * NOTE:  nothing will be marked if it is not currently unmarked, meaning
     * it is unmarked if reliability_ind = null
     * <p/>
     * the simple case is when they score at least the min passing score.  in this
     * case, they get marked for inclusion.
     * <p/>
     * it gets trickier for those that have not reached the min passing score.  in
     * that case, if they have a prior project that is included, then this project
     * will also be included.  however, if all prior projects (based on register date)
     * have not been included this this one should not be included either.
     *
     * @param conn
     * @return how many records we marked
     * @throws SQLException
     */
    protected int markForInclusionAndExclusion(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        int ret = 0;
        try {

            //mark the easy ones..people that scored over the min
            ps = conn.prepareStatement(markIncluded);
            ps.setInt(1, MIN_PASSING_SCORE);
            ps.setInt(2, competitionTypeId);
            ret = ps.executeUpdate();

            ret += markBasedOnPriorProjects(conn, competitionTypeId, startDate, pivotDate);

        } finally {
            close(ps);
        }
        return ret;
    }

    protected int markBasedOnPriorProjects(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        ResultSet unmarked = null;
        int ret = 0;

        try {
            ps2 = conn.prepareStatement(getUnmarked);
            ps2.setInt(1, MIN_PASSING_SCORE);
            ps2.setInt(2, competitionTypeId);
            unmarked = ps2.executeQuery();

            ps3 = conn.prepareStatement(setReliability);
            while (unmarked.next()) {
                ps3.clearParameters();
                ps3.setLong(2, unmarked.getLong("project_id"));
                ps3.setLong(3, unmarked.getLong("user_id"));
                int[] info = getPriorProjects(conn, unmarked.getLong("user_id"),
                                              unmarked.getLong("project_id"), unmarked.getInt("project_category_id"), pivotDate);

                if (info[RELIABLE_COUNT_IDX] > 0) {
                    //if they have previously had projects that were reliable, then this one counts
                    ps3.setInt(1, 1);
                    ret += ps3.executeUpdate();
                } else if (info[PROJECT_COUNT_IDX] == info[MARKED_COUNT_IDX]) {
                    //if all prior projects are not included in reliability, this one shouldn't either
                    ps3.setInt(1, 0);
                    ret += ps3.executeUpdate();
                } else if (info[BEFORE_PIVOT_PROJECT_COUNT_IDX] == info[BEFORE_PIVOT_MARKED_COUNT_IDX]) {
                    /* BUGR-852 modification: add this 'else if' clause */
                    // if all prior projects which created before the pivot date are not included in reliability,
                    // and some prior projects created after the pivot date are still incomplete,
                    // this one should be marked with 0 (not included in reliability) immediately.
                    ps3.setInt(1, 0);
                    ret += ps3.executeUpdate();
                } else {
                    /* BUGR-852 modification: modify the comments below */
                    // we don't know enough yet to mark them as either included or excluded.  basically, they have at least
                    // one project prior to this one and created before pivot date that isn't complete, so we can't decide
                    // on this one yet. (we should decide after all the projects created before pivot date are complete.)
                    log.info("got " + info[RELIABLE_COUNT_IDX] + " " + info[PROJECT_COUNT_IDX] + " " + info[MARKED_COUNT_IDX] + " " + unmarked.getLong("user_id") + " " + unmarked.getLong("project_id"));
                }
            }
        } finally {
            close(unmarked);
            close(ps2);
            close(ps3);
        }
        return ret;
    }


    /**
     * this first query is for projects before our reliability rule change.
     * in this case, anyone that has made a submission where reliabilty was in effect
     * will have a reliability rating.  the second query is for the new way.
     * in this case, anyone that has scored over the minimum review
     * score will be included.
     * <p/>
     * this is the list of people that will have a reliability rating in user_reliability
     * that may not be the same list as the list of people who have a non-empty reliability
     * history.  if people submitted prior to the new rules and were not successful, those
     * submissions will count against them the next time they submit.
     */
    private static final String includedUsers =
        " select distinct pr.user_id" +
        " from project_result pr" +
        " , project_phase pi" +
        " , project p" +
        " where pr.project_id = pi.project_id" +
        " and pi.phase_type_id = 2" +
        " and pi.scheduled_start_time < ?" +
        " and pr.reliability_ind = 1" +
        " and pr.project_id = p.project_id" +
        " and p.project_category_id+111=?" +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " union" +
        " select distinct pr.user_id" +
        " from project_result pr" +
        " , project_phase pi" +
        " , project p" +
        " where pr.project_id = pi.project_id" +
        " and pi.phase_type_id = 2" +
        " and pi.scheduled_start_time >= ?" +
        " and pr.reliability_ind = 1" +
        " and pr.final_score >= ?" +
        " and pr.project_id = p.project_id" +
        " and p.project_category_id+111=?" +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT;

    protected Set<Long> getIncludedUsers(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        HashSet<Long> ret = new HashSet<Long>();

        try {

            ps = conn.prepareStatement(includedUsers);
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setLong(2, competitionTypeId + 111);
            ps.setDate(3, new java.sql.Date(startDate.getTime()));
            ps.setInt(4, MIN_PASSING_SCORE);
            ps.setLong(5, competitionTypeId + 111);
            rs = ps.executeQuery();

            while (rs.next()) {
                ret.add(new Long(rs.getLong("user_id")));
            }
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }

    /**
     * SQL query that retrieves the new records to mark
     */
    private static final String getNewRecordsToMark =
        " select pr.user_id" +
        " , pr.project_id" +
        " , pr.final_score" +
        " from project_result pr" +
        " , project_phase pi" +
        " , project p" +
        " where pr.project_id = pi.project_id" +
        " and pi.phase_type_id = 2" +
        " and p.project_id = pr.project_id " +
        " and p.project_category_id = ? " +
        " and pi.scheduled_start_time >= ?" +
        " and pr.reliability_ind = 1" +
        " and pr.reliable_submission_ind is null" +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT;

    private static final String updateReliableSubmission =
        "update project_result set reliable_submission_ind = ?" +
        "where user_id = ? and project_id = ?";

    /**
     * mark all the project result records after the change date
     * as reliable or not reliable as appropriate.
     * <p/>
     * that means mark everyone that did a project that started
     * after the change date, (1) that has a final score populated
     * that is greater than or equal to the min reliability score,
     * (2)that should be included inthe calc (reliability_ind)
     * and (3) has reliable_submission_ind flag that is null set the
     * reliable_submission_ind flag to 1.  if the record
     * meets three of those criteria but scores less than the min
     * reliable score, then set to 0.
     *
     * @param conn
     * @return the number of records marked
     * @throws SQLException
     */
    protected int markNewReliableResults(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        int ret = 0;
        try {

            ps = conn.prepareStatement(getNewRecordsToMark);
            ps2 = conn.prepareStatement(updateReliableSubmission);
            ps.setInt(1, competitionTypeId);
            ps.setDate(2, new java.sql.Date(startDate.getTime()));
            rs = ps.executeQuery();
            while (rs.next()) {
                ps2.clearParameters();

                int reliableSubmissionInd = 0;
                if (rs.getObject("final_score") != null && Double.compare(rs.getDouble("final_score"), MIN_RELIABLE_SCORE) >= 0) {
                    reliableSubmissionInd = 1;
                }

                ps2.setInt(1, reliableSubmissionInd);
                ps2.setLong(2, rs.getLong("user_id"));
                ps2.setLong(3, rs.getLong("project_id"));

                ret += ps2.executeUpdate();
            }

        } finally {
            close(rs);
            close(ps);
            close(ps2);
        }
        return ret;
    }

    /**
     * SQL query that retrieves the old records to mark
     */
    private static final String getOldRecordsToMark =
        " select pr.user_id" +
        " , pr.project_id" +
        " , pr.valid_submission_ind" +
        " from project_result pr" +
        " , project_phase pi" +
        " , project p" +
        " where pr.project_id = pi.project_id" +
        " and pr.project_id = p.project_id " +
        " and pi.phase_type_id = 2" +
        " and pi.scheduled_start_time < ?" +
        " and p.project_category_id = ? "+
        " and pr.reliability_ind = 1" +
        " and pr.reliable_submission_ind is null" +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT;

    /**
     * mark all the project result records before the change date
     * as reliable or not reliable as appropriate.
     * <p/>
     * that means mark everyone that did a project that started
     * before the change date that should be included in the calculation
     * to 1 if it's a valid submission and 0 if not.
     *
     * @param conn
     * @return the number of records marks
     * @throws SQLException
     */
    protected int markOldReliableResults(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        int ret = 0;
        try {

            ps = conn.prepareStatement(getOldRecordsToMark);
            ps2 = conn.prepareStatement(updateReliableSubmission);
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setInt(2, competitionTypeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ps2.clearParameters();
                ps2.setInt(1, rs.getInt("valid_submission_ind"));
                ps2.setLong(2, rs.getLong("user_id"));
                ps2.setLong(3, rs.getLong("project_id"));
                ret += ps2.executeUpdate();
            }
        } finally {
            close(rs);
            close(ps);
            close(ps2);
        }
        return ret;
    }

    /**
     * SQL query that retrieves the old reliability data
     */
    private static final String oldReliabilityData =
        " select pr.reliable_submission_ind" +
        " , ci.create_time" +
        " , pr.project_id" +
        " from project_result pr" +
        " , component_inquiry ci" +
        " , project_phase pi" +
        " , project p" +
        " where ci.project_id = pr.project_id" +
        " and pr.user_id = ci.user_id" +
        " and p.project_id = pr.project_id " +
        " and pr.user_id = ?" +
        " and pi.phase_type_id = 2" +
        " and pi.scheduled_start_time < ?" +
        " and pi.project_id = pr.project_id" +
        " and pr.reliability_ind = 1" +
        " and pr.reliable_submission_ind is not null" +
        " and p.project_category_id = ? " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " order by ci.create_time asc";

    /**
     * SQL query that retrieves the new records to mark
     *
     * all the people that became part of the reliability process prior to the change date
     */
    private static final String oldReliabilityUsers =
        " select distinct pr.user_id" +
        " from project_result pr" +
        " , project_phase pi" +
        " , project p" +
        " where pi.phase_type_id = 2" +
        " and p.project_id = pr.project_id " +
        " and pi.scheduled_start_time < ?" +
        " and pi.project_id = pr.project_id" +
        " and pr.reliable_submission_ind is not null" +
        " and p.project_category_id = ? " +
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " and pr.reliability_ind = 1";

    protected int updateOldProjectResult(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        int ret = 0;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        ResultSet rs = null;
        ResultSet rs3 = null;

        try {

            ps = conn.prepareStatement(oldReliabilityData);
            ps2 = conn.prepareStatement(updateProjectResult);
            ps3 = conn.prepareStatement(oldReliabilityUsers);
            ps3.setDate(1, new java.sql.Date(startDate.getTime()));
            ps3.setInt(2, competitionTypeId);
            rs3 = ps3.executeQuery();
            long userId;
            while (rs3.next()) {
                try {
                    userId = rs3.getLong("user_id");
                    ps.clearParameters();
                    ps.setLong(1, userId);
                    ps.setDate(2, new java.sql.Date(startDate.getTime()));
                    ps.setInt(3,competitionTypeId);
                    rs = ps.executeQuery();
                    int projectCount = 0;
                    int reliableCount = 0;
                    double oldReliability;
                    double newReliability = 0.0d;
                    while (rs.next()) {
                        projectCount++;
                        reliableCount += rs.getInt("reliable_submission_ind");
                        oldReliability = newReliability;
                        newReliability = (double) reliableCount / (double) projectCount;
                        ps2.clearParameters();
                        //if it's their first project,then old is null
                        if (projectCount > 1) {
                            ps2.setDouble(1, oldReliability);
                        } else {
                            ps2.setNull(1, Types.DOUBLE);
                        }
                        ps2.setDouble(2, newReliability);
                        ps2.setInt(3, 0);
                        ps2.setLong(4, rs.getLong("project_id"));
                        ps2.setLong(5, userId);
                        ret += ps2.executeUpdate();
                    }
                } finally {
                    close(rs);
                }
            }
        } finally {
            close(rs3);
            close(ps);
            close(ps2);
            close(ps3);
        }

        return ret;

    }
    /**
     * go through the list of users and do two things.
     * 1.  update project result with reliability information
     * 2.  update user_reliability with current data
     *
     * @param conn
     * @param users
     * @param historyLength
     * @param phaseId
     * @return the number of records updated/inserted
     * @throws SQLException
     */
    protected int updateReliability(Connection conn, Set<Long> users, int historyLength, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        log.info("updateReliability(conn, users, " + historyLength + ", " + competitionTypeId + ") called");
        int phaseId = competitionTypeId + 111;
        int ret = 0;
        PreparedStatement ps2 = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        PreparedStatement clear = null;
        PreparedStatement currUpdate = null;
        ResultSet rs = null;

        try {

            ps2 = conn.prepareStatement(updateProjectResult);
            insert = conn.prepareStatement(insertUserReliability);
            update = conn.prepareStatement(updateUserReliability);
            currUpdate = conn.prepareStatement(updateCurrentReliability);
            clear = conn.prepareStatement(clearCurrentReliability);
            clear.setLong(1, phaseId);

            clear.executeUpdate();

            for (long userId : users) {
                try {
                    List<ReliabilityInstance> history = retrieveReliabilityHistory(conn, userId, historyLength, competitionTypeId, startDate, pivotDate);
                    history = computeReliabilityHistory(history, historyLength);

                    ReliabilityInstance instance = null;
                    for (Iterator<ReliabilityInstance> records = history.iterator(); records.hasNext();) {
                        instance = records.next();
                        if (instance.isAfterStart()) {
                            ps2.clearParameters();
                            if (instance.isFirst()) {
                                ps2.setNull(1, Types.DOUBLE);
                            } else {
                                ps2.setDouble(1, instance.getRecentOldReliability());
                            }
                            ps2.setDouble(2, instance.getRecentNewReliability());
                            ps2.setInt(3, instance.isIncluded() ? 1 : 0);
                            ps2.setLong(4, instance.getProjectId());
                            ps2.setLong(5, userId);
                            ret += ps2.executeUpdate();
                        } else {
                            currUpdate.clearParameters();
                            currUpdate.setInt(1, instance.isIncluded() ? 1 : 0);
                            currUpdate.setLong(2, instance.getProjectId());
                            currUpdate.setLong(3, userId);
                            ret += currUpdate.executeUpdate();
                        }

                    }
                    //update or create a user_reliability record for everyone that is included
                    //that would be whether they are included because of the old way, or the new way
                    if (instance != null) {
                        update.clearParameters();
                        update.setDouble(1, instance.getRecentNewReliability());
                        update.setLong(2, userId);
                        update.setLong(3, phaseId);
                        int num = update.executeUpdate();
                        if (num == 0) {
                            insert.clearParameters();
                            insert.setDouble(1, instance.getRecentNewReliability());
                            insert.setLong(2, userId);
                            insert.setLong(3, phaseId);
                            insert.executeUpdate();
                        }
                        log.info("reliability for " + userId + " set to " + instance.getRecentNewReliability());
                    }

                } finally {
                    close(rs);
                }
            }
        } finally {
            close(rs);
            close(ps2);
            close(insert);
            close(update);
            close(currUpdate);
            close(clear);
        }
        return ret;
    }


    /**
     * SQL query that retrieves reliability data before pivot
     *
     * BUGR-852 modification: change 'reliabilityDate' to 'reliabilityDataBeforePivot', and add
     * 'reliabilityDataAfterPivot'
     */
    private static final String reliabilityDataBeforePivot =
        " select pr.reliable_submission_ind" +
        " , ci.create_time" +
        " , pr.project_id" +
        " , case when pi.scheduled_start_time >= ? then 1 else 0 end as after_start_flag" +
        " from project_result pr" +
        " , component_inquiry ci" +
        " , project_phase pi" +
        " , project_phase pi2" +
        " , project p" +
        " where ci.project_id = pr.project_id" +
        " and pr.user_id = ci.user_id" +
        " and pr.project_id = p.project_id" +
        " and pr.user_id = ?" +
        " and p.project_category_id+111 = ?" +
        " and pr.project_id = pi.project_id" +
        " and pi.phase_type_id = 2" + // phase type 2 is submission
        " and pr.project_id = pi2.project_id" +
        " and pi2.phase_type_id = 4" + // phase type 4 is review
        " and (p.project_status_id IN (4,5,6,7,8) " +
        "       OR (p.project_status_id = 1 and pi2.phase_status_id = 3))" +
        " and pr.reliability_ind = 1" +
        " and pr.reliable_submission_ind is not null" +
        " and pi.scheduled_start_time <= ?" + // BUGR-852 modification: scheduled_start_time should be not greater than pivot date
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " order by ci.create_time asc";

    /**
     * SQL query that retrieves reliability data after pivot
     */
    private static final String reliabilityDataAfterPivot =
        " select pr.reliable_submission_ind" +
        " , ci.create_time" +
        " , pr.project_id" +
        " , case when pi.scheduled_start_time >= ? then 1 else 0 end as after_start_flag" +
        " , (select max(actual_end_time) from project_phase where project_id = p.project_id) as complete_date" +
        " from project_result pr" +
        " , component_inquiry ci" +
        " , project_phase pi" +
        " , project_phase pi2" +
        " , project p" +
        " where ci.project_id = pr.project_id" +
        " and pr.user_id = ci.user_id" +
        " and pr.project_id = p.project_id" +
        " and pr.user_id = ?" +
        " and p.project_category_id+111 = ?" +
        " and pr.project_id = pi.project_id" +
        " and pi.phase_type_id = 2" + // phase type 2 is submission
        " and pr.project_id = pi2.project_id" +
        " and pi2.phase_type_id = 4" + // phase type 4 is review
        " and (p.project_status_id IN (4,5,6,7,8) " +
        "       OR (p.project_status_id = 1 and pi2.phase_status_id = 3))" +
        " and pr.reliability_ind = 1" +
        " and pr.reliable_submission_ind is not null" +
        " and pi.scheduled_start_time > ?" + // BUGR-852 modification: scheduled_start_time should be greater than pivot date
        ELIGIBILITY_CONSTRAINTS_SQL_FRAGMENT +
        RATED_CONSTRAINTS_SQL_FRAGMENT +
        " order by complete_date asc";

    protected List<ReliabilityInstance> retrieveReliabilityHistory(Connection conn, long userId, int historyLength, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement psBeforePivot = null;
        PreparedStatement psAfterPivot = null;
        ResultSet rsBeforePivot = null;
        ResultSet rsAfterPivot = null;
        List<ReliabilityInstance> history = new ArrayList<ReliabilityInstance>(10000);
        int phaseId = competitionTypeId + 111;


        try {
            /* BUGR-852 modification: select two parts and combine them */
            psBeforePivot = conn.prepareStatement(reliabilityDataBeforePivot);
            psBeforePivot.setDate(1, new java.sql.Date(startDate.getTime()));
            psBeforePivot.setLong(2, userId);
            psBeforePivot.setLong(3, phaseId);
            psBeforePivot.setDate(4, new java.sql.Date(pivotDate.getTime()));
            rsBeforePivot = psBeforePivot.executeQuery();
            while (rsBeforePivot.next()) {
                history.add(new ReliabilityInstance(rsBeforePivot.getLong("project_id"),
                                                    userId, rsBeforePivot.getInt("reliable_submission_ind") == 1, rsBeforePivot.getInt("after_start_flag") == 1));
            }

            psAfterPivot = conn.prepareStatement(reliabilityDataAfterPivot);
            psAfterPivot.setDate(1, new java.sql.Date(startDate.getTime()));
            psAfterPivot.setLong(2, userId);
            psAfterPivot.setLong(3, phaseId);
            psAfterPivot.setDate(4, new java.sql.Date(pivotDate.getTime()));
            rsAfterPivot = psAfterPivot.executeQuery();
            while (rsAfterPivot.next()) {
                history.add(new ReliabilityInstance(rsAfterPivot.getLong("project_id"),
                                                    userId, rsAfterPivot.getInt("reliable_submission_ind") == 1, rsAfterPivot.getInt("after_start_flag") == 1));
            }

        } finally {
            close(rsBeforePivot);
            close(psBeforePivot);
            close(rsAfterPivot);
            close(psAfterPivot);
        }

        return history;
    }

    protected List<ReliabilityInstance> computeReliabilityHistory(List<ReliabilityInstance> history, int historyLength) {
        //calculate/populate reliabilities for the given history length. that means only include historyLength records

        if (!history.isEmpty()) {
            ((ReliabilityInstance) history.get(0)).setFirst(true);
        }

        int size = history.size();

        //set the most recent historyLength records as included in the current reliablity calculation
        for (int i = size - 1, j = 0; i >= 0 && j < historyLength; i--, j++) {
            ((ReliabilityInstance) history.get(i)).setIncluded(true);
        }

        ReliabilityInstance cur;
        double fullNewRel;
        int fullReliableCount = 0;
        for (int i = 0; i < size; i++) {
            if (history.get(i).isReliable()) {
                fullReliableCount++;
            }
            fullNewRel = (double) fullReliableCount / (double) (i + 1);

            double newRel = 0.0d;
            int reliableCount = 0;
            int projectCount = 0;

            int j = (i - historyLength + 1) < 0 ? 0 : i - historyLength + 1;
            for (; j <= i; j++) {
                //iterate through the records that count based on the
                //history length and calculate the reliability information
                projectCount++;
                cur = history.get(j);
                if (cur.isReliable()) {
                    reliableCount++;
                }
                newRel = (double) reliableCount / (double) (projectCount);
            }

            if (i > 0) {
                history.get(i).setRecentOldReliability(
                                                       history.get(i - 1).getRecentNewReliability());
                history.get(i).setOldReliability(
                                                 history.get(i - 1).getNewReliability());
            }
            history.get(i).setRecentNewReliability(newRel);
            history.get(i).setNewReliability(fullNewRel);
        }

        return history;
    }



    protected int[] getPriorProjects(Connection conn, long userId, long projectId, int projectTypeId, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;

        /* BUGR-852 modification: change int[3] to int[5] */
        int[] ret = new int[5];

        Arrays.fill(ret, 0);
        try {

            ps = conn.prepareStatement(priorProjects);
            ps.setLong(1, userId);
            ps.setInt(2, projectTypeId);
            ps.setLong(3, projectId);
            rs = ps.executeQuery();
            while (rs.next()) {

                /* BUGR-852 modification */
                boolean isBeforePivot = rs.getDate("scheduled_start_time").before(pivotDate);

                ret[PROJECT_COUNT_IDX]++;

                /* BUGR-852 modification */
                if(isBeforePivot) {
                    ret[BEFORE_PIVOT_PROJECT_COUNT_IDX]++;
                }

                ret[RELIABLE_COUNT_IDX] += rs.getInt("reliability_ind");
                if (rs.getString("reliability_ind") != null) {
                    ret[MARKED_COUNT_IDX]++;

                    /* BUGR-852 modification */
                    if(isBeforePivot) {
                        ret[BEFORE_PIVOT_MARKED_COUNT_IDX]++;
                    }

                }
            }
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }


    protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }


}



