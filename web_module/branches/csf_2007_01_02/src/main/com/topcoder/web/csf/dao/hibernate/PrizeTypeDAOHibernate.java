package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.PrizeType;
import com.topcoder.web.csf.dao.PrizeTypeDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class PrizeTypeDAOHibernate extends Base implements PrizeTypeDAO {

    public PrizeType find(Integer id) {
        return (PrizeType) super.find(PrizeType.class, id);
    }
}
