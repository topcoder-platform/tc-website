package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.truveo.dao.PrizeTypeDAO;
import com.topcoder.web.truveo.model.PrizeType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class PrizeTypeDAOHibernate extends Base implements PrizeTypeDAO {

    public PrizeType find(Integer id) {
        return (PrizeType) super.find(PrizeType.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<PrizeType> getPrizeTypes() {
        return findAll(PrizeType.class);
    }
}
