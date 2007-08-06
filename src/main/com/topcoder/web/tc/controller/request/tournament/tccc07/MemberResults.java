package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.MemberResultsBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
*/
public class MemberResults extends MemberResultsBase {

    final String CONTEST_PREFIX = "tccc07";

    final int[] placementPoints = new int[]{10, 7, 5, 4, 0};
    
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }
}
