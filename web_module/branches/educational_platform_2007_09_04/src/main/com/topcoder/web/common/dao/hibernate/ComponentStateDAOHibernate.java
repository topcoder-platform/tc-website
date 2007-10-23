package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Criteria;
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
    public ComponentState getStudentResultsByComponent(Round r, Component cmp, Long studentId) {
        Criteria c = getSession().createCriteria(ComponentState.class)
        .add(Restrictions.eq("coder.id", studentId))
        .add(Restrictions.eq("round.id", r.getId()))
        .add(Restrictions.eq("component.id", cmp.getId()));
        
        return (ComponentState) c.uniqueResult();
    }
}
