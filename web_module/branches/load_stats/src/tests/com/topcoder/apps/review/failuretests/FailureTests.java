package com.topcoder.apps.review.failuretests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;


/**
 * <p>
 * This test case aggregates all failure test cases.
 * </p>
 *
 * @author TopCoder Software
 * @version 1.0
 */
public class FailureTests extends TestCase {
    public FailureTests(String name) {
        super(name);
    }

    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new NullFailureCases("testNullArgsgetProjectInfo"));
        suite.addTest(new NullFailureCases("testNullArgssaveProject"));
        suite.addTest(new NullFailureCases("testNullArgsgetProject"));
        suite.addTest(new NullFailureCases("testNullArgsgetAggregation"));
        suite.addTest(new NullFailureCases("testNullArgsgetAggregationReview"));
        suite.addTest(new NullFailureCases("testNullArgsgetFinalFixes"));
        suite.addTest(new NullFailureCases("testNullArgsgetFinalReview"));
        suite.addTest(new NullFailureCases("testNullArgsgetInitialSubmission"));
        suite.addTest(new NullFailureCases("testNullArgsgetReviewScorecard"));
        suite.addTest(new NullFailureCases("testNullArgsgetScreeningScorecard"));
        suite.addTest(new NullFailureCases("testNullArgsgetTestCaseReview"));
        suite.addTest(new NullFailureCases("testNullArgssaveAggregation"));
        suite.addTest(new NullFailureCases("testNullArgssaveAggregationReview"));
        suite.addTest(new NullFailureCases("testNullArgssaveFinalFixSubmission"));
        suite.addTest(new NullFailureCases("testNullArgssaveFinalReview"));
        suite.addTest(new NullFailureCases("testNullArgssaveReviewScorecard"));
        suite.addTest(new NullFailureCases("testNullArgssaveScreeningScorecard"));
        suite.addTest(new NullFailureCases("testNullArgssaveSubmission"));
        suite.addTest(new NullFailureCases("testNullArgssaveTestCaseReview"));
        suite.addTest(new NullFailureCases("testNullArgsgetReviewScorecard"));

        suite.addTest(new SimpleFailureCases("testSimpleProjectSave"));
        suite.addTest(new SimpleFailureCases("testShouldSucceed"));
        suite.addTest(new SimpleFailureCases("testOverflowProjectSaveReason"));
        suite.addTest(new SimpleFailureCases("testOverflowProjectNotes"));
        suite.addTest(new SimpleFailureCases("testSetProjectURL"));
        suite.addTest(new SimpleFailureCases("testProjectTrackerBadGetProjectByIdNullUser"));
        suite.addTest(new SimpleFailureCases("testProjectTrackerBadGetProjectBadId"));
        suite.addTest(new SimpleFailureCases("testProjectTrackerBadGetProjectByNullUPI"));
        suite.addTest(new SimpleFailureCases("testProjectTrackerBadGetProjectNullUser"));

        suite.addTest(new FailureCasesWithProjects("testDocumentManager"));
        return suite;
    }
}
