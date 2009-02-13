/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.studio.controller.request.dr;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardResult;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky, cucu
 * @version 1.0.3
 */
public class ViewLeaderBoard extends BaseBoardV2 {

   private static final String CODER_HANDLE_COLUMN = "2";
   private static final String OUTSTANDING_POINTS_COLUMN = "6";
   private static final String TOTAL_POINTS_COLUMN = "7";
   

    protected void businessProcessing() throws Exception {
        int trackId = -1; 

        if (hasParameter(Constants.TRACK_ID)) {
            trackId = Integer.parseInt(getRequest().getParameter(Constants.TRACK_ID));
        }
            
        if (trackId < 0) {
            trackId = getCurrentTrack(3);  // studio type
        }
        
        int startRank;
        int numRecords;

        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        
        if ("".equals(numRecordsStr)) {
            numRecords = 50;
        } else {
            numRecords = Integer.parseInt(numRecordsStr); 

            if (numRecords > 200) {
                numRecords = 200;
            }
        }

        if ("".equals(startRankStr) || Integer.parseInt(startRankStr) <= 0) {
            startRank = 1;
        } else {
            startRank = Integer.parseInt(startRankStr);
        }
        
        // Get track details from database
        TrackInfo trackInfo = getTrackDetails(trackId);            
        getRequest().setAttribute("trackInfo", trackInfo);

        ResultSetContainer tracks = getTrackList(trackInfo.getTrackTypeId());
        getRequest().setAttribute("tracks", tracks);

        // Get the results from database
        LeaderBoardResult resultObject = getTrackResults(trackId);
        
        // Sort and crop the list
        sortResult(resultObject.getResults(), sortCol, invert);
        resultObject.setResults(cropResult(resultObject.getResults(), startRank, numRecords));

        getRequest().setAttribute("resultObject", resultObject);
        getRequest().setAttribute("topTripWinners", 1);
        getRequest().setAttribute("trackExists", true);            

        getRequest().setAttribute(Constants.TRACK_ID, trackId);
        setDefault(Constants.TRACK_ID, trackId);

        setNextPage("/digitalrun/leaderboard.jsp");
        setIsNextPageInContext(true);        
    }
    
    

    /**
     * Crops coders list.
     *
     * @param boardResult the original board list.
     * @return the cropped list.
     */
    protected List<LeaderBoardRow> cropResult(List<? extends LeaderBoardRow> boardResult, int startRank, int numRecords) {
        if (boardResult.size() == 0) {
            return new ArrayList<LeaderBoardRow>();
        }
        
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
        setDefault(DataAccessConstants.START_RANK, startRank);

        List<LeaderBoardRow> cropped = new ArrayList<LeaderBoardRow>(numRecords);
        for (int j = 0; j < numRecords && j + startRank <= boardResult.size(); j++)
        {
            cropped.add(boardResult.get(startRank + j - 1));
        }

        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        getRequest().setAttribute("croppedDataAfter", new Boolean(boardResult.size() > startRank + cropped.size()));

       return cropped;
    }

    /**
     * Sorts coders list.
     *
     * @param boardResult the original board list.
     * @param invert      true if the order is descending.
     * @return the sorted list.
     */
    protected void sortResult(List<? extends LeaderBoardRow> boardResult, String sortCol, boolean invert) {
        if (boardResult.size() == 0) {
            return;
        }

        // all other columns are already sorted (rank)
        if (sortCol.equals(CODER_HANDLE_COLUMN)) {
            Collections.sort(boardResult, new Comparator<LeaderBoardRow>() {
                public int compare(LeaderBoardRow arg0, LeaderBoardRow arg1) {
                    return arg0.getUserName().compareTo(arg1.getUserName());
                }
            });
        } else  if (sortCol.equals(OUTSTANDING_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator<LeaderBoardRow>() {
                public int compare(LeaderBoardRow arg0, LeaderBoardRow arg1) {
                    return new Double(arg0.getPotentialPoints()).compareTo(new Double(arg1.getPotentialPoints()));
                }
            });
        } else if (sortCol.equals(TOTAL_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator<LeaderBoardRow>() {
                public int compare(LeaderBoardRow arg0, LeaderBoardRow arg1) {
                    return new Double(arg0.getTotalPoints()).compareTo(new Double(arg1.getTotalPoints()));
                }
            });
        } else {
            // Default, sort by rank.

            Collections.sort(boardResult, new Comparator<LeaderBoardRow>() {
                public int compare(LeaderBoardRow arg0, LeaderBoardRow arg1) {
                    return new Long(arg0.getRank()).compareTo(arg1.getRank());
                }
            });
        }

        if (invert) {
            Collections.reverse(boardResult);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(Integer.parseInt(CODER_HANDLE_COLUMN), "asc");
        s.addDefault(Integer.parseInt(OUTSTANDING_POINTS_COLUMN), "desc");
        s.addDefault(Integer.parseInt(TOTAL_POINTS_COLUMN), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
