/*
 * ViewExampleResults
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.PredictionStat;
import com.topcoder.web.winformula.model.PredictionSummary;

/**
 * @author Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewExampleResults extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewExampleResults.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            
            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            int coderId = getUserID();
            if (!isUserRegisteredInContest(getContestID(), coderId)) {
                registrationNeeded("You need to be registered in order to view your results.");
                return;
            }
            
            int roundId = Integer.parseInt(request.getParameter(CodingConstants.ROUND_ID));
            setDefault(CodingConstants.ROUND_ID, roundId);
            log.debug("coder: " + coderId + " user " + getUser().getId());
            Integer subnum = getService().getLastSubmissionNumberFor(roundId, coderId);
            LongTestResult[] results = LongContestServicesLocator.getService().getLongTestResults(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, LongContestServices.LONG_TEST_RESULT_TYPE_NON_SYSTEM);
            
            PredictionSummary summary = null;
            LongTestResult result = null;
            List<ListSelectTag.Option> weeks;
            if (results != null && results.length > 0) {
                weeks = new ArrayList<ListSelectTag.Option>(results.length);
                result = results[0];
                Object o = result.getResultObject();

                // process predictions
                summary = resolvePredictions(o);
                List<Prediction> predictions = summary.getPredictions();

                if (predictions.size() > 0) {
                    int weekIndex = 0;
                    int i = 0;
                    for (Prediction p : predictions) {
                        weeks.add(new ListSelectTag.Option(String.valueOf(p.getWeek()), "Week " + p.getWeek(), String.valueOf(p.getWeek()).equals(selectedWeek)));
                        if (String.valueOf(p.getWeek()).equals(selectedWeek)) {
                            weekIndex = i;
                        }
                        i++;
                    }
                    Prediction p = predictions.get(weekIndex);
                    PredictionsHelper.sortResult(request, p);
                    result.setResultObject(p);
                } else  {
                    log.info("prediction for test case 0 was null or empty");
                    weeks = Collections.emptyList();
                }
            } else {
                log.info("results is null or empty");
                weeks = Collections.emptyList();
            }
            
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            
            // sort result

            request.setAttribute("summary", summary);
            request.setAttribute("result", result);
            request.setAttribute("weeks", weeks);
            request.setAttribute(CodingConstants.ROUND_ID, new Integer(roundId));
            request.setAttribute(CodingConstants.SUBMISSION_NUMBER, subnum);
            setNextPage(Constants.PAGE_VIEW_EXAMPLE_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    

    //ResultObject = Object[] {Week 1, .. Week n}
    //Week = Object [] {week id, score, prediction}
    //                  Integer, Integer, Prediction
    //prediction = Object[] {Game1... Game N}
    //Game = Object[] {homeTeam, awayTeam, homePScore, awayPScore, homeScore, awayScore, predictionScore}
    //                 String,   String, Integer, Integer, Integer, Integer, Integer
    
    private  PredictionSummary resolvePredictions(Object o) {
        if (o == null) {
            return PredictionSummary.NULL_SUMMARY;
        }
        int totalGamesWithScore = 0;
        int totalCorrect = 0;
        
        Object[] weeks = (Object[]) o;
        List<Prediction> predictions = new ArrayList(weeks.length);
        int bestWeekIndex=-1;
        int worstWeekIndex=-1;
        for (int i = 0; i < weeks.length; i++) {
            Object[] week = (Object[]) weeks[i];
            Integer weekId = (Integer) week[0];
            Integer score = (Integer) week[1];
            Object[] results = (Object[]) week[2];
            List<PredictionItem> items = new ArrayList(results.length);
            int weekCorrect = 0;
            int weekWithScore = 0;
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
                if (homePScore != null && awayPScore != null) {
                    pscore = new GameResult(homePScore.intValue(), awayPScore.intValue());
                }
                GameResult rscore = null;
                if (homeScore != null && awayScore != null) {
                    weekWithScore++;
                    rscore = new GameResult(homeScore.intValue(), awayScore.intValue());
                }
                PredictionItem predictionItem = new PredictionItem(homeTeam, awayTeam, pscore, rscore, predictionScore);
                if (predictionItem.getPickedWinner().booleanValue()) {
                    weekCorrect++;
                }
                items.add(predictionItem);
            }
            Prediction prediction = new Prediction(weekId.intValue(), items, score, new PredictionStat(weekWithScore, weekCorrect));
            Double weekAccuracy = prediction.getStats().getAccuracy();
            if (weekAccuracy != null) {
                if (bestWeekIndex == -1 || predictions.get(bestWeekIndex).getStats().getAccuracy().compareTo(weekAccuracy) < 0) {
                    bestWeekIndex = i;
                }
                if (worstWeekIndex == -1 || predictions.get(worstWeekIndex).getStats().getAccuracy().compareTo(weekAccuracy) > 0) {
                    worstWeekIndex = i;
                }
            }
            predictions.add(prediction);
            totalCorrect += weekCorrect;
            totalGamesWithScore += weekWithScore;
        }
        return new PredictionSummary(new PredictionStat(totalGamesWithScore, totalCorrect), predictions, worstWeekIndex, bestWeekIndex);
    }
}

