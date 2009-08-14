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
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
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

    @SuppressWarnings("unchecked")
    public Set<TermsOfUse> findNecessaryTerms(Long contestId, Integer[] submitterRoleIds) {
        Criteria c = session.createCriteria(ContestRoleTermsOfUse.class);
        
        c.add(Restrictions.eq("id.contest.id", contestId))
         .add(Restrictions.in("id.roleId", submitterRoleIds));
        
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
