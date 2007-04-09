package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;
 

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

    public Event find(String shortDescription) {
        StringBuffer query = new StringBuffer(100);
        query.append("from Event");
        query.append(" where shortDescription = ?");
        Query q = session.createQuery(query.toString());
        q.setString(0, shortDescription);
        return (Event) q.uniqueResult();
    }

    public List getEvents() {
        return findAll(Event.class);
    }

    public List getEvents(EventType et) {
        return getEvents(et.getId());
    }

    public List getEvents(Integer eventTypeId) {
        StringBuffer query = new StringBuffer(100);
        query.append("from Event");
        query.append(" where type.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, eventTypeId.intValue());
        return q.list();
    }

    public List getChildren(Long id) {
        StringBuffer query = new StringBuffer(100);
        query.append("from Event e");
        query.append(" where e.parent.id = ?");
        Query q = session.createQuery(query.toString());
        q.setLong(0, id);
        return q.list();
    }

    public void saveOrUpdate(Event e) {
        super.saveOrUpdate(e);
    }

    @SuppressWarnings("unchecked")
    public List<Long> getRegistrants(Long eventId) {
        Query q = session.createQuery("select e.id.user.id from EventRegistration e where e.id.event.id = :eventId");
        q.setLong("eventId", eventId);
        return (List<Long>) q.list();
    }
}
