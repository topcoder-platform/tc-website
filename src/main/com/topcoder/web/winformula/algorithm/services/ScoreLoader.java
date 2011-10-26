/*
 * ScoreLoader
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.winformula.model.GameResult;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: ScoreLoader.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class ScoreLoader {
    private static final Logger log = Logger.getLogger(ScoreLoader.class);

    private final String UPDATE = "update prediction_detail_score set " +
        " prediction_detail_points = ?, " +
        " prediction_detail_total_score_variance = ?, " +
        " prediction_detail_victory_margin_variance = ?, " +
        " prediction_detail_picked_winner = ? " +
        " where prediction_detail_id = ? ";

    private final String INSERT = "insert into prediction_detail_score (" +
        " prediction_detail_points, " +
        " prediction_detail_total_score_variance, " +
        " prediction_detail_victory_margin_variance, " +
        " prediction_detail_picked_winner, " +
        " prediction_detail_id) " +
    " values (?, ?, ?, ?, ?) ";


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
        new ScoreLoader().process(weekId, coderId);
        
    }
    
    private void process(int weekId, int coderId) {
        Connection cnn = null;
        PreparedStatement ps = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);

            log.info("Loading scores:");

            insert = cnn.prepareStatement(INSERT);
            update = cnn.prepareStatement(UPDATE);

            String cmd =    " select pd.prediction_detail_id, pd.home_score as home_pred, " +
            		        " pd.visitor_score as visitor_pred, " + 
                            " g.home_score, g.visitor_score " +
                            " from prediction p, prediction_detail pd, game g, week w " +
                            " where p.prediction_id = pd.prediction_id " +
                            " and pd.game_id = g.game_id " +
                            " and p.week_id = w.week_id " +
                            " and pd.home_score is not null " +
                            " and pd.visitor_score is not null " +
                            " and g.home_score is not null " +
                            " and g.visitor_score is not null " +
                            " and w.week_id = ? " +
                            " and p.prediction_status_id >= ?";
            
            if (coderId > 0) {
                cmd = cmd + " and p.coder_id = ? ";
            }
            
            ps = cnn.prepareStatement(cmd, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY, ResultSet.HOLD_CURSORS_OVER_COMMIT);
            ps.setInt(1, weekId);
            ps.setInt(2, WinFormulaServicesImpl.PREDICTION_STATUS_TEMPORARY); 
            if (coderId > 0) {
               ps.setInt(3, coderId); 
            }
            rs = ps.executeQuery();
            int count = 0; 
            while (rs.next()) {
                int predictionDetailId = rs.getInt("prediction_detail_id");
                GameResult predictedResult = new GameResult(rs.getInt("home_pred"), rs.getInt("visitor_pred"));
                GameResult realResult = new GameResult(rs.getInt("home_score"), rs.getInt("visitor_score"));

                int points = getScore(predictedResult, realResult);
                int totalScoreVariance = getTotalScoreVariance(predictedResult, realResult);
                int victoryMarginVariance = getVictoryMarginVariance(predictedResult, realResult);
                boolean pickedWinner = getPickedWinner(predictedResult, realResult);
                
                addUpdateScores(cnn, insert, update, predictionDetailId, points, totalScoreVariance, victoryMarginVariance, pickedWinner);
                count++;
                if (count % 500 == 0) {
                    log.info("loading... " + count + " rows...");    
                }
            }
            log.info(count + " rows updated/inserted");
            if (count == 0) {
                log.info("** missing predictions or games results???");
            }
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(update);
            DBMS.close(insert);
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    private void addUpdateScores(Connection cnn, PreparedStatement insert, PreparedStatement update, int predictionDetailId,
            int points, int totalScoreVariance, int victoryMarginVariance,
            boolean pickedWinner) throws Exception {
        
        int j = 1;
        update.clearParameters();
        update.setInt(j++, points);
        update.setInt(j++, totalScoreVariance);
        update.setInt(j++, victoryMarginVariance);
        update.setBoolean(j++, pickedWinner);
        update.setInt(j++, predictionDetailId);
        int retVal = update.executeUpdate();

        if (retVal == 0) {
            j = 1;
            insert.clearParameters();
            insert.setInt(j++, points);
            insert.setInt(j++, totalScoreVariance);
            insert.setInt(j++, victoryMarginVariance);
            insert.setBoolean(j++, pickedWinner);
            insert.setInt(j++, predictionDetailId);
            insert.executeUpdate();
        }
    }

    private boolean getPickedWinner(GameResult predictedResult, GameResult realResult) {
        int real = realResult.getHomeScore() - realResult.getAwayScore();
        int pred = predictedResult.getHomeScore() - predictedResult.getAwayScore();

        return ((real > 0 && pred > 0) || (real < 0 && pred < 0) || (real == 0 && pred == 0)); 
    }
    
    private int getTotalScoreVariance(GameResult predictedResult, GameResult realResult) {
        int homeDif = predictedResult.getHomeScore() - realResult.getHomeScore();
        int awayDif = predictedResult.getAwayScore() - realResult.getAwayScore();

        return Math.abs(homeDif) + Math.abs(awayDif); 
    }
    
    private int getVictoryMarginVariance(GameResult predictedResult, GameResult realResult) {
        int homeDif = predictedResult.getHomeScore() - realResult.getHomeScore();
        int awayDif = predictedResult.getAwayScore() - realResult.getAwayScore();

        return Math.abs(homeDif - awayDif); 
    }

    int[] ds = {20,18,16,13,10,7,4,1};
    private int getScore(GameResult predictedResult, GameResult realResult) {
        int ret = 0;
        if(realResult.getHomeScore() > realResult.getAwayScore() && 
                predictedResult.getHomeScore() > predictedResult.getAwayScore() || 
                realResult.getHomeScore() < realResult.getAwayScore() && 
                predictedResult.getHomeScore() < predictedResult.getAwayScore()){
            ret += 60;
            int diff = Math.abs(realResult.getHomeScore() - realResult.getAwayScore() - 
                    predictedResult.getHomeScore() + predictedResult.getAwayScore());
            if (diff < ds.length) {
                ret += ds[diff];
            }
        }
        ret += Math.max(0, 10 - Math.abs(predictedResult.getHomeScore() - realResult.getHomeScore()));
        ret += Math.max(0, 10 - Math.abs(predictedResult.getAwayScore() - realResult.getAwayScore()));
        return ret;
    }
}
