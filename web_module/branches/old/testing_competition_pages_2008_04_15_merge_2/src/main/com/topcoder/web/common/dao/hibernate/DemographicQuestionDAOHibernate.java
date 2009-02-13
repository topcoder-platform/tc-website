package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.DemographicQuestionDAO;
import com.topcoder.web.common.model.DemographicQuestion;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class DemographicQuestionDAOHibernate extends Base implements DemographicQuestionDAO {


    public DemographicQuestion find(Long id) {
        return (DemographicQuestion) find(DemographicQuestion.class, id);
    }

    public List getQuestions() {
        return findAll(DemographicQuestion.class);
    }
}
