package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

/**
 * Display information about the component contest for the event.
 * 
 * @author Cucu
 */
public class CompInfo extends Base {
    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        setNextIntroEventPage("compInfo.jsp");

    }

}
