package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.Event;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventDAOHibernate extends Base implements EventDAO {
    public EventDAOHibernate() {
        super();
    }
    
    public EventDAOHibernate(Session session) {
        super(session);
    }
    
    public Event find(Long id) {
        return (Event) super.find(Event.class, id);
    }

    public List getEvents() {
        return findAll(Event.class);
    }
    
    public void saveOrUpdate(Event e) {
        super.saveOrUpdate(e);
    }
}
