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
 * A processor to retrieve dr coders board.
 * 
 * @author pulky
 * @version 1.0
 */
public abstract class BaseBoard extends BaseProcessor {

    public final static String DEV_PHASE = "113";
    public final static String DESIGN_PHASE = "112";

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
     * Process the dr coders board request.
     * Retrieves coders list for development or design for a particular period.
     */
    protected void businessProcessing(String period_id, String command, String query, String nextpage) throws Exception {
        // Phase ID and Season ID are required.
        if (!hasParameter(period_id)) {
            throw new TCWebException("parameter " + period_id + " expected.");
        }
        
        if (!getRequest().getParameter(period_id).equals(DEV_PHASE) && 
            !getRequest().getParameter(period_id).equals(DESIGN_PHASE)) {
            throw new TCWebException("invalid " + period_id + " parameter.");
        }

        if (!hasParameter(Constants.SEASON_ID)) {
            throw new TCWebException("parameter " + Constants.SEASON_ID + " expected.");
        }

        setDefault(period_id, getRequest().getParameter(period_id));   
        setDefault(Constants.SEASON_ID, getRequest().getParameter(Constants.SEASON_ID));   

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
        }
        r.setProperty(DataAccessConstants.START_RANK, startRank);                       
        r.setProperty(DataAccessConstants.END_RANK, 
            String.valueOf(Integer.parseInt(startRank)+Integer.parseInt(numRecords)-1));
        r.setProperty(period_id, getRequest().getParameter(period_id));
        r.setProperty(Constants.SEASON_ID, getRequest().getParameter(Constants.SEASON_ID));
        r.setContentHandle(command);

        // retrieves data from DB
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer)m.get(query);
       
        log.debug("Got " +  board.size() + " rows for board");
        getRequest().setAttribute(Constants.CODER_LIST_KEY, board);
        getRequest().setAttribute(Constants.TYPE_KEY, 
            (getRequest().getParameter(period_id).equals(DEV_PHASE) ? 
                HandleTag.DEVELOPMENT : HandleTag.DESIGN));
        
        setNextPage(nextpage);
        setIsNextPageInContext(true);
    }
}
