/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.stresstests.StressTests;
import com.topcoder.apps.review.failuretests.FailureTest;
import com.topcoder.apps.review.projecttracker.ProjectTrackerTest;
import com.topcoder.apps.review.document.DocumentManagerTests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * This test case aggregates all PL test cases.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AllPLTests extends TestCase {

    /**
     * Builds the PL test suite.
     *
     * @return the PL test suite
     */
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(ProjectManagerTest.suite());
        suite.addTest(DocumentManagerTest.suite());
        // accuracy tests are run separately via JUnitEE, under control of Ant
        suite.addTest(FailureTests.suite());
        suite.addTest(StressTests.suite());
        return suite;
    }

}

