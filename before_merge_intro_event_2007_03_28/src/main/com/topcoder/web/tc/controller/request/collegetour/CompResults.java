package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;

/**
 * @author cucu
 */
public class CompResults extends Base {

    private static final int RESULTS_EXPIRATION_TIME = 1000 * 60 * 60;

    protected void collegeTourProcessing() throws Exception {
        String ct = getRequest().getParameter("ct");

        if (ct != null) {
            Request r = new Request();
            r.setContentHandle("college_tour_comp_results");
            r.setProperty("ct", Long.parseLong(ct) + "");

            getRequest().setAttribute("results", new CachedDataAccess(RESULTS_EXPIRATION_TIME, DBMS.TCS_OLTP_DATASOURCE_NAME).
                    getData(r).get("college_tour_comp_results"));
        }

        setNextPage("/collegetour/compResults.jsp");
        setIsNextPageInContext(true);
    }
}
