/*
* StudioLeaderboard
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tco08;

import com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudioLeaderboard extends StudioLeaderboardBase {

    private int[] placementPoints = new int[]{17, 15, 13, 10, 7};

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tco08";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getMaxContests()
     */
    @Override
    protected int getMaxContests() {
        return 5;
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
