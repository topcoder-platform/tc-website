package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.model.VisaLetterEvent;

/**
 * @author cucu
 */
public class VisaLetterEventDAOHibernate extends Base implements VisaLetterEventDAO {

    public VisaLetterEventDAOHibernate() {
        super();
    }

    public VisaLetterEventDAOHibernate(Session session) {
        super(session);
    }

	public VisaLetterEvent findCurrent() {
    	List l = getAll();
    	if (l.size() == 0) return null;
    	return (VisaLetterEvent) l.get(0);		
	}

    public VisaLetterEvent find(Long eventId) {
        return (VisaLetterEvent) find(VisaLetterEvent.class, eventId);

    }

    public List getAll() {
        Query q = session.createQuery(" from VisaLetterEvent " +
        	" order by request_start_date desc");
        
        return q.list();
	}
    

    public void saveOrUpdate(VisaLetterEvent event) {
        super.saveOrUpdate(event);
    }


}
