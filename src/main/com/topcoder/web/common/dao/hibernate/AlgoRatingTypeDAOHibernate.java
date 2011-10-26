package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.AlgoRatingTypeDAO;
import com.topcoder.web.common.model.AlgoRatingType;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class AlgoRatingTypeDAOHibernate extends Base implements AlgoRatingTypeDAO {
    public AlgoRatingType find(Integer id) {
        return (AlgoRatingType) find(AlgoRatingType.class, id);
    }
}
