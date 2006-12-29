package com.topcoder.web.common.dao.hibernate;

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

    public VisaLetterEvent find(Long eventId) {
        return (VisaLetterEvent) find(VisaLetterEvent.class, eventId);

    }

    public void saveOrUpdate(VisaLetterEvent event) {
        super.saveOrUpdate(event);
    }


}
