/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve competition history.
 *
 * @author pulky
 * @version 1.0
 */
public class CompetitionHistory extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(CompetitionHistory.class);

    /**
     * Process the competition history request.
     * Retrieves the competition history list for development or design for a particular coder.
     */
    protected void businessProcessing() throws Exception {
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // Phase ID and coder ID are required.
        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + Constants.PHASE_ID + " expected.");
        }

        if (!hasParameter(Constants.CODER_ID)) {
            throw new TCWebException("parameter " + Constants.CODER_ID + " expected.");
        }

        if (!getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }
        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        setDefault(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));

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
            endRank = String.valueOf(Integer.parseInt(startRank) + Constants.MAX_HISTORY);
        }
        setDefault(DataAccessConstants.END_RANK, endRank);

        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            r.setProperty(DataAccessConstants.SORT_QUERY, Constants.COMPETITION_HISTORY_QUERY);
        }
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        r.setContentHandle(Constants.COMPETITION_HISTORY_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer history = (ResultSetContainer) m.get(Constants.COMPETITION_HISTORY_QUERY);
        if (log.isDebugEnabled()) {
            log.debug("Got " + history.size() + " rows for competition history");
        }

        // crops data
        ResultSetContainer rsc = new ResultSetContainer(history, Integer.parseInt(startRank),
                Integer.parseInt(endRank));

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.HISTORY_LIST_KEY, rsc);
        getRequest().setAttribute(Constants.TYPE_KEY,
                (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ?
                        HandleTag.DEVELOPMENT : HandleTag.DESIGN));

        setNextPage(Constants.VIEW_COMPETITION_HISTORY_PAGE);
        setIsNextPageInContext(true);
    }
}
