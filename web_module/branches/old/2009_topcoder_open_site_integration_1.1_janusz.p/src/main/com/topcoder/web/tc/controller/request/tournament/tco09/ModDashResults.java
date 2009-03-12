/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
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
 * Feed URL is taken from configuration file. 
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ModDashResults extends ModDashStatBase {
    /**
     * Name of property from which leaderboard feed url will be read.
     */
    private final static String USER_RESULTS_FEED_URL_PROPERTY = "userResultsFeedURL";
    
    /**
     * Name of request attribute from which user handle has to be taken.
     */
    private static String USER_HANDLE_PARAMETER_NAME = "handle";
        
    /**
     * Method returns name of property with feed URL.
     * @throws TCWebException when any exception occurs
     */
    protected String getFeedUrlPropertyName() throws TCWebException {
        return USER_RESULTS_FEED_URL_PROPERTY;
    }
    
    /**
     * Adds user handle to feed.
     * @throws TCWebException when any exception occurs
     */
    protected String updateFeedUrl(String feedUrl) throws TCWebException {
        return feedUrl + getRequest().getParameter(USER_HANDLE_PARAMETER_NAME);
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
        String handle = (String) getRequest().getParameter(USER_HANDLE_PARAMETER_NAME);
        Integer userId = getUserIdForHandle(handle);
        getRequest().setAttribute(USER_ID_PROPERTY_NAME, userId);
    }

}
