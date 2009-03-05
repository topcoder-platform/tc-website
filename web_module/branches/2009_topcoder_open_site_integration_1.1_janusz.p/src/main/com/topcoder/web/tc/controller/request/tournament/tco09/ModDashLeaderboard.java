package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ModDashStatBase;

public class ModDashLeaderboard extends ModDashStatBase {
    
    //private static String CONTEST_PREFIX = "tco09";

    @Override
    protected String getFeedURL() {
        return "http://66.37.210.86/tc?module=BasicData&c=dd_mod_dash_tco_leaderboard&dsid=34&json=true";
    }

    @Override
    protected String getPageName() {
        System.out.println("Geting next page");
        return "/tournaments/tco09/moddash/advancers/leaderboard.jsp";
    }

}
