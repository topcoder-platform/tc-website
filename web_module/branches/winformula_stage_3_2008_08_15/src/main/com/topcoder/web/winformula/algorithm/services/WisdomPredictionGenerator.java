/*
 * PredictionLoader
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.winformula.Constants;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class WisdomPredictionGenerator {
    private static final Logger log = Logger.getLogger(WisdomPredictionGenerator.class);
    private static final WinFormulaServicesImpl service = new WinFormulaServicesImpl();
    
    public WinFormulaServicesImpl getService() {
        return service;
    }
    
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: roundId");
            return;
        }
        int roundId = Integer.parseInt(args[0]);
        Connection cnn = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);
            new WisdomPredictionGenerator().generatePredictionsForOpenedWeeksOfRound(roundId);
        } catch (Exception e) {
            log.error("Failed to generate predictions", e);
        } finally {
            DBUtils.endDBBlock();
        }
    }


    public void generatePredictionsForOpenedWeeksOfRound(int roundId) {
        try {
            log.info("Generating predictins for roundId: "+ roundId);
            DBUtils.initDBBlock();
            List<Integer> weeks = getWeeksAcceptingSubmission(roundId);
            if (weeks.size()== 0) {
                log.info("All weeks are closed for the given round");
                return;
            }
            log.info("Opened week in round "+weeks);
            
            deletePredictions(weeks);
            
            
            String cmd = "SELECT game_id, avg(pd.home_score) as home_score, avg(pd.visitor_score) as visitor_score" + 
                         " FROM prediction p, prediction_detail pd" +
                         "   WHERE pd.prediction_id = p.prediction_id AND p.week_id = ?  AND pd.home_score IS NOT NULL AND pd.visitor_score IS NOT NULL" +
                         "         AND p.coder_id NOT IN (?,?)"  + 
                         "   GROUP BY game_id order by 1";
            generatePredictions(weeks, roundId, Constants.WISDOM_ALL, cmd);
            
            
            if (areOverallStatsGenerated()) {
                cmd =  "SELECT game_id, avg(pd.home_score) as home_score, avg(pd.visitor_score) as visitor_score" + 
                       "   FROM prediction p, prediction_detail pd" + 
                       "      WHERE pd.prediction_id = p.prediction_id AND p.week_id = ? AND pd.home_score IS NOT NULL and pd.visitor_score IS NOT NULL" + 
                       "            AND p.coder_id IN (select coder_id from user_overall_stats uos where uos.rank <= 10 + (select count(*) from  user_overall_stats where rank <= 10 and coder_id in (?,?)))" + 
                       "      group by game_id order by 1";
            } else if (areMiniSeasonStatsGenerated()) {
                cmd =  "SELECT game_id, avg(pd.home_score) as home_score, avg(pd.visitor_score) as visitor_score" + 
                       "   FROM prediction p, prediction_detail pd" + 
                       "      WHERE pd.prediction_id = p.prediction_id AND p.week_id = ? AND pd.home_score IS NOT NULL and pd.visitor_score IS NOT NULL" + 
                       "            AND p.coder_id IN (select coder_id from user_mini_season_stats uos where uos.rank <= 10 + (select count(*) from  user_mini_season_stats where rank <= 10 and coder_id in (?,?)))" + 
                       "      group by game_id order by 1";
            }
            
            generatePredictions(weeks, roundId, Constants.WISDOM_BEST, cmd);
                   
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBUtils.endDBBlock();
        }
    }


    private void generatePredictions(List<Integer> weeks, int roundId, int coderId, String cmd) throws SQLException, IDGenerationException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            log.info("Generating predictions for coder: " +coderId);
            Connection cnn = DBUtils.getCurrentConnection();
            ps = cnn.prepareStatement(cmd);
            ps.setInt(2, Constants.WISDOM_ALL);
            ps.setInt(3, Constants.WISDOM_BEST);
            
            for (Integer week : weeks) {
               int weekId = week.intValue();
               ps.setInt(1, weekId);
               int predictionId = service.getNextID();
               service.insertPredictionHeader(predictionId, roundId, coderId, weekId);
            
               rs = ps.executeQuery();
               while (rs.next()) {
                   service.insertPredictionItem(predictionId, rs.getInt(1), DBUtils.getInt(rs, 2), DBUtils.getInt(rs, 3));
               }
               DBMS.close(rs);
            }
        } finally {
            DBMS.close(ps, rs);
        }
    }


    private void deletePredictions(List<Integer> weeks) throws WinFormulaServicesException {
        service.deletePredictions(weeks, Constants.WISDOM_ALL);
        service.deletePredictions(weeks, Constants.WISDOM_BEST);
    }


    private List<Integer> getWeeksAcceptingSubmission(int roundId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = " SELECT week_id FROM week " +
                         "         WHERE mini_season_id = ?  AND week_status_id <> "+WeekInfo.WEEK_SCORED_AND_CLOSED +
                         "         ORDER BY week_id";

            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, roundId);
            rs = ps.executeQuery();
            List weeks = new ArrayList(20);
            while (rs.next()) {
                weeks.add(Integer.valueOf(rs.getInt(1)));
            }
            return weeks;
        } finally {
            DBMS.close(ps, rs);
        }
    }
    
    
    private boolean areOverallStatsGenerated() throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT FIRST 1 coder_id FROM  user_overall_stats";
            ps = cnn.prepareStatement(cmd);
            rs = ps.executeQuery();
            return rs.next();
        } finally {
            DBMS.close(ps, rs);
        }
    }
    
    private boolean areMiniSeasonStatsGenerated() throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT FIRST 1 coder_id FROM  user_mini_season_stats";
            ps = cnn.prepareStatement(cmd);
            rs = ps.executeQuery();
            return rs.next();
        } finally {
            DBMS.close(ps, rs);
        }
    }
}
