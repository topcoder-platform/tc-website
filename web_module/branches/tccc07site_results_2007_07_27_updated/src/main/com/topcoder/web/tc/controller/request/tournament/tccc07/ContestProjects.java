package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ContestProjects extends ContestProjectsBase {

    final String CONTEST_PREFIX = "tccc07";

    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }
}
