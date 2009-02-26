package com.topcoder.web.common.dao.hibernate;

import java.util.List;

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

    
    public Contest find(Long id) {
        return (Contest) super.find(Contest.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<Contest> getCurrent() {
        return session.createQuery(
                "from com.topcoder.web.common.model.comp.Contest c " +
                "where current between c.startDate and c.endDate")                
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Contest> getCurrent(Integer phaseId) {
        return session.createQuery(
                "from com.topcoder.web.common.model.comp.Contest c " +
                "where current between c.startDate and c.endDate " +
                "and c.phaseId = :phaseId")        
                .setInteger("phaseId", phaseId)
                .list();
    }

    public void saveOrUpdate(Contest c) {
        super.saveOrUpdate(c);
    }
}
