package com.topcoder.web.tc.controller.request.introevent;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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

        Request r = new Request();
        r.setContentHandle("intro_event_contests");
        r.setProperty("eid", getEvent().getId() + "");        
        ResultSetContainer contests = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("intro_event_contests");
        
        List<String[]> devContests = new ArrayList<String[]>();
        List<String[]> desContests = new ArrayList<String[]>();
        
        for(ResultSetContainer.ResultSetRow rr : contests) {
            String search = rr.getIntItem("phase_id") == 112? "- Design " : "- Development ";
            int pos = rr.getStringItem("contest_name").indexOf(search);
            String name = rr.getStringItem("contest_name");
            log.debug("contest name=" + name);
                                       
            if (pos < 0) {
                log.warn("Contest name format was expected to contain '"+ search + "'.  Contest id=" + rr.getStringItem("contest_id") + "  name=" + name);
            } else {
                name = name.substring(0, pos+search.length());
            }

            if (rr.getIntItem("phase_id") == 112) {
                desContests.add(new String[]{rr.getStringItem("contest_id"), name} );
            } else {
                devContests.add(new String[]{rr.getStringItem("contest_id"), name} );                    
            }
        }
        
        getRequest().setAttribute("desContests", desContests);
        getRequest().setAttribute("devContests", devContests);
        
        if(ct != null) {
            r = new Request();
            r.setContentHandle("intro_event_comp_results");
            r.setProperty("ct", Long.parseLong(ct) + "");
            
            Map<String, ResultSetContainer> results = new CachedDataAccess(RESULTS_EXPIRATION_TIME, DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r);
            getRequest().setAttribute("results", results.get("intro_event_comp_results"));
        }
        
        setNextIntroEventPage("compResults.jsp");
    }
}
