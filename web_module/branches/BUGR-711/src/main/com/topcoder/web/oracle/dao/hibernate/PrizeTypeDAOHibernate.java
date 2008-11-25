package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.PrizeTypeDAO;
import com.topcoder.web.oracle.model.PrizeType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class PrizeTypeDAOHibernate extends Base implements PrizeTypeDAO {
    public PrizeType find(Integer id) {
        return (PrizeType) super.find(PrizeType.class, id);
    }

    public List<PrizeType> getPrizeTypes() {
        List l = super.findAll(PrizeType.class);
        ArrayList<PrizeType> ret = new ArrayList<PrizeType>(l.size());
        for (Object aL : l) {
            ret.add((PrizeType) aL);
        }
        return ret;
    }
}
