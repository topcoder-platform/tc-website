/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
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
        //todo smarten this up.  if we do the sorting in memory, we wouldn't have to make a db hit for every
        //todo different sort.  we'd cache less, and hit the db less.  WAY better

        int projectTypeId;
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (hasParameter(Constants.PHASE_ID) && !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        if (!hasParameter(Constants.PHASE_ID)) {
            if (!getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(Constants.DESIGN_PROJECT_TYPE) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(Constants.DEVELOPMENT_PROJECT_TYPE) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(Constants.ASSEMBLY_PROJECT_TYPE)) {
                throw new TCWebException("invalid " + Constants.PROJECT_TYPE_ID + " parameter.");
            }
            
            projectTypeId = Integer.parseInt(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        } else {
            projectTypeId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111;
        }

        if (!hasParameter(Constants.CODER_ID)) {
            throw new TCWebException("parameter " + Constants.CODER_ID + " expected.");
        }

        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);
        getRequest().setAttribute(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));

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
            endRank = String.valueOf(Integer.parseInt(startRank) + Constants.DEFAULT_HISTORY - 1);
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
        r.setProperty(Constants.PROJECT_TYPE_ID, String.valueOf(projectTypeId));
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

        String handleType = ""; 
        switch (projectTypeId) {
            case 1:
                handleType = HandleTag.DESIGN;
                break;
            case 2:
                handleType = HandleTag.DEVELOPMENT;
                break;
            case 14:
                handleType = HandleTag.COMPONENT;
                break;
        }
        getRequest().setAttribute(Constants.TYPE_KEY, handleType);

        setNextPage(Constants.VIEW_COMPETITION_HISTORY_PAGE);
        setIsNextPageInContext(true);
    }
}
