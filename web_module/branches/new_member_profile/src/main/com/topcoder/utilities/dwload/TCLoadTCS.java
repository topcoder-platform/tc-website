package com.topcoder.utilities.dwload;

/**
 * TCLoadTCS.java
 *
 * @author rfairfax
 * @version $Revision$
 */

import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class TCLoadTCS extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadTCS.class);

    public TCLoadTCS() {
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
    public void performLoad() throws Exception {
        try {

            PreparedStatement ps = prepareStatement("set lock mode to wait 5", SOURCE_DB);
            ps.execute();
            ps.close();

            doLoadEvents();

            doLoadContests();

            String sSQL = "select distinct project_id from project";

            ps = prepareStatement(sSQL, SOURCE_DB);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                doLoadProject(rs.getLong("project_id"));
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            sSQL = "select distinct project_id from project_result";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                doLoadProjectResults(rs.getLong("project_id"));
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            doLoadUserRating();

            doLoadUserReliability();

            doLoadRoyalty();
  
            doLoadRank(112);
            doLoadRank(113);

            //fix problems with submission date
            sSQL = "update project_result " +
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

            ps = prepareStatement(sSQL, TARGET_DB);
            ps.execute();
            ps.close();
            ps = null;

            doClearCache();

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
        CacheClient cc = CacheClientFactory.createCacheClient();

        String tempKey = null;

        String[] keys = new String[]{"tccc05_", "usdc_", "component_history", "tcs_ratings_history", "member_profile", "public_home_data", "top_designers", "top_developers", "tco04", "coder_all_ratings"};

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
    }

    public void doLoadRoyalty() throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;
        try {
            String sSQL = "select * from royalty";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                log.info("PROCESSING USER " + rs.getInt("user_id"));

                //update record, if 0 rows affected, insert record
                sSQL = "update royalty set amount = ?, description = ?, royalty_date = ? " +
                        " where user_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("amount"));
                ps2.setObject(2, rs.getObject("description"));
                ps2.setObject(3, rs.getObject("royalty_date"));
                ps2.setLong(4, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into royalty (user_id, amount, description, royalty_date) " +
                            "values (?, ?, ?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("amount"));
                    ps2.setObject(3, rs.getObject("description"));
                    ps2.setObject(4, rs.getObject("royalty_date"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'royalty' table failed.\n" +
                    sqle.getMessage());
        }
    }

    public void doLoadUserReliability() throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;

        try {
            String sSQL = "select * from user_reliability";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                log.info("PROCESSING USER " + rs.getInt("user_id"));

                //update record, if 0 rows affected, insert record
                sSQL = "update user_reliability set rating = ?, modify_date = CURRENT " +
                        " where user_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("rating"));
                ps2.setLong(2, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into user_reliability (user_id, rating, modify_date, create_date) " +
                            "values (?, ?, CURRENT, CURRENT) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("rating"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_reliability' table failed.\n" +
                    sqle.getMessage());
        }
    }

    public void doLoadUserRating() throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;
        try {
            String sSQL = "select * from user_rating";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                log.info("PROCESSING USER " + rs.getInt("user_id"));

                //update record, if 0 rows affected, insert record
                sSQL = "update user_rating set rating = ?,  vol = ?, rating_no_vol = ?, num_ratings = ?, last_rated_project_id = ?, mod_date_time = CURRENT " +
                        " where user_id = ? and phase_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("rating"));
                ps2.setObject(2, rs.getObject("vol"));
                ps2.setObject(3, rs.getObject("rating_no_vol"));
                ps2.setObject(4, rs.getObject("num_ratings"));
                //ps2.setObject(6, rs.getObject("last_component_rated"));
                ps2.setObject(5, rs.getObject("last_rated_project_id"));
                ps2.setLong(6, rs.getLong("user_id"));
                ps2.setObject(7, rs.getObject("phase_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into user_rating (user_id, rating, phase_id, vol, rating_no_vol, num_ratings, last_rated_project_id, mod_date_time, create_date_time) " +
                            "values (?, ?, ?, ?, ?, ?, ?, CURRENT, CURRENT) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("rating"));
                    ps2.setObject(3, rs.getObject("phase_id"));
                    ps2.setObject(4, rs.getObject("vol"));
                    ps2.setObject(5, rs.getObject("rating_no_vol"));
                    ps2.setObject(6, rs.getObject("num_ratings"));
                    ps2.setObject(7, rs.getObject("last_rated_project_id"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_rating' table failed.\n" +
                    sqle.getMessage());
        }
    }

    public void doLoadProject(long project_id) throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;

        try {
            log.info("PROCESSING PROJECT " + project_id);

            //get data from source DB
            String sSQL = "select p.project_id, cc.component_id, cc.component_name, " +
                    "(select count(*) from component_inquiry where project_id = p.project_id) as num_registrations, " +
                    "(select count(*) from submission where cur_version = 1 and project_id = p.project_id and submission_type = 1 and is_removed = 0) as num_submissions, " +
                    "(select count(*) from project_result where project_id = p.project_id and valid_submission_ind = 1) as num_valid_submissions, " +
                    "(select avg(case when raw_score is null then 0 else raw_score end) from project_result where project_id = p.project_id and raw_score is not null) as avg_raw_score, " +
                    "(select avg(case when final_score is null then 0 else final_score end) from project_result where project_id = p.project_id and final_score is not null) as avg_final_score, " +
                    "case when p.project_type_id = 1 then 112 else 113 end as phase_id, " +
                    "(select description from phase where phase_id = (case when p.project_type_id = 1 then 112 else 113 end)) as phase_desc, " +
                    "cc.root_category_id as category_id, " +
                    "(select category_name from categories where category_id = case when cc.root_category_id in (5801776,5801778) then 5801776 when cc.root_category_id in (5801777,5801779) then 5801777 else cc.root_category_id end) as category_desc, " +
                    "(select start_date from phase_instance where phase_id = 1 and cur_version = 1 and project_id = p.project_id) as posting_date, " +
                    "(select end_date from phase_instance where phase_id = 1 and cur_version = 1 and project_id = p.project_id) as submitby_date, " +
                    "(select max(level_id) from comp_version_dates where comp_vers_id = p.comp_vers_id and phase_id = p.project_type_id + 111) as level_id, " +
                    "p.complete_date, " +
                    "rp.review_phase_id, " +
                    "rp.review_phase_name," +
                    "ps.project_stat_id," +
                    "ps.project_stat_name, " +
                    "case when cc.root_category_id in (5801778,5801779) then 1 else 0 end as custom_ind " +
                    "from project p, " +
                    "comp_versions cv, " +
                    "comp_catalog cc," +
                    "phase_instance pi, " +
                    "review_phase rp," +
                    "project_status ps " +
                    "where p.project_id = ? " +
                    "and p.cur_version = 1  " +
                    "and cv.comp_vers_id = p.comp_vers_id " +
                    "and cc.component_id = cv.component_id " +
                    "and pi.cur_version = 1 " +
                    "and pi.phase_instance_id = p.phase_instance_id " +
                    "and rp.review_phase_id = pi.phase_id " +
                    "and ps.project_stat_id = p.project_stat_id";

            ps = prepareStatement(sSQL, SOURCE_DB);
            ps.setLong(1, project_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                //update record, if 0 rows affected, insert record
                sSQL = "update project set component_name = ?,  num_registrations = ?, num_submissions = ?, num_valid_submissions = ?, avg_raw_score = ?, avg_final_score = ?, phase_id = ?, " +
                        "phase_desc = ?, category_id = ?, category_desc = ?, posting_date = ?, submitby_date = ?, complete_date = ?, component_id = ?, review_phase_id = ?, review_phase_name = ?, status_id = ?, status_desc = ?, level_id = ?, custom_ind = ? where project_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setString(1, rs.getString("component_name"));
                ps2.setInt(2, rs.getInt("num_registrations"));
                ps2.setInt(3, rs.getInt("num_submissions"));
                ps2.setInt(4, rs.getInt("num_valid_submissions"));
                ps2.setDouble(5, rs.getDouble("avg_raw_score"));
                ps2.setDouble(6, rs.getDouble("avg_final_score"));
                ps2.setInt(7, rs.getInt("phase_id"));
                ps2.setString(8, rs.getString("phase_desc"));
                ps2.setInt(9, rs.getInt("category_id"));
                ps2.setString(10, rs.getString("category_desc"));
                ps2.setDate(11, rs.getDate("posting_date"));
                ps2.setDate(12, rs.getDate("submitby_date"));
                ps2.setDate(13, rs.getDate("complete_date"));
                ps2.setLong(14, rs.getLong("component_id"));
                ps2.setLong(15, rs.getLong("review_phase_id"));
                ps2.setString(16, rs.getString("review_phase_name"));
                ps2.setLong(17, rs.getLong("project_stat_id"));
                ps2.setString(18, rs.getString("project_stat_name"));
                ps2.setLong(19, rs.getLong("level_id"));
                ps2.setInt(20, rs.getInt("custom_ind"));
                ps2.setLong(21, rs.getLong("project_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into project (project_id, component_name, num_registrations, num_submissions, num_valid_submissions, avg_raw_score, avg_final_score, phase_id, phase_desc, " +
                            "category_id, category_desc, posting_date, submitby_date, complete_date, component_id, review_phase_id, review_phase_name, status_id, status_desc, level_id, custom_ind) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("project_id"));
                    ps2.setString(2, rs.getString("component_name"));
                    ps2.setInt(3, rs.getInt("num_registrations"));
                    ps2.setInt(4, rs.getInt("num_submissions"));
                    ps2.setInt(5, rs.getInt("num_valid_submissions"));
                    ps2.setDouble(6, rs.getDouble("avg_raw_score"));
                    ps2.setDouble(7, rs.getDouble("avg_final_score"));
                    ps2.setInt(8, rs.getInt("phase_id"));
                    ps2.setString(9, rs.getString("phase_desc"));
                    ps2.setInt(10, rs.getInt("category_id"));
                    ps2.setString(11, rs.getString("category_desc"));
                    ps2.setDate(12, rs.getDate("posting_date"));
                    ps2.setDate(13, rs.getDate("submitby_date"));
                    ps2.setDate(14, rs.getDate("complete_date"));
                    ps2.setLong(15, rs.getLong("component_id"));
                    ps2.setLong(16, rs.getLong("review_phase_id"));
                    ps2.setString(17, rs.getString("review_phase_name"));
                    ps2.setLong(18, rs.getLong("project_stat_id"));
                    ps2.setString(19, rs.getString("project_stat_name"));
                    ps2.setLong(20, rs.getLong("level_id"));
                    ps2.setInt(21, rs.getInt("custom_ind"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        }
    }

    public void doLoadProjectResults(long project_id) throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;

        try {
            log.info("PROCESSING PROJECT RESULTS " + project_id);

            //get data from source DB
            String sSQL = "";

            /*sSQL = "delete from project_result where project_id = ?";

            ps = prepareStatement(sSQL, TARGET_DB);
            ps.setLong(1, project_id);

            ps.execute();

            ps.close();
            ps = null; */

            //insert project_result records for this project
            sSQL = "select pr.project_id, pr.user_id, " +
                    "case when exists(select * from submission s where s.cur_version = 1 and s.project_id = pr.project_id " +
                    "and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) then 1 " +
                    "else 0 end as submit_ind, " +
                    "pr.valid_submission_ind, " +
                    "pr.raw_score, " +
                    "pr.final_score, " +
                    "case when exists (select create_time from component_inquiry where project_id = p.project_id and user_id = pr.user_id) then " +
                    "(select min(create_time) from component_inquiry where project_id = p.project_id and user_id = pr.user_id) else " +
                    "(select min(create_time) from component_inquiry where component_id = cc.component_id and user_id = pr.user_id) end as inquire_timestamp, " +
                    "(select submission_date from submission s where s.cur_version = 1 and s.project_id = pr.project_id and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) as submit_timestamp, " +
                    "(select max(pm_review_timestamp) from scorecard where scorecard_type = 2 and is_completed = 1 and submission_id = " +
                    "	(select submission_id from submission s where s.cur_version = 1 and s.project_id = pr.project_id and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) " +
                    " and project_id = pr.project_id and cur_version = 1) as review_completed_timestamp, " +
                    "pr.payment, pr.old_rating, pr.new_rating, " +
                    "pr.old_reliability, pr.new_reliability, pr.placed, pr.rating_ind, pr.reliability_ind " +
                    "from project_result pr, " +
                    "project p, " +
                    "comp_versions cv, " +
                    "comp_catalog cc " +
                    "where pr.project_id = ? " +
                    "and p.project_id = pr.project_id " +
                    "and p.cur_version = 1  " +
                    "and cv.comp_vers_id = p.comp_vers_id " +
                    "and cc.component_id = cv.component_id";
//                    "and p.project_stat_id in (2,  4, 5, 6) " +

            ps = prepareStatement(sSQL, SOURCE_DB);
            ps.setLong(1, project_id);

            rs = ps.executeQuery();

            while (rs.next()) {

                sSQL = "update project_result set submit_ind = ?, valid_submission_ind = ?, raw_score = ?, final_score = ?, inquire_timestamp = ?, " +
                        "submit_timestamp = ?, review_complete_timestamp = ?, payment = ?, old_rating = ?, new_rating = ?, old_reliability = ?, new_reliability = ?, " +
                        "placed = ?, rating_ind = ?, reliability_ind = ? where project_id = ? and user_id = ?";

                ps2 = prepareStatement(sSQL, TARGET_DB);

                ps2.setObject(1, rs.getObject("submit_ind"));
                ps2.setObject(2, rs.getObject("valid_submission_ind"));
                ps2.setObject(3, rs.getObject("raw_score"));
                ps2.setObject(4, rs.getObject("final_score"));
                ps2.setObject(5, rs.getObject("inquire_timestamp"));
                ps2.setObject(6, rs.getObject("submit_timestamp"));
                ps2.setObject(7, rs.getObject("review_completed_timestamp"));
                ps2.setObject(8, rs.getObject("payment"));
                ps2.setObject(9, rs.getObject("old_rating"));
                ps2.setObject(10, rs.getObject("new_rating"));
                ps2.setObject(11, rs.getObject("old_reliability"));
                ps2.setObject(12, rs.getObject("new_reliability"));
                ps2.setObject(13, rs.getObject("placed"));
                ps2.setObject(14, rs.getObject("rating_ind"));
                ps2.setObject(15, rs.getObject("reliability_ind"));
                ps2.setLong(16, project_id);
                ps2.setLong(17, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    sSQL = "insert into project_result (project_id, user_id, submit_ind, valid_submission_ind, raw_score, final_score, inquire_timestamp," +
                            " submit_timestamp, review_complete_timestamp, payment, old_rating, new_rating, old_reliability, new_reliability, placed, rating_ind, " +
                            "reliability_ind ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    ps2 = prepareStatement(sSQL, TARGET_DB);

                    ps2.setLong(1, project_id);
                    ps2.setLong(2, rs.getLong("user_id"));
                    ps2.setObject(3, rs.getObject("submit_ind"));
                    ps2.setObject(4, rs.getObject("valid_submission_ind"));
                    ps2.setObject(5, rs.getObject("raw_score"));
                    ps2.setObject(6, rs.getObject("final_score"));
                    ps2.setObject(7, rs.getObject("inquire_timestamp"));
                    ps2.setObject(8, rs.getObject("submit_timestamp"));
                    ps2.setObject(9, rs.getObject("review_completed_timestamp"));
                    ps2.setObject(10, rs.getObject("payment"));
                    ps2.setObject(11, rs.getObject("old_rating"));
                    ps2.setObject(12, rs.getObject("new_rating"));
                    ps2.setObject(13, rs.getObject("old_reliability"));
                    ps2.setObject(14, rs.getObject("new_reliability"));
                    ps2.setObject(15, rs.getObject("placed"));
                    ps2.setObject(16, rs.getObject("rating_ind"));
                    ps2.setObject(17, rs.getObject("reliability_ind"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;

                }
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //load submission_review
            /*sSQL = "delete from submission_review where project_id = ?";

            ps = prepareStatement(sSQL, TARGET_DB);
            ps.setLong(1, project_id);

            ps.execute();

            ps.close();
            ps = null;*/

            //insert project_result records for this project
            sSQL = "select sc.project_id, " +
                    "(select submitter_id from submission where submission_type = 1 and is_removed = 0 and cur_version = 1 and submission_id = sc.submission_id) as user_id, " +
                    "author_id as reviewer_id, " +
                    "sc.raw_score as raw_score, " +
                    "score as final_score, " +
                    "(select count(distinct appeal_id) from appeal where appealer_id = (select submitter_id from submission where submission_type = 1 and is_removed = 0 and cur_version = 1 and submission_id = sc.submission_id) and cur_version = 1 " +
                    "and question_id in (select question_id from scorecard_question where scorecard_id = sc.scorecard_id)) as num_appeals, " +
                    "0 as num_successful_appeals " +
                    "from scorecard sc " +
                    "where sc.project_id = ? " +
                    "and sc.scorecard_type = 2 " +
                    "and sc.cur_version = 1;";

            ps = prepareStatement(sSQL, SOURCE_DB);
            ps.setLong(1, project_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                sSQL = "update submission_review set raw_score = ?, final_score = ?, num_appeals = ?, num_successful_appeals = ? " +
                        "where project_id = ? and user_id = ? and reviewer_id = ?";

                ps2 = prepareStatement(sSQL, TARGET_DB);

                ps2.setObject(1, rs.getObject("raw_score"));
                ps2.setObject(2, rs.getObject("final_score"));
                ps2.setObject(3, rs.getObject("num_appeals"));
                ps2.setObject(4, rs.getObject("num_successful_appeals"));
                ps2.setLong(5, project_id);
                ps2.setLong(6, rs.getLong("user_id"));
                ps2.setLong(7, rs.getLong("reviewer_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    sSQL = "insert into submission_review (project_id, user_id, reviewer_id, raw_score, final_score, num_appeals," +
                            "num_successful_appeals ) values (?, ?, ?, ?, ?, ?, ?)";

                    ps2 = prepareStatement(sSQL, TARGET_DB);

                    ps2.setLong(1, project_id);
                    ps2.setLong(2, rs.getLong("user_id"));
                    ps2.setLong(3, rs.getLong("reviewer_id"));
                    ps2.setObject(4, rs.getObject("raw_score"));
                    ps2.setObject(5, rs.getObject("final_score"));
                    ps2.setObject(6, rs.getObject("num_appeals"));
                    ps2.setObject(7, rs.getObject("num_successful_appeals"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //load contest_project_xref
            sSQL = "delete from contest_project_xref where project_id = ?";

            ps = prepareStatement(sSQL, TARGET_DB);
            ps.setLong(1, project_id);

            ps.execute();

            ps.close();
            ps = null;

            //insert project_result records for this project
            sSQL = "select *  " +
                    "from contest_project_xref " +
                    "where project_id = ?";

            ps = prepareStatement(sSQL, SOURCE_DB);
            ps.setLong(1, project_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                sSQL = "insert into contest_project_xref (contest_id, project_id) " +
                        "values (?, ?)";

                ps2 = prepareStatement(sSQL, TARGET_DB);

                ps2.setLong(1, rs.getLong("contest_id"));
                ps2.setLong(2, project_id);

                ps2.execute();

                ps2.close();
                ps2 = null;
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'project_result / project' table failed.\n" +
                    sqle.getMessage());
        }
    }

    public void doLoadContests() throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;

        try {

            String sSQL = "select c.contest_id, c.contest_name, " +
                    "c.start_date as contest_start_timestamp, " +
                    "c.end_date as contest_end_timestamp, " +
                    "c.contest_type_id, " +
                    "ct.contest_type_desc," +
                    "c.phase_id," +
                    "c.event_id  " +
                    "from contest c, " +
                    "contest_type_lu ct " +
                    "where ct.contest_type_id = c.contest_type_id";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                log.info("PROCESSING CONTEST " + rs.getInt("contest_id"));

                //update record, if 0 rows affected, insert record
                sSQL = "update contest set contest_name = ?,  contest_start_timestamp = ?, contest_end_timestamp = ?, contest_type_id = ?, contest_type_desc = ?, phase_id = ?, event_id = ? " +
                        " where contest_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("contest_name"));
                ps2.setObject(2, rs.getObject("contest_start_timestamp"));
                ps2.setObject(3, rs.getObject("contest_end_timestamp"));
                ps2.setObject(4, rs.getObject("contest_type_id"));
                ps2.setObject(5, rs.getObject("contest_type_desc"));
                ps2.setObject(6, rs.getObject("phase_id"));
                ps2.setObject(7, rs.getObject("event_id"));
                ps2.setLong(8, rs.getLong("contest_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into contest (contest_id, contest_name, contest_start_timestamp, contest_end_timestamp, contest_type_id, contest_type_desc, phase_id, event_id) " +
                            "values (?, ?, ?, ?, ?, ?, ?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("contest_id"));
                    ps2.setObject(2, rs.getObject("contest_name"));
                    ps2.setObject(3, rs.getObject("contest_start_timestamp"));
                    ps2.setObject(4, rs.getObject("contest_end_timestamp"));
                    ps2.setObject(5, rs.getObject("contest_type_id"));
                    ps2.setObject(6, rs.getObject("contest_type_desc"));
                    ps2.setObject(7, rs.getObject("phase_id"));
                    ps2.setObject(8, rs.getObject("event_id"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //load prizes
            sSQL = "select ucp.user_id, " +
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
                    "and pt.prize_type_id = cp.prize_type_id;";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                //update record, if 0 rows affected, insert record
                sSQL = "update user_contest_prize set prize_type_id = ?,  prize_description = ?, place = ?, prize_amount = ?, prize_payment = ? " +
                        " where contest_id = ? and user_id = ?";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("prize_type_id"));
                ps2.setObject(2, rs.getObject("prize_description"));
                ps2.setObject(3, rs.getObject("place"));
                ps2.setObject(4, rs.getObject("prize_amount"));
                ps2.setObject(5, rs.getObject("prize_payment"));
                ps2.setLong(6, rs.getLong("contest_id"));
                ps2.setLong(7, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into user_contest_prize (contest_id, user_id, prize_type_id, prize_description, place, prize_amount, prize_payment) " +
                            "values (?, ?, ?, ?, ?, ?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("contest_id"));
                    ps2.setLong(2, rs.getLong("user_id"));
                    ps2.setObject(3, rs.getObject("prize_type_id"));
                    ps2.setObject(4, rs.getObject("prize_description"));
                    ps2.setObject(5, rs.getObject("place"));
                    ps2.setObject(6, rs.getObject("prize_amount"));
                    ps2.setObject(7, rs.getObject("prize_payment"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'contests' table failed.\n" +
                    sqle.getMessage());
        }
    }


    public void doLoadEvents() throws Exception {
        PreparedStatement ps, ps2;
        ResultSet rs;

        try {

            String sSQL = "select * " +
                    "from event e ";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                log.info("PROCESSING EVENT " + rs.getInt("event_id"));

                //update record, if 0 rows affected, insert record
                sSQL = "update event set event_name = ? " +
                        " where event_id = ? ";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("event_name"));
                ps2.setLong(2, rs.getLong("event_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into event (event_id, event_name) " +
                            "values (?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("event_id"));
                    ps2.setObject(2, rs.getObject("event_name"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //load users
            sSQL = "select * " +
                    "from user_event_xref ";

            ps = prepareStatement(sSQL, SOURCE_DB);
            rs = ps.executeQuery();

            while (rs.next()) {
                //update record, if 0 rows affected, insert record
                sSQL = "update user_event_xref set create_date = ? " +
                        " where event_id = ? and user_id = ?";

                ps2 = prepareStatement(sSQL, TARGET_DB);
                ps2.setObject(1, rs.getObject("create_date"));
                ps2.setLong(2, rs.getLong("event_id"));
                ps2.setLong(3, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if (retVal == 0) {
                    //need to insert
                    sSQL = "insert into user_event_xref (event_id, user_id, create_date) " +
                            "values (?, ?, ?) ";

                    ps2 = prepareStatement(sSQL, TARGET_DB);
                    ps2.setLong(1, rs.getLong("event_id"));
                    ps2.setLong(2, rs.getLong("user_id"));
                    ps2.setObject(3, rs.getObject("create_date"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'events' table failed.\n" +
                    sqle.getMessage());
        }
    }
    
    /**
     * Get a sorted list (by rating desc) of all the active coders
     * and their ratings.
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List getCurrentRatings(int phaseId) throws Exception {
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);
            query.append(" SELECT r.user_id");
            query.append(" ,r.rating");
            query.append(" FROM user_rating r ");
            if (phaseId == 112)
                query.append(" ,  active_designers a");
            else
                query.append(" ,  active_developers a");
            query.append(" WHERE ");
            query.append(" r.rating > 0");
            query.append(" AND a.user_id = r.user_id");
            query.append(" AND r.phase_id = ");
            query.append(phaseId);
            query.append(" ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), TARGET_DB);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new CoderRating(rs.getInt("user_id"), rs.getInt("rating")));
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_rating' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }
    
    private class CoderRating implements Comparable {
        private int _coderId = 0;
        private int _rating = 0;

        CoderRating(int coderId, int rating) {
            _coderId = coderId;
            _rating = rating;
        }

        public int compareTo(Object other) {
            if (((CoderRating) other).getRating() > _rating)
                return 1;
            else if (((CoderRating) other).getRating() < _rating)
                return -1;
            else
                return 0;
        }

        int getCoderId() {
            return _coderId;
        }

        int getRating() {
            return _rating;
        }

        void setCoderId(int coderId) {
            _coderId = coderId;
        }

        void setRating(int rating) {
            _rating = rating;
        }

        public String toString() {
            return new String(_coderId + ":" + _rating);
        }
    }

    private void doLoadRank(int phaseId) throws Exception {
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM user_rank");
            query.append(" WHERE phase_id = " + phaseId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO user_rank (user_id, percentile, rank, phase_id)");
            query.append(" VALUES (?, ?, ?, " + phaseId + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            /* coder_rank table should be kept "up-to-date" so get the most recent stuff
             * from the rating table
             */
            ratings = getCurrentRatings(phaseId);
            coderCount = ratings.size();

            // delete all the records for the overall rating rank type
            psDel.executeUpdate();

            int i = 0;
            int rating = 0;
            int rank = 0;
            int size = ratings.size();
            int tempRating = 0;
            int tempCoderId = 0;
            for (int j = 0; j < size; j++) {
                i++;
                tempRating = ((CoderRating) ratings.get(j)).getRating();
                tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setInt(1, tempCoderId);
                psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                psIns.setInt(3, rank);
                count += psIns.executeUpdate();
            }
            log.info("Records loaded for overall rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'user_rank' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }

}
