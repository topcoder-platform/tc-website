/*
 * TCO04MemberResults.java
 *
 * Created on August 5, 2004, 3:10 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 *
 * @author  rfairfax
 */
public class TCO04MemberResults extends StatBase {

    String getCommandName() {
        return "tco04_member_results";
    }

    String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco04/member_results.jsp";
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
        getRequest().setAttribute("from", getRequest().getParameter("from"));
    }

}
