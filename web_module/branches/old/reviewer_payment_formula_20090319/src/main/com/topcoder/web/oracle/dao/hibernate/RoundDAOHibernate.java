package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.RoundDAO;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundDAOHibernate extends Base implements RoundDAO {
    public Round find(Integer id) {
        return (Round) super.find(Round.class, id);
    }

    public void saveOrUpdate(Round r) {
        super.saveOrUpdate(r);
    }
}
