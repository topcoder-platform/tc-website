package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Show the results for the component competition.
 * 
 * @author cucu
 */
public class CompResults extends Base {

    private static final int RESULTS_EXPIRATION_TIME = 1000 * 60 * 60;
    
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        
        String ct = getRequest().getParameter("ct");

        // Find the contests for the event, to show the crumb with them.  
        // It stores the names and id for des and dev in separate lists.
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
            String id = rr.getStringItem("contest_id");
                                       
            if (pos < 0) {
                log.warn("Contest name format was expected to contain '"+ search + "'.  Contest id=" + id  + "  name=" + name);
            } else {
                name = name.substring(pos+search.length());
            }

            if (rr.getIntItem("phase_id") == 112) {
                if (id.equals(ct)) {
                    getRequest().setAttribute("context", "design");
                }
                desContests.add(new String[]{id, name} );
            } else {
                if (id.equals(ct)) {
                    getRequest().setAttribute("context", "development");
                }
                devContests.add(new String[]{id, name} );                    
            }
        }
        
        getRequest().setAttribute("desContests", desContests);
        getRequest().setAttribute("devContests", devContests);
        
        if(ct != null) {
            // if a contest was specified, find out the results
            r = new Request();
            r.setContentHandle("intro_event_comp_results");
            r.setProperty("ct", Long.parseLong(ct) + "");
            
            Map<String, ResultSetContainer> results = new CachedDataAccess(RESULTS_EXPIRATION_TIME, DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r);
            getRequest().setAttribute("results", results.get("intro_event_comp_results"));
        }
        
        getRequest().setAttribute("event", getEvent());
        setNextIntroEventPage("compResults.jsp");
    }
}
