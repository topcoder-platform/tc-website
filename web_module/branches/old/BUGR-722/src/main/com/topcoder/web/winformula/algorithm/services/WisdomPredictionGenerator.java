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
 * @version $Id: WisdomPredictionGenerator.java 73049 2008-09-25 22:32:53Z dbelfer $
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


    @SuppressWarnings("boxing")
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
            
            String cmd = "SELECT game_id, round(avg(pd.home_score)) as home_score, round(avg(pd.visitor_score)) as visitor_score, avg(pd.home_score) as nr_home_score, avg(pd.visitor_score) as nr_visitor_score " + 
                         " FROM prediction p, prediction_detail pd" +
                         "   WHERE pd.prediction_id = p.prediction_id AND p.week_id = ?  AND pd.home_score IS NOT NULL AND pd.visitor_score IS NOT NULL" +
                         "         AND p.coder_id NOT IN (?,?)"  + 
                         "   GROUP BY game_id order by 1";
            generatePredictions(weeks, roundId, Constants.WISDOM_ALL, cmd, true);
            
            
            updateWeekStatus(weeks.get(0), WeekInfo.WEEK_WITH_FINAL_PREDICTIONS);
            
            
            int previousWeek = weeks.get(0) - 1;
            boolean bindCoders = true;
            if (areOverallStatsGenerated(previousWeek)) {
                log.info("Using overall stats for TOP 10 generation");
                int rank = resolveRankToTakeOnOverall(previousWeek);
                cmd =  "SELECT game_id, round(avg(pd.home_score)) as home_score, round(avg(pd.visitor_score)) as visitor_score, avg(pd.home_score) as nr_home_score, avg(pd.visitor_score) as nr_visitor_score" + 
                       "   FROM prediction p, prediction_detail pd" + 
                       "      WHERE pd.prediction_id = p.prediction_id AND p.week_id = ? AND pd.home_score IS NOT NULL and pd.visitor_score IS NOT NULL" + 
                       "            AND p.coder_id NOT IN (?,?) AND p.coder_id IN (select coder_id from user_overall_stats uos where uos.rank <= "+rank+" and uos.week_id = "+previousWeek+")" + 
                       "      group by game_id order by 1";
                log.info("Using rank <= " + rank+" on week ="+previousWeek);
            } else if (areWeeklyStatsGenerated(previousWeek)) {
                log.info("Using weekly stats for TOP 10 generation: weekID <= "+previousWeek);
                cmd =  "SELECT game_id, round(avg(pd.home_score)) as home_score, round(avg(pd.visitor_score)) as visitor_score, avg(pd.home_score) as nr_home_score, avg(pd.visitor_score) as nr_visitor_score" + 
                              "   FROM prediction p, prediction_detail pd" + 
                              "      WHERE pd.prediction_id = p.prediction_id AND p.week_id = ? AND pd.home_score IS NOT NULL and pd.visitor_score IS NOT NULL" +
                              "            AND " +  resolveCodersToTakeFromWeeklyStats(previousWeek) +
                              "      group by game_id order by 1";
                bindCoders = false;
            } else {
                log.warn("We don't have proper stats, avoiding TOP 10 generation");
                return;
            }
            generatePredictions(weeks, roundId, Constants.WISDOM_BEST, cmd, bindCoders);
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBUtils.endDBBlock();
        }
    }


    private void updateWeekStatus(Integer weekId, int status) throws SQLException {
        PreparedStatement ps = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            ps = cnn.prepareStatement("UPDATE week SET week_status_id = ? WHERE week_id = ?");
            ps.setInt(1, status);
            ps.setInt(2, weekId.intValue());
            ps.executeUpdate();
        } finally {
            DBMS.close(ps);
        }
        
    }

    private void generatePredictions(List<Integer> weeks, int roundId, int coderId, String cmd, boolean bindCoders) throws SQLException, IDGenerationException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            log.info("Generating predictions for coder: " +coderId);
            Connection cnn = DBUtils.getCurrentConnection();
            ps = cnn.prepareStatement(cmd);
            if (bindCoders) {
                ps.setInt(2, Constants.WISDOM_ALL);
                ps.setInt(3, Constants.WISDOM_BEST);
            }
            
            for (Integer week : weeks) {
               int weekId = week.intValue();
               ps.setInt(1, weekId);
               int predictionId = service.getNextID();
               service.insertPredictionHeader(predictionId, roundId, coderId, weekId);
            
               rs = ps.executeQuery();
               while (rs.next()) {
                   int gameId = rs.getInt(1);
                   Integer finalHomeScore = DBUtils.getInt(rs, 2);
                   Integer finalAwayScore = DBUtils.getInt(rs, 3);
                   Double homeScore = DBUtils.getDouble(rs, 4);
                   Double awayScore = DBUtils.getDouble(rs, 5);
                   if (finalHomeScore.equals(finalAwayScore)) {
                       log.info("Converting tie on game " + gameId +" from "+ finalHomeScore + "," +finalAwayScore +"("+homeScore + "," +awayScore+")");
                       if (Math.abs(homeScore.doubleValue() - finalHomeScore.doubleValue()) > Math.abs(awayScore.doubleValue() - finalHomeScore.doubleValue())) {
                           finalAwayScore = finalHomeScore;
                           finalHomeScore = getTweakScore(finalHomeScore, homeScore);  
                       } else {
                           finalHomeScore = finalAwayScore;
                           finalAwayScore = getTweakScore(finalAwayScore, awayScore);
                       }
                       log.info("TO "+ finalHomeScore + "," +finalAwayScore);
                   }
                   service.insertPredictionItem(predictionId, gameId, finalHomeScore, finalAwayScore);
               }
               DBMS.close(rs);
               
               service.updatePredictionStatus(predictionId, WinFormulaServicesImpl.PREDICTION_STATUS_TEMPORARY);
            }
        } finally {
            DBMS.close(ps, rs);
        }
    }

    private Integer getTweakScore(Integer roundedScore, Double realScore) {
        return realScore.compareTo(roundedScore.doubleValue()) <= 0 ? new Integer((int) Math.floor(realScore.doubleValue())) : new Integer((int) Math.ceil(realScore.doubleValue()));
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
    
    
    private boolean areOverallStatsGenerated(int weekId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT FIRST 1 coder_id FROM user_overall_stats WHERE week_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, weekId);
            rs = ps.executeQuery();
            return rs.next();
        } finally {
            DBMS.close(ps, rs);
        }
    }
    
    private boolean areWeeklyStatsGenerated(int weekId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT FIRST 1 coder_id FROM user_week_stats WHERE week_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, weekId);
            rs = ps.executeQuery();
            return rs.next();
        } finally {
            DBMS.close(ps, rs);
        }
    }
    
    
    private int resolveRankToTakeOnOverall(int weekId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT rank FROM user_overall_stats WHERE coder_id IN (?, ?) AND week_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, Constants.WISDOM_ALL);
            ps.setInt(2, Constants.WISDOM_BEST);
            ps.setInt(3, weekId);
            rs = ps.executeQuery();

            int rank = 10;
            while (rs.next()) {
                if (rs.getInt(1) <= rank) {
                    rank++;
                }
            }
            return rank;
        } finally {
            DBMS.close(ps, rs);
        }
    }
    
    private String resolveCodersToTakeFromWeeklyStats(int weekId) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List topTenIds = new ArrayList(12);
            Connection cnn = DBUtils.getCurrentConnection();
            String cmd = "SELECT coder_id, sum(points) FROM user_week_stats WHERE coder_id NOT IN (?, ?) and week_id <= ? GROUP BY 1 ORDER BY 2 DESC";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, Constants.WISDOM_ALL);
            ps.setInt(2, Constants.WISDOM_BEST);
            ps.setInt(3, weekId);
            rs = ps.executeQuery();
            int rank = 0;
            int lastPoints = Integer.MAX_VALUE; 
            while (rs.next()) {
                int points = rs.getInt(2);
                if (lastPoints != points) {
                    rank++;
                    lastPoints = points;
                }
                if (rank <= 10) {
                    topTenIds.add(Integer.valueOf(rs.getInt(1)));
                } else {
                    break;
                }
            }
            log.info("Using Top Ten coders: "+topTenIds);
            return DBUtils.sqlStrInList("coder_id", topTenIds);
        } finally {
            DBMS.close(ps, rs);
        }
    }
}
