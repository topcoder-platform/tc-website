/*
* StudioUserContestsBase
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tco08;

import com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: StudioContests.java 68101 2008-01-21 18:39:50Z pulky $
 */
public class StudioContests extends StudioUserContestsBase {

    private int[] placementPoints = new int[]{17, 15, 13, 10, 7};

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tco08";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getMaxContests()
     */
    @Override
    protected int getMaxContests() {
        return 5;
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getPlacementPoints()
     */
    @Override
    protected int getPlacementPoints(int contestPlace) {
        if (contestPlace <= placementPoints.length) {
            return placementPoints[contestPlace - 1];
        }
        return 0;
    }
}
