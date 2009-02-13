package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ContestDetails extends ContestDetailsBase {
    final String CONTEST_PREFIX = "tccc07";

    final int[] placementPoints = new int[]{10, 7, 5, 4, 0};

    final int MAX_NUMBER_PROJECTS = 4;

    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

    @Override
    public int getMax() {
        return MAX_NUMBER_PROJECTS;
    }

    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }

}