package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.SystemTestResultDAO;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.SystemTestResult;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class SystemTestResultDAOHibernate extends GenericBase<SystemTestResult, Long> implements SystemTestResultDAO {
    @SuppressWarnings("unchecked")
    public Object getSystemTestResultsByStudentComponent(Round r, Component cmp, Long studentId) {
        Criteria c = getSession().createCriteria(SystemTestResult.class)
            .add(Restrictions.eq("id.coder.id", studentId))
            .add(Restrictions.eq("id.round.id", r.getId()))
            .add(Restrictions.eq("id.component.id", cmp.getId()))
            .setProjection( Projections.projectionList()
                .add( Projections.rowCount() )
                .add( Projections.sum("succeeded") )
                .add( Projections.groupProperty("id.coder.id") )
                .add( Projections.groupProperty("id.round.id") )
                .add( Projections.groupProperty("id.component.id") )
                );        
        
        return (Object) c.uniqueResult();
    }    
}
