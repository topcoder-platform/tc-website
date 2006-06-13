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
import java.util.List;
import java.util.Map;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0
 */
public class LeaderBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        Request r = new Request();
        r.setContentHandle(Constants.DR_STAGE_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer stages = (ResultSetContainer)m.get(Constants.DR_STAGE_QUERY);
        log.debug("Got " +  stages.size() + " rows for stages");
        getRequest().setAttribute(Constants.STAGE_LIST_KEY, stages);

        List leaderBoardResult = new ArrayList();
        leaderBoardResult.add(new LeaderBoardRow(1, 7548200, 1000, true, true, 10, 20, 30));
        leaderBoardResult.add(new LeaderBoardRow(2, 11770376, 900, true, true, 5, 10, 13));
        leaderBoardResult.add(new LeaderBoardRow(3, 8544935, 800, true, true, 1, 2, 3));
        log.debug("leaderBoardResult.size(): " + leaderBoardResult.size());

        getRequest().setAttribute("testList", leaderBoardResult);

        log.debug("Getting Leader board coders...");
        businessProcessing(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY,
            Constants.VIEW_LEADER_BOARD_PAGE);
    }
}
