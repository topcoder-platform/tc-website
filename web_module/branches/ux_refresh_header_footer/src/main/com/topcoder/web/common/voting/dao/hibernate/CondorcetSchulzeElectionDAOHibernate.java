package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.common.voting.dao.CondorcetSchulzeElectionDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public class CondorcetSchulzeElectionDAOHibernate extends Base implements CondorcetSchulzeElectionDAO {

    public CondorcetSchulzeElection find(Long id) {
        return (CondorcetSchulzeElection) super.find(CondorcetSchulzeElection.class, id);
    }

    public void saveOrUpdate(CondorcetSchulzeElection b) {
        super.saveOrUpdate(b);
    }

}
