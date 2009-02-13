/*
 * TCCC05ContestProjects.java
 *
 * Created on January 5, 2005, 3:02 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author rfairfax
 */
public class TCCC05ContestProjects extends StatBase {

    String getCommandName() {
        return "tccc05_contest_projects";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tccc05/contest_projects.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
