package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.ContestDAO;
import com.topcoder.web.oracle.model.Contest;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class ContestDAOHibernate extends Base implements ContestDAO {
    public List<Contest> getContests() {
        List l = super.findAll(Contest.class);
        ArrayList<Contest> ret = new ArrayList<Contest>(l.size());
        for (Object aL : l) {
            ret.add((Contest) aL);
        }
        return ret;
    }

    public Contest find(Integer id) {
        return (Contest) super.find(Contest.class, id);
    }

    public void saveOrUpdate(Contest c) {
        super.saveOrUpdate(c);
    }
}
