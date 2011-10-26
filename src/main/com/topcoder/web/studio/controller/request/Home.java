/*
 * Copyright (C) 2005-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.studio.Constants;

import java.util.Map;

/**
 * <p>A controller for servicing the requests for viewing <code>Home</code> page for <code>Studio</code> website.</p>
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
public class Home extends BaseProcessor {

    /**
     * <p>Implements the logic for processing the request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {

        Request r = new Request();
       // r.setContentHandle("studio_home_data");
       // r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        r.setContentHandle("studio_active_contests");
        r.setProperty("uid",  String.valueOf(getUser().getId()));

        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Map<String, ResultSetContainer> data = dai.getData(r);
        getRequest().setAttribute("studio_home_data", data);

       // Map<Long, Boolean> eligibilityCheckResults 
       //     = EligibilityServiceHelper.checkContestsEligibility(data.get("studio_active_contests"), 
       //                                                         getLoggedInUser().getId());
       // getRequest().setAttribute("eligibility", eligibilityCheckResults);

        if (userIdentified()) {
            DataAccess tco08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco08Request = new Request();
            tco08Request.setProperty("cr", String.valueOf(getUser().getId()));

            tco08Request.setContentHandle("tco08studio_info");
            getRequest().setAttribute("tco08studio_info",
                    tco08Dai.getData(tco08Request).get("tco08studio_info"));
        }

        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
}