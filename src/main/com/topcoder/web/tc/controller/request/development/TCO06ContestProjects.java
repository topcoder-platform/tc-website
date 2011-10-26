package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * @version $Revision: 57980 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 15, 2006
 */
public class TCO06ContestProjects extends StatBase {

    public String getCommandName() {
        return "tco06_contest_projects";
    }

    public String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tco06/contest_projects.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
