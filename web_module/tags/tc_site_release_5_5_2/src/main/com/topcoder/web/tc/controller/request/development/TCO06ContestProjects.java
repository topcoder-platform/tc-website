package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 15, 2006
 */
public class TCO06ContestProjects extends StatBase {

    String getCommandName() {
        return "tco06_contest_projects";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco06/contest_projects.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
