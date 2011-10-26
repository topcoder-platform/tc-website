/*
 * WinFormulaServicesBean
 * 
 * Created Jul 29, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.topcoder.netCommon.contest.ContestConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.IdGeneratorClient;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.winformula.algorithm.services.DBUtils.UnitOfWork;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: WinFormulaServicesImpl.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class WinFormulaServicesImpl {
    public static final String GENERIC_SEQ = "WINFORMULA_SEQ";
    
    public static final int PREDICTION_STATUS_NO_PREDICTION = 1;
    public static final int PREDICTION_STATUS_TEMPORARY = 2;
    
    private final Logger log = Logger.getLogger(getClass());
    
    
   /**
    * Get all submissions for the given coder in the contest
    * 
    * @param contestId The id of the contest
    * @param coderId The id of the coder
    * @return List<SubmissionHistoryItem> containing submissions
    * @throws WinFormulaServicesException if data could not be retrieved
    */
    public List<SubmissionHistoryItem> getSubmissionHistory(int contestId, int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT s.submission_number"
                         + "     , s.submit_time"
                         + "     , s.submission_points " //Example results points
                         + "     , case when cs.submission_number = s.submission_number then cs.status_id else 0 end as status_id"
                         + "     , r.round_id"
                         + "     , r.name"
                         + "     , rs.end_time < current as locked" 
                         + "     , ps.avg_picked_winner " 
                         + "     , EXISTS(SELECT coder_id FROM long_system_test_result ltr "
                         + "              WHERE ltr.round_id = r.round_id AND ltr.coder_id = cs.coder_id AND" 
                         + "                    ltr.submission_number = s.submission_number AND test_action = 10) as example"
                         + "     , p.coder_id" 
                         + "  FROM long_submission s"
                         + "     , long_component_state cs"
                         + "     , round r"
                         + "     , round_component rc" 
                         + "     , round_segment rs"
                         + "     , OUTER mini_season_prediction p"
                         + "     , OUTER user_mini_season_stats ps"
                         + " WHERE r.contest_id = ?"
                         + "   AND rc.round_id = r.round_id"
                         + "   AND cs.round_id = r.round_id AND cs.coder_id = ? AND cs.component_id = rc.component_id"
                         + "   AND s.long_component_state_id = cs.long_component_state_id AND s.example = 0"
                         + "   AND rs.round_id = r.round_id AND rs.segment_id = 2"
                         + "   AND p.coder_id = cs.coder_id AND p.round_id = r.round_id"
                         + "   AND ps.coder_id = cs.coder_id AND ps.mini_season_id = r.round_id"
                         + " ORDER BY s.submission_number desc, r.round_id desc";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            
            LinkedList<SubmissionHistoryItem> list = new LinkedList();
            int prvSubmission = -1;
            int prvRoundId = -1;
            while (rs.next()) {
                int submissionNumber = rs.getInt(1);;
                long submitTime = rs.getLong(2);
                double submissionPoints = rs.getDouble(3);
                int statusId = rs.getInt(4);
                int roundId = rs.getInt(5);
                String name = rs.getString(6);
                //The season is locked in, so the first submission in the season is the one locked
                boolean lockedIn = prvRoundId != roundId && rs.getBoolean(7);
                double accuracy = rs.getDouble(8);
                if (rs.wasNull()) {
                    accuracy = -1;
                }
                boolean example = rs.getBoolean(9);
                boolean hasPrediction = DBUtils.getInt(rs, 10) != null;
                boolean inqueue = (statusId == ContestConstants.NOT_CHALLENGED);
                if (prvRoundId != roundId && prvSubmission == submissionNumber && !list.isEmpty()) {
                    SubmissionHistoryItem lastOne = list.getLast();
                    if (!lastOne.isExample() && !lastOne.isLockedIn()) {
                        //The submission is just an initial copy that may be/was overwriten by the coder
                        list.removeLast();
                    }
                }
                list.add(new SubmissionHistoryItem(submissionNumber, new Date(submitTime), roundId, name, example, submissionPoints, lockedIn, accuracy, inqueue, hasPrediction));
                prvRoundId = roundId;
                prvSubmission = submissionNumber;
            }
            return list;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    /**
     * Get all rounds of the given contest
     * Resulset: 
     *   round_id
     *   name
     *   start_time
     *   end_time
     *   coding_phase is accepting submissions
     *   future will the round start in the future
     * 
     * @param contestId The id of the contest
     * @param coderId The id of the coder
     * @return a result container
     * @throws WinFormulaServicesException if data could not be retrieved
     */
    public ResultSetContainer getRoundsByContest(int contestId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT rs.round_id, r.name, rs.start_time, rs.end_time, " +
            	         "       (current > start_time AND current < rs.end_time) as coding_phase, (current < rs.start_time) as future" + 
                         " FROM round_segment rs, round r " +
                         " WHERE rs.round_id = r.round_id and rs.segment_id = 2 and r.contest_id = ?" +
                         " ORDER BY 1";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            rs = ps.executeQuery();
            ResultSetContainer rsc = new ResultSetContainer(rs);
            return rsc;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }


    public LastCompilationInfo getLastCompilation(int contestId, int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT FIRST 1 lc.compilation_text, lc.language_id" +
                         " FROM long_compilation lc, long_component_state cs, round r " +
                         " WHERE r.contest_id = ? AND " +
                         "       cs.round_id = r.round_id AND cs.coder_id = ? AND" +
                         "       lc.long_component_state_id = cs.long_component_state_id AND lc.compilation_text IS NOT NULL" +
                         " ORDER BY r.round_id desc";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new LastCompilationInfo(rs.getInt(2), rs.getString(1));
            }
            return null;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    public Integer getLastCompilationLanguage(int contestId, int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT FIRST 1 lc.language_id" +
                         " FROM long_compilation lc, long_component_state cs, round r " +
                         " WHERE r.contest_id = ? AND " +
                         "       cs.round_id = r.round_id AND cs.coder_id = ? AND" +
                         "       lc.long_component_state_id = cs.long_component_state_id AND lc.compilation_text IS NOT NULL" +
                         " ORDER BY r.round_id desc";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return DBUtils.getInt(rs, 1);
            }
            return null;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }


    public boolean isUserRegisteredInContest(int contestId, int userId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT contest_id FROM contest_registration" +
                         " WHERE contest_id = ? AND user_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    public boolean isUserRegisteredInRound(int roundId, int userId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT round_id FROM round_registration" +
                         " WHERE round_id = ? AND coder_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, roundId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    public Integer getLanguageIdForCoder(int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT language_id FROM coder" +
                         " WHERE coder_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, coderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return DBUtils.getInt(rs, 1);
            }
            return null;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    public Integer resolveLanguageIdForCoder(int contestId, int coderId) throws WinFormulaServicesException {
        try {
            DBUtils.initDBBlock();
            Integer language = getLastCompilationLanguage(contestId, coderId);
            if (language == null) {
                language = getLanguageIdForCoder(coderId);
            }
            return language;
        } catch (WinFormulaServicesException e) {
            throw e;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBUtils.endDBBlock();
        }
    }
    
    
    public ProblemComponent getProblemComponent(int componentId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT component_text FROM component" +
                         " WHERE component_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, componentId);
            rs = ps.executeQuery();
            rs.next();
            StringReader reader = new StringReader(rs.getString(1));
            return new ProblemComponentFactory().buildFromXML(reader, true);
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }

    public Integer getLastSubmissionNumberFor(int roundId, int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd= "SELECT submission_number " +
                        " FROM  long_component_state cs" +
                        " WHERE cs.round_id = ? AND cs.coder_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, roundId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Integer(rs.getInt(1));
            } 
            return null;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    public ResultSetContainer getSummaryReport(int contestId, int roundId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd=   "SELECT u.handle, cs.submission_number, cs.points, ls.submit_time, cr.user_id"
                        + " FROM contest_registration cr, user u, OUTER(long_component_state cs,  long_submission ls)"
                        + " WHERE cr.contest_id = ?"
                        + "   AND u.user_id = cr.user_id"
                        + "   AND cs.round_id = ?"
                        + "   AND cs.coder_id = cr.user_id"
                        + "   AND ls.long_component_state_id = cs.long_component_state_id"
                        + "   AND ls.submission_number = cs.submission_number"
                        + "   AND ls.example = 0 "
                        + " ORDER BY cs.points desc, u.handle";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            ps.setInt(2, roundId);
            rs = ps.executeQuery();
            return new ResultSetContainer(rs, false);
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
 
    
    public ResultSetContainer getLastActiveRound(int contestId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT FIRST 1 rs.round_id, r.name "+
                            " FROM round_segment rs, round r " +
                            " WHERE rs.round_id = r.round_id and rs.segment_id = 2 and r.contest_id = ?" +
                            "       AND current > start_time" +
                            " ORDER BY 1 DESC";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, contestId);
            rs = ps.executeQuery();
            return new ResultSetContainer(rs);
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    
    public void recordPrediction(final int roundId, final int coderId, final int submissionNumber, final int weekIndex, final Prediction prediction) throws WinFormulaServicesException {
        try {
            Connection cnn = DBUtils.initDBBlock();
            UnitOfWork unitOfWork = new DBUtils.UnitOfWork() {
                public Object doWork(Connection cnn) throws Exception {
                    log.info("Recording prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex);
                    WeekInfo week = getWeekInformation(roundId, weekIndex);
                    if (!week.isWeekAllowingPredictions()) {
                        throw new IllegalStateException("The week status does not allow to store predictions.");
                    }
                    updateMiniSeasonPrediction(roundId, coderId, submissionNumber);
                    int predictionId = deleteWeekPredictions(roundId, coderId, weekIndex);
                    insertPredictionHeader(predictionId, roundId, coderId, weekIndex);
                    List<PredictionItem> games = prediction.getPredictions();
                    if (week.getGameCount() != games.size()) {
                        log.info("Game count differs, defined in DB: "+ week.getGameCount()+" returned by tester: "+games.size());
                    }
                    for (PredictionItem game : games) {
                        int gameId = week.getGameId(game.getHomeTeamName(), game.getAwayTeamName());
                        Integer homePrediction = null;
                        Integer awayPrediction = null;
                        if (game.getPredictedResult() != null) {
                            homePrediction = Integer.valueOf(game.getPredictedResult().getHomeScore());
                            awayPrediction = Integer.valueOf(game.getPredictedResult().getAwayScore());
                        }
                        insertPredictionItem(predictionId, gameId, homePrediction, awayPrediction);
                    }
                    updatePredictionStatus(predictionId, PREDICTION_STATUS_TEMPORARY);
                    log.info("Finished: Processing prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex);
                    return null;
                }
            };
            DBUtils.invoke(cnn, unitOfWork);
        } catch (WinFormulaServicesException e) {
            throw e;
        } catch (Exception e) {
            log.error("Could not store prediction", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBUtils.endDBBlock();
        }
            
        
    }

    public void insertPredictionHeader(int predictionId, int roundId, int coderId, int weekIndex) throws SQLException {
        PreparedStatement ps = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "INSERT INTO prediction (prediction_id, week_id, coder_id, prediction_status_id) VALUES (?,?,?,?)";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, predictionId);
            ps.setInt(2, weekIndex);
            ps.setInt(3, coderId);
            ps.setInt(4, PREDICTION_STATUS_NO_PREDICTION);
            ps.executeUpdate();
        } finally {
            DBMS.close(ps);
            DBUtils.endDBBlock();
        }        
    }

    public void updatePredictionStatus(int predictionId, int statusId) throws SQLException {
        PreparedStatement ps = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "UPDATE prediction SET prediction_status_id = ? WHERE prediction_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, statusId);
            ps.setInt(2, predictionId);
            ps.executeUpdate();
        } finally {
            DBMS.close(ps);
            DBUtils.endDBBlock();
        }        
    }
    private int deleteWeekPredictions(int roundId, int coderId, int weekId) throws SQLException, IDGenerationException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT prediction_id " +
            		     " FROM prediction p "+
                         " WHERE p.coder_id = ? AND p.week_id = ? ";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, coderId);
            ps.setInt(2, weekId);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                DBMS.close(ps, rs);
                ps = cnn.prepareStatement("DELETE FROM prediction_detail WHERE prediction_id = ?");
                ps.setInt(1, id);
                ps.executeUpdate();
                DBMS.close(ps);
                ps = cnn.prepareStatement("DELETE FROM prediction WHERE prediction_id = ?");
                ps.setInt(1, id);
                ps.executeUpdate();
                return id;
            } else {
                return getNextID();
            }
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
        
    }


    public void insertPredictionItem(int predictionId, int gameId, Integer homePrediction, Integer awayPrediction) throws SQLException, IDGenerationException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "INSERT INTO prediction_detail (prediction_detail_id, prediction_id, game_id, home_score, visitor_score)"+
                            " VALUES (?, ?, ?, ?, ?)";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, getNextID());
            ps.setInt(2, predictionId);
            ps.setInt(3, gameId);
            ps.setObject(4, homePrediction);
            ps.setObject(5, awayPrediction);
            ps.executeUpdate();
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }

    public int getNextID() throws IDGenerationException {
        return IdGeneratorClient.getSeqIdAsInt(GENERIC_SEQ);
    }


    private void updateMiniSeasonPrediction(int roundId, int coderId, int submissionNumber) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT submission_number "+
                         " FROM mini_season_prediction ms " +
                         " WHERE round_id = ? and coder_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, roundId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) != submissionNumber) {
                    log.warn("Submission number differs for roundId="+roundId+" coderId="+coderId+
                              ". Expected in DB: "+submissionNumber+" but it was: "+rs.getInt(1)+". Updating...");
                    DBMS.close(ps, rs);
                    ps = cnn.prepareStatement("UPDATE mini_season_prediction " +
                                              " SET submission_number = ?" +
                    		                  " WHERE round_id = ? AND coder_id = ?");
                    ps.setInt(1, submissionNumber);
                    ps.setInt(2, roundId);
                    ps.setInt(3, coderId);
                    ps.executeUpdate();
                }
            } else {
                DBMS.close(ps, rs);
                ps = cnn.prepareStatement("INSERT INTO mini_season_prediction (round_id, coder_id, submission_number) VALUES (?, ?, ?)");
                ps.setInt(1, roundId);
                ps.setInt(2, coderId);
                ps.setInt(3, submissionNumber);
                ps.executeUpdate();
            }
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }        
    }

    public WeekInfo getWeekInformation(int roundId, int weekIndex) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection cnn = DBUtils.initDBBlock();
            String cmd = "SELECT week_status_id FROM week"+
                         " WHERE mini_season_id = ? AND week_id = ?";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, roundId);
            ps.setInt(2, weekIndex);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new IllegalArgumentException("Week not found roundId="+roundId+" weekId="+weekIndex); 
            }
            WeekInfo week = new WeekInfo(weekIndex, rs.getInt(1));
            DBMS.close(ps, rs);
            
            cmd = "SELECT g.game_id, t1.tester_name AS home_team_name, t2.tester_name AS away_team_name,  g.game_status_id, g.home_score, g.visitor_score" +
                  " FROM game g, team t1, team t2 " +
                  " WHERE g.week_id = ?" +
                  "       AND t1.team_id = g.home_team_id" +
                  "       AND t2.team_id = g.visitor_team_id" +
                  " ORDER BY g.game_id";
            ps = cnn.prepareStatement(cmd);
            ps.setInt(1, weekIndex);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new IllegalStateException("The week "+weekIndex+" exists, but there are no games defined for it");
            }
            do {
              week.addGame(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), DBUtils.getInt(rs,5), DBUtils.getInt(rs, 6));  
            } while (rs.next());
            return week;
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
    
    
    public void deletePredictions(List<Integer> weeks, int coderId) throws WinFormulaServicesException {
        PreparedStatement ps = null;
        try {
            Connection cnn = DBUtils.initDBBlock();

            ps = cnn.prepareStatement("DELETE FROM prediction_detail WHERE prediction_id IN (SELECT prediction_id FROM prediction  WHERE coder_id = ? AND " + DBUtils.sqlStrInList("week_id", weeks)+")");
            ps.setInt(1, coderId);
            ps.executeUpdate();
            DBMS.close(ps);
            
            
            ps = cnn.prepareStatement("DELETE FROM user_week_stats WHERE coder_id = ? AND " + DBUtils.sqlStrInList("week_id", weeks));
            ps.setInt(1, coderId);
            ps.executeUpdate();
            DBMS.close(ps);
            
            ps = cnn.prepareStatement("DELETE FROM prediction WHERE coder_id = ? AND " + DBUtils.sqlStrInList("week_id", weeks));
            ps.setInt(1, coderId);
            ps.executeUpdate();
            DBMS.close(ps);
        }  catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps);
            DBUtils.endDBBlock();
        }
        
    }
}
