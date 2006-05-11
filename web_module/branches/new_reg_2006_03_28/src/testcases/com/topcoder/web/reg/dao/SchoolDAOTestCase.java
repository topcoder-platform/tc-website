package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.School;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class SchoolDAOTestCase extends TestCase {
    public void testFind() {
        School mit = new SchoolDAO(HibernateUtils.getLocalSession()).find(new Long(775));
        assertTrue("could not find MIT in the database", mit.getName().equals("Massachusetts Institute of Technology"));
    }

}
