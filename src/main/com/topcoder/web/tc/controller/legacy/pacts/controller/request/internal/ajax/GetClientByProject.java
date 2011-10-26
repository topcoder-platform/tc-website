/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * <p>A controller for handling the requests for getting the details for client matching the requested project ID.</p>
 *
 * @author isv
 * @version 1.0 (Miscellaneous TC Improvements Assembly v1.0)
 */
public class GetClientByProject extends BaseProcessor implements PactsConstants {

    /**
     * <p>Constructs new <code>GetClientByProject</code> instance. This implementation does nothing.</p>
     */
    public GetClientByProject() {
    }

    /**
     * <p>Implements the business logic which is to find the client matching the project ID.</p>
     *
     * @throws Exception if an unexpected error occurs which prevents request from successful processing.
     */
    @Override
    protected void businessProcessing() throws Exception {
        String projectId = getRequest().getParameter("project_id");
        try {
            if (projectId != null && projectId.trim().length() > 0) {
                Request r = new Request();
                r.setContentHandle("pacts_client_by_project");
                r.setProperty("pj", getRequest().getParameter("project_id"));
                DataAccessInt da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

                ResultSetContainer clientInfo = da.getData(r).get("pacts_client_by_project");
                getRequest().setAttribute("clientInfo", clientInfo);
            }
        } catch (Exception e) {
            log.error("Failed to resolve client for project ID: " + projectId, e);
        }

        setNextPage(INTERNAL_AJAX_CLIENT_BY_PROJECT);
        setIsNextPageInContext(true);
    }
}
