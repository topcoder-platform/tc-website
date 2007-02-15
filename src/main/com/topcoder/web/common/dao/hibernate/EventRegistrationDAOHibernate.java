package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.EventRegistrationDAO;
import com.topcoder.web.common.model.EventRegistration;
import org.hibernate.Query;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 14, 2007
 */
public class EventRegistrationDAOHibernate extends Base implements EventRegistrationDAO {

    public EventRegistration find(Long userId, Long eventId) {

        StringBuffer query = new StringBuffer(100);
        query.append("FROM EventRegistration er ");
        query.append(" WHERE er.id.user.id = ?");
        query.append(" AND er.id.event.id = ?");
        Query q = session.createQuery(query.toString());
        q.setLong(0, userId.longValue());
        q.setLong(1, eventId.longValue());
        return (EventRegistration) q.uniqueResult();
    }
}
