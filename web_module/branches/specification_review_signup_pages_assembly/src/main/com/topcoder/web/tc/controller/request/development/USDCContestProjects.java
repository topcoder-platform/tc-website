/*
 * USDCResults.java
 *
 * Created on June 9, 2004, 11:22 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author rfairfax
 */
public class USDCContestProjects extends StatBase {

    public String getCommandName() {
        return "usdc_contest_projects";
    }

    public String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/dev/usdc_contest_projects.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
