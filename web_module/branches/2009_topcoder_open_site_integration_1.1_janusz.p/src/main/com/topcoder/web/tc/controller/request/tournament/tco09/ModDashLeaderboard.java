/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
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
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ModDashLeaderboard extends ModDashStatBase {
   
    /**
     * Returns URL that should be used for feed data retrieval.
     * @return feed URL
     */
    @Override
    protected String getFeedURL() {
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard&dsid=34&json=true";
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
