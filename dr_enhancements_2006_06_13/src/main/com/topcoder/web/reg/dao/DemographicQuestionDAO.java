package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.DemographicQuestion;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface DemographicQuestionDAO {
    DemographicQuestion find(Long id);
    List getQuestions();
}
