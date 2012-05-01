package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.truveo.dao.ContestRegistrationDAO;
import com.topcoder.web.truveo.model.Contest;
import com.topcoder.web.truveo.model.ContestRegistration;
import org.hibernate.Query;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class ContestRegistrationDAOHibernate extends Base implements ContestRegistrationDAO {
    public void saveOrUpdate(ContestRegistration reg) {
        super.saveOrUpdate(reg);
    }

    public ContestRegistration find(Contest c, User u) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM com.topcoder.web.truveo.model.ContestRegistration cr WHERE ");
        query.append("cr.user.id=? and cr.contest.id = ?");

        Query q = session.createQuery(query.toString());
        q.setLong(0, u.getId().longValue());
        q.setLong(1, c.getId().longValue());
        return (ContestRegistration) q.uniqueResult();
    }
}
