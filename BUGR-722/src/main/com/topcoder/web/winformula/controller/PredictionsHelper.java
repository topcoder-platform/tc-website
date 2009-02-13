/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.winformula.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.PredictionStat;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: PredictionsHelper.java 72757 2008-09-08 18:58:48Z pwolfus $
 * Create Date: Aug 18, 2008
 */
public class PredictionsHelper {

    protected static final Logger log = Logger.getLogger(PredictionsHelper.class);

    public static final int HOME_TEAM_COLUMN = 1;
    public static final int AWAY_TEAM_COLUMN = 2;
    public static final int PICKED_WINNER_COLUMN = 3;
    public static final int TOTAL_SCORE_VARIANCE_COLUMN = 4;
    public static final int VICTORY_MARGIN_VARIANCE_COLUMN = 5;
    public static final int POINTS_COLUMN = 6;

    public static ResultSetContainer getPredictionsData(long userId, int weekId) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_predictions");
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));

        DataAccessInt dai = new CachedDataAccess(MaxAge.FIVE_MINUTES, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_predictions");
    }

    @SuppressWarnings("unchecked")
    public static void sortResult(TCRequest request, Prediction p) {
        if (p.getPredictions().size() == 0) {
            return;
        }

        boolean invert = "desc".equals(request.getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN));

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
                    if (arg0.getPickedWinner() == null && arg1.getPickedWinner() != null) {
                        return 1;
                    }
                    if (arg0.getPickedWinner() != null && arg1.getPickedWinner() == null) {
                        return -1;
                    }
                    if (arg0.getPickedWinner() == null && arg1.getPickedWinner() == null) {
                        return 0;
                    }
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

        request.setAttribute(SortInfo.REQUEST_KEY, s);
    }

    /**
     * Crops the result as specified
     * 
     * @param rsc the resultsetcontainter to crop
     * @throws Exception
     */
    public static void cropResult(TCRequest request, Prediction p) {
        String numRecords = StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_RECORDS));

        int sizeBeforeCrop = p.getPredictions().size();
        if (!"25".equals(numRecords) &&
                !"50".equals(numRecords) &&
                !String.valueOf(sizeBeforeCrop).equals(numRecords)) {
            numRecords = "10";
        }
   
        String numPage = StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_PAGE));
        if (numPage.equals("") || Integer.parseInt(numPage) <= 0) {
            numPage = "1";
        }
   
        request.setAttribute(DataAccessConstants.NUMBER_PAGE, numPage);
        request.setAttribute(DataAccessConstants.NUMBER_RECORDS, numRecords);

        int startRank = getStartRank(Integer.parseInt(numPage), Integer.parseInt(numRecords));
        int endRank = getEndRank(Integer.parseInt(numPage), Integer.parseInt(numRecords));
        if (endRank >= sizeBeforeCrop) {
//            endRank = sizeBeforeCrop - 1;
            endRank = sizeBeforeCrop;
        }
            
        if (sizeBeforeCrop > 0) {
            p.setPredictions(p.getPredictions().subList(startRank, endRank));
        }

        log.debug("startRank: " + startRank);
        log.debug("startRank: " + endRank);
        log.debug("startRank: " + sizeBeforeCrop);
        
        request.setAttribute("croppedDataBefore", new Boolean(startRank > 1));
//        request.setAttribute("croppedDataAfter", new Boolean(endRank != sizeBeforeCrop - 1));
        request.setAttribute("croppedDataAfter", new Boolean(endRank != sizeBeforeCrop));

        request.setAttribute("totalSize", sizeBeforeCrop);
    }

    
    private static int getStartRank(int numPage, int numRecords) {
        return (numPage - 1) * numRecords;
    }

    private static int getEndRank(int numPage, int numRecords) {
        return numPage * numRecords;
    }

    public static Integer getNullableIntItem(ResultSetRow rsr, String columnName) {
        if (rsr.getItem(columnName).getResultData() == null) {
            return null;
        } else {
            return rsr.getIntItem(columnName);
        }
    }
    
    public static Double getNullableDoubleItem(ResultSetRow rsr, String columnName) {
        if (rsr.getItem(columnName).getResultData() == null) {
            return null;
        } else {
            return rsr.getDoubleItem(columnName);
        }
    }
    

    public static Boolean getNullableBoolItem(ResultSetRow rsr, String columnName) {
        if (rsr.getItem(columnName).getResultData() == null) {
            return null;
        } else {
            return rsr.getBooleanItem(columnName);
        }
    }
    
    public static LongTestResult processResult(ResultSetContainer rsc, int week) {
        if (rsc.size() > 0) {
            int total = 0;
            int correct = 0;
            int score = 0;
            List<PredictionItem> lpi = new ArrayList<PredictionItem>(rsc.size()); 
            for (ResultSetRow rsr : rsc) {
                Integer gameId = rsr.getIntItem("game_id");
                String home = rsr.getStringItem("home");
                String visitor = rsr.getStringItem("visitor");
                Integer homePred = PredictionsHelper.getNullableIntItem(rsr, "home_pred");
                Integer visitorPred = PredictionsHelper.getNullableIntItem(rsr, "visitor_pred");
                Integer homeScore = PredictionsHelper.getNullableIntItem(rsr, "home_score");
                Integer visitorScore = PredictionsHelper.getNullableIntItem(rsr, "visitor_score");
                Integer predictionPoints = PredictionsHelper.getNullableIntItem(rsr, "prediction_detail_points");
                Integer totalScoreVariance = PredictionsHelper.getNullableIntItem(rsr, "prediction_detail_total_score_variance");
                Integer victoryMarginVariance = PredictionsHelper.getNullableIntItem(rsr, "prediction_detail_victory_margin_variance");
                Boolean pickedWinner = PredictionsHelper.getNullableBoolItem(rsr, "prediction_detail_picked_winner");
                
                PredictionItem pi = new PredictionItem(gameId, home, visitor, 
                        (homePred == null || visitorPred == null) ? null : new GameResult(homePred, visitorPred),
                        (homeScore == null || visitorScore == null) ? null : new GameResult(homeScore, visitorScore),
                        predictionPoints, totalScoreVariance, victoryMarginVariance, pickedWinner);

                lpi.add(pi);
                
                total++;
                correct += (pi.getPickedWinner() != null && pi.getPickedWinner()) ? 1 : 0;
                score += pi.getScore() == null ? 0 : pi.getScore();
            }
            
            Prediction p = new Prediction(week, lpi, score, new PredictionStat(total, correct));
    
            LongTestResult ltr = new LongTestResult(); 
            ltr.setResultObject(p);
            return ltr;
        } else {
            return null;
        }
    }

}
