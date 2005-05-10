/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import junit.framework.TestCase;

/**
 * Unit tests for the retrieval classes.
 *
 * @author adic
 * @version 1.0
 */
public class RetrievalClassesTestCase extends TestCase {

    /**
     * Method setUp.
     */
    public void setUp() {
        EJBHelper.setTestMode(true);
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
        EJBHelper.setTestMode(false);
    }

    /**
     * Test AggregationReviewRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testAggregationReviewRetrieval() throws Exception {
        AggregationReview[] ars = new AggregationReview[]{MockupData.aggregationreview};
        AggregationReviewRetrieval arr = new AggregationReviewRetrieval(ars);
        assertTrue(ars == arr.getAggregationReviews());
    }

    /**
     * Test AggregationWorksheetRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testAggregationWorksheetRetrieval() throws Exception {
        AggregationWorksheet aw = MockupData.aggregation;
        AggregationWorksheetRetrieval awr = new AggregationWorksheetRetrieval(aw);
        assertTrue(aw == awr.getWorksheet());
    }

    /**
     * Test FinalReviewRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testFinalReviewRetrieval() throws Exception {
        com.topcoder.apps.review.document.FinalReview fr = MockupData.finalreview;
        FinalReviewRetrieval frr = new FinalReviewRetrieval(fr);
        assertTrue(fr == frr.getFinalReview());
    }

    /**
     * Test LoginResult.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testLoginResult() throws Exception {
        SecurityEnabledUser seu = MockupData.user1;
        LoginResult lr = new LoginResult(seu);
        assertTrue(seu == lr.getUser());
    }

    /**
     * Test OpenProjectRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testOpenProjectRetrieval() throws Exception {
        UserProjectInfo[] upis = MockupData.projinfos;
        OpenProjectRetrieval lr = new OpenProjectRetrieval(upis);
        assertTrue(upis == lr.getUserProjects());
    }

    /**
     * Test ProjectRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testProjectRetrieval() throws Exception {
        Project p = MockupData.proj1;
        AbstractScorecard[] ascs = MockupData.reviews;
        AbstractSubmission[] asbs = new AbstractSubmission[]{MockupData.submission};
        ProjectRetrieval pr = new ProjectRetrieval(p, ascs, asbs);
        assertTrue(p == pr.getProject());
        assertTrue(ascs == pr.getScorecards());
        assertTrue(asbs == pr.getSubmissions());
    }

    /**
     * Test ProjectsRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testProjectsRetrieval() throws Exception {
        UserProjectInfo[] upis = MockupData.projinfos;
        ProjectsRetrieval pr = new ProjectsRetrieval(upis);
        assertTrue(upis == pr.getProjects());
    }

    /**
     * Test ReviewScorecardRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testReviewScorecardRetrieval() throws Exception {
        ReviewScorecard rs = MockupData.review1;
        ReviewScorecardRetrieval rsr = new ReviewScorecardRetrieval(rs);
        assertTrue(rs == rsr.getScoreCard());
    }

    /**
     * Test ReviewScorecardsRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testReviewScorecardsRetrieval() throws Exception {
        ReviewScorecard[] rss = MockupData.reviews;
        ReviewScorecardsRetrieval rsrs = new ReviewScorecardsRetrieval(rss);
        assertTrue(rss == rsrs.getScorecards());
    }

    /**
     * Test ScreeningScorecardRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testScreeningScorecardRetrieval() throws Exception {
        ScreeningScorecard ss = MockupData.screening;
        ScreeningScorecardRetrieval ssr = new ScreeningScorecardRetrieval(ss);
        assertTrue(ss == ssr.getScoreCard());
    }

    /**
     * Test ScreeningScorecardsRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testScreeningScorecardsRetrieval() throws Exception {
        ScreeningScorecard[] sss = new ScreeningScorecard[]{MockupData.screening};
        ScreeningScorecardsRetrieval ssr = new ScreeningScorecardsRetrieval(sss);
        assertTrue(sss == ssr.getScorecards());
    }

    /**
     * Test TestCaseReviewRetrieval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testTestCaseReviewRetrieval() throws Exception {
        com.topcoder.apps.review.document.TestCaseReview[] tcrs
                = new com.topcoder.apps.review.document.TestCaseReview[]{MockupData.testreview};
        TestCaseReviewRetrieval tcrr = new TestCaseReviewRetrieval(tcrs);
        assertTrue(tcrs == tcrr.getTestCaseReviews());
    }

    /**
     * Test SuccessResult/FailureResults
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSuccessResultFailureResults() throws Exception {
        new SuccessResult();

        FailureResult fr = new FailureResult();
        assertNull(fr.getMessage());
        assertNull(fr.getCause());

        fr = new FailureResult("test");
        assertEquals("test", fr.getMessage());
        assertNull(fr.getCause());

        Exception e = new Exception();
        fr = new FailureResult(e);
        assertEquals(fr.getMessage(), null); //"(no message)");
        assertTrue(fr.getCause() == e);

        e = new Exception();
        fr = new FailureResult("test", e);
        assertEquals("test", fr.getMessage());
        assertTrue(fr.getCause() == e);
    }

}

