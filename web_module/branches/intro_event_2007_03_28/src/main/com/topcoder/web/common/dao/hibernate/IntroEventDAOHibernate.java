package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.IntroEventDAO;
import com.topcoder.web.common.model.IntroEvent;


/**
 * @author cucu
 */
public class IntroEventDAOHibernate extends Base implements IntroEventDAO {
    
    public IntroEventDAOHibernate() {
        super();
    }

    public IntroEventDAOHibernate(Session session) {
        super(session);
    }

    public IntroEvent find(Long id) {
        return (IntroEvent) super.find(IntroEvent.class, id);
    }

    public void saveOrUpdate(IntroEvent e) {
        super.saveOrUpdate(e);
        
    }
}
