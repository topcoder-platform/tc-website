/*
 * TCO04Results.java
 *
 * Created on August 5, 2004, 10:35 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author  rfairfax
 */
public class TCO04Results extends StatBase {

    String getCommandName() {
        return "tco04_results";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco04/comp_results.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }

}
