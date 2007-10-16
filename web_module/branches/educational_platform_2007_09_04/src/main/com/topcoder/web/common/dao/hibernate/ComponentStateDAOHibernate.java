package com.topcoder.web.common.dao.hibernate;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ComponentStateDAO;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.ComponentState;
import com.topcoder.web.common.model.algo.Round;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ComponentStateDAOHibernate extends GenericBase<ComponentState, Long> implements ComponentStateDAO {

    @SuppressWarnings("unchecked")
    public List<Object> getResultsSummary(Long roundId, Long componentId) {
        Query q = getSession().createQuery(
                "select cs.coder.id, cs.coder.user.lastName, cs.coder.user.firstName, cs.points " +
                " from ComponentState cs " +
                " where cs.round.id = :roundId " +
                " and cs.component.id = :componentId " +
                " order by cs.coder.user.lastName, cs.coder.user.firstName");      
        q.setLong("roundId", roundId);
        q.setLong("componentId", componentId);
        
        return q.list();
    }
    
    public List<ComponentState> getStudentResults(List<Round> lr, Long studentId) {
        if (lr.size() == 0) {
            return new ArrayList<ComponentState>();
        }
        
        Set<Long> values = new HashSet<Long>(lr.size());
        
        for (Round r : lr) {
            values.add(r.getId());
        }
        Criteria c = getSession().createCriteria(ComponentState.class)
        .add(Restrictions.eq("coder.id", studentId))
        .add(Restrictions.in("round.id", values));
        
        return c.list();
    }

    public ComponentState getStudentResultsByComponent(Round r, Component cmp, Long studentId) {
        Criteria c = getSession().createCriteria(ComponentState.class)
        .add(Restrictions.eq("coder.id", studentId))
        .add(Restrictions.eq("round.id", r.getId()))
        .add(Restrictions.eq("component.id", cmp.getId()));
        
        return (ComponentState) c.uniqueResult();
    }
}
