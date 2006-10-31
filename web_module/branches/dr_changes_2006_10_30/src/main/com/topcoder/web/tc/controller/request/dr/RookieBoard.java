/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.CachedDataAccess;
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
     * The design rookie placement prizes.
     */
    //private static final double[] designPlacementPrize = {10000.0, 7500.0, 5000.0, 2500.0, 1500.0, 1250.0, 750.0, 500.0, 500.0, 500.0};

    /**
     * The development rookie placement prizes.
     */
    //private static final double[] developmentPlacementPrize = {7500.0, 5000.0, 3000.0, 1500.0, 900.0, 750.0, 450.0, 300.0, 300.0, 300.0};

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        ResultSetContainer seasons = runQuery(Constants.DR_SEASON_COMMAND, Constants.DR_SEASON_QUERY);
        if (log.isDebugEnabled()) {
            log.debug("Got " + seasons.size() + " rows for seasons");
        }
        getRequest().setAttribute(Constants.SEASON_LIST_KEY, seasons);

        if (log.isDebugEnabled()) {
            log.debug("Getting rookie board coders...");
        }
        ResultSetContainer rsc = retrieveBoardData(Constants.SEASON_ID, Constants.ROOKIE_BOARD_COMMAND, Constants.ROOKIE_BOARD_QUERY);

        long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

        List rookieBoardResult = processBoard(rsc, phase);

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        boolean invert = sortDir.equals("desc");

        // break prizes ties
        tieBreak(rookieBoardResult, getPlacementPrize(period, phase + ""), invert,
                "dr_rookie_tie_break_placement", "dr_rookie_tie_break_score", Constants.SEASON_ID);

        // sort
        sortResult(rookieBoardResult, invert);

        // crop
        List resultBoard = cropResult(rookieBoardResult);

        getRequest().setAttribute("boardList", resultBoard);
        setNextPage(Constants.VIEW_ROOKIE_BOARD_PAGE);
        setIsNextPageInContext(true);
    }


    /**
     * First processing of the board
     *
     * @param rsc   the ResultSetContainer retrieved from DB
     * @param phase the phase being used.
     */
    private List processBoard(ResultSetContainer rsc, long phase) {
        ResultSetRow row = null;
        boolean firstRow = true;
        List rookieBoardResult = new ArrayList(rsc.size());
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            rookieBoardResult.add(new RookieBoardRow(row.getLongItem("season_id"), phase, row.getLongItem("rank"),
                    row.getLongItem("user_id"), row.getStringItem("handle_lower"), row.getLongItem("total_points"),
                    firstRow, 0, row.getLongItem("confirmed_ind") == 0, row.getLongItem("outstanding_points")));
            firstRow = false;
        }
        return rookieBoardResult;
    }
    
    private double[] getPlacementPrize(String seasonId, String phaseId) throws TCWebException {
        double[] placementArray = null;

        Request r = new Request();
        r.setContentHandle("rookie_board_placement_prize");
        r.setProperty(Constants.PHASE_ID, phaseId);
        r.setProperty(Constants.SEASON_ID, seasonId);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = null;
        try {
            m = dai.getData(r);

            ResultSetContainer placementPoints = (ResultSetContainer) m.get("rookie_board_placement_prize");        
        
            placementArray = new double[placementPoints.size()];
            int i = 1;
            for (Iterator it = placementPoints.iterator(); it.hasNext(); i++) {
                ResultSetRow row = (ResultSetRow) it.next();
                if (row.getIntItem("place") != i) {
                    throw new TCWebException("Wrong contest_prize for stage " + seasonId + " phase " + phaseId);
                }
                placementArray[i-1] = row.getDoubleItem("prize_amount");
            }
        } catch (Exception e) {
            throw new TCWebException("Command " + "rookie_board_placement_prize" + " failed.", e);
        }

        return placementArray;
    }

}
