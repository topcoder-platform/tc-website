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

        if (!hasParameter(Constants.STAGE_ID)) {
            throw new TCWebException("parameter " + Constants.STAGE_ID + " expected.");
        }

        Request request = new Request();

        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
        }

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        if ("".equals(numRecords)) {
            numRecords = "50";
        } else if (Integer.parseInt(numRecords)>200) {
            numRecords="200";
        }
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

        if ("".equals(startRank)||Integer.parseInt(startRank)<=0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);   

        r.setProperty(DataAccessConstants.START_RANK, startRank);                       
        r.setProperty(DataAccessConstants.END_RANK,                                     
            String.valueOf(Integer.parseInt(startRank)+Integer.parseInt(numRecords)-1));

        request.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        request.setProperty(Constants.STAGE_ID, getRequest().getParameter(Constants.STAGE_ID));
        request.setContentHandle(Constants.LEADER_BOARD_COMMAND);

        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);

        Map m = dai.getData(request);

        ResultSetContainer leaderBoard = (ResultSetContainer)m.get(Constants.LEADER_BOARD_QUERY);

        log.debug("Got " +  leaderBoard.size() + " rows for leader board");

        getRequest().setAttribute(Constants.LEADER_LIST_KEY, leaderBoard);
        
        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);
    }
}
