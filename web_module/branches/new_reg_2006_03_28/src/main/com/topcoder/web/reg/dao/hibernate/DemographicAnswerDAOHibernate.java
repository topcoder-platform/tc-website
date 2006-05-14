package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.DemographicAnswerDAO;
import com.topcoder.web.reg.model.DemographicAnswer;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class DemographicAnswerDAOHibernate extends Base implements DemographicAnswerDAO {

    public DemographicAnswer find(Long id) {
        return (DemographicAnswer)find(DemographicAnswer.class, id);
    }
}
