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

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 * 
 * @author pulky
 * @version 1.0
 */
public class LeaderBoard extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    /**
     * Retrieves data from the DB to show leader board.
     *
     * @param compType the competition type
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private Map getLeadersData(long compType) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.LEADER_BOARD_COMMAND);
        request.setProperty(Constants.PHASE_ID, String.valueOf(compType));
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);

        return dai.getData(request);
    }

    /**
     * Process the dr leader board request.
     * Retrieves leader list for development or design.
     */
    protected void businessProcessing() throws Exception {
        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + Constants.PHASE_ID + " expected.");
        }
        
        Map m = getLeadersData(getRequest().getParameter(Constants.PHASE_ID));
        
        ResultSetContainer leaderBoard = (ResultSetContainer)m.get(Constants.LEADER_BOARD_QUERY);

        log.debug("Got " +  leaderBoard.size() + " rows for leader board");

        getRequest().setAttribute(Constants.LEADER_LIST_KEY, 
                new ResultSetContainer(leaderBoard, 1, Constants.MAX_LEADERS));
        
        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);
    }
}
