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
import com.topcoder.web.common.WebConstants;
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
public class LegacyLeaderBoard extends BaseBoard {

    
    
    protected void boardProcessing() throws Exception {
        
        // Stage list for combo box
        ResultSetContainer stages = runQuery(Constants.DR_STAGE_COMMAND, Constants.DR_STAGE_QUERY);
        getRequest().setAttribute("stages", stages);

        int stageId = -1; 
        
        if (hasParameter(Constants.STAGE_ID)) {
            stageId = Integer.parseInt(getRequest().getParameter(Constants.STAGE_ID));
        } else if (hasParameter(Constants.SEASON_ID)) {
            int seasonId = Integer.parseInt(getRequest().getParameter(Constants.SEASON_ID));

            for (ResultSetContainer.ResultSetRow row : stages) {
                if (row.getIntItem("season_id") == seasonId) {
                    stageId = row.getIntItem("stage_id");
                    break;
                }
            }
        }
            
        if (stageId < 0) {
            stageId = Integer.parseInt(getCurrentPeriod(Constants.STAGE_ID));
        }
        setDefault(Constants.STAGE_ID, stageId);

        // handle old assembly boards
        if (WebConstants.ASSEMBLY_PROJECT_TYPE==projectTypeId &&
                stageId == 5) {
            setNextPage("/digital_run/2007dot5/asmLeaderboardS1.jsp");
            setIsNextPageInContext(true);
            return;
        }

        if (WebConstants.ASSEMBLY_PROJECT_TYPE==projectTypeId &&
                stageId == 6) {
            setNextPage("/digital_run/2007dot5/asmLeaderboardS2.jsp");
            setIsNextPageInContext(true);        
            return;
        }
                
        // Get the stage and top performer contests
        int []ct = null;

        boolean stageExists = true;
        try {
            ct = getContestsForStage(stageId, projectTypeId);
        } catch (Exception e) {
            // this stage doesn't exist
            stageExists = false;
        }

        if (stageExists) {
            // Get the results from database
            Request r = new Request();
            r.setContentHandle("dr_results");
            
            r.setProperty("ct", ct[0] + ""); 
            r.setProperty("tpct", ct[1] + ""); 
            DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
            Map m = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) m.get("dr_results");
            
            
            // Put the results in a list
            List<LeaderBoardRow> results = new ArrayList<LeaderBoardRow>();
            for (ResultSetContainer.ResultSetRow row : rsc) {
                LeaderBoardRow lbr = new LeaderBoardRow(stageId, projectTypeId, row.getIntItem("current_place"), row.getLongItem("coder_id"),row.getStringItem("handle"),
                         row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                         row.getStringItem("current_top_performer_prize") == null? 0.0 : row.getDoubleItem("current_top_performer_prize"),
                         row.getStringItem("current_top_n_prize") == null? 0.0 : row.getDoubleItem("current_top_n_prize"),
                         hasWonTrip(row.getIntItem("current_place"), ct[2]));
                
                results.add(lbr);
                
            }
            
            // Sort and crop the list
            sortResult(results, sortCol, invert);
            List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
            
            // Find whether the season has rookie competition (needed for hidding links).
            boolean hasRookie = false;
            for (ResultSetContainer.ResultSetRow row : stages) {
                if (row.getIntItem("stage_id") == stageId) {
                    hasRookie = row.getIntItem("rookie_competition_ind") == 1;
                    getRequest().setAttribute(Constants.SEASON_ID, row.getStringItem("season_id"));
                }
            }
            getRequest().setAttribute("hasRookieCompetition", hasRookie);
            getRequest().setAttribute("results", cropped);
            getRequest().setAttribute("topTripWinners", numToLetters(ct[2]));
            getRequest().setAttribute("stageExists", true);            
        } else {
            getRequest().setAttribute("hasRookieCompetition", false);
            getRequest().setAttribute("stageExists", false);            
        }
        
        getRequest().setAttribute(Constants.STAGE_ID, stageId);

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


    /**
     * Get the stage and top performers contest for the specified stage and project type
     * 
     * @param stageId
     * @param projectTypeId
     * @return an array with element 0 being the contest_id for the stage contest and element 1 for top performers contest
     * @throws Exception
     */
    private int[] getContestsForStage(int stageId, int projectTypeId) throws Exception {
        
        Request r = new Request();
        r.setContentHandle("dr_contests_for_stage");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId + "");
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME); 
        ResultSetContainer contests= dai.getData(r).get("dr_contests_for_stage");
        
        int []result = new int[3];
        result[0] = -1;
        result[1] = -1;
        result[2] = 0;
        
        for(ResultSetContainer.ResultSetRow row : contests) {
            if (row.getIntItem("contest_type_id") == DR_STAGE_CONTEST_TYPE) {
                result[0] = row.getIntItem("contest_id");
                result[2] = row.getIntItem("top_trip_winners");
            }
            if (row.getIntItem("contest_type_id") == DR_TOP_PERFORMERS_CONTEST_TYPE) result[1] = row.getIntItem("contest_id");
        }
        
        if (result[0] < 0) throw new Exception("Missing a contest type dr stage for stage id " + stageId + " project type " + projectTypeId);
        if (result[1] < 0) throw new Exception("Missing a contest type top performers for stage id " + stageId + " project type " + projectTypeId);
        
        return result;

    }
    

}
