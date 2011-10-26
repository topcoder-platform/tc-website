package com.topcoder.web.common.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.RoundDAO;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;

/**
 * @author cucu
 */
public class RoundDAOHibernate extends Base implements RoundDAO {

    @SuppressWarnings("unchecked")
    public List<Round> getRoundsAfter(Date date) {
        Query q = session.createQuery(
                " select r from Round r, RoundSegment rs " +
                        " where rs.id.round.id = r.id " +
                        " and rs.id.segmentId = 1 " +
                        " and rs.startTime > :start");

        q.setDate("start", date);
        return q.list();
    }

    public List<Round> findDuplicateName(Long classroomId, String assignmentName, Long roundId) {
        Criteria c = session.createCriteria(Round.class)
                .add(Restrictions.eq("name", assignmentName));

        if (roundId != null) {
            c.add(Restrictions.ne("id", roundId));
        }

        c.createCriteria("roundProperties")
                .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
                .add(Restrictions.eq("intValue", classroomId));

        return c.list();
    }

    public Round find(Long id) {
        return (Round) super.find(Round.class, id);
    }

    public void saveOrUpdate(Round r) {
        super.saveOrUpdate(r);
    }

    public void delete(Round r) {
        super.delete(r);
    }

    @SuppressWarnings("unchecked")
    public List<Round> getAssignments(Long classroomId) {
        Criteria c = session.createCriteria(Round.class);
        
        c.createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId));
        c.addOrder(Order.asc("name"));
        
        return (List<Round>) c.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<Round> getAssignmentsForStudent(Long classroomId, Long coderId) {
        Criteria c = session.createCriteria(Round.class);

        c.createCriteria("roundRegistrations")
            .add(Restrictions.eq("id.coder.id", coderId));

        c.createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId));
        
        c.addOrder(Order.asc("name"));
            
        return (List<Round>) c.list();
    }
    

}
