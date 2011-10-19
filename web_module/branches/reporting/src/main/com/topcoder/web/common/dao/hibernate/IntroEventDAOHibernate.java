package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
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
        Query q = session.createQuery("from IntroEvent ie left join fetch ie.children order by ie.id desc");
        
        q.setFirstResult(start);
        
        if (maxRows > 0) {
            q.setMaxResults(maxRows);
        }
        return q.list();
    }
    
    public List<IntroEvent> getList() {
        return getList(0,0);
    }
    
    public void saveOrUpdate(IntroEvent e) {
        super.saveOrUpdate(e);        
    }
    
    
}
