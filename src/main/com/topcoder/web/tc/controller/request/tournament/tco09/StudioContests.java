/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase;

/**
 * <p>This class provides specific implementation for TCO09 Studio leaderboard details page.</p>
 * <p>It will calculate points based on competition data and present a detailed list of contests for the specified
 * competitor.</p>
 *
 * <p>Note: this class was changed to delegate to a simple helper class <code>StudioAdvancersHelper</code> in order to
 * avoid duplicating code in <code>StudioLeaders</code> class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1.1
 */
public class StudioContests extends StudioUserContestsBase {

    /**
     * <p>This method returns TCO09 short description.</p>
     * <p>Note: to avoid code duplication, this method will delegate to a simple helper class.</p>
     *
     * @return <code>String</code> containing the TCO09 contest prefix.
     */
    @Override
    protected String getContestPrefix() {
        return StudioAdvancersHelper.getContestPrefix();
    }

    /**
     * <p>This method returns the number of contests to be considered for the cumulative placement scoring.</p>
     * <p>Although this is not strictly required by TCO09 Studio rules, this method is required in order to extend
     * <code>StudioLeaderboardBase</code>. This is worked around returning <code>Integer.MAX_VALUE</code>.</p>
     * <p>Note: to avoid code duplication, this method will delegate to a simple helper class.</p>
     *
     * @return <code>int</code> containing the number of contests to consider.
     */
    @Override
    protected int getMaxContests() {
        return StudioAdvancersHelper.getMaxContests();
    }

    /**
     * <p>This method returns the corresponding placement points for a given contest placement.</p>
     * <p>Note: to avoid code duplication, this method will delegate to a simple helper class.</p>
     *
     * @param contestPlace an <code>int</code> containing the placement within a particular contest for tournament
     * registrants.
     * @return <code>int</code> containing the corresponding placement points.
     */
    @Override
    protected int getPlacementPoints(int contestPlace) {
        return StudioAdvancersHelper.getPlacementPoints(contestPlace);
    }

    /**
     * <p>This method returns the path to the corresponding JSP that will be shown.</p>
     *
     * <p>Note: complete parameter is no longer used since current and completed contest pages
     * were unified. It is still in this method signature due to compatibility issues.</p>
     *
     * @param complete an <code>Integer</code> specifying if the requested contest has completed. 
     * (1-complete, 0-incomplete)
     * @return <code>String</code> containing the complete path to the corresponding JSP
     */
    @Override
    protected String getPageName(Integer complete) {
        return Constants.TCO09_STUDIO_LEADERBOARD_DETAILS_PAGE;
    }
}
