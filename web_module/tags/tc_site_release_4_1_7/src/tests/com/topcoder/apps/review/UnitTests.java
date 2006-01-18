package com.topcoder.apps.review;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * <p>This test case aggregates all unit test cases.</p>
 *
 * @author TopCoder Software
 * @version 1.0
 */
public class UnitTests extends TestCase {

    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(ActionDataTest.class));
        suite.addTest(new TestSuite(FormBeanTest.class));
        suite.addTest(new TestSuite(LoginActionTest.class));
        suite.addTest(new TestSuite(ViewOpenProjectsActionTest.class));
        suite.addTest(new TestSuite(ProjectDetailActionTest.class));
        suite.addTest(new TestSuite(ScreeningScorecardListActionTest.class));
        suite.addTest(new TestSuite(ScreeningScorecardActionTest.class));
        suite.addTest(new TestSuite(ReviewScorecardListActionTest.class));
        suite.addTest(new TestSuite(ReviewScorecardActionTest.class));
        suite.addTest(new TestSuite(AggregationActionTest.class));
        suite.addTest(new TestSuite(TestCaseReviewActionTest.class));
        suite.addTest(new TestSuite(AggregationReviewActionTest.class));
        suite.addTest(new TestSuite(FinalReviewActionTest.class));
        suite.addTest(new TestSuite(ContactPMActionTest.class));

        return suite;
    }

}
