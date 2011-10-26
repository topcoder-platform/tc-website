/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;

/**
 * <p>This class is a simple helper class that provides common functionality for TCO09 Studio leaderboard and 
 * leaderboard details pages.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1.1
 */
public final class StudioAdvancersHelper {

    /**
     * <p>An <code>int[]</code> containing the placement points for TCO09 Studio Track.</p>
     * <p>First element corresponds to first place, second element to second place and so on.</p>
     */
    private static final int[] placementPoints = new int[]{
        Constants.TCO09_STUDIO_PLACE_SCORE_1,
        Constants.TCO09_STUDIO_PLACE_SCORE_2,
        Constants.TCO09_STUDIO_PLACE_SCORE_3,
        Constants.TCO09_STUDIO_PLACE_SCORE_4,
        Constants.TCO09_STUDIO_PLACE_SCORE_5};

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
     * @return <code>int</code> containing the number of contests to consider.
     */
    protected static final int getMaxContests() {
        // Since there is no contest number limit like tco08, Integer.MAX_VALUE is returned.
        return Integer.MAX_VALUE;
    }

    /**
     * <p>This method returns the corresponding placement points for a given contest placement.</p>
     *
     * @param contestPlace an <code>int</code> containing placement within contest for tournament registrants.
     * @return <code>int</code> containing placement points.
     * @throws <code>IllegalArgumentException</code> if contest place is less than 1.
     */
    protected static final int getPlacementPoints(int contestPlace) {
        if (contestPlace < 1) {
            throw new IllegalArgumentException("contestPlace should be greater than zero");
        }
        if (contestPlace <= placementPoints.length) {
            return placementPoints[contestPlace - 1];
        }
        return 0;
    }
}
