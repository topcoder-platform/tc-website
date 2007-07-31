/*
* StudioUserContestsBase
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudioUserContests extends StudioUserContestsBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }
}
