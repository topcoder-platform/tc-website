package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase;

/**
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ContestDetails extends ContestDetailsBase {
    private final String CONTEST_PREFIX = "tc08";

    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};

    private final int MAX_NUMBER_PROJECTS = 5;

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase#getPlacementPoints()
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase#getMax()
     */
    @Override
    public int getMax() {
        return MAX_NUMBER_PROJECTS;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }

}