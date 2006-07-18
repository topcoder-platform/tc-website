package com.topcoder.web.creative;

import com.topcoder.web.creative.validation.ContestNameValidatorTestCase;
import com.topcoder.web.creative.validation.EndTimeValidatorTestCase;
import com.topcoder.web.creative.validation.StartTimeValidatorTestCase;
import com.topcoder.web.creative.validation.TimeValidatorTestCase;
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

/*
        suite.addTest(new TestSuite(ContestDAOTestCase.class));
*/

        suite.addTest(new TestSuite(TimeValidatorTestCase.class));
        suite.addTest(new TestSuite(EndTimeValidatorTestCase.class));
        suite.addTest(new TestSuite(StartTimeValidatorTestCase.class));
        suite.addTest(new TestSuite(ContestNameValidatorTestCase.class));

        return suite;
    }
}