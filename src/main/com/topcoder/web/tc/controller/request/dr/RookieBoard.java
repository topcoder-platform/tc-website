/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import java.util.Map;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
        businessProcessing(Constants.SEASON_ID, Constants.ROOKIE_BOARD_COMMAND, Constants.ROOKIE_BOARD_QUERY,
            Constants.VIEW_ROOKIE_BOARD_PAGE);
    }
}
