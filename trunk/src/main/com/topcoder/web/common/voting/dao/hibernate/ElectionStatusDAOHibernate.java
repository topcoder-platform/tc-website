package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.voting.ElectionStatus;
import com.topcoder.web.common.voting.dao.ElectionStatusDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 5, 2007
 */
public class ElectionStatusDAOHibernate extends Base implements ElectionStatusDAO {

    public ElectionStatus find(Integer id) {
        return (ElectionStatus) super.find(ElectionStatus.class, id);
    }

    public List getElectionStatuses() {
        return findAll(ElectionStatus.class);
    }
}
