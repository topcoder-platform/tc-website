/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.BaseProcessor;
import java.util.Map;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.common.model.SoftwareComponent;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr coders board.
 * 
 * @author pulky
 * @version 1.0
 */
public abstract class BaseBoard extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(BaseBoard.class);

    /**
     * Child must implement businessProcessing.
     */
     protected void businessProcessing() throws Exception  {
     }

    /**
     * private method to retrieve from DB current periods ids.
     */
    private String getCurrentPeriod(String period_id) throws Exception {
        Request r = new Request();
        r.setContentHandle(Constants.CURRENT_PERIOD_COMMAND);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer currentPeriod = (ResultSetContainer)m.get(Constants.CURRENT_PERIOD_QUERY);
        return (String.valueOf(currentPeriod.getLongItem(0, period_id)));
    }
     
    /**
     * Process the dr coders board request.
     * Retrieves coders list for development or design for a particular period.
     */
    protected void businessProcessing(String period_id, String command, String query, String nextpage) throws Exception {
        // Phase ID is required.
        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + period_id + " expected.");
        }

        if (!getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) && 
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        
        // if period is not available, get current one from DB.
        String period = null;
        if (!hasParameter(period_id)) {
            period = getCurrentPeriod(period_id);
        } else {
            period = getRequest().getParameter(period_id);
        }
        setDefault(period_id, period);   

        // Gets the rest of the optional parameters.
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Normalizes optional parameters and sets defaults
        if ("".equals(numRecords)) {
            numRecords = String.valueOf(Constants.DEFAULT_LEADERS);
        } else if (Integer.parseInt(numRecords) > Constants.MAX_LEADERS) {
            numRecords = String.valueOf(Constants.MAX_LEADERS);
        }
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

        if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);   

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            r.setProperty(DataAccessConstants.SORT_QUERY, query);            
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);   
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);   
        }
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        r.setProperty(period_id, period);
        r.setContentHandle(command);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer)m.get(query);
        log.debug("Got " +  board.size() + " rows for board");

        // crops data
        ResultSetContainer rsc = new ResultSetContainer(board, Integer.parseInt(startRank), 
            Integer.parseInt(startRank)+Integer.parseInt(numRecords)-1);
        
        // sets attributes for the jsp
        getRequest().setAttribute(Constants.CODER_LIST_KEY, rsc);
        getRequest().setAttribute(Constants.TYPE_KEY, 
            (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ? 
                HandleTag.DEVELOPMENT : HandleTag.DESIGN));
        
        setNextPage(nextpage);
        setIsNextPageInContext(true);
    }
}
