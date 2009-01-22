/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * This test case aggregates all unit test cases.
 *
 * @author adic
 * @version 1.0
 */
public class UnitTestsBL extends TestCase {

    /**
     * Builds the unit test suite.
     *
     * @return the unit test suite
     */
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        // Model classes
        suite.addTest(new TestSuite(LoginTestCase.class));
        suite.addTest(new TestSuite(ViewAllProjectsTestCase.class));
        suite.addTest(new TestSuite(ViewMyOpenProjectsTestCase.class));
        suite.addTest(new TestSuite(ProjectDetailTestCase.class));
        suite.addTest(new TestSuite(RetrieveReviewScorecardsTestCase.class));
        suite.addTest(new TestSuite(RetrieveScreeningScorecardsTestCase.class));
        suite.addTest(new TestSuite(ScreenProjectTestCase.class));
        suite.addTest(new TestSuite(ReviewProjectTestCase.class));
        suite.addTest(new TestSuite(AggregateProjectTestCase.class));
        suite.addTest(new TestSuite(FinalReviewTestCase.class));
        suite.addTest(new TestSuite(TestCaseReviewTestCase.class));
        suite.addTest(new TestSuite(SubmitSolutionTestCase.class));
        suite.addTest(new TestSuite(SubmitFinalFixTestCase.class));
        suite.addTest(new TestSuite(ContactProductManagerTestCase.class));
        suite.addTest(new TestSuite(ProjectAdministrationTestCase.class));

        // helpers & others
        suite.addTest(new TestSuite(RetrievalClassesTestCase.class));
        suite.addTest(new TestSuite(PresentationUtilityTestCase.class));
        suite.addTest(new TestSuite(ScoringHelperTestCase.class));
        suite.addTest(new TestSuite(PermissionsTestCase.class));
        suite.addTest(new TestSuite(PhaseHelperTestCase.class));
        suite.addTest(new TestSuite(RoleHelperTestCase.class));

        return suite;
    }

}

