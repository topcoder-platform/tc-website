/*
 * TCO04ContestDetails.java
 *
 * Created on August 5, 2004, 12:24 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author  rfairfax
 */
public class TCO04ContestDetails extends StatBase {


    String getCommandName() {
        return "tco04_contest_details";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco04/contest_det.jsp";
    }

    void statProcessing() {
    }

}
