/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

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
public class OutstandingProjects extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(OutstandingProjects.class);

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

        // Gets the rest of the optional parameters.
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            if (hasParameter(Constants.STAGE_ID)) {
                r.setProperty(DataAccessConstants.SORT_QUERY, "stage_outstanding_projects");
            } else if (hasParameter(Constants.SEASON_ID)) {
                r.setProperty(DataAccessConstants.SORT_QUERY, "season_outstanding_projects");
            } else {
                r.setProperty(DataAccessConstants.SORT_QUERY, "outstanding_projects");
            }
        }
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        if (hasParameter(Constants.STAGE_ID)) {
            r.setProperty(Constants.STAGE_ID, getRequest().getParameter(Constants.STAGE_ID));
            r.setContentHandle("stage_outstanding_projects");
        } else if (hasParameter(Constants.SEASON_ID)){
            r.setProperty(Constants.SEASON_ID, getRequest().getParameter(Constants.SEASON_ID));
            r.setContentHandle("season_outstanding_projects");
        } else {
            r.setContentHandle("outstanding_projects");
        }

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer history;
        if (hasParameter(Constants.STAGE_ID)) {
             history = (ResultSetContainer) m.get("stage_outstanding_projects");
        } else if (hasParameter(Constants.SEASON_ID)){
            history = (ResultSetContainer) m.get("season_outstanding_projects");
        } else {
            history = (ResultSetContainer) m.get("outstanding_projects");
        }
        if (log.isDebugEnabled()) {
            log.debug("Got " + history.size() + " rows for competition history");
        }

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.HISTORY_LIST_KEY, history);
        getRequest().setAttribute(Constants.TYPE_KEY,
                (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ?
                        HandleTag.DEVELOPMENT : HandleTag.DESIGN));

        setNextPage("/dr/outstanding_projects.jsp");
        setIsNextPageInContext(true);
    }
}
