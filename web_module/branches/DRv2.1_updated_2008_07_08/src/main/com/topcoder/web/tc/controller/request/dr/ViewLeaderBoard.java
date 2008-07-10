/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky, cucu
 * @version 1.0.3
 */
public class ViewLeaderBoard extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        int startRank;
        int numRecords;

        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        
        if ("".equals(numRecordsStr)) {
            numRecords = Constants.DEFAULT_LEADERS;
        } else {
            numRecords = Integer.parseInt(numRecordsStr); 

            if (numRecords > Constants.MAX_LEADERS) {
                numRecords = Constants.MAX_LEADERS;
            }
        }

        if ("".equals(startRankStr) || Integer.parseInt(startRankStr) <= 0) {
            startRank = 1;
        } else {
            startRank = Integer.parseInt(startRankStr);
        }

        
        int trackId = Integer.parseInt(getRequest().getParameter(Constants.TRACK_ID));
        setDefault(Constants.TRACK_ID, trackId);

        // Get the results from database
        Request r = new Request();
        r.setContentHandle("drv2_results");
        r.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("drv2_results");
            
        // Put the results in a list
        List<LeaderBoardRow> results = new ArrayList<LeaderBoardRow>();
        for (ResultSetContainer.ResultSetRow row : rsc) {
            LeaderBoardRow lbr = new LeaderBoardRow(trackId, projectTypeId, row.getIntItem("current_place"), row.getLongItem("coder_id"),
                 row.getStringItem("handle"),
                 row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                 row.getStringItem("current_top_performer_prize") == null? 0.0 : row.getDoubleItem("current_top_performer_prize"),
                 row.getStringItem("current_top_n_prize") == null? 0.0 : row.getDoubleItem("current_top_n_prize"),
                 hasWonTrip(row.getIntItem("current_place"), 5));
            
            results.add(lbr);
            
        }
            
        // Sort and crop the list
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        getRequest().setAttribute("hasRookieCompetition", Boolean.FALSE);
        getRequest().setAttribute("results", cropped);
        getRequest().setAttribute("topTripWinners", 5);
        getRequest().setAttribute("stageExists", true);            
        
        getRequest().setAttribute(Constants.TRACK_ID, trackId);

        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);        
    }
    
    
    private String numToLetters(int i) {
        switch (i) {
        case 1:
            return "One";
        case 2:
            return "Two";
        case 3:
            return "Three";
        case 4:
            return "Four";
        case 5:
            return "Five";
        case 6:
            return "Six";
        case 7:
            return "Seven";
        case 8:
            return "Eight";
        case 9:
            return "Nine";
        case 10:
            return "Ten";
        default:
            return String.valueOf(i);
        }
    }


    /**
     * Checks if the coder has win a trip
     * 
     * @param rank
     * @param topTripWinners
     * @return true if the winner won a trip
     */
    private boolean hasWonTrip(int rank, int topTripWinners) {
        return rank <= topTripWinners;
    }    

}
