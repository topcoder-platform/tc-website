package com.topcoder.web.reg;

import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.framework.Test;
import com.topcoder.web.reg.dao.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 3, 2006
 */
public class RegTests extends TestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        //dao


        suite.addTest(new TestSuite(CoderDAOTestCase.class));
        suite.addTest(new TestSuite(CoderTypeDAOTestCase.class));
        suite.addTest(new TestSuite(CountryDAOTestCase.class));
        suite.addTest(new TestSuite(RegistrationTypeDAOTestCase.class));
        suite.addTest(new TestSuite(SchoolDAOTestCase.class));
        suite.addTest(new TestSuite(StateDAOTestCase.class));
        suite.addTest(new TestSuite(TimeZoneDAOTestCase.class));
        suite.addTest(new TestSuite(UserDAOTestCase.class));

        return suite;
    }
}
