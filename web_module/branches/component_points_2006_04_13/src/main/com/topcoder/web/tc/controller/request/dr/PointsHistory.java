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
public class PointsHistory extends BaseProcessor {

    public final static String DEV_PHASE = "113";
    public final static String DESIGN_PHASE = "112";

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(PointsHistory.class);

    /**
     * Process the dr points history request.
     * Retrieves the points history list for development or design for a particular coder.
     */
     protected void businessProcessing() throws Exception  {
        // Phase ID and coder ID are required.
        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + Constants.PHASE_ID + " expected.");
        }

        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + Constants.PHASE_ID + " expected.");
        }
        
        if (!getRequest().getParameter(Constants.PHASE_ID).equals(DEV_PHASE) && 
            !getRequest().getParameter(Constants.PHASE_ID).equals(DESIGN_PHASE)) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }
        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));   

        // Gets the rest of the optional parameters.
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Normalizes optional parameters and sets defaults
        if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);   
        
        if ("".equals(endRank)) {
            endRank = String.valueOf(Integer.parseInt(startRank) + Constants.DEFAULT_HISTORY);
        } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > Constants.MAX_HISTORY) {
            endRank = String.valueOf(Integer.parseInt(startRank) + Constants.DEFAULT_HISTORY);
        }
        setDefault(DataAccessConstants.END_RANK, endRank);

        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));   
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));   
        setDefault(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));   

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            r.setProperty(DataAccessConstants.SORT_QUERY, Constants.POINTS_HISTORY_QUERY);            
        }
        r.setProperty(DataAccessConstants.START_RANK, startRank);                       
        r.setProperty(DataAccessConstants.END_RANK, endRank);
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));        
        r.setContentHandle(Constants.POINTS_HISTORY_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer)m.get(Constants.POINTS_HISTORY_QUERY);
        log.debug("Got " +  board.size() + " rows for points history");
        
        // crops data
        ResultSetContainer rsc = new ResultSetContainer(board, 
            Integer.parseInt(r.getProperty(DataAccessConstants.START_RANK)), 
                Integer.parseInt(r.getProperty(DataAccessConstants.END_RANK)));

        getRequest().setAttribute(Constants.CODER_LIST_KEY, rsc);
        getRequest().setAttribute(Constants.TYPE_KEY, 
            (getRequest().getParameter(Constants.PHASE_ID).equals(DEV_PHASE) ? 
                HandleTag.DEVELOPMENT : HandleTag.DESIGN));
        
        setNextPage(Constants.VIEW_POINTS_HISTORY_PAGE);
        setIsNextPageInContext(true);
    }
}
