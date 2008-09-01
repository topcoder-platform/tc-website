package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06ContestProjects extends StatBase {

    public String getCommandName() {
        return "tccc06_contest_projects";
    }

    public String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tccc06/contest_projects.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
