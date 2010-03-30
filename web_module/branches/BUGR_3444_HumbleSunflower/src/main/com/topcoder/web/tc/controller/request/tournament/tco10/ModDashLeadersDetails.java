/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.ModDashLeaderboardDetailsBase;

/**
 * <p>This class provides specific implementation for TCO10 Mod Dash leaderboard.</p>
 * <p>This processor will present the competition details for a particular competitor.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class ModDashLeadersDetails extends ModDashLeaderboardDetailsBase {

    /**
     * <p>
     * This method returns TCO10 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO10 short description
     */
    @Override
    protected String getContestPrefix() {
        return TCO10Constants.TCO10_SHORT_DESC;
    }
}
