package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;

/**
 * @author cucu
 */
public class CompResults extends Base {

    protected void collegeTourProcessing() throws Exception {
        String ct = getRequest().getParameter("ct");

        if(ct != null) {
            Request r = new Request();
            r.setContentHandle("college_tour_comp_results");
            r.setProperty("ct", Long.parseLong(ct) + "");
            
            getRequest().setAttribute("results", getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true).getData(r).get("college_tour_comp_results"));
        }
        
        setNextPage("/collegetour/compResults.jsp");
        setIsNextPageInContext(true);
    }
}
