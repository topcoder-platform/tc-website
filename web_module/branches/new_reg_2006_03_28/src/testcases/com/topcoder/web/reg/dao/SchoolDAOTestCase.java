package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.School;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class SchoolDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        School mit = Util.getFactory().getSchoolDAO().find(new Long(775));
        assertTrue("could not find MIT in the database", mit.getName().equals("Massachusetts Institute of Technology"));
    }

}
