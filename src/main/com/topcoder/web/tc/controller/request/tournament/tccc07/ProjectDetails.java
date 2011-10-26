package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.ProjectDetailsBase;

/**
 * @author dok, pulky
 * @version $Revision: 63893 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ProjectDetails extends ProjectDetailsBase {

    private final String CONTEST_PREFIX = "tccc07";

    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ProjectDetailsBase#getPlacementPoints()
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ProjectDetailsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }

}
