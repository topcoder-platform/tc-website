package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.truveo.dao.ContestStatusDAO;
import com.topcoder.web.truveo.model.ContestStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class ContestStatusDAOHibernate extends Base implements ContestStatusDAO {

    public ContestStatus find(Integer id) {
        return (ContestStatus) super.find(ContestStatus.class, id);
    }

    public List getContestStatuses() {
        return findAll(ContestStatus.class);
    }
}
