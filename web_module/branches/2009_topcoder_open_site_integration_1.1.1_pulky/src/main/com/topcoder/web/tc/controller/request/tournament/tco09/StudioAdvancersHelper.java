/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;

/**
 * <p>This class provides specific implementation for TCO09 Studio leaderboard.</p>
 * <p>It will calculate points based on competition data and present a detailed list of contests for the specified 
 * competitor.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.2? (ToDo)
 */
public final class StudioAdvancersHelper {

    /**
     * <p>An <code>int[]</code> containing the placement points for TCO09 Studio Track.</p>
     */    
     // Todo: take this out of here
    private static final int[] placementPoints = new int[]{17, 15, 13, 10, 7};

    /**
     * <p>This method returns TCO09 short description.</p>
     * 
     * @return <code>String</code> containing the TCO09 short description.
     */
    protected static final String getContestPrefix() {
        return Constants.TCO09_SHORT_DESC;
    }

    /**
     * <p>This method returns the number of contests to be considered for the cumulative placement scoring.</p>
     * <p>Note: Although this is not required by TCO09 Studio rules, this method is mandatory in order to extend 
     * <code>StudioLeaderboardBase</code>. This is fixed returning <code>Integer.MAX_VALUE</code>.</p> 
     * 
     * @return <code>int</code> containing the number of contests to consider
     */
    protected static final int getMaxContests() {
        // TODO: improve
        // Since there is no contest limit like tco08, Integer.MAX_VALUE is returned
        return Integer.MAX_VALUE;
    }
    
    /**
     * <p>This method returns the corresponding placement points for a given contest placement.</p>
     * 
     * @param contestPlace an <code>int</code> containing placement within contest for tournament registrants.
     * @return <code>int</code> containing placement points .
     */
    protected static final int getPlacementPoints(int contestPlace) {
        if (contestPlace <= placementPoints.length) {
            return placementPoints[contestPlace - 1];
        }
        return 0;
    }
}
