package com.topcoder.apps.review;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * <p>This test case aggregates all test cases for front end layer.</p>
 *
 * @author TopCoder Software
 * @version 1.0
 */
public class AllFETests extends TestCase {

    public static Test suite() {
        final TestSuite suite = new TestSuite();

        // Unit tests
        suite.addTest(UnitTests.suite());

        return suite;
    }

}
