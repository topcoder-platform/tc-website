/*
 * TCO04ProjectDetails.java
 *
 * Created on August 5, 2004, 12:16 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author rfairfax
 */
public class TCO04ProjectDetails extends StatBase {

    public String getCommandName() {
        return "tco04_project_details";
    }

    public String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tco04/project_det.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
