/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;


import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.io.File;

import junit.framework.TestCase;

/**
 * <p>Test all the ActionData classes.</p>
 *
 * @author TCS_FAILURE_REVIEWER
 * @version 1.0
 */
public class ActionDataFailureTest extends TestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * User instance for test.
     */
    private User user = null;

    /**
     * UserProjectInfo instance for test.
     */
    private UserProjectInfo userProjectInfo = null;

    /**
     * OnlineReviewData instance for test.
     */
    private OnlineReviewData ord = null;

    /**
     * OnlineReviewProjectData instance for test.
     */
    private OnlineReviewProjectData orpd = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public ActionDataFailureTest() {
        businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
        user = businessDelegate.getUserByHandle("pzhao");
        ord = new OnlineReviewData((SecurityEnabledUser) user);

        userProjectInfo = businessDelegate.getUserProjectInfos()[0];
        orpd = new OnlineReviewProjectData((SecurityEnabledUser) user,
                userProjectInfo);
    }

    /**
     * Test the class LoginData with null arguments
     */
    public void testLoginData1() {
        LoginData data = null;
        try {
            data = new LoginData((String) null, "pass");
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class LoginData with null arguments
     */
    public void testLoginData2() {
        LoginData data = null;
        try {
            data = new LoginData("user", (String) null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class LoginData with null arguments
     */
    public void testLoginData3() {
        LoginData data = null;
        try {
            data = new LoginData((String) null, (String) null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class OnlineReviewData with null OnlineReviewData
     * parameter.
     */
    public void testOnlineReviewData1() {
        OnlineReviewData data = null;
        try {
            data = new OnlineReviewData((OnlineReviewData) null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class OnlineReviewData with null User
     * parameter.
     */
    public void testOnlineReviewData2() {
        OnlineReviewData data = null;
        try {
            data = new OnlineReviewData((SecurityEnabledUser) null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class OnlineReviewProjectData with null
     * OnlineReviewProjectData parameter
     */
    public void testOnlineReviewProjectData1() {
        OnlineReviewProjectData data = null;
        try {
            data = new OnlineReviewProjectData(null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class OnlineReviewProjectData with null
     * UserProjectInfo and User parameters
     */
    public void testOnlineReviewProjectData2() {
        OnlineReviewProjectData data = null;
        try {
            data = new OnlineReviewProjectData(null, userProjectInfo);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class OnlineReviewProjectData with null
     * UserProjectInfo and User parameters
     */
    public void testOnlineReviewProjectData3() {
        OnlineReviewProjectData data = null;
        try {
            data = new OnlineReviewProjectData((SecurityEnabledUser) user, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class ScreeningData with null arguments
     */
    public void testScreeningData1() {
        ScreeningScorecard scorecard =
                businessDelegate.getScreeningScorecards()[0];
        ScreeningData data = null;
        try {
            data = new ScreeningData(null, 3L, scorecard);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of class ScreeningData with null arguments
     */
    public void testScreeningData2() {
        ScreeningData data = null;
        try {
            data = new ScreeningData(orpd, 3L, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of the class ReviewData
     */
    public void testReviewData1() {
        ReviewScorecard scorecard =
                businessDelegate.getReviewScorecards()[0];
        ReviewData data = null;
        try {
            data = new ReviewData(null, 2L, 3L, scorecard);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of the class ReviewData
     */
    public void testReviewData2() {
        ReviewData data = null;
        try {
            data = new ReviewData(orpd, 2L, 3L, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of the class TestCaseReviewData.
     */
    public void testTestCaseReviewData1() {
        TestCaseReview[] testCaseReviews =
                businessDelegate.getTestCaseReviews();
        TestCaseReviewData data = null;
        try {
            data = new TestCaseReviewData(null, testCaseReviews);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the constructor of the class TestCaseReviewData.
     */
    public void testTestCaseReviewData2() {
        TestCaseReviewData data = null;
        try {
            data = new TestCaseReviewData(orpd, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);

    }

    /**
     * Test the class AggregationData.
     */
    public void testAggregationData1() {
        AggregationWorksheet aggregationWorksheet =
                businessDelegate.getAggregationWorksheet();
        AggregationData data = null;
        try {
            data = new AggregationData(null, aggregationWorksheet);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class AggregationData.
     */
    public void testAggregationData2() {
        AggregationData data = null;
        try {
            data = new AggregationData(orpd, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class AggregationReviewData.
     */
    public void testAggregationReviewData1() {
        AggregationReview aggregationReview =
                businessDelegate.getAggregationReviews()[0];
        AggregationReviewData data = null;
        try {
            data = new AggregationReviewData(null, aggregationReview);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class AggregationReviewData.
     */
    public void testAggregationReviewData2() {
        AggregationReviewData data = null;
        try {
            data = new AggregationReviewData(orpd, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class FinalReviewData.
     */
    public void testFinalReviewData1() {
        FinalReview finalReview = businessDelegate.getFinalReview();
        FinalReviewData data = null;
        try {
            data = new FinalReviewData(null, finalReview);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class FinalReviewData.
     */
    public void testFinalReviewData2() {
        FinalReviewData data = null;
        try {
            data = new FinalReviewData(orpd, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ScreeningScorecardsData.
     */
    public void testScreeningScorecardsData() {
        ScreeningScorecardsData data = null;
        try {
            data = new ScreeningScorecardsData(null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ReviewScorecardsData.
     */
    public void testReviewScorecardsData() {
        ReviewScorecardsData data = null;
        try {
            data = new ReviewScorecardsData(null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class SolutionData.
     */
    public void testSolutionData1() {
        AbstractSubmission solution = businessDelegate.getSubmissions()[0];
        File file = new File("submission.jar");
        SolutionData data = null;
        try {
            data = new SolutionData(null, solution, file);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class SolutionData.
     */
    public void testSolutionData2() {
        File file = new File("submission.jar");
        SolutionData data = null;
        try {
            data = new SolutionData(orpd, null, file);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class SolutionData.
     */
    public void testSolutionData3() {
        AbstractSubmission solution = businessDelegate.getSubmissions()[0];
        SolutionData data = null;
        try {
            data = new SolutionData(orpd, solution, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ProjectData.
     */
    public void testProjectData1() {
        Project project = businessDelegate.getProjects()[0];
        ProjectData data = null;
        try {
            data = new ProjectData(null, project, "reason", null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ProjectData.
     */
    public void testProjectData2() {
        ProjectData data = null;
        try {
            data = new ProjectData(orpd, null, "reason", null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ProjectData.
     */
    public void testProjectData3() {
        Project project = businessDelegate.getProjects()[0];
        ProjectData data = null;
        try {
            data = new ProjectData(orpd, project, null, null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ContactPMData.
     */
    public void testContactPMData1() {
        ContactPMData data = null;
        try {
            data = new ContactPMData(null, "subject", "text");
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ContactPMData.
     */
    public void testContactPMData2() {
        ContactPMData data = null;
        try {
            data = new ContactPMData(orpd, null, "text");
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }

    /**
     * Test the class ContactPMData.
     */
    public void testContactPMData3() {
        ContactPMData data = null;
        try {
            data = new ContactPMData(orpd, "subject", null);
            fail("Should throw NullPointerException!");
        } catch (NullPointerException npe) {
            // success
        }
        assertEquals(null, data);
    }
}
