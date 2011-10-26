/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ModDashLeaderboardBase;

/**
 * <p>This class provides specific implementation for TCO09 Mod Dash leaderboard.</p>
 * <p>This processor will present the consolidated leaderboard.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public class ModDashLeaders extends ModDashLeaderboardBase {

    /**
     * <p>
     * This method returns TCO09 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO09 short description
     */
    @Override
    protected String getContestPrefix() {
        return Constants.TCO09_SHORT_DESC;
    }
}
