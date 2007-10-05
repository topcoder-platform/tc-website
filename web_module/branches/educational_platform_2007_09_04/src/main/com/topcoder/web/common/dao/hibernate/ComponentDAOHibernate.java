package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ComponentDAO;
import com.topcoder.web.common.model.algo.Component;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ComponentDAOHibernate extends GenericBase<Component, Long> implements ComponentDAO {

    public List searchByProblemName(String name, int maxResults) {
        return getSession().createCriteria(Component.class)
        .add(Restrictions.like("problem.name", name))
        .addOrder(Order.asc("problem.name"))
        .setMaxResults(maxResults)
        .list();
    }
}
