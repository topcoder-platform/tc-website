package com.topcoder.web.common.dao.hibernate;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.SystemTestResultDAO;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.SystemTestResult;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class SystemTestResultDAOHibernate extends GenericBase<SystemTestResult, Long> implements SystemTestResultDAO {

    @SuppressWarnings("unchecked")
    public List<Object> getSystemTestResultsSummary(Long roundId) {
        Criteria c = getSession().createCriteria(SystemTestResult.class)
            .add(Restrictions.eq("id.round.id", roundId))
            .setProjection( Projections.projectionList()
                .add( Projections.rowCount() )
                .add( Projections.sum("succeeded") )
                .add( Projections.groupProperty("id.coder.id") )
                );        
        
        return c.list();
    }    

    @SuppressWarnings("unchecked")
    public List<Object> getSystemTestResultsByComponent(Long roundId, Long componentId) {
        Criteria c = getSession().createCriteria(SystemTestResult.class)
            .add(Restrictions.eq("id.round.id", roundId))
            .add(Restrictions.eq("id.component.id", componentId))
            .setProjection( Projections.projectionList()
                .add( Projections.rowCount() )
                .add( Projections.sum("succeeded") )
                .add( Projections.groupProperty("id.coder.id") )
                );        
        
        return c.list();
    }    

    @SuppressWarnings("unchecked")
    public List<Object> getSystemTestResultsByStudent(List<Round> lr, Long coderId) {
        Set<Long> values = new HashSet<Long>(lr.size());
        
        for (Round r : lr) {
            values.add(r.getId());
        }

        Criteria c = getSession().createCriteria(SystemTestResult.class)
            .add(Restrictions.eq("id.coder.id", coderId))
            .add(Restrictions.in("id.round.id", values))
            .setProjection( Projections.projectionList()
                .add( Projections.rowCount() )
                .add( Projections.sum("succeeded") )
                .add( Projections.groupProperty("id.round.id") )
                .add( Projections.groupProperty("id.component.id") )
                );        
        
        return c.list();
    }    
}
