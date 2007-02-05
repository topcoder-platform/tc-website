package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.EventDAO;
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
    
    public void saveOrUpdate(Event e) {
        super.saveOrUpdate(e);
    }
}
