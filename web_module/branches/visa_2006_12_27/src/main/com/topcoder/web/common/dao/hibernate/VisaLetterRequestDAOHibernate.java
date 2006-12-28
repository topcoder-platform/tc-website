package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.common.model.VisaLetterRequest;

/**
 * @author cucu
 */
public class VisaLetterRequestDAOHibernate extends Base implements VisaLetterRequestDAO {

    public VisaLetterRequestDAOHibernate() {
        super();
    }

    public VisaLetterRequestDAOHibernate(Session session) {
        super(session);
    }

    public VisaLetterRequest find(Long userId, Long eventId) {
        Query q = session.createQuery(" from VisaLetterRequest " +
                " where user_id=" + userId +
                " and visa_letter_event_id=" + eventId +
                " order by request_date desc");
    
    	List l = q.list();
    	if (l.size() == 0) return null;
    	return (VisaLetterRequest) l.get(0);
    }

    public void saveOrUpdate(VisaLetterRequest req) {
        super.saveOrUpdate(req);
    }


}
