package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.ContestStatus;
import com.topcoder.web.csf.dao.ContestStatusDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
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
