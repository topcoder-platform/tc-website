package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

public class ModDashLeaderboard extends ModDashStatBase {
    
    //private static String CONTEST_PREFIX = "tco09";

    @Override
    protected String getFeedURL() {
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard&dsid=34&json=true";
    }

    @Override
    protected String getPageName() {
        return "/tournaments/tco09/moddash/advancers/leaderboard.jsp";
    }
        
    @Override
    protected void statProcessing() throws TCWebException {
        JSONArray feedData = (JSONArray) getRequest().getAttribute(WEB_REQUEST_DATA_PARAMETER_NAME);
        for (int i=0; i < feedData.getSize(); i++) {
            // process feed row
            JSONObject row = feedData.getJSONObject(i);
            String handle = row.getString(USER_HANDLE_KEY);
            row.setInt(USER_ID_PROPERTY_NAME, getUserIdForHandle(handle));
        }
        getRequest().setAttribute(WEB_REQUEST_DATA_PARAMETER_NAME, feedData);
    }

}
