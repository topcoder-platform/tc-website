/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Hashtable;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;

/**
 * <p>
 * This class is used to load TCS data to DW aggregation table. It extends from <code>TCLoader</code>. It's new added in
 * TopCoder Data Load Tool Assembly.
 * </p>
 *
 * <p>
 * Version 1.1 (BUGR-4729) change notes:
 * <ol>
 *   <li>Updated {@link #doLoadMonthlyContestStats()} and {@link #doLoadWeeklyContestStats()} methods to delete the rubbish
 *   records firstly and then insert new records.</li>
 * </ol>
 * </p>
 *
 * @author moonli, flexme
 * @version 1.1
 */
public class AggregationDataLoader extends TCLoad {
    /**
     * Represents the logger to do logging.
     */
    private static final Logger LOGGER = Logger.getLogger(AggregationDataLoader.class);

    /**
     * The constructor. Does nothing.
     */
    public AggregationDataLoader() {
    }

    /**
     * This method performs the load for the coder information tables.
     * 
     * @throws Exception
     *             if any error occurs
     */
    public void performLoad() throws Exception {
        LOGGER.info("[Aggregation Data LOAD] Aggregation Data load running");

        long start = System.currentTimeMillis();
        try {
            doLoadWeeklyContestStats();
            doLoadMonthlyContestStats();
            LOGGER.info("Aggregation Data are loaded in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (Exception ex) {
            // have already been logged
            setReasonFailed(ex.getMessage());
            LOGGER.error("Load of aggregation data failed.", ex);
            throw ex;
        }
    }

    /**
     * This method is passed any parameters passed to this load.
     * 
     * @param params
     *            the passed in parameters
     * @return always true
     */
    public boolean setParameters(Hashtable params) {
        LOGGER.info("Set parameters");
        long start = System.currentTimeMillis();
        
        LOGGER.info("Set parameters done in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        return true;
    }

    /**
     * Load the weekly contest statistics data to DW.
     * 
     * @throws Exception
     *             if any error occurs
     */
    public void doLoadWeeklyContestStats() throws Exception {
        LOGGER.info("Load weekly contest statistics data");

        long start = System.currentTimeMillis();
        
        // Statement to select aggregation data with successful contests cnt
        final String AGGRE_SUCC = "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.week_of_year week, b.year, " +
                                "SUM(a.admin_fee)/COUNT(a.project_id) avg_contest_fees, " +
                                "SUM(a.contest_prizes_total)/COUNT(a.project_id) avg_member_fees," +
                                "SUM(a.duration)/COUNT(a.project_id) avg_duration, " +
                                "SUM(a.fulfillment)/COUNT(a.project_id) avg_fulfillment, COUNT(a.status_id) succ_cnt " +
                                "FROM project a, calendar b WHERE a.status_id=7 and a.client_project_id IS NOT NULL " +
                                "AND DAY(a.complete_date)=b.day_of_month AND MONTH(a.complete_date)=b.month_numeric AND YEAR(a.complete_date)=b.year " +
                                "AND a.complete_date is not null AND a.posting_date is not null " +
                                // dont include copilot posting, dont include content creation for now
                                "AND project_category_id not in (29) " +
                                "GROUP BY a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.week_of_year, b.year INTO TEMP tmp_project_aggr_1";
        
        // Statement to select aggregation data with failed contests cnt
        final String AGGRE_FAIL = "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.week_of_year week, b.year, COUNT(a.status_id) fail_cnt " +
                                "FROM project a, calendar b WHERE a.status_id IN (4,5,6,8,11) and a.client_project_id IS NOT NULL " +
                                "AND DAY(a.complete_date)=b.day_of_month AND MONTH(a.complete_date)=b.month_numeric AND YEAR(a.complete_date)=b.year " +
                                "AND a.complete_date is not null AND a.posting_date is not null " +
                                // dont include copilot posting, dont include content creation for now
                                "AND project_category_id not in (29) " +
                                " GROUP BY a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.week_of_year, b.year INTO TEMP tmp_project_aggr_2";
        
        // Statement to merge two parts of aggregation data above
        final String MERGE_SUCC_FAIL = "SELECT CASE WHEN a.client_project_id is NULL THEN b.client_project_id ELSE a.client_project_id END as client_project_id, " +
                                "    CASE WHEN a.tc_direct_project_id is NULL THEN b.tc_direct_project_id ELSE a.tc_direct_project_id END as tc_direct_project_id, " +
                                "    CASE WHEN a.project_category_id is NULL THEN b.project_category_id ELSE a.project_category_id END as project_category_id, " +
                                "    CASE WHEN a.week is NULL THEN b.week ELSE a.week END as week, " +
                                "    CASE WHEN a.year is NULL THEN b.year ELSE a.year END as year, " +
                                "    CASE WHEN a.avg_contest_fees is NULL THEN 0 ELSE a.avg_contest_fees END as avg_contest_fees, " +
                                "    CASE WHEN a.avg_member_fees is NULL THEN 0 ELSE a.avg_member_fees END as avg_member_fees, " +
                                "    CASE WHEN a.avg_duration is NULL THEN 0 ELSE a.avg_duration END as avg_duration, " +
                                "    CASE WHEN a.succ_cnt is NULL THEN 0 WHEN b.fail_cnt is NULL THEN 1 ELSE a.succ_cnt / (a.succ_cnt + b.fail_cnt) END as avg_fulfillment, " +
                                "    CASE WHEN a.succ_cnt is NULL THEN 0 ELSE a.succ_cnt END as succ_cnt, " +
                                "    CASE WHEN b.fail_cnt is NULL THEN 0 ELSE b.fail_cnt END as fail_cnt " +
                                "FROM tmp_project_aggr_1 a full outer join tmp_project_aggr_2 b ON a.client_project_id=b.client_project_id AND a.tc_direct_project_id=b.tc_direct_project_id " +
                                "    AND a.project_category_id=b.project_category_id AND a.week=b.week AND a.year=b.year INTO TEMP tmp_project_aggr_3";
        
        // update tcs_dw:weekly_contest_stats table
        final String UPDATE = "UPDATE weekly_contest_stats SET (avg_contest_fees, avg_member_fees, avg_duration, avg_fulfillment, total_completed_contests, total_failed_contests) = " +
                            "((SELECT a.avg_contest_fees, a.avg_member_fees, a.avg_duration, a.avg_fulfillment, a.succ_cnt, a.fail_cnt " +
                            "  FROM tmp_project_aggr_3 a " +
                            "  WHERE a.client_project_id=weekly_contest_stats.client_project_id AND a.tc_direct_project_id=weekly_contest_stats.tc_direct_project_id " +
                            "     AND a.project_category_id=weekly_contest_stats.project_category_id AND a.week=weekly_contest_stats.week " +
                            "     AND a.year=weekly_contest_stats.year))";
        
        // insert new records to tcs_dw:weekly_contest_stats table
        final String INSERT = "INSERT INTO weekly_contest_stats (client_project_id, tc_direct_project_id, project_category_id, week, month, year, " +
                            "    avg_contest_fees, avg_member_fees, avg_duration, avg_fulfillment, total_completed_contests, total_failed_contests) " +
                            "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, a.week, 0, a.year, " +
                            "    a.avg_contest_fees, a.avg_member_fees, a.avg_duration, a.avg_fulfillment, a.succ_cnt, a.fail_cnt " +
                            "FROM tmp_project_aggr_3 a WHERE NOT EXISTS ( " +
                            "    SELECT * FROM weekly_contest_stats c WHERE c.client_project_id=a.client_project_id AND c.tc_direct_project_id=a.tc_direct_project_id " +
                            "        AND c.project_category_id=a.project_category_id AND c.week=a.week AND c.year=a.year)";
        
        // delete all the rubbish records from tcs_dw:weekly_contest_stats table
        final String DELETE = "DELETE FROM weekly_contest_stats WHERE NOT EXISTS (" +
                            "    SELECT * from tmp_project_aggr_3 a where weekly_contest_stats.client_project_id=a.client_project_id " +
                            "        AND weekly_contest_stats.tc_direct_project_id=a.tc_direct_project_id " +
                            "        AND weekly_contest_stats.project_category_id=a.project_category_id " +
                            "        AND weekly_contest_stats.week=a.week AND weekly_contest_stats.year=a.year)";

        // Statements to drop temp tables
        String[] DROP_TABLES = new String[] {"DROP TABLE tmp_project_aggr_1", "DROP TABLE tmp_project_aggr_2", "DROP TABLE tmp_project_aggr_3"};
        
        PreparedStatement statement = null;
        
        try {
            // Select aggregation data with successful contests count
            statement = prepareStatement(AGGRE_SUCC, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // Select aggregation data with failed contests count
            statement = prepareStatement(AGGRE_FAIL, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // Merge two parts of aggregation data above
            statement = prepareStatement(MERGE_SUCC_FAIL, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // delete rubbish records from tcs_dw:weekly_contest_stats table
            statement = prepareStatement(DELETE, TARGET_DB);
            long count = statement.executeUpdate();
            close(statement);
            
            // Update tcs_dw:weekly_contest_stats table
            statement = prepareStatement(UPDATE, TARGET_DB);
            count += statement.executeUpdate();
            close(statement);
            
            // Insert new records to tcs_dw:weekly_contest_stats table
            statement = prepareStatement(INSERT, TARGET_DB);
            count += statement.executeUpdate();
            close(statement);
            
            // Drop temp tables
            for (int i = 0; i < DROP_TABLES.length; i++) {
                statement = prepareStatement(DROP_TABLES[i], TARGET_DB);
                statement.executeUpdate();
                close(statement);
            }
            
            LOGGER.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            LOGGER.error("Load of weekly contest statistics data failed.", sqle);
            DBMS.printSqlException(true, sqle);
            throw new Exception("weekly contest statistics data failed.\n" + sqle.getMessage());
        } finally {
            close(statement);
        }                    
    }

    /**
     * Load the mnthly contest statistics data to DW.
     * 
     * @throws Exception
     *             if any error occurs
     */
    public void doLoadMonthlyContestStats() throws Exception {
        LOGGER.info("Load monthly contest statistics data");

        long start = System.currentTimeMillis();
        
        // Statement to select aggregation data with successful contests cnt
        final String AGGRE_SUCC = "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.month_numeric month, b.year, " +
                                "SUM(a.admin_fee)/COUNT(a.project_id) avg_contest_fees, " +
                                "SUM(a.contest_prizes_total)/COUNT(a.project_id) avg_member_fees," +
                                "SUM(a.duration)/COUNT(a.project_id) avg_duration, " +
                                "SUM(a.fulfillment)/COUNT(a.project_id) avg_fulfillment, COUNT(a.status_id) succ_cnt " +
                                "FROM project a, calendar b WHERE a.status_id=7 and a.client_project_id IS NOT NULL " +
                                "AND DAY(a.complete_date)=b.day_of_month AND MONTH(a.complete_date)=b.month_numeric AND YEAR(a.complete_date)=b.year " +
                                "AND a.complete_date is not null AND a.posting_date is not null " +
                                // dont include copilot posting, dont include content creation for now
                                "AND project_category_id not in (29) " +
                                "GROUP BY a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.month_numeric, b.year INTO TEMP tmp_project_aggr_1";
        
        // Statement to select aggregation data with failed contests cnt
        final String AGGRE_FAIL = "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.month_numeric month, b.year, COUNT(a.status_id) fail_cnt " +
                                "FROM project a, calendar b WHERE a.status_id IN (4,5,6,8,11) and a.client_project_id IS NOT NULL " +
                                "AND DAY(a.complete_date)=b.day_of_month AND MONTH(a.complete_date)=b.month_numeric AND YEAR(a.complete_date)=b.year " +
                                "AND a.complete_date is not null AND a.posting_date is not null " +
                                // dont include copilot posting, dont include content creation for now
                                "AND project_category_id not in (29) " +
                                " GROUP BY a.client_project_id, a.tc_direct_project_id, a.project_category_id, b.month_numeric, b.year INTO TEMP tmp_project_aggr_2";
        
        // Statement to merge two parts of aggregation data above
        final String MERGE_SUCC_FAIL = "SELECT CASE WHEN a.client_project_id is NULL THEN b.client_project_id ELSE a.client_project_id END as client_project_id, " +
                                "    CASE WHEN a.tc_direct_project_id is NULL THEN b.tc_direct_project_id ELSE a.tc_direct_project_id END as tc_direct_project_id, " +
                                "    CASE WHEN a.project_category_id is NULL THEN b.project_category_id ELSE a.project_category_id END as project_category_id, " +
                                "    CASE WHEN a.month is NULL THEN b.month ELSE a.month END as month, " +
                                "    CASE WHEN a.year is NULL THEN b.year ELSE a.year END as year, " +
                                "    CASE WHEN a.avg_contest_fees is NULL THEN 0 ELSE a.avg_contest_fees END as avg_contest_fees, " +
                                "    CASE WHEN a.avg_member_fees is NULL THEN 0 ELSE a.avg_member_fees END as avg_member_fees, " +
                                "    CASE WHEN a.avg_duration is NULL THEN 0 ELSE a.avg_duration END as avg_duration, " +
                                "    CASE WHEN a.succ_cnt is NULL THEN 0 WHEN b.fail_cnt is NULL THEN 1 ELSE a.succ_cnt / (a.succ_cnt + b.fail_cnt) END as avg_fulfillment, " +
                                "    CASE WHEN a.succ_cnt is NULL THEN 0 ELSE a.succ_cnt END as succ_cnt, " +
                                "    CASE WHEN b.fail_cnt is NULL THEN 0 ELSE b.fail_cnt END as fail_cnt " +
                                "FROM tmp_project_aggr_1 a full outer join tmp_project_aggr_2 b ON a.client_project_id=b.client_project_id AND a.tc_direct_project_id=b.tc_direct_project_id " +
                                "    AND a.project_category_id=b.project_category_id AND a.month=b.month AND a.year=b.year INTO TEMP tmp_project_aggr_3";
        
        // update tcs_dw:monthly_contest_stats table
        final String UPDATE = "UPDATE monthly_contest_stats SET (avg_contest_fees, avg_member_fees, avg_duration, avg_fulfillment, total_completed_contests, total_failed_contests) = " +
                            "((SELECT a.avg_contest_fees, a.avg_member_fees, a.avg_duration, a.avg_fulfillment, a.succ_cnt, a.fail_cnt " +
                            "  FROM tmp_project_aggr_3 a " +
                            "  WHERE a.client_project_id=monthly_contest_stats.client_project_id AND a.tc_direct_project_id=monthly_contest_stats.tc_direct_project_id " +
                            "     AND a.project_category_id=monthly_contest_stats.project_category_id " +
                            "     AND a.month=monthly_contest_stats.month AND a.year=monthly_contest_stats.year))";
        
        // delete all rubbish records from tcs_dw:monthly_contest_stats table
        final String DELETE = "DELETE FROM monthly_contest_stats WHERE NOT EXISTS ( " +
                            "    SELECT * from tmp_project_aggr_3 a where monthly_contest_stats.client_project_id=a.client_project_id " +
                            "        AND monthly_contest_stats.tc_direct_project_id=a.tc_direct_project_id " +
                            "        AND monthly_contest_stats.project_category_id=a.project_category_id " +
                            "        AND monthly_contest_stats.month=a.month AND monthly_contest_stats.year=a.year)";
        
        // insert new records to tcs_dw:monthly_contest_stats table
        final String INSERT = "INSERT INTO monthly_contest_stats (client_project_id, tc_direct_project_id, project_category_id, month, year, " +
                            "    avg_contest_fees, avg_member_fees, avg_duration, avg_fulfillment, total_completed_contests, total_failed_contests) " +
                            "SELECT a.client_project_id, a.tc_direct_project_id, a.project_category_id, a.month, a.year, " +
                            "    a.avg_contest_fees, a.avg_member_fees, a.avg_duration, a.avg_fulfillment, a.succ_cnt, a.fail_cnt " +
                            "FROM tmp_project_aggr_3 a WHERE NOT EXISTS ( " +
                            "    SELECT * FROM monthly_contest_stats c WHERE c.client_project_id=a.client_project_id AND c.tc_direct_project_id=a.tc_direct_project_id " +
                            "        AND c.project_category_id=a.project_category_id AND c.month=a.month AND c.year=a.year)";
        
        // Statements to drop temp tables
        String[] DROP_TABLES = new String[] {"DROP TABLE tmp_project_aggr_1", "DROP TABLE tmp_project_aggr_2", "DROP TABLE tmp_project_aggr_3"};
        
        PreparedStatement statement = null;
        
        try {
            // Select aggregation data with successful contests count
            statement = prepareStatement(AGGRE_SUCC, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // Select aggregation data with failed contests count
            statement = prepareStatement(AGGRE_FAIL, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // Merge two parts of aggregation data above
            statement = prepareStatement(MERGE_SUCC_FAIL, TARGET_DB);
            statement.executeUpdate();
            close(statement);
            
            // delete all rubbish records from tcs_dw:monthly_contest_stats table
            statement = prepareStatement(DELETE, TARGET_DB);
            long count = statement.executeUpdate();
            close(statement);
            
            // Update tcs_dw:monthly_contest_stats table
            statement = prepareStatement(UPDATE, TARGET_DB);
            count += statement.executeUpdate();
            close(statement);
            
            // Insert new records to tcs_dw:monthly_contest_stats table
            statement = prepareStatement(INSERT, TARGET_DB);
            count += statement.executeUpdate();
            close(statement);
            
            // Drop temp tables
            for (int i = 0; i < DROP_TABLES.length; i++) {
                statement = prepareStatement(DROP_TABLES[i], TARGET_DB);
                statement.executeUpdate();
                close(statement);
            }
            
            LOGGER.info("loaded " + count + " records in " + (System.currentTimeMillis() - start) / 1000 + " seconds");
        } catch (SQLException sqle) {
            LOGGER.error("Load of monthly contest statistics data failed.", sqle);
            DBMS.printSqlException(true, sqle);
            throw new Exception("monthly contest statistics data failed.\n" + sqle.getMessage());
        } finally {
            close(statement);
        }                    
    }
}
