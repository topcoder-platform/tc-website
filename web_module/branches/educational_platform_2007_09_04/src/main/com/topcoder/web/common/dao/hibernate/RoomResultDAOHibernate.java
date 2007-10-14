package com.topcoder.web.common.dao.hibernate;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.RoomResultDAO;
import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.Round;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class RoomResultDAOHibernate extends GenericBase<RoomResult, Long> implements RoomResultDAO {

    @SuppressWarnings("unchecked")
    public List<Object> getResultsSummary(Long roomId) {
        Query q = getSession().createQuery(
                "select rr.id.coder.id, rr.id.coder.user.lastName, rr.id.coder.user.firstName, rr.pointTotal " +
                " from RoomResult rr " +
                " where rr.id.room.id = :roomId " +
                " order by rr.id.coder.user.lastName, rr.id.coder.user.firstName");      
        q.setLong("roomId", roomId);
        
        return q.list();
    }

    public List<RoomResult> getStudentResults(List<Round> lr, Long studentId) {
        Set<Long> values = new HashSet<Long>(lr.size());
        
        for (Round r : lr) {
            values.add(r.getId());
        }
        
        Criteria c = getSession().createCriteria(RoomResult.class)
        .add(Restrictions.eq("id.coder.id", studentId))
        .add(Restrictions.in("id.round.id", values));
        
        return c.list();
    }
}
