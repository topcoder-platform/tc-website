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
     * Feed URL, this field is a placeholder for value taken from configuraiton file. 
     */
    private static String feedUrl;
    
    /**
     * Configuration namespace.
     */
    private final static String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.tournament.tco09.ModDash";
    
    /**
     * Name of property from which leaderboard feed url will be read.
     */
    private final static String USER_RESULTS_FEED_URL_PROPERTY = "userResultsFeedURL";
    
    /**
     * Name of request attribute from which user handle has to be taken.
     */
    private static String USER_HANDLE_ATTRIBUTE_NAME = "handle";
    
    /**
     * Initializes the feedUrl field with value read from configuration.
     * @throws TCWebException when any configuration error occurs
     */
    private static void initialize() throws TCWebException {
        ConfigManager configManager = ConfigManager.getInstance();
        try {
            feedUrl = (String) configManager.getProperty(DEFAULT_NAMESPACE, 
                    USER_RESULTS_FEED_URL_PROPERTY);
            if (feedUrl == null) {
                throw new TCWebException("Incorrect configuration, can't find " + USER_RESULTS_FEED_URL_PROPERTY + 
                        " property in " + DEFAULT_NAMESPACE + " namespace");                
            }
        } catch (UnknownNamespaceException e) {
            new TCWebException(e);
        }
    }
    
    /**
     * Returns URL that should be used for feed data retrieval.
     * @return feed URL
     */
    @Override
    protected String getFeedURL() throws TCWebException {
        if (feedUrl == null) {
            initialize();
        }
        String userHandle = (String) getRequest().getParameter(USER_HANDLE_ATTRIBUTE_NAME);
        return feedUrl + userHandle;
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
