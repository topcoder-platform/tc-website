package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.DemographicQuestion;

import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicQuestionDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find question 1", Util.getFactory().getDemographicQuestionDAO().find(new Long(1))==null);
    }
    public void testValidAnswers() {
        DemographicQuestion d= Util.getFactory().getDemographicQuestionDAO().find(new Long(1));
        Set s = d.getAnswers();
/*
        for (Iterator it = s.iterator(); it.hasNext();) {
            log.debug(it.next().toString());
        }
*/
        assertFalse("no answers found", s.isEmpty());

    }
}
