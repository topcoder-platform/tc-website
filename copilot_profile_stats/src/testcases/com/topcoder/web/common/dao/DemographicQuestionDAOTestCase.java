package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.DemographicAnswer;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicQuestionDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find question 1", DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(1)) == null);
    }

    public void testValidAnswers() {
        DemographicQuestion d = DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(1));
        Set s = d.getAnswers();
/*
        for (Iterator it = s.iterator(); it.hasNext();) {
            log.debug(it.next().toString());
        }
*/
        assertFalse("no answers found", s.isEmpty());

    }

    public void testFilteredAnswers() {
        DemographicQuestion q = DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(8));
        DemographicAnswer a;
        boolean ok = true;
        for (Iterator it = q.getAnswers().iterator(); it.hasNext();) {
            a = (DemographicAnswer) it.next();
            ok &= (a.getStatus().equals("A"));
        }
        assertTrue("an answer has not be filtered correctly", ok);
    }
}
