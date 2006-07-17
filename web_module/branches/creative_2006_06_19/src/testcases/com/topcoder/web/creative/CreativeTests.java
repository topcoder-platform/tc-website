package com.topcoder.web.creative;

import com.topcoder.web.creative.dao.ContestDAOTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class CreativeTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(ContestDAOTestCase.class));

        return suite;
    }
}