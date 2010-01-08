/*
* StudioLeaderboard
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudioLeaderboard extends StudioLeaderboardBase {

    private int[] placementPoints = new int[]{17, 15, 12, 10, 7, 5, 4};

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getMaxContests()
     */
    @Override
    protected int getMaxContests() {
        return 6;
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getPlacementPoints()
     */
    @Override
    protected int getPlacementPoints(int contestPlace) {
        if (contestPlace <= placementPoints.length) {
            return placementPoints[contestPlace - 1];
        }
        return 0;
    }
    
}
