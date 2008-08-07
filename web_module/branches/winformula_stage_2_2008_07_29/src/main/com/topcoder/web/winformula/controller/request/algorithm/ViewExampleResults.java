/*
 * ViewExampleResults
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class ViewExampleResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewExampleResults.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            
            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            
            int coderId = getUserID();
            int roundId = Integer.parseInt(request.getParameter(CodingConstants.ROUND_ID));
            setDefault(CodingConstants.ROUND_ID, roundId);
            log.debug("coder: " + coderId + " user " + getUser().getId());
            int subnum = getService().getLastSubmissionNumberFor(roundId, coderId);
            LongTestResult[] results = LongContestServicesLocator.getService().getLongTestResults(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, LongContestServices.LONG_TEST_RESULT_TYPE_NON_SYSTEM);
            
            LongTestResult result = null;

            List<String> weekNames = new ArrayList<String>(0);

            int weekIndex = 0;
            if (results.length > 0) {
                result = results[0];
                Object o = result.getResultObject();

                // process predictions
                List<Prediction> predictions = resolvePredictions(o);
                weekNames = getWeekNames(predictions);
                weekIndex = weekNames.indexOf("Week " + selectedWeek);
                if (weekIndex == -1) { // if we can't find the requested week, default to the first one 
                    weekIndex = 0;
                }
                result.setResultObject(predictions.get(weekIndex));
            }

            setDefault("week", "Week " + selectedWeek);
            
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            request.setAttribute("result", result);
            request.setAttribute("weekIndex", weekIndex);
            request.setAttribute("weekNames", weekNames);
            request.setAttribute(CodingConstants.ROUND_ID, new Integer(roundId));
            request.setAttribute(CodingConstants.SUBMISSION_NUMBER, new Integer(subnum));
            setNextPage(Constants.PAGE_VIEW_EXAMPLE_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    private List<String> getWeekNames(List<Prediction> predictions) {
        List<String> weekNames = new ArrayList<String>(predictions.size());
        
        for (Prediction p : predictions) {
            weekNames.add("Week " + p.getWeek());
        }
        
        return weekNames;
    }

    //ResultObject = Object[] {Week 1, .. Week n}
    //Week = Object [] {week id, score, prediction}
    //                  Integer, Integer, Prediction
    //prediction = Object[] {Game1... Game N}
    //Game = Object[] {homeTeam, awayTeam, homePScore, awayPScore, homeScore, awayScore, predictionScore}
    //                 String,   String, Integer, Integer, Integer, Integer, Integer
    
    private  List<Prediction> resolvePredictions(Object o) {
        if (o == null) {
            return null;
        }
        Object[] weeks = (Object[]) o;
        List<Prediction> predictions = new ArrayList(weeks.length);
        for (int i = 0; i < weeks.length; i++) {
            Object[] week = (Object[]) weeks[i];
            Integer weekId = (Integer) week[0];
            Integer score = (Integer) week[1];
            Object[] results = (Object[]) week[2];
            List<PredictionItem> items = new ArrayList(results.length);
            for (int j = 0; j < results.length; j++) {
                Object[] game = (Object[]) results[j];
                String homeTeam = (String) game[0];
                String awayTeam = (String) game[1];
                Integer homePScore = (Integer) game[2];
                Integer awayPScore = (Integer) game[3];
                Integer homeScore = (Integer) game[4];
                Integer awayScore = (Integer) game[5];
                Integer predictionScore = (Integer) game[6];
                GameResult pscore = null;
                if (homePScore != null) {
                    pscore = new GameResult(homePScore.intValue(), awayPScore.intValue());
                }
    
                GameResult rscore = null;
                if (homeScore != null) {
                    rscore = new GameResult(homeScore.intValue(), awayScore.intValue());
                }
                items.add(new PredictionItem(homeTeam, awayTeam, pscore, rscore, predictionScore));
            }
            predictions.add(new Prediction(weekId.intValue(), items, score));
        }
        return predictions;
    }
    
    
    //FIXME remove me
//    public static void main(String[] args) {
//        Object[] weeks = new Object[2];
//        for (int j = 0; j < 2; j++) {
//            Object[] games = new Object[20];
//            for (int i = 0; i < 20; i++) {
//                games[i] = new Object[] {"A"+i, "B"+i, new Integer(1+i), new Integer(2+i), new Integer(2+i), new Integer(4+i), new Integer(5+i)};
//            }
//            weeks[j] = new Object[] {new Integer(1000+j), new Integer(j+50), games};
//        }
//        List<Prediction> x = resolvePredictions(weeks);
//        System.out.println(x);
//    }
}

