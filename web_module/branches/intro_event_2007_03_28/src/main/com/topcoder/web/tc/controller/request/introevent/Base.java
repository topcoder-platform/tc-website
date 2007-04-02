package com.topcoder.web.tc.controller.request.introevent;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
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
        
        
        event = retrieveEvent(eventId);
        
        if (event == null) {
            throw new TCWebException("Event not found: " + eid);
        }
        
        Integer type = event.getType().getId();
        
        if (type.equals(EventType.INTRO_EVENT_ID)) {
            mainEvent = retrieveMainEvent(eventId);
            
        } else if (type.equals(EventType.INTRO_EVENT_ALGO_ID) || type.equals(EventType.INTRO_EVENT_COMP_ID)) {
            mainEvent = retrieveMainEvent(event.getParent().getId()); 
            
        } else {
            throw new TCWebException("Event must be any of intro event types, but was: " + type);
        }
        
        getRequest().setAttribute("event", event);
        getRequest().setAttribute("mainEvent", mainEvent);
        
        introEventProcessing();
    }

    protected Event retrieveEvent(Long eventId) {
        return DAOUtil.getFactory().getEventDAO().find(eventId);
    }

    protected IntroEvent retrieveMainEvent(Long eventId) {
        return DAOUtil.getFactory().getIntroEventDAO().find(eventId);
    }

    protected void setNextIntroEventPage(String page) {
        setNextPage(mainEvent.getConfig(new Long(Constants.PAGES_BASE_PROP_ID)) + "/" + page);
        setIsNextPageInContext(true);
    }
    
    protected Event getEvent() {
        return event;
    }

    protected IntroEvent getMainEvent() {
        return mainEvent;
    }

}
