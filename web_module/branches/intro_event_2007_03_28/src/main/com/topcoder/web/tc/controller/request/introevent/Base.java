package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.tc.Constants;

public abstract class Base extends ShortHibernateProcessor {

    private Event event = null;
    
    private IntroEvent mainEvent = null;

    protected abstract void introEventProcessing() throws Exception;

    @Override
    protected void dbProcessing() throws Exception {
        String eid = getRequest().getParameter(Constants.EVENT_ID);
        
        if (eid == null) {
            throw new TCWebException("invalid request no event id specified");
        }

        Long eventId = new Long(eid);
        
        EventDAO edao =  DAOUtil.getFactory().getEventDAO();
        
        event = edao.find(eventId);
        
        if (event == null) {
            throw new TCWebException("Event not found: " + eid);
        }
        
        Integer type = event.getType().getId();
        
        if (type.equals(EventType.INTRO_EVENT_ID)) {
            // the event is already an intro event, so load in the main id this event again, but as an intro event
            mainEvent = (IntroEvent) event;
            
        } else if (type.equals(EventType.INTRO_EVENT_ALGO_ID) || type.equals(EventType.INTRO_EVENT_COMP_ID)) {
            mainEvent = (IntroEvent) event.getParent(); 
            
        } else {
            throw new TCWebException("Event must be any of intro event types, but was: " + type);
        }
        
        getRequest().setAttribute("event", event);
        getRequest().setAttribute("mainEvent", mainEvent);
        
        introEventProcessing();
    }

    
    protected void setNextIntroEventPage(String page) {
        setNextPage(mainEvent.getConfig(new Long(Constants.PAGES_BASE_PROP_ID)) + page);
        setIsNextPageInContext(true);
    }
    
    protected Event getEvent() {
        return event;
    }

    protected IntroEvent getMainEvent() {
        return mainEvent;
    }

}
