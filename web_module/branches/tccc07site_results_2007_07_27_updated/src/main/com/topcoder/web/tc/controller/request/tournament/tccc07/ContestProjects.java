package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.request.development.StatBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ContestProjects extends StatBase {

    final String CONTEST_PREFIX = "tccc07";
    
    protected String getCommandName() {
        return "contest_projects";
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
