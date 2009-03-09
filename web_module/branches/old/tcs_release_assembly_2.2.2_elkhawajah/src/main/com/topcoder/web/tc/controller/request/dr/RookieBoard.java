/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.RookieBoardRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr rookie board.
 *
 * @author pulky, cucu
 * @version 1.0.2
 */
public class RookieBoard extends BaseBoard {

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void boardProcessing() throws Exception {
        // Season list.
        ResultSetContainer seasons = runQuery("dr_rookie_seasons", "dr_rookie_seasons");
        getRequest().setAttribute("seasons", seasons);


        int seasonId = hasParameter(Constants.SEASON_ID) ? Integer.parseInt(getRequest().getParameter(Constants.SEASON_ID)) : getCurrentRookieSeason();
        setDefault(Constants.SEASON_ID, seasonId);
       
        // Get the rookie contest for the season
        int ct = getContestForSeason(seasonId, phaseId);
        
        // Get the results from the Database
        Request r = new Request();
        r.setContentHandle("dr_rookie_results");
        r.setProperty("ph", phaseId + ""); 
        r.setProperty("ct", ct + "");
        r.setProperty("seid", seasonId + "");
        
        // Put the results in a list
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_rookie_results");
        
        List<RookieBoardRow> results = new ArrayList<RookieBoardRow>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            RookieBoardRow lbr = new RookieBoardRow(seasonId, projectTypeId, row.getIntItem("current_place"), row.getLongItem("coder_id"),row.getStringItem("handle"),
                     row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                     row.getStringItem("current_prize") == null? 0.0 : row.getDoubleItem("current_prize"),
                     row.getIntItem("confirmed_ind") == 0);
            
            results.add(lbr);            
        }
        
        // Sort and crop the list
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        getRequest().setAttribute(Constants.SEASON_ID, seasonId);
        getRequest().setAttribute("results", cropped);
        
        setNextPage(Constants.VIEW_ROOKIE_BOARD_PAGE);
        setIsNextPageInContext(true);
    }

    /**
     * Get the most recent season having rookie contest.
     * @return
     * @throws TCWebException
     */
    protected int getCurrentRookieSeason() throws TCWebException {
        ResultSetContainer currentPeriod = runQuery("dr_current_rookie_season", "dr_current_rookie_season");
        return currentPeriod.getIntItem(0, 0);
    }

    
    /**
     * Get the rookie contest for the specified season and phase
     * 
     * @param seasonId
     * @param phaseId
     * @return
     * @throws Exception
     */
    private int getContestForSeason(int seasonId, int phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contests_for_season");
        r.setProperty(Constants.SEASON_ID, seasonId + "");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME); 
        ResultSetContainer contests= dai.getData(r).get("dr_contests_for_season");

        if (contests.size() == 0) throw new Exception("Missing a contest type rookie for season id " + seasonId  + " phase " + phaseId);

        return contests.getIntItem(0, "contest_id");
    }


}
