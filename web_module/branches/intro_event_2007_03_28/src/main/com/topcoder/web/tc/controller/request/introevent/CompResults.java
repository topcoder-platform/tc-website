package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

/**
 * @author cucu
 */
public class CompResults extends Base {

    private static final int RESULTS_EXPIRATION_TIME = 1000 * 60 * 60;
    
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        
        String ct = getRequest().getParameter("ct");

        if(ct != null) {
            Request r = new Request();
            r.setContentHandle("college_tour_comp_results");
            r.setProperty("ct", Long.parseLong(ct) + "");
            
            getRequest().setAttribute("results", new CachedDataAccess(RESULTS_EXPIRATION_TIME, DBMS.TCS_OLTP_DATASOURCE_NAME).
                         getData(r).get("college_tour_comp_results"));
        }
        
        setNextIntroEventPage("compResults.jsp");
    }
}
