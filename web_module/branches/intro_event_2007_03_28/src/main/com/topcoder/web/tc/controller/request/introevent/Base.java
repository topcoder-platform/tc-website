package com.topcoder.web.tc.controller.request.introevent;

import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.common.model.ImageInfo;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.tc.Constants;

/**
 * Base class for introductory event processors.
 * It expects a parameter eid with the event id.  This is usually an algo or component event, whose parent (mainEvent) is
 * an introductory event.  
 * 
 * 
 * @author Cucu
 *
 */
public abstract class Base extends ShortHibernateProcessor {

    private Event event = null;    
    private IntroEvent mainEvent = null;
    private Long algoEventId = null;
    private Long compEventId = null;

    protected abstract void introEventProcessing() throws Exception;

    @Override
    protected void dbProcessing() throws Exception {
        String eid = getRequest().getParameter(Constants.EVENT_ID);
        
        if (eid == null) {
            throw new TCWebException("invalid request no event id specified");
        }

        Long eventId = new Long(eid);
        
        
        event = DAOUtil.getFactory().getEventDAO().find(eventId);
        
        if (event == null) {
            throw new TCWebException("Event not found: " + eid);
        }
        
        Integer type = event.getType().getId();
        
        if (type.equals(EventType.INTRO_EVENT_ID)) {
            mainEvent = DAOUtil.getFactory().getIntroEventDAO().find(eventId);
            
        } else if (type.equals(EventType.INTRO_EVENT_ALGO_ID) || type.equals(EventType.INTRO_EVENT_COMP_ID)) {
            mainEvent = DAOUtil.getFactory().getIntroEventDAO().find(event.getParent().getId()); 
            
        } else {
            throw new TCWebException("Event must be any of intro event types, but was: " + type);
        }
        
        // Check if there are algo and/or component events
        Query q = HibernateUtils.getSession().createQuery("select e.id, e.type.id from Event e where e.parent.id=:eventId");
        q.setLong("eventId", mainEvent.getId());
        
        List<Object[]> children = DAOUtil.getFactory().getEventDAO().getChildrenTypes(mainEvent.getId());
        
        for(Object[] child : children) {
            Object t = (Integer) (child[1]);
            
            if (t.equals(EventType.INTRO_EVENT_ALGO_ID)) {
                algoEventId = (Long) (child[0]);                
            }
            if (t.equals(EventType.INTRO_EVENT_COMP_ID)) {
                compEventId = (Long) (child[0]);                
            }
        }

        // Set up the event image
        Image img = mainEvent.getImage();
        
        if (img != null) {
            ImageInfo image = new ImageInfo();
            if (img.getHeight() != null) {
                image.setHeight(img.getHeight());
            }
            if (img.getWidth() != null) {
                image.setWidth(img.getWidth());
            }
            image.setLink(img.getLink());
            image.setSrc(img.getPath().getPath() + img.getFileName());
            getRequest().setAttribute("image", image);
        }
        
        
        getRequest().setAttribute("algoEventId", algoEventId);
        getRequest().setAttribute("compEventId", compEventId);
        getRequest().setAttribute("eid", eventId);
        getRequest().setAttribute("event", event);
        getRequest().setAttribute("mainEvent", mainEvent);
        
        introEventProcessing();
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
