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

}
