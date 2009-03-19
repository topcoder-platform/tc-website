package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.ContestStatusDAO;
import com.topcoder.web.oracle.model.ContestStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class ContestStatusDAOHibernate extends Base implements ContestStatusDAO {

    public ContestStatus find(Integer id) {
        return (ContestStatus) super.find(ContestStatus.class, id);
    }

    public List<ContestStatus> getContestStatuses() {
        List l = super.findAll(ContestStatus.class);
        ArrayList<ContestStatus> ret = new ArrayList<ContestStatus>(l.size());
        for (Object aL : l) {
            ret.add((ContestStatus) aL);
        }
        return ret;
    }
}
