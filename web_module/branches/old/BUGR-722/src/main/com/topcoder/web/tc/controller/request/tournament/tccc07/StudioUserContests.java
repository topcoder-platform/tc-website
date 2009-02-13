/*
* StudioUserContestsBase
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: StudioUserContests.java 63893 2007-08-06 17:40:41Z pulky $
 */
public class StudioUserContests extends StudioUserContestsBase {

    private int[] placementPoints = new int[]{17, 15, 12, 10, 7, 5, 4};

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getMaxContests()
     */
    @Override
    protected int getMaxContests() {
        return 6;
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
