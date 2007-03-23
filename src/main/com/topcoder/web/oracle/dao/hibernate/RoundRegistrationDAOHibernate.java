package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.dao.RoundRegistrationDAO;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundRegistration;
import org.hibernate.Query;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundRegistrationDAOHibernate extends Base implements RoundRegistrationDAO {

    public void saveOrUpdate(RoundRegistration reg) {
        super.saveOrUpdate(reg);
    }

    public RoundRegistration find(Round r, User u) {
        RoundRegistration.Identifier id = new RoundRegistration.Identifier(u, r);
        return (RoundRegistration) super.find(RoundRegistration.class, id);
    }

    public RoundRegistration find(Integer roundId, Long userId) {

        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.RoundRegistration");
        query.append(" where id.round.id = ?");
        query.append(  " and id.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        q.setLong(1, userId);
        return (RoundRegistration)q.uniqueResult();
    }

}
