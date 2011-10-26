package com.topcoder.web.tc.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.dao.NominationDAO;
import com.topcoder.web.tc.model.Nomination;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 63542 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class NominationDAOHibernate extends GenericBase<Nomination, Integer> implements NominationDAO {


    public List<Nomination> findNominations(User u) {
        return findNominations(u.getId());
    }

    public List<Nomination> findNominations(Long userId) {
        return findByCriteria(Restrictions.eq("nominator.id", userId));
    }
}
