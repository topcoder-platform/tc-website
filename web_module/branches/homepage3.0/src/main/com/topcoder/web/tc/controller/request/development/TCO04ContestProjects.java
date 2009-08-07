/*
 * TCO04ContestProjects.java
 *
 * Created on August 5, 2004, 11:20 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author rfairfax
 */
public class TCO04ContestProjects extends StatBase {

    public String getCommandName() {
        return "tco04_contest_projects";
    }

    public String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tco04/contest_projects.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
