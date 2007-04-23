package com.topcoder.web.common.dao.hibernate;

import java.util.List;

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

    @SuppressWarnings("unchecked")
    public List<IntroEvent> getList(int start, int maxRows) {
        return session.createQuery("from IntroEvent ie left join fetch ie.children order by ie.id desc")
            .setFirstResult(start)
            .setMaxResults(maxRows)
            .list();

        
    }
    public void saveOrUpdate(IntroEvent e) {
        super.saveOrUpdate(e);        
    }
    
    
}
