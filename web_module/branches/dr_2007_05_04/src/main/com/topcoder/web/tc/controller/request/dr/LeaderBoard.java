/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0.3
 */
public class LeaderBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    protected void businessProcessing() throws Exception {
        if (!getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        // Stage list for combo box
        ResultSetContainer stages = runQuery(Constants.DR_STAGE_COMMAND, Constants.DR_STAGE_QUERY);
        getRequest().setAttribute("stages", stages);

        int stageId = Integer.parseInt(hasParameter(Constants.STAGE_ID) ? getRequest().getParameter(Constants.STAGE_ID) : getCurrentPeriod(Constants.STAGE_ID));
        setDefault(Constants.STAGE_ID, stageId);

        int phase = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));
        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        
        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
        int startRank;
        int numRecords;
        
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

        int []ct = getContestsForStage(stageId, phase);
        
        Request r = new Request();
        r.setContentHandle("dr_results");
        r.setProperty("ct", ct[0] + ""); 
        r.setProperty("tpct", ct[1] + ""); 
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME); // change to cached
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_results");
        
        List<LeaderBoardRow> results = new ArrayList<LeaderBoardRow>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            LeaderBoardRow lbr = new LeaderBoardRow(stageId, phase, row.getIntItem("current_place"), row.getLongItem("coder_id"),row.getStringItem("handle"),
                     row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                     row.getStringItem("current_top_performer_prize") == null? 0.0 : row.getDoubleItem("current_top_performer_prize"),
                     row.getStringItem("current_top_n_prize") == null? 0.0 : row.getDoubleItem("current_top_n_prize"));
            
            results.add(lbr);
            
        }
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        boolean hasRookie = false;
        for (ResultSetContainer.ResultSetRow row : stages) {
            if (row.getIntItem("stage_id") == stageId) {
                hasRookie = row.getIntItem("rookie_competition_ind") == 1;
            }
        }
        
        getRequest().setAttribute("hasRookieCompetition", hasRookie);
        getRequest().setAttribute("results", cropped);
        getRequest().setAttribute("isDesign", phase == 112);
        getRequest().setAttribute("isDevelopment", phase == 113);

        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);        
    }
    
    
    private int[] getContestsForStage(int stageId, int phaseId) throws Exception {
        
        Request r = new Request();
        r.setContentHandle("dr_contests_for_stage");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME); 
        ResultSetContainer contests= dai.getData(r).get("dr_contests_for_stage");
        
        
        
        int []result = new int[2];
        result[0] = -1;
        result[1] = -1;
        
        for(ResultSetContainer.ResultSetRow row : contests) {
            if (row.getIntItem("contest_type_id") == DR_STAGE_CONTEST_TYPE) result[0] = row.getIntItem("contest_id");
            if (row.getIntItem("contest_type_id") == DR_TOP_PERFORMERS_CONTEST_TYPE) result[1] = row.getIntItem("contest_id");
        }
        
        if (result[0] < 0) throw new Exception("Missing a contest type dr stage for stage id " + stageId + " phase " + phaseId);
        if (result[1] < 0) throw new Exception("Missing a contest type top performers for stage id " + stageId + " phase " + phaseId);
        
        return result;

    }
    

}
