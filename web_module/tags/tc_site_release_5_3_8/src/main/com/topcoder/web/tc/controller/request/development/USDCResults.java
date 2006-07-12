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
public class USDCResults extends StatBase {

    String getCommandName() {
        return "usdc_results";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/dev/usdc_results.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
