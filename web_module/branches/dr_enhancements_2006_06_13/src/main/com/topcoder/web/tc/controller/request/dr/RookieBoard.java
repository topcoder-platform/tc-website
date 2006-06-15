/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr rookie board.
 *
 * @author pulky
 * @version 1.0
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
        // Prepare request for data retrieval
        Request r = new Request();
        r.setContentHandle(Constants.DR_SEASON_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer seasons = (ResultSetContainer)m.get(Constants.DR_SEASON_QUERY);
        log.debug("Got " +  seasons.size() + " rows for seasons");
        getRequest().setAttribute(Constants.SEASON_LIST_KEY, seasons);

        log.debug("Getting rookie board coders...");
        ResultSetContainer rsc = retrieveBoardData(Constants.SEASON_ID, Constants.ROOKIE_BOARD_COMMAND, Constants.ROOKIE_BOARD_QUERY);

        // for now
        long period = 0;
        if (!hasParameter(Constants.SEASON_ID)) {
            period = new Long(getCurrentPeriod(Constants.SEASON_ID)).longValue();
        } else {
            period = new Long(getRequest().getParameter(Constants.SEASON_ID)).longValue();
        }

        long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

        List leaderBoardResult = new ArrayList(rsc.size());
        ResultSetRow row = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            leaderBoardResult.add(new LeaderBoardRow(period, phase, row.getLongItem("rank"),
                    row.getLongItem("user_id"), row.getStringItem("handle_lower"),
                    row.getLongItem("total_points"),
                    true, true, 10, 20, 30));
        }
        log.debug("leaderBoardResult.size(): " + leaderBoardResult.size());
        getRequest().setAttribute("testList", leaderBoardResult);
        getRequest().setAttribute("croppedDataBefore", new Boolean(false));
        getRequest().setAttribute("croppedDataAfter", new Boolean(true));

        setNextPage(Constants.VIEW_ROOKIE_BOARD_PAGE);
        setIsNextPageInContext(true);

    }
}
