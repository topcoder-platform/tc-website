package com.topcoder.web.common.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.dao.RoundDAO;
import com.topcoder.web.common.model.algo.Round;

/**
 * @author cucu
 */
public class RoundDAOHibernate extends Base implements RoundDAO {
    

    @SuppressWarnings("unchecked")
    public List<Round> getRoundsAfter(Date date) {
        Query q = session.createQuery(
                " select r from Round r, RoundSegment rs " +
                " where rs.id.roundId = r.id " +
                " and rs.id.segmentId = 1 " +
                " and rs.startTime > :start");

        q.setDate("start", new Date());
        return q.list();
    }

    public Round find(Integer id) {
        return (Round) super.find(Round.class, id);
    }

    public void saveOrUpdate(Round r) {
        super.saveOrUpdate(r);
    }

}
