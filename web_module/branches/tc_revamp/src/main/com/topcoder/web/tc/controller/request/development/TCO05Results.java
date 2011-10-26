/*
 * TCCC05Results.java
 *
 * Created on January 5, 2005, 2:01 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author rfairfax
 */
public class TCO05Results extends StatBase {

    public String getCommandName() {
        return "tco05_results";
    }

    public String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tco05/comp_results.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
    }
}
