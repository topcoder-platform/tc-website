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

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }
}
