package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/**
 * @author dok, pulky
 * @version $Revision: 68101 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ContestProjects extends ContestProjectsBase {

    private final String CONTEST_PREFIX = "tco09";

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }    
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getPageName()
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/online/contestProjects.jsp";
    }
}
