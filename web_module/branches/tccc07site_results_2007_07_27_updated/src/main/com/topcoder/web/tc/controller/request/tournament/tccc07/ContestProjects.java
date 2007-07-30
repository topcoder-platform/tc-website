package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.request.development.StatBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 *          
 * To set up a new tournament just copy this class, change the contest prefix constant and
 * create the corresponding commands in query tool named:
 * - CONTEST_PREFIX + "_contest_projects"
 */
public class ContestProjects extends StatBase {

    final String CONTEST_PREFIX = "tccc07";
    
    protected String getCommandName() {
        return CONTEST_PREFIX + "_contest_projects";
    }

    protected String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + CONTEST_PREFIX + "/component/contestProjects.jsp";
    }

    protected void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
