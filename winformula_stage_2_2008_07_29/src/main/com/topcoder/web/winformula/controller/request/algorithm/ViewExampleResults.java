/*
 * ViewExampleResults
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;

/**
 * @author Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewExampleResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewExampleResults.class);
    private static final int HOME_TEAM_COLUMN = 1;
    private static final int AWAY_TEAM_COLUMN = 2;
    private static final int PICKED_WINNER_COLUMN = 3;
    private static final int TOTAL_SCORE_VARIANCE_COLUMN = 4;
    private static final int VICTORY_MARGIN_VARIANCE_COLUMN = 5;
    private static final int POINTS_COLUMN = 6;

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
            
            LongTestResult result = null;
            List<ListSelectTag.Option> weeks;
            if (results != null && results.length > 0) {
                weeks = new ArrayList<ListSelectTag.Option>(results.length);
                if (results.length > 0) {
                    result = results[0];
                    Object o = result.getResultObject();
    
                    // process predictions
                    List<Prediction> predictions = resolvePredictions(o);
    
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
                    sortResult(p);
                    
                    result.setResultObject(p);
                }
            } else {
                weeks = Collections.emptyList();
            }
            
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            
            // sort result

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
    
    @SuppressWarnings("unchecked")
    private void sortResult(Prediction p) {
        if (p.getPredictions().size() == 0) {
            return;
        }

        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // all other columns are already sorted (rank)
        if (sortCol.equals(String.valueOf(AWAY_TEAM_COLUMN))) {
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    return arg0.getAwayTeamName().compareTo(arg1.getAwayTeamName());
                }
            });
        } else if (sortCol.equals(String.valueOf(PICKED_WINNER_COLUMN))) {
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    return arg0.getPickedWinner().compareTo(arg1.getPickedWinner());
                }
            });
        } else if (sortCol.equals(String.valueOf(TOTAL_SCORE_VARIANCE_COLUMN))) {
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getTotalScoreVariance() == null && arg1.getTotalScoreVariance() != null) {
                        return 1;
                    }
                    if (arg0.getTotalScoreVariance() != null && arg1.getTotalScoreVariance() == null) {
                        return -1;
                    }
                    if (arg0.getTotalScoreVariance() == null && arg1.getTotalScoreVariance() == null) {
                        return 0;
                    }
                    return arg0.getTotalScoreVariance().compareTo(arg1.getTotalScoreVariance());
                }
            });
        } else if (sortCol.equals(String.valueOf(VICTORY_MARGIN_VARIANCE_COLUMN))) {
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getVictoryMarginVariance() == null && arg1.getVictoryMarginVariance() != null) {
                        return 1;
                    }
                    if (arg0.getVictoryMarginVariance() != null && arg1.getVictoryMarginVariance() == null) {
                        return -1;
                    }
                    if (arg0.getVictoryMarginVariance() == null && arg1.getVictoryMarginVariance() == null) {
                        return 0;
                    }
                    return arg0.getVictoryMarginVariance().compareTo(arg1.getVictoryMarginVariance());
                }
            });
        } else if (sortCol.equals(String.valueOf(POINTS_COLUMN))) {
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getScore() == null && arg1.getScore() != null) {
                        return 1;
                    }
                    if (arg0.getScore() != null && arg1.getScore() == null) {
                        return -1;
                    }
                    if (arg0.getScore() == null && arg1.getScore() == null) {
                        return 0;
                    }
                    return arg0.getScore().compareTo(arg1.getScore());
                }
            });
        } else {
            // Default, sort by home team.
            Collections.sort(p.getPredictions(), new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    return arg0.getHomeTeamName().compareTo(arg1.getHomeTeamName());
                }
            });
        }

        if (invert) {
            Collections.reverse(p.getPredictions());
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(HOME_TEAM_COLUMN, "asc");
        s.addDefault(AWAY_TEAM_COLUMN, "asc");
        s.addDefault(PICKED_WINNER_COLUMN, "desc");
        s.addDefault(TOTAL_SCORE_VARIANCE_COLUMN, "asc");
        s.addDefault(VICTORY_MARGIN_VARIANCE_COLUMN, "asc");
        s.addDefault(POINTS_COLUMN, "desc");

        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

    //ResultObject = Object[] {Week 1, .. Week n}
    //Week = Object [] {week id, score, prediction}
    //                  Integer, Integer, Prediction
    //prediction = Object[] {Game1... Game N}
    //Game = Object[] {homeTeam, awayTeam, homePScore, awayPScore, homeScore, awayScore, predictionScore}
    //                 String,   String, Integer, Integer, Integer, Integer, Integer
    
    private  List<Prediction> resolvePredictions(Object o) {
        if (o == null) {
            return Collections.emptyList();
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
                if (homePScore != null && awayPScore != null) {
                    pscore = new GameResult(homePScore.intValue(), awayPScore.intValue());
                }
    
                GameResult rscore = null;
                if (homeScore != null && awayScore != null) {
                    rscore = new GameResult(homeScore.intValue(), awayScore.intValue());
                }
                items.add(new PredictionItem(homeTeam, awayTeam, pscore, rscore, predictionScore));
            }
            predictions.add(new Prediction(weekId.intValue(), items, score));
        }
        return predictions;
    }
}

