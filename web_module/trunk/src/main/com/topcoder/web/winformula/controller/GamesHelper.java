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
import com.topcoder.web.winformula.model.StandingsItem;

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

    public static final int RANK_COLUMN = 1;
    public static final int HANDLE_COLUMN = 2;
    public static final int POINTS_COLUMN = 3;
    public static final int WIN_PERCENTAGE_COLUMN = 4;
    public static final int AVG_TOTAL_SCORE_VARIANCE_COLUMN = 5;
    public static final int AVG_VICTORY_MARGIN_VARIANCE_COLUMN = 6;

    public static ResultSetContainer getGamesPredictions(Integer gameId) throws Exception {
        Request r = new Request();
        r.setContentHandle("game_predictions");
        r.setProperty(Constants.GAME_ID, String.valueOf(gameId));
        DataAccessInt dai = new CachedDataAccess(MaxAge.FIVE_MINUTES, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("game_predictions");
    }

    @SuppressWarnings("unchecked")
    public static void sortResult(TCRequest request, List<StandingsItem> l) {
        if (l.size() == 0) {
            return;
        }

        boolean invert = "desc".equals(request.getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN));

        // all other columns are already sorted (rank)
        if (sortCol.equals(String.valueOf(HANDLE_COLUMN))) {
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    return arg0.getHandle().compareTo(arg1.getHandle());
                }
            });
        } else if (sortCol.equals(String.valueOf(POINTS_COLUMN))) {
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    if (arg0.getPoints() == null && arg1.getPoints() != null) {
                        return 1;
                    }
                    if (arg0.getPoints() != null && arg1.getPoints() == null) {
                        return -1;
                    }
                    if (arg0.getPoints() == null && arg1.getPoints() == null) {
                        return 0;
                    }
                    return arg0.getPoints().compareTo(arg1.getPoints());
                }
            });
        } else if (sortCol.equals(String.valueOf(WIN_PERCENTAGE_COLUMN))) {
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    if (arg0.getWinPercent() == null && arg1.getWinPercent() != null) {
                        return 1;
                    }
                    if (arg0.getWinPercent() != null && arg1.getWinPercent() == null) {
                        return -1;
                    }
                    if (arg0.getWinPercent() == null && arg1.getWinPercent() == null) {
                        return 0;
                    }
                    return arg0.getWinPercent().compareTo(arg1.getWinPercent());
                }
            });
        } else if (sortCol.equals(String.valueOf(AVG_TOTAL_SCORE_VARIANCE_COLUMN))) {
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    if (arg0.getAvgTotalScoreVariance() == null && arg1.getAvgTotalScoreVariance() != null) {
                        return 1;
                    }
                    if (arg0.getAvgTotalScoreVariance() != null && arg1.getAvgTotalScoreVariance() == null) {
                        return -1;
                    }
                    if (arg0.getAvgTotalScoreVariance() == null && arg1.getAvgTotalScoreVariance() == null) {
                        return 0;
                    }
                    return arg0.getAvgTotalScoreVariance().compareTo(arg1.getAvgTotalScoreVariance());
                }
            });
        } else if (sortCol.equals(String.valueOf(AVG_VICTORY_MARGIN_VARIANCE_COLUMN))) {
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    if (arg0.getAvgVictoryMarginVariance() == null && arg1.getAvgVictoryMarginVariance() != null) {
                        return 1;
                    }
                    if (arg0.getAvgVictoryMarginVariance() != null && arg1.getAvgVictoryMarginVariance() == null) {
                        return -1;
                    }
                    if (arg0.getAvgVictoryMarginVariance() == null && arg1.getAvgVictoryMarginVariance() == null) {
                        return 0;
                    }
                    return arg0.getAvgVictoryMarginVariance().compareTo(arg1.getAvgVictoryMarginVariance());
                }
            });
        } else {
            // Default, sort by home team.
            Collections.sort(l, new Comparator<StandingsItem>() {
                public int compare(StandingsItem arg0, StandingsItem arg1) {
                    if (arg0.getRank() == null && arg1.getRank() != null) {
                        return 1;
                    }
                    if (arg0.getRank() != null && arg1.getRank() == null) {
                        return -1;
                    }
                    if (arg0.getRank() == null && arg1.getRank() == null) {
                        return 0;
                    }
                    return arg0.getRank().compareTo(arg1.getRank());
                }
            });
        }

        if (invert) {
            Collections.reverse(l);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(RANK_COLUMN, "asc");
        s.addDefault(HANDLE_COLUMN, "asc");
        s.addDefault(POINTS_COLUMN, "desc");
        s.addDefault(WIN_PERCENTAGE_COLUMN, "asc");
        s.addDefault(AVG_TOTAL_SCORE_VARIANCE_COLUMN, "asc");
        s.addDefault(AVG_VICTORY_MARGIN_VARIANCE_COLUMN, "asc");

        request.setAttribute(SortInfo.REQUEST_KEY, s);
    }

    /**
     * Crops the result as specified
     * 
     * @param rsc the resultsetcontainter to crop
     * @throws Exception
     */
    public static List<StandingsItem> cropResult(TCRequest request, TCResponse response, List<StandingsItem> l) {
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
            
        List<StandingsItem> result;
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
                
                PredictionItem pi = new PredictionItem(userId, handle, new GameResult(homePred, awayPred), 
                        points, totalScoreVariance, victoryMarginVariance, pickedWinner);

                lpi.add(pi);
            }
            return lpi;
        } else {
            return null;
        }
    }

}
