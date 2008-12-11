package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.dao.ContestPrizeDAO;
import com.topcoder.web.common.model.comp.ContestPrize;

public class ContestPrizeDAOHibernate extends Base implements ContestPrizeDAO {

    @SuppressWarnings("unchecked")
    public List<ContestPrize> getPrizesForEvent(Long eventId) {
        Query q = session.createQuery(
                "select new com.topcoder.web.common.model.comp.ContestPrize(cp.place, cp.prizeTypeId, min(cp.amount))" +
                " from com.topcoder.web.common.model.comp.ContestPrize cp " +
                " where cp.contest.event.id = :eventId " +
                " group by cp.place, cp.prizeTypeId " +
                " order by cp.place");
        
        
        q.setLong("eventId", eventId);
        return q.list();
    }
    
    public ContestPrize find(Long id) {
        return (ContestPrize) super.find(ContestPrize.class, id);
    }

}
