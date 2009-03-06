/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

/** 
 * Responsibility of this class is to process Mod Dash leaderboard feed data 
 * and pass them to appropriate view. Most of the work is done by super class
 * which is supplied with feed URL and view file path. 
 * 
 * Main task that is done by this class is regarded to processing retrieved 
 * feed data. For each user from leaderboard its user_id is retrieved from db.
 * This is done in order to allow pretty rendering of user handle.  
 * 
 * Feed URL is taken from configuration file. 
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ModDashLeaderboard extends ModDashStatBase {
   
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
    private final static String LEADERBOARD_FEED_URL_PROPERTY = "leaderboardFeedURL";
    
    /**
     * Initializes the feedUrl field with value read from configuration.
     * @throws TCWebException when any configuration error occurs
     */
    private static synchronized void initialize() throws TCWebException {
        ConfigManager configManager = ConfigManager.getInstance();
        try {
            feedUrl = (String) configManager.getProperty(DEFAULT_NAMESPACE, 
                    LEADERBOARD_FEED_URL_PROPERTY);

            System.out.println("feedurl (static): przed sprawdzeniem" + feedUrl + " ---- " + (feedUrl == null ? "null" : "nie null"));
            if (feedUrl == null) {
                throw new TCWebException("Incorrect configuration, can't find " + LEADERBOARD_FEED_URL_PROPERTY + 
                        " property in " + DEFAULT_NAMESPACE + " namespace");                
            }
            System.out.println("feedurl (static): " + feedUrl);
            
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
        System.out.println("FeedUrl: " + feedUrl);
        return feedUrl;
    }

    /**
     * Returns view which should be used.
     * @return path to JSP file defining view
     */
    @Override
    protected String getPageName() {
        return "/tournaments/tco09/moddash/advancers/leaderboard.jsp";
    }
        
    /**
     * This method is responsible for retrieval of userIDs for each user 
     * that competed in Mod Dash. 
     * @throws TCWebException when any exception occurs
     */
    @Override
    protected void statProcessing() throws TCWebException {
        // get feedData (it will be retrieved by abstract class)
        JSONArray feedData = (JSONArray) getRequest().getAttribute(WEB_REQUEST_DATA_PARAMETER_NAME);
        for (int i=0; i < feedData.getSize(); i++) {
            // process feed row
            JSONObject row = feedData.getJSONObject(i);
            String handle = row.getString(USER_HANDLE_KEY);
            row.setInt(USER_ID_PROPERTY_NAME, getUserIdForHandle(handle));
        }
    }

}
