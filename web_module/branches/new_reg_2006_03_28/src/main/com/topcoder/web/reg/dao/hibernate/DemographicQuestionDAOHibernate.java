package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.DemographicQuestionDAO;
import com.topcoder.web.reg.model.DemographicQuestion;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class DemographicQuestionDAOHibernate extends Base implements DemographicQuestionDAO {


    public DemographicQuestion find(Long id) {
        return (DemographicQuestion)find(DemographicQuestion.class, id);
    }
}
