/*
 * USDCResults.java
 *
 * Created on June 9, 2004, 11:22 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author  rfairfax
 */
public class USDCMemberResults extends StatBase {

    String getCommandName() {
        return "usdc_member_results";
    }

    String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/dev/usdc_member_results.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
        getRequest().setAttribute("from", getRequest().getParameter("from"));
    }

}
