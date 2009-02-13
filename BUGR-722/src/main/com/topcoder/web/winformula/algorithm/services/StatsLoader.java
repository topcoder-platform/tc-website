/*
 * StatsLoader
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: StatsLoader.java 72639 2008-08-29 14:18:38Z pwolfus $
 */
public class StatsLoader {
    private static final Logger log = Logger.getLogger(StatsLoader.class);
    
    public static void main(String[] args) {
        if (args.length > 2 || args.length == 0) {
            System.out.println("Usage: weekId [coderId]");
            return;
        }
        int weekId = Integer.parseInt(args[0]);
        int coderId = -1;
        if (args.length > 1) {
            coderId = Integer.parseInt(args[1]);
        }
        new StatsLoader().process(weekId, coderId);
        
    }
    
    private void process(int weekId, int coderId) {
        log.info("Loading stats:");
        loadWeekStats(weekId, coderId);
        loadMiniSeasonStats(weekId, coderId);
        if (weekId >= 71) {
            loadOverallStats(weekId, coderId);
        } else {
            log.info("Skipping overall stats load: this weeks corresponds to pre-season (mini-season 1)");
        }
    }

    private void loadWeekStats(int weekId, int coderId) {
        Connection cnn = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);

            String DELETE = " delete from user_week_stats " + 
                            " where week_id = ? ";
            
            String INSERT = "insert into user_week_stats " +
                " select p.week_id, p.coder_id, 0 as rank, 0 as rank_diff, " +
                " sum(nvl(pds.prediction_detail_points,0)) as points, " + 
                " avg(pds.prediction_detail_total_score_variance) as avg_total_score_variance, " +
                " avg(pds.prediction_detail_victory_margin_variance) as avg_victory_margin_variance, " +
                " sum(case when pds.prediction_detail_picked_winner then 1 else 0 end) / count(*) * 100 as avg_picked_winner " +
                " from prediction p, prediction_detail pd, prediction_detail_score pds " +
                " where p.prediction_id = pd.prediction_id " +
                " and pd.prediction_detail_id = pds.prediction_detail_id " +
                " and p.week_id = ? ";
            
            if (coderId > 0) {
                INSERT += " and coder_id = ? ";
                DELETE += " and coder_id = ? ";
            }

            INSERT += " group by p.week_id, p.coder_id";

            delete = cnn.prepareStatement(DELETE);
            delete.setInt(1, weekId);
            if (coderId > 0) {
                delete.setInt(2, coderId); 
            }
            delete.executeUpdate();

            insert = cnn.prepareStatement(INSERT);
            insert.setInt(1, weekId);
            if (coderId > 0) {
                insert.setInt(2, coderId); 
            }
            int retVal = insert.executeUpdate();

            log.info("Week stats: " + retVal + " rows inserted");
            
            rank(cnn, "user_week_stats", weekId, "week");
            
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(delete);
            DBMS.close(insert);
            DBUtils.endDBBlock();
        }
    }
    

    private void loadMiniSeasonStats(int weekId, int coderId) {
        Connection cnn = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);
            String DELETE = " delete from user_mini_season_stats " + 
                            " where mini_season_id = (select w2.mini_season_id from week w2 where w2.week_id = ?)";
            
            String INSERT = " insert into user_mini_season_stats " +
            "     select ms.mini_season_id, p.coder_id, 0 as rank, 0 as rank_diff, " +
            "     sum(nvl(pds.prediction_detail_points,0)) as points, " + 
            "            avg(pds.prediction_detail_total_score_variance) as avg_total_score_variance, " +
            "            avg(pds.prediction_detail_victory_margin_variance) as avg_victory_margin_variance, " +
            "            sum(case when pds.prediction_detail_picked_winner then 1 else 0 end) / count(*) * 100 as avg_picked_winner " +
            "     from prediction p, prediction_detail pd, prediction_detail_score pds, week w, mini_season ms " +
            "     where p.prediction_id = pd.prediction_id " +
            "     and pd.prediction_detail_id = pds.prediction_detail_id " +
            "     and w.week_id = p.week_id " +
            "     and ms.mini_season_id = w.mini_season_id " +
            "     and ms.mini_season_id = (select w2.mini_season_id from week w2 where w2.week_id = ?) ";
            
            if (coderId > 0) {
                INSERT += " and coder_id = ? ";
                DELETE += " and coder_id = ? ";
            }

            INSERT += " group by ms.mini_season_id, p.coder_id ";

            delete = cnn.prepareStatement(DELETE);
            delete.setInt(1, weekId);
            if (coderId > 0) {
                delete.setInt(2, coderId); 
            }
            delete.executeUpdate();

            insert = cnn.prepareStatement(INSERT);
            insert.setInt(1, weekId);
            if (coderId > 0) {
                insert.setInt(2, coderId); 
            }
            int retVal = insert.executeUpdate();

            log.info("Mini Season stats: " + retVal + " rows inserted");

            rank(cnn, "user_mini_season_stats", weekId, "mini_season");
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(delete);
            DBMS.close(insert);
            DBUtils.endDBBlock();
        }
    }

    private void loadOverallStats(int weekId, int coderId) {
        Connection cnn = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);
            String DELETE = " delete from user_overall_stats " + 
                            " where week_id = ? ";
            
            String INSERT = " insert into user_overall_stats " +
                   " select " + weekId + " as week_id, p.coder_id, 0 as rank, 0 as rank_diff, sum(nvl(pds.prediction_detail_points,0)) as points, " + 
                   "        avg(pds.prediction_detail_total_score_variance) as avg_total_score_variance, " +
                   "        avg(pds.prediction_detail_victory_margin_variance) as avg_victory_margin_variance, " +
                   "        sum(case when pds.prediction_detail_picked_winner then 1 else 0 end) / count(*) * 100 as avg_picked_winner " +
                   " from prediction p, prediction_detail pd, prediction_detail_score pds " +
                   " where p.prediction_id = pd.prediction_id " +
                   " and pd.prediction_detail_id = pds.prediction_detail_id " +
                   " and p.week_id >= 71" +
                   " and p.week_id <= ?";
            
            if (coderId > 0) {
                INSERT += " and coder_id = ? ";
                DELETE += " and coder_id = ? ";
            }

            INSERT += " group by p.coder_id ";

            delete = cnn.prepareStatement(DELETE);
            delete.setInt(1, weekId); 
            if (coderId > 0) {
                delete.setInt(2, coderId); 
            }
            delete.executeUpdate();

            insert = cnn.prepareStatement(INSERT);
            insert.setInt(1, weekId); 
            if (coderId > 0) {
                insert.setInt(2, coderId); 
            }
            int retVal = insert.executeUpdate();

            log.info("Overall stats: " + retVal + " rows inserted");

            rank(cnn, "user_overall_stats", weekId, "overall");
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(delete);
            DBMS.close(insert);
            DBUtils.endDBBlock();
        }
    }

    private void rank(Connection cnn, String tableName, Integer weekId, String scope) throws Exception {
        String cmd = " select * from " + tableName;
        String cmdRankDiff = null;

        if (scope.equals("week")) {
            cmd += " where week_id = ?";
            cmdRankDiff = "select rank from " + tableName + 
            " where week_id = ? and coder_id = ?";
        } else if (scope.equals("mini_season")) {
            cmd += " where mini_season_id = (select w2.mini_season_id from week w2 where w2.week_id = ?) ";
            cmdRankDiff = "select rank from " + tableName + 
            " where mini_season_id = ? and coder_id = ?";
        } else if (scope.equals("overall")) {
            cmd += " where week_id = ?";
            cmdRankDiff = "select rank from " + tableName + 
            " where week_id = ? and coder_id = ?";
        }
        
        cmd += " order by points desc ";

        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement psRankDiff = null;
        ResultSet rsRankDiff = null;

        try {
            ps = cnn.prepareStatement(cmd, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            if (!scope.equals("overall") || weekId != 71) {
                psRankDiff = cnn.prepareStatement(cmdRankDiff, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY, ResultSet.HOLD_CURSORS_OVER_COMMIT);
            }
 
            ps.setInt(1, weekId); 
            rs = ps.executeQuery();
            int rank = 0;
            int i = 1;
            int oldPoints = -1;
            if (scope.equals("overall")) {
                scope = "week"; // the historic rank is by week
            }
            while (rs.next()) {
                if (oldPoints != rs.getInt("points")) {
                    rank = i;
                }
                rs.updateInt("rank", rank);
                if (psRankDiff != null) {
                    psRankDiff.clearParameters();
                    psRankDiff.setInt(1, rs.getInt(scope + "_id") - 1); 
                    psRankDiff.setInt(2, rs.getInt("coder_id")); 
                    rsRankDiff = psRankDiff.executeQuery();
                    if (rsRankDiff.next()) {
                        rs.updateInt("rank_diff", rank - rsRankDiff.getInt("rank"));
                    }
                    DBMS.close(rsRankDiff);
                }
                rs.updateRow();

                oldPoints = rs.getInt("points");
                i++;
            }
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }        
    }

}
