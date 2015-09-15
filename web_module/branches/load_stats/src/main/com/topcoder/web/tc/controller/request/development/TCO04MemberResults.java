/*
 * TCO04MemberResults.java
 *
 * Created on August 5, 2004, 3:10 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;

/**
 * @author rfairfax
 */
public class TCO04MemberResults extends StatBase {

    public String getCommandName() {
        return "tco04_member_results";
    }

    public String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tco04/member_results.jsp";
    }

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
        getRequest().setAttribute("from", getRequest().getParameter("from"));
    }

}
