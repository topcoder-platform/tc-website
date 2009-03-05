/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

/** 
 * Responsibility of this class is to process Mod Dash user results feed data 
 * and pass them to appropriate view. Most of the work is done by super class
 * which is supplied with feed URL and view file path. 
 * 
 * Main task that is done by this class is retrieval of user ID for user 
 * which results is to be presented.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration 1.1
 */
public class ModDashResults extends ModDashStatBase {
    /**
     * Name of request attribute from which user handle has to be taken.
     */
    private static String USER_HANDLE_ATTRIBUTE_NAME = "handle";
    
    /**
     * Returns URL that should be used for feed data retrieval.
     * @return feed URL
     */
    @Override
    protected String getFeedURL() {
        String userHandle = (String) getRequest().getParameter(USER_HANDLE_ATTRIBUTE_NAME);
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard_user_detail&dsid=34&json=true&handle=" + 
            userHandle;
    }
    
    /**
     * Returns view which should be used.
     * @return path to JSP file defining view
     */
    @Override
    protected String getPageName() {
        return "/tournaments/tco09/moddash/advancers/results.jsp";
    }
    
    /**
     * This method is responsible for retrieval of userID which results are
     * to be presented. Retrieved value is stored in request context.
     * @throws TCWebException when any exception occurs
     */
    @Override
    protected void statProcessing() throws TCWebException {
        String handle = (String) getRequest().getParameter(USER_HANDLE_ATTRIBUTE_NAME);
        Integer userId = getUserIdForHandle(handle);
        getRequest().setAttribute(USER_ID_PROPERTY_NAME, userId);
    }

}
