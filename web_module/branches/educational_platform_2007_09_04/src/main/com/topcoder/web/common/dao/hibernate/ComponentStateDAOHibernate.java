package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.dao.ComponentStateDAO;
import com.topcoder.web.common.model.algo.ComponentState;
 

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
}
