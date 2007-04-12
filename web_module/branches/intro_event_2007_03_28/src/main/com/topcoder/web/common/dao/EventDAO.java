package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface EventDAO {

    Event find(Long id);

    Event find(String shortDescription);

    List getEvents();

    List getEvents(EventType et);

    List getEvents(Integer eventTypeId);
    
    List getChildren(Long id);

    List<Event> getChildrenTypes(Long id);

    List<Long> getRegistrants(Long eventId);
        
    void saveOrUpdate(Event e);
}
