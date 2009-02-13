package com.topcoder.web.tc.controller.request.introevent;

import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;

/**
 * Display a list of registrants for the event.
 * 
 * @author Cucu
 *
 */
public class ViewRegistrants extends Base {
    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID) &&
                !getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
            

        Event e = getEvent();
        getRequest().setAttribute("isComp", e.getType().getId().equals(EventType.INTRO_EVENT_COMP_ID));
        getRequest().setAttribute("isAlgo", e.getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID));

        List<Long> registrants = DAOUtil.getFactory().getEventDAO().getRegistrants(e.getId());
        getRequest().setAttribute("registrants", registrants);
        
        setNextIntroEventPage("viewRegistrants.jsp");

    }

}
