/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;

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
        log.debug("Getting rookie board coders...");
        businessProcessing(Constants.SEASON_ID, Constants.ROOKIE_BOARD_COMMAND, Constants.ROOKIE_BOARD_QUERY,
            Constants.VIEW_ROOKIE_BOARD_PAGE);
    }
}
