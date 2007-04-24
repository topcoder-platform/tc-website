package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.CompContestDAO;
import com.topcoder.web.common.model.comp.Contest;
 

/**
 * @author cucu
*/
public class CompContestDAOHibernate extends Base implements CompContestDAO {
    public CompContestDAOHibernate() {
        super();
    }

    public CompContestDAOHibernate(Session session) {
        super(session);
    }

    public int deleteForEvent(Long eventId) {
        return session.createQuery(
                "DELETE com.topcoder.web.common.model.comp.Contest c" +
                " WHERE c.event.id=:eventId" )
                .setLong("eventId", eventId)
                .executeUpdate();
    }

    
    public Contest find(Long id) {
        return (Contest) super.find(Contest.class, id);
    }

    public void saveOrUpdate(Contest c) {
        super.saveOrUpdate(c);
    }
}
