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
public class USDCProjectDetails extends StatBase {

    public String getCommandName() {
        return "usdc_project_details";
    }

    public String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/dev/usdc_project_det.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
