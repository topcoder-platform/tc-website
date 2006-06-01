package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAnswerDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        assertFalse("couldn't find answer 1", Util.getFactory().getDemographicAnswerDAO().find(new Long(1))==null);
    }

    public void testFindDecline() {
        assertFalse("couldn't find decline for question 1", Util.getFactory().getDemographicAnswerDAO().findDecline(
                Util.getFactory().getDemographicQuestionDAO().find(new Long(1)))==null);
    }

    public void testFindFreeForm() {
        assertFalse("couldn't find free form for question 15", Util.getFactory().getDemographicAnswerDAO().findFreeForm(
                Util.getFactory().getDemographicQuestionDAO().find(new Long(14)))==null);
    }
}
