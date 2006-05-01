/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.BaseProcessor;
import java.util.Map;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.tag.HandleTag;

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
        log.debug("Getting Leader board coders...");
        businessProcessing(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY,
            Constants.VIEW_LEADER_BOARD_PAGE);
    }
}
