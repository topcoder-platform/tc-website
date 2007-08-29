package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.RoundStatusDAO;
import com.topcoder.web.oracle.model.RoundStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class RoundStatusDAOHibernate extends Base implements RoundStatusDAO {

    public RoundStatus find(Integer id) {
        return (RoundStatus) super.find(RoundStatus.class, id);
    }

    public List<RoundStatus> getRoundStatuses() {
        List l = super.findAll(RoundStatus.class);
        ArrayList<RoundStatus> ret = new ArrayList<RoundStatus>(l.size());
        for (Object aL : l) {
            ret.add((RoundStatus) aL);
        }
        return ret;
    }
}
