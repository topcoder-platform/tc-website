/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * This test case aggregates all BL test cases.
 *
 * @author adic
 * @version 1.0
 */
public class AllBLTests extends TestCase {

    /**
     * Builds the BL test suite.
     *
     * @return the BL test suite
     */
    public static Test suite() {
        final TestSuite suite = new TestSuite();
        suite.addTest(UnitTestsBL.suite());
        return suite;
    }

}

