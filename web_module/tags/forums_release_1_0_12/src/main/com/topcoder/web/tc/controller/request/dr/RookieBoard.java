/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.RookieBoardRow;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr rookie board.
 *
 * @author pulky
 * @version 1.0.1
 */
public class RookieBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(RookieBoard.class);

    /**
     * The design rookie placement prizes.
     */
    private static final double[] designPlacementPrize = {10000.0, 7500.0, 5000.0, 2500.0, 1500.0, 1250.0, 750.0, 500.0, 500.0, 500.0};

    /**
     * The development rookie placement prizes.
     */
    private static final double[] developmentPlacementPrize = {7500.0, 5000.0, 3000.0, 1500.0, 900.0, 750.0, 450.0, 300.0, 300.0, 300.0};

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
        boolean invert = sortDir.equals("asc");

        // break prizes ties
        tieBreak(rookieBoardResult, (phase == 112) ? designPlacementPrize : developmentPlacementPrize, invert,
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
                    firstRow, 0, row.getLongItem("confirmed_ind") == 0));
            firstRow = false;
        }
        return rookieBoardResult;
    }
}
