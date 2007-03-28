package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.Request;

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
            
            getRequest().setAttribute("results", getDataAccess().getData(r).get("college_tour_comp_results"));
        }
        
        setNextPage("/collegetour/compResults.jsp");
        setIsNextPageInContext(true);
    }
}
