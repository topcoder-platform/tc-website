/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;
import com.topcoder.web.tc.model.dr.RookieBoardRow;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr rookie board.
 *
 * @author pulky
 * @version 1.0.2
 */
public class RookieBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(RookieBoard.class);

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Season list. FIX: skip seasons without rookies
        ResultSetContainer seasons = runQuery(Constants.DR_SEASON_COMMAND, Constants.DR_SEASON_QUERY);
        getRequest().setAttribute(Constants.SEASON_LIST_KEY, seasons);


        int seasonId = 1; // fix
//        int seasonId = Integer.parseInt(hasParameter(Constants.STAGE_ID) ? getRequest().getParameter(Constants.STAGE_ID) : getCurrentPeriod(Constants.STAGE_ID));
      setDefault(Constants.STAGE_ID, seasonId);

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

        
        int ct = 274; //fix
        
        Request r = new Request();
        r.setContentHandle("dr_rookie_results");
        r.setProperty("ph", phase + ""); 
        r.setProperty("ct", ct + "");
        r.setProperty("seid", seasonId + "");
        
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME); // change to cached
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_rookie_results");
        
        List<RookieBoardRow> results = new ArrayList<RookieBoardRow>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            RookieBoardRow lbr = new RookieBoardRow(seasonId, phase, row.getIntItem("current_place"), row.getLongItem("coder_id"),row.getStringItem("handle"),
                     row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                     row.getStringItem("current_prize") == null? 0.0 : row.getDoubleItem("current_prize"),
                     row.getIntItem("confirmed_ind") == 0);
            
            results.add(lbr);            
        }
        
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        getRequest().setAttribute("results", cropped);
        getRequest().setAttribute("isDesign", phase == 112);
        getRequest().setAttribute("isDevelopment", phase == 113);

        
        setNextPage(Constants.VIEW_ROOKIE_BOARD_PAGE);
        setIsNextPageInContext(true);
    }


}
