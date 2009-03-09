package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.PhaseDAO;
import com.topcoder.web.oracle.model.Phase;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class PhaseDAOHibernate extends Base implements PhaseDAO {
    public Phase find(Integer id) {
        return (Phase) super.find(Phase.class, id);
    }

    public List<Phase> getPhases() {
        List l = super.findAll(Phase.class);
        ArrayList<Phase> ret = new ArrayList<Phase>(l.size());
        for (Object aL : l) {
            ret.add((Phase) aL);
        }
        return ret;
    }
}
