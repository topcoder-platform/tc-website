package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

/**
 * Display information about the algorithm contest for the event.
 * 
 * @author Cucu
 */
public class AlgoInfo extends Base {
    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        setNextIntroEventPage("algoInfo.jsp");

    }

}
