package com.topcoder.web.tc.controller.request.introevent;

import java.sql.Timestamp;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

/**
 * Display an overview of the algorithm competition.
 * 
 * @author Cucu
 */
public class AlgoOverview extends Base {
    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        
        Timestamp codingStart = getMainEvent().getRoundStart();
        Timestamp sysTestEnd = getMainEvent().getRoundEnd();
        
        getRequest().setAttribute("contestName",  getMainEvent().getRoundName());
        getRequest().setAttribute("roundStart", codingStart);
        getRequest().setAttribute("sysTestEnd", sysTestEnd);
        getRequest().setAttribute("eventStart", new Timestamp(codingStart.getTime()+(getMainEvent().getEventStartDelta()*1000*60)));
        getRequest().setAttribute("eventEnd", new Timestamp(codingStart.getTime()+(getMainEvent().getEventEndDelta()*1000*60)));
        getRequest().setAttribute("resultsTime", new Timestamp(sysTestEnd.getTime()+(getMainEvent().getResultsDelta())*1000*60));

        setNextIntroEventPage("algoOverview.jsp");

    }
}
