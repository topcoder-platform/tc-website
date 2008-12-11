package com.topcoder.web.common.dao;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;

/**
 * @author dok
 * @version $Revision: 60521 $ Date: 2005/01/01 00:00:00
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
        
    Date[] getComponentContestDates(Long eventId);
    
    void deleteContests(Event e);

    void saveOrUpdate(Event e);
}
