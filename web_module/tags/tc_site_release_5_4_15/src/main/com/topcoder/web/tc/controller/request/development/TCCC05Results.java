/*
 * TCCC05Results.java
 *
 * Created on January 5, 2005, 2:01 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author rfairfax
 */
public class TCCC05Results extends StatBase {

    String getCommandName() {
        return "tccc05_results";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tccc05/comp_results.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }
}
