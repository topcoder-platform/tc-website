/*
 * PredictionLoader
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.model.PredictionSummary;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class PredictionLoader {
    private static final Logger log = Logger.getLogger(PredictionLoader.class);
    private static final Logger alertLog = Logger.getLogger("ALERT." + PredictionLoader.class.getName());
    private static final WinFormulaServicesImpl service = new WinFormulaServicesImpl();
    
    public void handleSystemTestCompleted(int roundId, int coderId, int submissionNumber) {
        log.info("Handling system test result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber);
        try {
            LongTestResult[] results = LongContestServicesLocator.getService().getLongTestResults(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, LongContestServices.LONG_TEST_RESULT_TYPE_SYSTEM);
            if (results == null || results.length == 0) {
                log.error("Handling system test result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+". LongTestResults is empty or null.");
                alertLog.error("LongTestResults is empty or null.");
                return;
            }
            for (LongTestResult result : results) {
                handlePrediction(roundId, coderId, submissionNumber, Integer.parseInt(result.getArg()), result.getResultObject());
            }
        } catch (Exception e) {
            log.error("Exception while handling system test result: ", e);
            alertLog.error("Handling system test result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber, e);
        }
    }
    
    
    public void handlePrediction(int roundId, int coderId, int submissionNumber, int weekIndex, Object resultObject) {
        log.info("Handling prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex);
        if (resultObject == null) {
            log.error("Result object is null. Ignoring result");
            alertLog.error("Prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex+" is null");
            return;
        }
        try {
            PredictionSummary prediction = PredictionResultTransformer.transformPredictions(resultObject);
            if (prediction.getPredictions().size() > 1) {
                log.error("Result object has more than one result. Storing first one");
                alertLog.error("Prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex+" has more than 1 result");
            } else if (prediction.getPredictions().size() == 0) {
                log.error("Result object has no result. Dropping report");
                alertLog.error("Prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex+" has no result.");
                return;
            }
            getService().recordPrediction(roundId, coderId, submissionNumber, weekIndex, prediction.getPredictions().get(0));
        } catch (Exception e) {
            log.error("Exception while handling result", e);
            alertLog.error("Handling prediction result for roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber+" weekIndex="+weekIndex+" Exception while handling result.",e);
        }
    }

    public WinFormulaServicesImpl getService() {
        return service;
    }
    
    public static void main(String[] args) {
        if (args.length > 2 || args.length == 0) {
            System.out.println("Usage: roundId [coderId]");
            return;
        }
        int roundId = Integer.parseInt(args[0]);
        int coderId = -1;
        if (args.length > 1) {
            coderId = Integer.parseInt(args[1]);
        }
        new PredictionLoader().process(roundId, coderId);
        
    }


    private void process(int roundId, int coderId) {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);
            String cmd =    " SELECT lcs.coder_id, lcs.submission_number" +
                            "         FROM long_component_state lcs" +
                            "         WHERE lcs.round_id = ?" +
                            "               AND lcs.submission_number > 0 " +
                            "               AND NOT EXISTS (SELECT gu.user_id FROM group_user gu WHERE gu.user_id = lcs.coder_id " + 
                            "                      AND (group_id = 13 OR group_id = 14))";
            if (coderId > 0) {
                cmd = cmd + " AND coder_id = ? ";
            }
            
            ps = cnn.prepareStatement(cmd, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY, ResultSet.HOLD_CURSORS_OVER_COMMIT);
            ps.setInt(1, roundId);
            if (coderId > 0) {
               ps.setInt(2, coderId); 
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                coderId = rs.getInt(1);
                int submissionNumber = rs.getInt(2);
                handleSystemTestCompleted(roundId, coderId, submissionNumber);
            }
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
}
