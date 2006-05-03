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
     * Child must implement businessProcessing.
     */
     protected void businessProcessing() throws Exception  {
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
            r.setProperty(DataAccessConstants.SORT_QUERY, "dr_points_history");            
        }
        r.setProperty(DataAccessConstants.START_RANK, startRank);                       
        r.setProperty(DataAccessConstants.END_RANK, 
            String.valueOf(Integer.parseInt(startRank)+Integer.parseInt(numRecords)-1));
        r.setProperty("cr", getRequest().getParameter("cr"));
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));        
        r.setContentHandle("dr_points_history");

        // retrieves data from DB
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer)m.get("dr_points_history");
       
        log.debug("Got " +  board.size() + " rows for board");
        ResultSetContainer rsc = new ResultSetContainer(board, r.getProperty(DataAccessConstants.START_RANK), 
            r.getProperty(DataAccessConstants.END_RANK), false);

        getRequest().setAttribute(Constants.CODER_LIST_KEY, rsc);
        getRequest().setAttribute(Constants.TYPE_KEY, 
            (getRequest().getParameter(Constants.PHASE_ID).equals(DEV_PHASE) ? 
                HandleTag.DEVELOPMENT : HandleTag.DESIGN));

        
        setNextPage("/dr/points_history.jsp");
        setIsNextPageInContext(true);
    }
}
