package com.topcoder.apps.review.stresstests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;


/**
 * <p>
 * This test case aggregates all stress test cases.
 * </p>
 *
 * @author TopCoder Software
 * @version 1.0
 */
public class StressTests extends TestCase {

    public StressTests(String arg0) {
        super(arg0);
    }

    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(UserManagerTest.suite());
        suite.addTest(ProjectTrackerTest.suite());
        suite.addTest(DocumentManagerTest.suite());
        return suite;
    }
}
