package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.dao.RoomResultDAO;
import com.topcoder.web.common.model.algo.RoomResult;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class RoomResultDAOHibernate extends GenericBase<RoomResult, Long> implements RoomResultDAO {

    @SuppressWarnings("unchecked")
    public List<Object> getResultsSummary(Long roomId) {
        Query q = getSession().createQuery(
                "select rr.id.coder.id, rr.id.coder.user.lastName, rr.id.coder.user.firstName, rr.pointTotal, count(*), sum(str.succeeded) " +
                " from RoomResult rr, SystemTestResult str " +
                " where rr.id.room.id = :roomId " +
                " and rr.id.round.id = str.id.round.id " +
                " and rr.id.coder.id = str.id.coder.id " +
                " group by rr.id.coder.id, rr.id.coder.user.lastName, rr.id.coder.user.firstName, rr.pointTotal " +
                " order by rr.id.coder.user.lastName, rr.id.coder.user.firstName");      

        q.setLong("roomId", roomId);
        
        return q.list();
    }
}
