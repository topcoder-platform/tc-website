/*
 * Copyright (C) 2005-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.studio.Constants;

import java.util.Map;

/**
 * <p>A controller for servicing the requests for viewing <code>Active Contests</code> page for <code>Studio</code> 
 * website.</p>
 *
 * <p>
 * Version 1.1 (Replatforming Studio Release 1 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated the {@link #businessProcessing()} method to set the request with list of contests which have 
 *     eligibility constraints and flags indicating if current user is granted permission to access those contests or
 *     not.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, isv
 * @version 1.1
 */
public class ViewActiveContests extends BaseProcessor {

    /**
     * <p>Implements the logic for processing the request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        long userId = getUser().getId();
        
        //load up the contests
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_active_contests");
        r.setProperty("uid", String.valueOf(userId));

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "studio_active_contests");
        }

        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        ResultSetContainer contestsContainer = da.getData(r).get("studio_active_contests");
        getRequest().setAttribute("contests", contestsContainer);

        /*Map<Long, Boolean> eligibilityCheckResults 
            = EligibilityServiceHelper.checkContestsEligibility(contestsContainer, getLoggedInUser().getId());
        getRequest().setAttribute("eligibility", eligibilityCheckResults);*/

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/activeContests.jsp");
        setIsNextPageInContext(true);
    }
}
