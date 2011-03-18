/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco11;

import com.topcoder.web.tc.TCO11Constants;
import com.topcoder.web.tc.controller.request.tournament.ModDashLeaderboardDetailsBase;

/**
 * <p>This class provides specific implementation for TCO11 Mod Dash leaderboard.</p>
 * <p>This processor will present the competition details for a particular competitor.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class ModDashLeadersDetails extends ModDashLeaderboardDetailsBase {

    /**
     * <p>
     * This method returns TCO11 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO11 short description
     */
    @Override
    protected String getContestPrefix() {
        return TCO11Constants.TCO11_SHORT_DESC;
    }

    /**
     * Gets the page that will show the leaderboard
     *
     * @return the page
     */
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/moddash/leaderboardDetails.jsp";
    }
}
