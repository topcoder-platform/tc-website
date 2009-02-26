/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import junit.framework.TestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.AbstractSubmission;

import java.io.File;

/**
 * <p>Test all the ActionData classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ActionDataTest extends TestCase {
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
    public ActionDataTest() {
        businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
        user = businessDelegate.getUserByHandle("pzhao");
        ord = new OnlineReviewData((SecurityEnabledUser) user);

        userProjectInfo = businessDelegate.getUserProjectInfos()[0];
        orpd = new OnlineReviewProjectData((SecurityEnabledUser) user,
                userProjectInfo);
    }

    /**
     * Test the class LoginData.
     */
    public void testLoginData() {
        LoginData data = new LoginData("pzhao", "pzhaoxxx");
        assertEquals("pzhao", data.getUserName());
        assertEquals("pzhaoxxx", data.getPassword());
    }

    /**
     * Test the class OnlineReviewData.
     */
    public void testOnlineReviewData() {
        assertTrue(ord.getUser() == user);
    }

    /**
     * Test the class OnlineReviewProjectData.
     */
    public void testOnlineReviewProjectData() {
        OnlineReviewProjectData data = new OnlineReviewProjectData(orpd);

        assertTrue(orpd.getUser() == user);
        assertTrue(orpd.getProject() == userProjectInfo);
        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
    }

    /**
     * Test the class ScreeningData.
     */
    public void testScreeningData() {
        ScreeningScorecard scorecard =
                businessDelegate.getScreeningScorecards()[0];
        ScreeningData data = new ScreeningData(orpd, 3L, scorecard);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getSubmitterId() == 3L);
        assertTrue(data.getScreeningScorecard() == scorecard);
    }

    /**
     * Test the class ReviewData.
     */
    public void testReviewData() {
        ReviewScorecard scorecard =
                businessDelegate.getReviewScorecards()[0];
        ReviewData data = new ReviewData(orpd, 2L, 3L, scorecard);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getSubmitterId() == 2L);
        assertTrue(data.getReviewerId() == 3L);
        assertTrue(data.getReviewScorecard() == scorecard);
    }

    /**
     * Test the class TestCaseReviewData.
     */
    public void testTestCaseReviewData() {
        TestCaseReview[] testCaseReviews =
                businessDelegate.getTestCaseReviews();
        TestCaseReviewData data = new TestCaseReviewData(orpd, testCaseReviews);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getTestCaseReviews() == testCaseReviews);
    }

    /**
     * Test the class AggregationData.
     */
    public void testAggregationData() {
        AggregationWorksheet aggregationWorksheet =
                businessDelegate.getAggregationWorksheet();
        AggregationData data = new AggregationData(orpd, aggregationWorksheet);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getAggregationWorksheet() == aggregationWorksheet);
    }

    /**
     * Test the class AggregationReviewData.
     */
    public void testAggregationReviewData() {
        AggregationReview aggregationReview =
                businessDelegate.getAggregationReviews()[0];
        AggregationReviewData data =
                new AggregationReviewData(orpd, aggregationReview);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getAggregationReview() == aggregationReview);
    }

    /**
     * Test the class FinalReviewData.
     */
    public void testFinalReviewData() {
        FinalReview finalReview = businessDelegate.getFinalReview();
        FinalReviewData data = new FinalReviewData(orpd, finalReview);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getFinalReview() == finalReview);
    }

    /**
     * Test the class ScreeningScorecardsData.
     */
    public void testScreeningScorecardsData() {
        ScreeningScorecardsData data = new ScreeningScorecardsData(orpd);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
    }

    /**
     * Test the class ReviewScorecardsData.
     */
    public void testReviewScorecardsData() {
        ReviewScorecardsData data = new ReviewScorecardsData(orpd);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
    }

    /**
     * Test the class SolutionData.
     */
    public void testSolutionData() {
        AbstractSubmission solution = businessDelegate.getSubmissions()[0];
        File file = new File("submission.jar");
        SolutionData data = new SolutionData(orpd, solution, file);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertTrue(data.getSolution() == solution);
        assertTrue(data.getFile() == file);
    }

    /**
     * Test the class ProjectData.
     */
    public void testProjectData() {
        Project project = businessDelegate.getProjects()[0];
        ProjectData data = new ProjectData(ord, project, "reason", null);

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == project);
        assertEquals("reason", data.getReason());
    }

    /**
     * Test the class ContactPMData.
     */
    public void testContactPMData() {
        ContactPMData data = new ContactPMData(orpd, "subject", "text");

        assertTrue(data.getUser() == user);
        assertTrue(data.getProject() == userProjectInfo);
        assertEquals("subject", data.getSubject());
        assertEquals("text", data.getMessageText());
    }

}
