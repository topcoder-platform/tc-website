package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.AlgoRatingTypeDAO;
import com.topcoder.web.reg.model.AlgoRatingType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class AlgoRatingTypeDAOHibernate extends Base implements AlgoRatingTypeDAO {
    public AlgoRatingType find(Integer id) {
        return (AlgoRatingType)find(AlgoRatingType.class, id);
    }
}
