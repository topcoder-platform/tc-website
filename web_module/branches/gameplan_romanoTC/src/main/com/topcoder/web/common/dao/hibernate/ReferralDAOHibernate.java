package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.ReferralDAO;
import com.topcoder.web.common.model.Referral;
import com.topcoder.web.common.model.State;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class ReferralDAOHibernate extends Base implements ReferralDAO {

    public List getReferrals(State s) {
        StringBuffer query = new StringBuffer(100);
        query.append("from Referral r ");
        query.append("where r.statusId = 1");
        query.append(" order by sort");
        Query q = session.createQuery(query.toString());

        List ret = q.list();

        if (s != null && s.isOptionalDemographics()) {
            ret.add(findDecline());
        }
        return ret;
    }

    public Referral findDecline() {
        StringBuffer query = new StringBuffer(100);
        query.append("from Referral r WHERE r.id= ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, Referral.DECLINE.intValue());
        return (Referral) q.uniqueResult();
    }

    public Referral find(Integer id) {
        return (Referral) find(Referral.class, id);
    }
}
