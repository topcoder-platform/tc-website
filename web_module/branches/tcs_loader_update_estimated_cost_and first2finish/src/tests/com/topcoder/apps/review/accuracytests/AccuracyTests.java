/*
 * TCS Online Review Project
 *
 * AccuracyTests.java
 *
 * Copyright (c) 2003  TopCoder, Inc.  All rights reserved
 */
package com.topcoder.apps.review.accuracytests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;


/**
 * This class aggregates all accuracy test cases.
 *
 * @author TopCoder Software
 * @author ThinMan
 * @version 1.0
 */
public class AccuracyTests {

    /**
     * Creates and returns a Test suitable for running all the accuracy tests
     *
     * @return a JUnit Test representing all the accuracy tests
     */
    public static Test suite() throws Exception {
        final TestSuite suite = new TestSuite();

        suite.addTest(UserManagerAccuracyTests.suite());
        suite.addTest(ProjectTrackerAccuracyTests.suite());
        suite.addTest(DocumentManagerAccuracyTests.suite());
        return suite;
    }
}
