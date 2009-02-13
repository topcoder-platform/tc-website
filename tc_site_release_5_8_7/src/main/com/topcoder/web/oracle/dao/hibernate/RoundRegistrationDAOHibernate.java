package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.dao.RoundRegistrationDAO;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundRegistration;

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
        RoundRegistration.Identifier id = new RoundRegistration.Identifier();
        User u = new User();
        u.setId(userId);
        Round r = new Round();
        r.setId(roundId);
        return find(r, u);
    }

}
