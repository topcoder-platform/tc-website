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
    protected String getCurrentPeriod(String period_id) throws TCWebException {
        ResultSetContainer currentPeriod = runQuery(Constants.CURRENT_PERIOD_COMMAND, Constants.CURRENT_PERIOD_QUERY);
        return (String.valueOf(currentPeriod.getLongItem(0, period_id)));
    }

    /**
     * Process the dr coders board request.
     * Retrieves coders list for development or design for a particular period.
     */
    protected ResultSetContainer retrieveBoardData(String period_id, String command, String query) throws Exception {
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

        // Prepare request for data retrieval
        Request r = new Request();
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        r.setProperty(period_id, period);
        r.setContentHandle(command);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer)m.get(query);
        log.debug("Got " +  board.size() + " rows for board");

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.TYPE_KEY,
            (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ?
                HandleTag.DEVELOPMENT : HandleTag.DESIGN));

        return board;
    }

    protected ResultSetContainer runQuery(String command, String query) throws TCWebException {
        Request r = new Request();
        r.setContentHandle(command);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = null;
        try {
            m = dai.getData(r);
        } catch (Exception e) {
            throw new TCWebException("Command " + command + " failed.");
        }
        return (ResultSetContainer)m.get(query);
    }
}
