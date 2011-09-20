/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;


import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationResponseStatus;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.Evaluation;
import com.topcoder.apps.review.document.FinalFixStatus;
import com.topcoder.apps.review.document.FixItem;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ResponseType;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.SubjectiveResponse;
import com.topcoder.apps.review.document.SubjectiveScorecardQuestion;
import com.topcoder.apps.review.document.TestCaseApproval;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.util.Iterator;

import junit.framework.TestCase;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;

/**
 * <p>Test all the FormBean classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class FormBeanFailureTest extends TestCase {
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
    public FormBeanFailureTest() {
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
    public void testLoginForm1() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Reset
        form.reset(null, null);
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        //// Validate nulls
        errors = form.validate(null, null);
        assertEquals(2, errors.size());
    }

    /**
     * Test the class LoginForm.
     */
    public void testLoginForm2() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Set values
        form.setUsername(new String(""));
        form.setPassword("xyx");
        //// Validate empty String
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("username", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.username.required");
    }

    /**
     * Test the class LoginForm.
     */
    public void testLoginForm3() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Set values
        form.setUsername(null);
        form.setPassword("xyx");
        //// Validate empty String
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("username", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.username.required");
    }

    /**
     * Test the class LoginForm.
     */
    public void testLoginForm4() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Set values
        form.setUsername("phzao");
        form.setPassword(new String(""));
        //// Validate empty String
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("password", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.password.required");
    }

    /**
     * Test the class LoginForm.
     */
    public void testLoginForm5() {
        LoginForm form = new LoginForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getUsername());
        assertNull(form.getPassword());
        // Set values
        form.setUsername("phzao");
        form.setPassword(null);
        //// Validate empty String
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("password", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.password.required");
    }

    /**
     * Test the class ContactPMForm.
     */
    public void testContactPMForm1() {
        ContactPMForm form = new ContactPMForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        //// Accessor
        form.setSubject(null);
        form.setMessageText("text");
        //// Validate
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("subject", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.messageSubject.required");
    }

    /**
     * Test the class ContactPMForm.
     */
    public void testContactPMForm2() {
        ContactPMForm form = new ContactPMForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        //// Accessor
        form.setSubject(new String(""));
        form.setMessageText("text");
        //// Validate
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("subject", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.messageSubject.required");
    }

    /**
     * Test the class ContactPMForm.
     */
    public void testContactPMForm3() {
        ContactPMForm form = new ContactPMForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        //// Accessor
        form.setSubject("subject");
        form.setMessageText(new String(""));
        //// Validate
        errors = form.validate(null, null);
        assertEquals(1, errors.size());
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("messageText", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.messageText.required");
    }

    /**
     * Test the class ContactPMForm.
     */
    public void testContactPMForm4() {
        ContactPMForm form = new ContactPMForm();
        ActionErrors errors = null;

        // Initial values
        assertNull(form.getMessageText());
        assertNull(form.getSubject());
        //// Accessor
        form.setSubject("subject");
        try {
            form.setMessageText(null);
            //// Validate
            errors = form.validate(null, null);
            assertEquals(1, errors.size());
            Iterator it = errors.properties();
            assertTrue(it.hasNext());
            String property = (String) it.next();
            assertEquals("messageText", property);
            it = errors.get(property);
            assertTrue(it.hasNext());
            ActionError ae = (ActionError) it.next();
            assertEquals(ae.getKey(), "error.messageText.required");
        } catch (NullPointerException npe) {
            assertTrue(npe != null);
        }
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm1() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        ScorecardQuestion[] screeningQuestions = {
            new ScorecardQuestion(1, null, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1),
            new ScorecardQuestion(2, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 2, 1, 2),
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0],
                        0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        //// Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        //// Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.answer.required");
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm2() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        Evaluation evaluationInvalid = new Evaluation(0, "", 0);
        ScorecardQuestion[] screeningQuestions = {
            new ScorecardQuestion(1, evaluationInvalid, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1),
            new ScorecardQuestion(2, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 2, 1, 2),
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0],
                        0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        //// Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        //// Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.answer.required");
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm3() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("Best", null),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] screeningQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists",
                    1, businessDelegate.getScreeningSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1),
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        //// Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        //// Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm4() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("Best", new ResponseType(1, "")),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1])
        };
        ScorecardQuestion[] screeningQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(1, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1)
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm5() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("", businessDelegate.getResponseTypes()[0]),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] screeningQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1),
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class ScreeningScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testScreeningScorecardForm6() {
        ScreeningScorecardForm form = new ScreeningScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse(null, businessDelegate.getResponseTypes()[0]),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] screeningQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getScreeningSections()[0], 1, 1, 1),
        };
        ScreeningScorecard scorecard =
                new ScreeningScorecard(1, false, false, screeningQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm1() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        ScorecardQuestion[] reviewQuestions = {
            new ScorecardQuestion(1, null, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
            new ScorecardQuestion(2, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.answer.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm2() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        Evaluation evaluationInvalid = new Evaluation(0, "", 2);
        ScorecardQuestion[] reviewQuestions = {
            new ScorecardQuestion(1, evaluationInvalid, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
            new ScorecardQuestion(2, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.answer.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm3() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("Best", null),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] reviewQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm4() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("Best", new ResponseType(1, "")),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] reviewQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm5() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse("", businessDelegate.getResponseTypes()[0]),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] reviewQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class ReviewScorecardForm for questions without evaluation
     * and "finish" action
     */
    public void testReviewScorecardForm6() {
        ReviewScorecardForm form = new ReviewScorecardForm();
        Evaluation evaluation = new Evaluation(1, "Yes", 1);
        SubjectiveResponse[] subjectiveResponses = new SubjectiveResponse[]{
            new SubjectiveResponse(null, businessDelegate.getResponseTypes()[0]),
            new SubjectiveResponse("Better", businessDelegate.getResponseTypes()[1]),
        };
        ScorecardQuestion[] reviewQuestions = {
            new SubjectiveScorecardQuestion(1, evaluation, "Class-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1,
                    subjectiveResponses, 1, 1),
            new ScorecardQuestion(2, evaluation, "UseCase-Diagram exists", 1,
                    businessDelegate.getReviewSections()[0], 1, 1, 1),
        };
        ReviewScorecard scorecard =
                new ReviewScorecard(1, false, false, reviewQuestions,
                        businessDelegate.getUserByHandle("pzhao"),
                        businessDelegate.getProjects()[0],
                        (InitialSubmission) businessDelegate.getSubmissions()[0], 0.0, 1, 1);
        ActionErrors errors = null;

        form.fromScorecard(scorecard);
        // Accessor
        assertNull(form.getAction());
        form.setAction("finish");

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("questions[0].responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm1() {
        TestCaseReviewForm form = new TestCaseReviewForm();

        TestCaseApproval[] testCaseApprovals = {
            new TestCaseApproval(1, "Approval"),
            new TestCaseApproval(2, "Rejected")
        };
        // Test case reviews
        TestCaseReview[] testCaseReviews = new TestCaseReview[]{
            new TestCaseReview(1, testCaseApprovals[0],
                    businessDelegate.getProjects()[0], null,
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("renhc"), true, 1, 1),
            new TestCaseReview(2, testCaseApprovals[1],
                    businessDelegate.getProjects()[0], "Text",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("longli"), true, 1, 2)
        };
        ActionErrors errors = null;

        form.fromTestCaseReviews(testCaseReviews);

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("testCaseReviews[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.testCaseText.required");
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm2() {
        TestCaseReviewForm form = new TestCaseReviewForm();

        TestCaseApproval[] testCaseApprovals = {
            new TestCaseApproval(1, "Approval"),
            new TestCaseApproval(2, "Rejected")
        };
        // Test case reviews
        TestCaseReview[] testCaseReviews = new TestCaseReview[]{
            new TestCaseReview(1, testCaseApprovals[0],
                    businessDelegate.getProjects()[0], "",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("renhc"), true, 1, 1),
            new TestCaseReview(2, testCaseApprovals[1],
                    businessDelegate.getProjects()[0], "Text",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("longli"), true, 1, 2)
        };
        ActionErrors errors = null;

        form.fromTestCaseReviews(testCaseReviews);

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("testCaseReviews[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.testCaseText.required");
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm3() {
        TestCaseReviewForm form = new TestCaseReviewForm();

        TestCaseApproval[] testCaseApprovals = {
            new TestCaseApproval(1, "Approval"),
            new TestCaseApproval(2, "Rejected")
        };
        // Test case reviews
        TestCaseReview[] testCaseReviews = new TestCaseReview[]{
            new TestCaseReview(1, null,
                    businessDelegate.getProjects()[0], "txeT",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("renhc"), true, 1, 1),
            new TestCaseReview(2, testCaseApprovals[1],
                    businessDelegate.getProjects()[0], "Text",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("longli"), true, 1, 2)
        };
        ActionErrors errors = null;

        form.fromTestCaseReviews(testCaseReviews);

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("testCaseReviews[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.testCaseApproval.required");
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm4() {
        TestCaseReviewForm form = new TestCaseReviewForm();

        TestCaseApproval[] testCaseApprovals = {
            new TestCaseApproval(1, null),
            new TestCaseApproval(2, "Rejected")
        };
        // Test case reviews
        TestCaseReview[] testCaseReviews = new TestCaseReview[]{
            new TestCaseReview(1, testCaseApprovals[0],
                    businessDelegate.getProjects()[0], "Texti",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("renhc"), true, 1, 1),
            new TestCaseReview(2, testCaseApprovals[1],
                    businessDelegate.getProjects()[0], "Text",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("longli"), true, 1, 2)
        };
        ActionErrors errors = null;

        form.fromTestCaseReviews(testCaseReviews);

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("testCaseReviews[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.testCaseApproval.required");
    }

    /**
     * Test the class TestCaseReviewForm.
     */
    public void testTestCaseReviewForm5() {
        TestCaseReviewForm form = new TestCaseReviewForm();

        TestCaseApproval[] testCaseApprovals = {
            new TestCaseApproval(1, ""),
            new TestCaseApproval(2, "Rejected")
        };
        // Test case reviews
        TestCaseReview[] testCaseReviews = new TestCaseReview[]{
            new TestCaseReview(1, testCaseApprovals[0],
                    businessDelegate.getProjects()[0], "Texti",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("renhc"), true, 1, 1),
            new TestCaseReview(2, testCaseApprovals[1],
                    businessDelegate.getProjects()[0], "Text",
                    businessDelegate.getUserByHandle("pzhao"),
                    businessDelegate.getUserByHandle("longli"), true, 1, 2)
        };
        ActionErrors errors = null;

        form.fromTestCaseReviews(testCaseReviews);

        // Validate
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("testCaseReviews[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.testCaseApproval.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm1() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, null),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"), aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.status.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm2() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, ""),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.status.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm3() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm4() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse(null, responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseText.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm5() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, ""),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class AggregationWorksheetForm.
     */
    public void testAggregationWorksheetForm6() {
        AggregationWorksheetForm form = new AggregationWorksheetForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, null),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);

        ActionErrors errors = null;

        form.fromWorksheet(worksheet, null);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.responseType.required");
    }

    /**
     * Test the class AggregationReviewForm.
     */
    public void testAggregationReviewForm() {
        AggregationReviewForm form = new AggregationReviewForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, null),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);
        AggregationApproval[] aprovals = {
            new AggregationApproval(1, "Accepted"),
            new AggregationApproval(2, "Rejected"),
        };
        AggregationReview aggregationReview =
                new AggregationReview(1, aprovals[1], "", false, worksheet, false,
                        businessDelegate.getUserByHandle("pzhao"), 1, 1);
        ActionErrors errors = null;

        form.fromReview(aggregationReview);

        // Validate
        form.setAction("reject");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("aggregationReviewText", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.reason.required");
    }

    /**
     * Test the class FinalReviewForm.
     */
    public void testFinalReviewForm1() {
        FinalReviewForm form = new FinalReviewForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);
        FinalFixStatus[] statuses = {
            new FinalFixStatus(1, "Fixed"),
            new FinalFixStatus(2, "Working")
        };
        FixItem[] fixItems = {
            new FixItem(1, null, aggregationResponses[0], 1),
            new FixItem(2, statuses[0], aggregationResponses[1], 2),
            new FixItem(3, statuses[1], aggregationResponses[2], 3),
        };
        FinalReview finalReview =
                new FinalReview(1, fixItems, worksheet, false, 1, 1);
        ActionErrors errors = null;

        form.fromReview(finalReview);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.status.required");
    }

    /**
     * Test the class FinalReviewForm.
     */
    public void testFinalReviewForm2() {
        FinalReviewForm form = new FinalReviewForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);
        FinalFixStatus[] statuses = {
            new FinalFixStatus(1, ""),
            new FinalFixStatus(2, "Working")
        };
        FixItem[] fixItems = {
            new FixItem(1, statuses[0], aggregationResponses[0], 1),
            new FixItem(2, statuses[1], aggregationResponses[1], 2),
            new FixItem(3, statuses[1], aggregationResponses[2], 3),
        };
        FinalReview finalReview =
                new FinalReview(1, fixItems, worksheet, true, 1, 1);
        ActionErrors errors = null;

        form.fromReview(finalReview);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.status.required");
    }

    /**
     * Test the class FinalReviewForm.
     */
    public void testFinalReviewForm3() {
        FinalReviewForm form = new FinalReviewForm();
        AggregationResponseStatus[] status = {
            new AggregationResponseStatus(1, "Accepted"),
            new AggregationResponseStatus(2, "Rejected"),
            new AggregationResponseStatus(2, "Duplicate")
        };
        ResponseType[] responseTypes = {
            new ResponseType(1, "Required"),
            new ResponseType(2, "Recommended"),
            new ResponseType(3, "Comment")
        };
        SubjectiveResponse[] subjectiveResponses = {
            new SubjectiveResponse("Best", responseTypes[0]),
            new SubjectiveResponse("Better", responseTypes[1]),
            new SubjectiveResponse("Good", responseTypes[2]),
        };
        AggregationResponse[] aggregationResponses = {
            new AggregationResponse(1, subjectiveResponses[0], status[0],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(2, subjectiveResponses[1], status[1],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("pzhao"), 1),
            new AggregationResponse(3, subjectiveResponses[2], status[2],
                    (SubjectiveScorecardQuestion) businessDelegate.getReviewQuestions()[4],
                    businessDelegate.getUserByHandle("renhc"), 1),
        };
        AggregationWorksheet worksheet =
                new AggregationWorksheet(1, false, false,
                        businessDelegate.getUserByHandle("pzhao"),
                        aggregationResponses,
                        businessDelegate.getProjects()[3], 1, 1);
        FinalFixStatus[] statuses = {
            new FinalFixStatus(1, null),
            new FinalFixStatus(2, "Working")
        };
        FixItem[] fixItems = {
            new FixItem(1, statuses[0], aggregationResponses[0], 1),
            new FixItem(2, statuses[1], aggregationResponses[1], 2),
            new FixItem(3, statuses[1], aggregationResponses[2], 3),
        };
        FinalReview finalReview =
                new FinalReview(1, fixItems, worksheet, false, 1, 1);
        ActionErrors errors = null;

        form.fromReview(finalReview);

        // Validate
        form.setAction("finish");
        errors = form.validate(null, null);
        assertTrue(errors.size() == 1);
        Iterator it = errors.properties();
        assertTrue(it.hasNext());
        String property = (String) it.next();
        assertEquals("responses[0]", property);
        it = errors.get(property);
        assertTrue(it.hasNext());
        ActionError ae = (ActionError) it.next();
        assertEquals(ae.getKey(), "error.status.required");
    }
}
