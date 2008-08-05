package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.EventTypeDAO;
import com.topcoder.web.common.model.EventType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class EventTypeDAOHibernate extends Base implements EventTypeDAO {
    public EventTypeDAOHibernate() {
        super();
    }
    
    public EventTypeDAOHibernate(Session session) {
        super(session);
    }
    
    public EventType find(Integer id) {
        return (EventType) find(EventType.class, id);
    }
}
