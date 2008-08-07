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
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.topcoder.netCommon.contest.ContestConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class WinFormulaServicesImpl {
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
                         + "     , p.prediction_accuracy" 
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
                         + " WHERE r.contest_id = ?"
                         + "   AND rc.round_id = r.round_id"
                         + "   AND cs.round_id = r.round_id AND cs.coder_id = ? AND cs.component_id = rc.component_id"
                         + "   AND s.long_component_state_id = cs.long_component_state_id AND s.example = 0"
                         + "   AND rs.round_id = r.round_id AND rs.segment_id = 2"
                         + "   AND p.coder_id = cs.coder_id AND p.round_id = r.round_id"
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
                         " ORDER BY 2";
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
                DBUtils.getInt(rs, 1);
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
            return null;
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

    public int getLastSubmissionNumberFor(int roundId, int coderId) throws WinFormulaServicesException {
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
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            log.error("Could not process required method", e);
            throw new WinFormulaServicesException("INTERNAL_SERVER");
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
}
