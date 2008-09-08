/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.winformula.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.Cookie;

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
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.PredictionItem;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Aug 18, 2008
 */
public class GamesHelper {

    private static final String SIZE_COOKIE = "wf_stats_"+DataAccessConstants.NUMBER_RECORDS;

    protected static final Logger log = Logger.getLogger(GamesHelper.class);

    public static final int HANDLE_COLUMN = 1;
    public static final int PICKED_WINNER_COLUMN = 2;
    public static final int TOTAL_SCORE_VARIANCE_COLUMN = 3;
    public static final int VICTORY_MARGIN_VARIANCE_COLUMN = 4;
    public static final int POINTS_COLUMN = 5;

    public static ResultSetContainer getGamesPredictions(Integer gameId) throws Exception {
        Request r = new Request();
        r.setContentHandle("game_predictions");
        r.setProperty(Constants.GAME_ID, String.valueOf(gameId));
        DataAccessInt dai = new CachedDataAccess(MaxAge.FIVE_MINUTES, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("game_predictions");
    }

    @SuppressWarnings("unchecked")
    public static void sortResult(TCRequest request, List<PredictionItem> l) {
        if (l.size() == 0) {
            return;
        }

        boolean invert = "desc".equals(request.getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN));

        // all other columns are already sorted (rank)
        if (sortCol.equals(String.valueOf(HANDLE_COLUMN))) {
            Collections.sort(l, new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    return arg0.getHandleLower().compareTo(arg1.getHandleLower());
                }
            });
        } else if (sortCol.equals(String.valueOf(PICKED_WINNER_COLUMN))) {
            Collections.sort(l, new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getPickedWinner() == null && arg1.getPickedWinner() != null) {
                        return -1;
                    }
                    if (arg0.getPickedWinner() != null && arg1.getPickedWinner() == null) {
                        return 1;
                    }
                    if (arg0.getPickedWinner() == null && arg1.getPickedWinner() == null) {
                        return 0;
                    }
                    return arg0.getPickedWinner().compareTo(arg1.getPickedWinner());
                }
            });
        } else if (sortCol.equals(String.valueOf(TOTAL_SCORE_VARIANCE_COLUMN))) {
            Collections.sort(l, new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getTotalScoreVariance() == null && arg1.getTotalScoreVariance() != null) {
                        return -1;
                    }
                    if (arg0.getTotalScoreVariance() != null && arg1.getTotalScoreVariance() == null) {
                        return 1;
                    }
                    if (arg0.getTotalScoreVariance() == null && arg1.getTotalScoreVariance() == null) {
                        return 0;
                    }
                    return arg0.getTotalScoreVariance().compareTo(arg1.getTotalScoreVariance());
                }
            });
        } else if (sortCol.equals(String.valueOf(VICTORY_MARGIN_VARIANCE_COLUMN))) {
            Collections.sort(l, new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getVictoryMarginVariance() == null && arg1.getVictoryMarginVariance() != null) {
                        return -1;
                    }
                    if (arg0.getVictoryMarginVariance() != null && arg1.getVictoryMarginVariance() == null) {
                        return 1;
                    }
                    if (arg0.getVictoryMarginVariance() == null && arg1.getVictoryMarginVariance() == null) {
                        return 0;
                    }
                    return arg0.getVictoryMarginVariance().compareTo(arg1.getVictoryMarginVariance());
                }
            });
        } else {
            // Default, sort by points.
            Collections.sort(l, new Comparator<PredictionItem>() {
                public int compare(PredictionItem arg0, PredictionItem arg1) {
                    if (arg0.getScore() == null && arg1.getScore() != null) {
                        return -1;
                    }
                    if (arg0.getScore() != null && arg1.getScore() == null) {
                        return 1;
                    }
                    if (arg0.getScore() == null && arg1.getScore() == null) {
                        return 0;
                    }
                    return arg0.getScore().compareTo(arg1.getScore());
                }
            });
            if (!sortCol.equals(String.valueOf(POINTS_COLUMN))) {
                // default to descending
                invert = true;
            }
        }

        if (invert) {
            Collections.reverse(l);
        }


        SortInfo s = new SortInfo();
        s.addDefault(HANDLE_COLUMN, "asc");
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
    public static List<PredictionItem> cropResult(TCRequest request, TCResponse response, List<PredictionItem> l) {
        int sizeBeforeCrop = l.size();
        String numRecords = resolveSize(request, response, sizeBeforeCrop);
   
        String numPage = StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_PAGE));
        if (numPage.equals("") || Integer.parseInt(numPage) <= 0) {
            numPage = "1";
        }
   
        request.setAttribute(DataAccessConstants.NUMBER_PAGE, numPage);
        request.setAttribute(DataAccessConstants.NUMBER_RECORDS, numRecords);

        int startRank = getStartRank(Integer.parseInt(numPage), Integer.parseInt(numRecords));
        int endRank = getEndRank(Integer.parseInt(numPage), Integer.parseInt(numRecords));
        if (endRank >= sizeBeforeCrop) {
            endRank = sizeBeforeCrop;
        }
            
        List<PredictionItem> result;
        if (sizeBeforeCrop > 0) {
            result = l.subList(startRank, endRank);
        } else { 
            result = Collections.emptyList();
        }

        log.debug("startRank: " + startRank);
        log.debug("startRank: " + endRank);
        log.debug("sizeBeforeCrop: " + sizeBeforeCrop);
        
        request.setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        request.setAttribute("croppedDataAfter", new Boolean(endRank != sizeBeforeCrop));

        request.setAttribute("totalSize", sizeBeforeCrop);
        
        return result;
    }

    private static String resolveSize(TCRequest request, TCResponse response, int sizeBeforeCrop) {
        String numRecords = StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_RECORDS));
        if (numRecords.length() == 0) {
            numRecords = StringUtils.checkNull(getSizeCookie(request));
            if (log.isDebugEnabled()) {
                log.debug("Number records not specified. Cookie is: "+numRecords);
            }
            if ("all".equals(numRecords)) {
                numRecords = String.valueOf(sizeBeforeCrop);
            }
        }
        
        if (!"50".equals(numRecords) &&
                !"100".equals(numRecords) &&
                !String.valueOf(sizeBeforeCrop).equals(numRecords)) {
            numRecords = "25";
        }
        
        if (String.valueOf(sizeBeforeCrop).equals(numRecords)) {
            if (!"all".equals(getSizeCookie(request))) {
                setSizeCookie(response, "all");
            }
        } else {
            if (!numRecords.equals(getSizeCookie(request))) {
                setSizeCookie(response, numRecords);
            }
        }
        return numRecords;
    }

    private static String getSizeCookie(TCRequest request) {
        Cookie cookie = request.getCookie(SIZE_COOKIE);
        if (cookie == null) {
            return null;
        }
        return cookie.getValue(); 
    }
    
    private static void setSizeCookie(TCResponse response, String size) {
        if (log.isDebugEnabled()) {
            log.debug("Setting cookie to "+size);
        }
        response.addCookie(new Cookie(SIZE_COOKIE, size));
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
    
    public static List<PredictionItem> processResult(ResultSetContainer rsc) throws Exception {
        if (rsc.size() > 0) {
            List<PredictionItem> lpi = new ArrayList<PredictionItem>(rsc.size()); 
            for (ResultSetRow rsr : rsc) {
                Long userId = rsr.getLongItem("user_id");
                String handle = rsr.getStringItem("handle");
                Integer homePred = GamesHelper.getNullableIntItem(rsr, "home_pred");
                Integer awayPred = GamesHelper.getNullableIntItem(rsr, "visitor_pred");
                Integer points = GamesHelper.getNullableIntItem(rsr, "prediction_detail_points");
                Integer totalScoreVariance = GamesHelper.getNullableIntItem(rsr, "prediction_detail_total_score_variance");
                Integer victoryMarginVariance = GamesHelper.getNullableIntItem(rsr, "prediction_detail_victory_margin_variance");
                Boolean pickedWinner = GamesHelper.getNullableBoolItem(rsr, "prediction_detail_picked_winner");
                
                GameResult gr = null;
                
                if (homePred != null && awayPred != null) {
                    gr = new GameResult(homePred, awayPred);
                }
                
                PredictionItem pi = new PredictionItem(userId, handle, gr, 
                        points, totalScoreVariance, victoryMarginVariance, pickedWinner);

                lpi.add(pi);
            }
            return lpi;
        } else {
            return null;
        }
    }

}
