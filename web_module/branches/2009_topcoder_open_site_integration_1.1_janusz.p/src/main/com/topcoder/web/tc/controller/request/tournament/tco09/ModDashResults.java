package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.text.SimpleDateFormat;
import java.util.Map;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

public class ModDashResults extends ModDashStatBase {
    

    private static String USER_HANDLE_ATTRIBUTE_NAME = "handle";
    @Override
    protected String getFeedURL() {
        String userHandle = (String) getRequest().getParameter(USER_HANDLE_ATTRIBUTE_NAME);
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard_user_detail&dsid=34&json=true&handle=" + 
            userHandle;
    }

    @Override
    protected String getPageName() {
        return "/tournaments/tco09/moddash/advancers/results.jsp";
    }
    
    @Override
    protected void statProcessing() throws TCWebException {
        String handle = (String) getRequest().getParameter(USER_HANDLE_ATTRIBUTE_NAME);
        Integer userId = getUserIdForHandle(handle);
        getRequest().setAttribute(USER_ID_PROPERTY_NAME, userId);
    }

}
