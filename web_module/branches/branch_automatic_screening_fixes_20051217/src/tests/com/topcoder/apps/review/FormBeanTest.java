/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import junit.framework.TestCase;

import org.apache.struts.action.ActionErrors;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.FinalFixStatus;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.SubjectiveScorecardQuestion;

/**
 * <p>Test all the FormBean classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class FormBeanTest extends TestCase {
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
    public FormBeanTest() {
        businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
        user = businessDelegate.getUserByHandle("pzhao");
        ord = new OnlineReviewData((SecurityEnabledUser) user);

        userProjectInfo = businessDelegate.getUserProjectInfos()[0];
        orpd = new OnlineReviewProjectData((SecurityEnabledUser) user, userProjectInfo);
    }

    /**
     * Test the class LoginForm.
     */
    public void testLoginForm() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;
        LoginData data = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Accessor
        form.setUsername("pzhao");
        form.setPassword("pzhaoxxx");
        assertEquals("pzhao", form.getUsername());
        assertEquals("pzhaoxxx", form.getPassword());
        // toLoginData
        data = form.toLoginData();
        assertEquals("pzhao", data.getUserName());
        assertEquals("pzhaoxxx", data.getPassword());
        // Reset
        form.reset(null, null);
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Validate
        errors = form.validate(null, null);
        assertEquals(2, errors.size());
    }

    /**
     * Test the class ScreeningScorecardForm.
     */
    public void testScreeningScorecardForm() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        ScreeningScorecard scorecard =
                businessDelegate.getScreeningScorecards()[0];
        ScorecardQuestion[] questions =
                businessDelegate.getScreeningQuestions();
        ActionErrors errors = null;
        ScreeningData data = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertEquals(scorecard.getSubmission().getURL().toString(),
                form.getSubmissionURL());
        assertEquals(scorecard.getSubmission().getSubmitter().getHandle(),
                form.getSubmitter());
        assertTrue(scorecard.getProject() == form.getProject());
        assertNull(form.getAction());
        form.setAction("save");
        assertEquals("save", form.getAction());
        assertEquals(-1, form.getQuestionIndex());
        form.setQuestionIndex(2);
        assertEquals(2, form.getQuestionIndex());
        assertEquals(-1, form.getResponseIndex());
        form.setResponseIndex(1);
        assertEquals(1, form.getResponseIndex());
        assertEquals(questions.length, form.getQuestions().length);

        for (int i = 0; i < questions.length; i++) {
            checkQuestionBean(questions[i], form.getQuestions()[i]);
        }

        // toScreeningData
        data = form.toScreeningData(orpd);
        assertTrue(scorecard == data.getScreeningScorecard());

        // Validate
        form.setAction("save");
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() > 0);
    }

    /**
     * Test the class ReviewScorecardForm.
     */
    public void testReviewScorecardForm() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        ReviewScorecard scorecard =
                businessDelegate.getReviewScorecards()[0];
        ScorecardQuestion[] questions =
                businessDelegate.getReviewQuestions();
        ActionErrors errors = null;
        ReviewData data = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertEquals(scorecard.getSubmission().getURL().toString(),
                form.getSubmissionURL());
        assertEquals(scorecard.getSubmission().getSubmitter().getHandle(),
                form.getSubmitter());
        assertTrue(scorecard.getProject() == form.getProject());
        assertNull(form.getAction());
        form.setAction("save");
        assertEquals("save", form.getAction());
        assertEquals(-1, form.getQuestionIndex());
        form.setQuestionIndex(2);
        assertEquals(2, form.getQuestionIndex());
        assertEquals(-1, form.getResponseIndex());
        form.setResponseIndex(1);
        assertEquals(1, form.getResponseIndex());
        assertEquals(questions.length, form.getQuestions().length);

        for (int i = 0; i < questions.length; i++) {
            checkQuestionBean(questions[i], form.getQuestions()[i]);
        }

        // toReviewData
        data = form.toReviewData(orpd);
        assertTrue(scorecard == data.getReviewScorecard());

        // Validate
        form.setAction("save");
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() > 0);
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm() {
        TestCaseReviewForm form = new TestCaseReviewForm();
        TestCaseReview[] testCaseReviews =
                businessDelegate.getTestCaseReviews();
        ActionErrors errors = null;
        TestCaseReviewData data = null;

        form.fromTestCaseReviews(testCaseReviews);
        assertTrue(testCaseReviews[0].getProject() == form.getProject());
        assertEquals(testCaseReviews.length, form.getTestCaseReviews().length);

        for (int i = 0; i < testCaseReviews.length; i++) {
            checkTestCaseReviewBean(testCaseReviews[i],
                    form.getTestCaseReviews()[i]);
        }

        // toTestCaseReviewData
        data = form.toTestCaseReviewData(orpd);
        assertTrue(testCaseReviews == data.getTestCaseReviews());

        // Validate
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
        form.getTestCaseReviews()[0].setReviewText("");
        errors = form.validate(null, null);
        assertTrue(errors.size() > 0);
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationWorksheet worksheet =
                businessDelegate.getAggregationWorksheet();
        ActionErrors errors = null;
        AggregationData data = null;
        int num = 0;
        int i;

        form.fromWorksheet(worksheet, null);

        assertTrue(worksheet.getProject() == form.getProject());
        for (i = 0; i < worksheet.getProject().getParticipants().length; i++) {
            UserRole userRole = worksheet.getProject().getParticipants()[i];
            if (userRole.getRole().getId() == Constants.ROLE_REVIEWER) {
                assertTrue(form.getReviewScorecards()[num].getReviewer()
                        == userRole.getUser());
                assertTrue(form.getReviewScorecards()[num].getSubmitter()
                        == worksheet.getProject().getWinner());
                num++;
            }
        }
        assertEquals(num, form.getReviewScorecards().length);
        assertTrue(worksheet.getAggregator() == form.getAggregator());
        assertNull(form.getAction());
        form.setAction("save");
        assertEquals("save", form.getAction());
        assertEquals(worksheet.getAggregationResponses().length,
                form.getResponses().length);
        for (i = 0; i < form.getResponses().length; i++) {
            checkResponseBean(worksheet.getAggregationResponses()[i],
                    form.getResponses()[i]);
        }

        // toAggregationData
        data = form.toAggregationData(orpd);
        assertTrue(worksheet == data.getAggregationWorksheet());

        // Validate
        form.getResponses()[0].setResponseText("");
        form.setAction("save");
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() > 0);
    }

    /**
     * Test the class AggregationReviewForm.
     */
    public void testAggregationReviewForm() {
        AggregationReviewForm form = new AggregationReviewForm();
        AggregationReview aggregationReview =
                businessDelegate.getAggregationReviews()[0];
        ActionErrors errors = null;
        AggregationReviewData data = null;

        form.fromReview(aggregationReview);
        assertEquals(aggregationReview.getText(),
                form.getAggregationReviewText());
        form.setAggregationReviewText("agg. review");
        assertEquals("agg. review", form.getAggregationReviewText());
        assertTrue(form.getValid());

        // toAggregationReviewData
        data = form.toReviewData(orpd);
        assertTrue(aggregationReview == data.getAggregationReview());

        // Validate
        form.setAggregationReviewText("");
        form.setAction("accept");
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
        form.setAction("reject");
        errors = form.validate(null, null);
        assertTrue(errors.size() > 0);
    }

    /**
     * Test the class FinalReviewForm.
     */
    public void testFinalReviewForm() {
        FinalReviewForm form = new FinalReviewForm();
        FinalReview finalReview = businessDelegate.getFinalReview();
        ActionErrors errors = null;
        FinalReviewData data = null;

        form.fromReview(finalReview);
        for (int i = 0; i < finalReview.getFixCheckList().length; i++) {
            FinalFixStatus status =
                    finalReview.getFixCheckList()[i].getFinalFixStatus();
            if (status != null) {
                assertEquals(status.getName(), form.getFixItem(i));
            } else {
                assertNull(form.getFixItem(i));
            }
            form.setFixItem(i, form.getFinalFixStatuses()[1].getName());
            assertEquals(form.getFinalFixStatuses()[1].getName(),
                    form.getFixItem(i));
        }

        // toFinalReviewData
        data = form.toReviewData(orpd);
        assertTrue(finalReview == data.getFinalReview());

        // Validate
        errors = form.validate(null, null);
        assertEquals(0, errors.size());
    }

    /**
     * Test the class ContactPMForm.
     */
    public void testContactPMForm() {
        ContactPMForm form = new ContactPMForm();
        ActionErrors errors = null;
        ContactPMData data = null;

        // Initial values
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        // Accessor
        form.setSubject("subject");
        form.setMessageText("text");
        assertEquals("subject", form.getSubject());
        assertEquals("text", form.getMessageText());
        // toLoginData
        data = form.toContactPMData(orpd);
        assertEquals("subject", data.getSubject());
        assertEquals("text", data.getMessageText());
        // Reset
        form.reset(null, null);
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        // Validate
        errors = form.validate(null, null);
        assertEquals(2, errors.size());
    }

    /**
     * Check the question bean is equal to the question.
     *
     * @param question The original question.
     * @param bean The created bean from the original question.
     */
    private void checkQuestionBean(ScorecardQuestion question,
                                   ScorecardQuestionBean bean) {
        assertEquals(question.getQuestionText(), bean.getQuestionText());
        assertNull(bean.getEvaluation());
        bean.setEvaluation(bean.getEvaluationAnswers()[1]);
        assertEquals(bean.getEvaluationAnswers()[1], bean.getEvaluation());
        assertEquals(question.getScorecardSection().getName(),
                bean.getScorecardSection());
        if (question instanceof SubjectiveScorecardQuestion) {
            assertEquals("subjective", bean.getType());
            assertEquals(1, bean.getResponses().length);
        } else {
            assertEquals("objective", bean.getType());
            assertEquals(0, bean.getResponses().length);
        }

        assertTrue(bean.getValid());
        bean.setValid(false);
        assertTrue(!bean.getValid());
    }

    /**
     * Check the test case review bean is equal to the test case review.
     *
     * @param testCaseReview The original test case review.
     * @param bean The created bean from the original test case review.
     */
    private void checkTestCaseReviewBean(TestCaseReview testCaseReview,
                                         TestCaseReviewBean bean) {
        int userNum = testCaseReview.getProject().getParticipants().length;
        long revieweeId = testCaseReview.getReviewee().getId();

        for (int i = 0; i < userNum; i++) {
            UserRole userRole =
                    testCaseReview.getProject().getParticipants()[i];
            if (userRole.getUser().getId() == revieweeId) {
                assertEquals(userRole.getReviewerResponsibility().getName(),
                        bean.getTestCaseName());
            }
        }
        assertEquals(testCaseReview.getReviewText(), bean.getReviewText());
        bean.setReviewText("review text");
        assertEquals("review text", bean.getReviewText());
        if (testCaseReview.getTestCaseApproval() != null) {
            assertEquals(testCaseReview.getTestCaseApproval().getName(),
                    bean.getTestCaseReviewStatus());
        } else {
            assertNull(bean.getTestCaseReviewStatus());
        }
        bean.setTestCaseReviewStatus(bean.getApprovalAnswers()[1]);
        assertEquals(bean.getApprovalAnswers()[1],
                bean.getTestCaseReviewStatus());
        assertTrue(bean.getValid());
        bean.setValid(false);
        assertTrue(!bean.getValid());
    }

    /**
     * Check the response bean is equal to the response.
     *
     * @param response The original response.
     * @param bean The created bean from the original response.
     */
    private void checkResponseBean(AggregationResponse response,
                                   AggregationResponseBean bean) {
        assertTrue(response.getScorecardQuestion()
                == bean.getQuestion());
        assertEquals(response.getSubjectiveResponse().getResponseText(),
                bean.getResponseText());
        bean.setResponseText("response text");
        assertEquals("response text", bean.getResponseText());
        if (response.getSubjectiveResponse().getResponseType() != null) {
            String type =
                    response.getSubjectiveResponse().getResponseType().getName();
            assertEquals(type, bean.getResponseType());
        } else {
            assertNull(bean.getResponseType());
        }
        bean.setResponseType(bean.getResponseAnswers()[1]);
        assertEquals(bean.getResponseAnswers()[1], bean.getResponseType());
        assertTrue(response.getReviewer() == bean.getReviewer());
        if (response.getAggregationResponseStatus() != null) {
            String status = response.getAggregationResponseStatus().getName();
            assertEquals(status, bean.getAggregationResponseStatus());
        } else {
            assertNull(bean.getAggregationResponseStatus());
        }
        bean.setAggregationResponseStatus(bean.getStatusAnswers()[1]);
        assertEquals(bean.getStatusAnswers()[1],
                bean.getAggregationResponseStatus());
        assertTrue(bean.getReviewScorecard().getReviewer()
                == bean.getReviewer());
        assertTrue(bean.getValid());
        bean.setValid(false);
        assertTrue(!bean.getValid());
    }
}
