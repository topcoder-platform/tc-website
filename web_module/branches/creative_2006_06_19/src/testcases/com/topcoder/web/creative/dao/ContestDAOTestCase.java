package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ContestDAOTestCase extends TCHibernateTestCase {

    public void testGetCountries() {
        List countries = CreativeDAOUtil.getFactory().getContestDAO().getContests();
        assertTrue("could not find any contests in the db", countries != null && !countries.isEmpty());
    }

}
