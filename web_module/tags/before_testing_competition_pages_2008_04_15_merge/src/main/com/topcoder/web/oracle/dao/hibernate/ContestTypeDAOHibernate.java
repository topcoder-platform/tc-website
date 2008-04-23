package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.ContestTypeDAO;
import com.topcoder.web.oracle.model.ContestType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class ContestTypeDAOHibernate extends Base implements ContestTypeDAO {
    public ContestType find(Integer id) {
        return (ContestType) super.find(ContestType.class, id);
    }

    public List<ContestType> getContestTypes() {
        List l = super.findAll(ContestType.class);
        ArrayList<ContestType> ret = new ArrayList<ContestType>(l.size());
        for (Object aL : l) {
            ret.add((ContestType) aL);
        }
        return ret;
    }
}
