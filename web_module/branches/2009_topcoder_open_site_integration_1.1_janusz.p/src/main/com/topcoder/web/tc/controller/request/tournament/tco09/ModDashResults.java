package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

public class ModDashResults extends ModDashStatBase {
    
    //private static String CONTEST_PREFIX = "tco09";

    private static String USER_HANDLE_ATTRIBUTE_NAME;
    @Override
    protected String getFeedURL() {
        String userHandle = (String) getRequest().getAttribute(USER_HANDLE_ATTRIBUTE_NAME);
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard_user_detail&dsid=34&json=true&handle=" + 
            userHandle;
    }

    @Override
    protected String getPageName() {
        System.out.println("Geting next page");
        return "/tournaments/tco09/moddash/advancers/results.jsp";
    }

}
