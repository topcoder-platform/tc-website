package com.topcoder.web.common.dao.hibernate;

import java.util.Calendar;
import java.util.GregorianCalendar;
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
        Query q = session.createQuery(" from VisaLetterEvent " +
                " where request_start_date <= current " +
                " and request_end_date >= current" +
                " order by request_start_date desc");

        List l = q.list();
        if (l.size() == 0) return null;
        return (VisaLetterEvent) l.get(0);
    }

    public List findShowStatus() {
        Query q = session.createQuery(" from VisaLetterEvent " +
                " where request_start_date <= current " +
                " and request_end_date >= :endDate" +
                " order by request_start_date desc");

        Calendar c = new GregorianCalendar();
        c.add(Calendar.MONTH, -1);
        
        q.setCalendar("endDate", c);
        return q.list();
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
