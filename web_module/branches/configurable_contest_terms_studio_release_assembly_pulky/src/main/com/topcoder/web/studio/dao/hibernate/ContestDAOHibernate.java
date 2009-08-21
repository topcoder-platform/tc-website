/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestRoleTermsOfUse;

/**
 * <p>Contest DAO class Hibernate implementation.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added method to find necessary terms for a given contest and resource roles ids.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ContestDAOHibernate extends Base implements ContestDAO {
    public List getContests() {
        StringBuffer query = new StringBuffer(100);
        query.append("from Contest");
        query.append(" order by start_time desc");
        Query q = session.createQuery(query.toString());

        return q.list();
    }

    public Contest find(Long id) {
        return (Contest) super.find(Contest.class, id);
    }

    /**
     * <p>This method will track all necessary terms of use for a particular contest and role ids and return
     * a <code>Set</code> with the terms of use collection.</p>
     *
     * <p>Note: this method was improved to use Hibernate's Criteria class to build the query instead of classic
     * HQL.</p>
     *
     * @param contestId the contest id being queried
     * @param roleIds the resource role ids to filter
     * @return a <code>Set</code> with the necessary terms of use collection.
     * @throws IllegalArgumentException if contestId is null or roleIds is null or empty
     *
     * @see com.topcoder.web.studio.dao.ContestDAO#findNecessaryTerms(java.lang.Long, java.lang.Integer[])
     * @since 1.1
     */
    @SuppressWarnings("unchecked")
    public Set<TermsOfUse> findNecessaryTerms(Long contestId, Integer[] roleIds) {
        if (contestId == null) {
            throw new IllegalArgumentException("Contest id cannot be null");
        }

        if (roleIds == null || roleIds.length == 0) {
            throw new IllegalArgumentException("Role ids cannot be null or empty");
        }

        Criteria c = session.createCriteria(ContestRoleTermsOfUse.class);
        c.add(Restrictions.eq("id.contest.id", contestId)).add(Restrictions.in("id.resourceRole.id", roleIds));

        Set<TermsOfUse> necessaryTerms = new HashSet<TermsOfUse>();
        for (ContestRoleTermsOfUse crtou : (List<ContestRoleTermsOfUse>) c.list()) {
            necessaryTerms.add(crtou.getId().getTerms());
        }

        return necessaryTerms;
    }

    public void saveOrUpdate(Contest c) {
        super.saveOrUpdate(c);
    }
}
