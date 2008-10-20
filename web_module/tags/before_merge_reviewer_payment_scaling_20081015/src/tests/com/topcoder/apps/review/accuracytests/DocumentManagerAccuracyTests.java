/*
 * TCS Online Review Application
 *
 * DocumentManagerAccuracyTests.java
 *
 * Copyright (c) 2003 TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationResponseStatus;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.Evaluation;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.FixItem;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ResponseType;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.SubjectiveScorecardQuestion;
import com.topcoder.apps.review.document.SubjectiveResponse;
import com.topcoder.apps.review.document.TestCaseApproval;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import com.topcoder.security.TCSubject;

import java.net.URL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class DocumentManagerAccuracyTests extends TestCase {

    private DMProxy manager;

    private final static long PHASE_SUBMISSION = 1L;
    private final static long PHASE_SCREENING = 2L;
    private final static long PHASE_REVIEW = 3L;
    private final static long PHASE_AGGREGATION = 4L;
    private final static long PHASE_AGG_REVIEW = 5L;
    private final static long PHASE_FINAL_FIX = 6L;
    private final static long PHASE_FINAL_REVIEW = 7L;
    private final static long PHASE_PREP = 8L;

    private final static Evaluation YES_EVAL =
            new Evaluation(Evaluation.ID_YES, "Yes", 1.0);
    private final static Evaluation SUBJECTIVE_EVAL =
            new Evaluation(4, "Strongly Agree", 4.0);
    private final static ResponseType COMMENT_TYPE =
            new ResponseType(3, "Comment");
    private final static TestCaseApproval TEST_CASE_APPROVED =
            new TestCaseApproval(TestCaseApproval.ID_APPROVED, "Approved");
    private final static AggregationApproval AGGREGATION_APPROVED =
            new AggregationApproval(AggregationApproval.ID_APPROVED,
                    "Approved");
    private final static AggregationResponseStatus AGG_RESPONSE_ACCEPTED =
            new AggregationResponseStatus(AggregationResponseStatus.ID_ACCEPTED,
                    "Accepted");

    private static User pmUser;
    private static User screenerUser;
    private static User rev2User;
    private static User rev3User;
    private static User dev1User;
    private static User dev2User;
    private static User observerUser;

    private static Project proj;
    private static PTProxy tracker;

    public DocumentManagerAccuracyTests(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        manager = new Sub2DMProxy();

    }

    public void tearDown() throws Exception {
        manager.remove();
        super.tearDown();
    }

    private static void setProjectPhase(long phaseId) throws Exception {
        proj = tracker.getProject(proj.getId(), pmUser);
        proj.setCurrentPhase(new Phase(phaseId, ""));
        tracker.saveProject(proj, "phase change", pmUser);
    }

    public void testInitialSubmission() throws Exception {
        InitialSubmission[] submissions;
        InitialSubmission[] subs = new InitialSubmission[2];
        InitialSubmission sub1;
        InitialSubmission sub2;
        User user0;

        setProjectPhase(PHASE_SUBMISSION);

        // No submissions exist to begin with
        submissions = manager.getInitialSubmission(proj, pmUser);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Initial submissions erroneously created for PM", 0,
                submissions.length);
        submissions = manager.getInitialSubmission(proj, screenerUser);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Initial submissions erroneously created for PM", 0,
                submissions.length);
        submissions = manager.getInitialSubmission(proj, rev2User);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Initial submissions erroneously created for PM", 0,
                submissions.length);

        // New initial submissions should be created for developers only
        submissions = manager.getInitialSubmission(proj, dev1User);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Initial submission not created for developer, or "
                + "extraneous submissions retrieved", 1,
                submissions.length);
        sub1 = submissions[0];
        assertEquals("Initial submission has incorrect user", dev1User,
                sub1.getSubmitter());
        sub1.setPMReviewMessage("");
        sub1.setPMScreeningMessage("");
        sub1.setURL(new URL("http://localhost/sub1.html"));
        manager.saveSubmission(sub1, dev1User);

        submissions = manager.getInitialSubmission(proj, dev2User);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Initial submission not created for developer, or "
                + "extraneous submissions retrieved", 1,
                submissions.length);
        sub2 = submissions[0];
        assertEquals("Initial submission has incorrect user", dev2User,
                sub2.getSubmitter());
        sub2.setPMReviewMessage("");
        sub2.setPMScreeningMessage("");
        sub2.setURL(new URL("http://localhost/sub2.html"));
        manager.saveSubmission(sub2, dev2User);

        /*
         * After submissions are created, everyone but developers gets all
         * submissions available
         */
        submissions = manager.getInitialSubmission(proj, pmUser);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Wrong number of initial submissions returned", 2,
                submissions.length);
        if (sub1.getSubmitter().getId()
                == submissions[0].getSubmitter().getId()) {
            subs[0] = submissions[0];
            subs[1] = submissions[1];
            user0 = dev1User;
        } else {
            subs[0] = submissions[1];
            subs[1] = submissions[0];
            user0 = dev2User;
        }
        for (int i = 0; i < subs.length; i++) {
            assertSubmissionsMatch(subs[i], submissions[i]);
        }
        submissions = manager.getInitialSubmission(proj, screenerUser);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Wrong number of initial submissions returned", 2,
                submissions.length);
        for (int i = 0; i < subs.length; i++) {
            assertSubmissionsMatch(subs[i], submissions[i]);
        }
        submissions = manager.getInitialSubmission(proj, rev3User);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Wrong number of initial submissions returned", 2,
                submissions.length);
        for (int i = 0; i < subs.length; i++) {
            assertSubmissionsMatch(subs[i], submissions[i]);
        }

        // modify a submission, then save and reread
        subs[0].setPMScreeningMessage(subs[0].getPMScreeningMessage() + "!");
        manager.saveSubmission(subs[0], pmUser);
        submissions = manager.getInitialSubmission(proj, user0);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Wrong number of submissions retrieved", 1,
                submissions.length);
        assertSubmissionsMatch(subs[0], submissions[0]);

        submissions = manager.getInitialSubmission(proj, screenerUser);
        assertNotNull("Initial submissions is null", submissions);
        assertEquals("Wrong number of initial submissions returned", 2,
                submissions.length);
        if (submissions[0].getSubmitter().getId()
                != subs[0].getSubmitter().getId()) {
            assertSubmissionsMatch(subs[1], submissions[0]);
            assertSubmissionsMatch(subs[0], submissions[1]);
        } else {
            assertSubmissionsMatch(subs[0], submissions[0]);
            assertSubmissionsMatch(subs[1], submissions[1]);
        }
    }

    public void testScreeningScorecards() throws Exception {
        // test initial load and modify / save / load sequence
        ScreeningScorecard[] scorecards;
        ScreeningScorecard[] cards = new ScreeningScorecard[2];
        User[] submitters = new User[]{dev1User, dev2User};
        User user0;

        setProjectPhase(PHASE_SCREENING);

        // initially there are no scorecards, and devs shouldn't receive any
        scorecards = manager.getScreeningScorecard(proj, dev1User);
        assertNotNull("Retrieved scorecards array was null", scorecards);
        assertEquals("Retrieved scorecards array has incorrect length", 0,
                scorecards.length);

        // scorecards should be created when the screener (or any other project
        // personnel besides devs) requests them
        scorecards = manager.getScreeningScorecard(proj, screenerUser);
        assertNotNull("Retrieved scorecards array was null", scorecards);
        assertEquals("Retrieved scorecards array has incorrect length", 2,
                scorecards.length);
        if (scorecards[0].getSubmission().getSubmitter().equals(dev1User)) {
            cards[0] = scorecards[0];
            cards[1] = scorecards[1];
            user0 = dev1User;
        } else {
            cards[1] = scorecards[0];
            cards[0] = scorecards[1];
            user0 = dev2User;
        }
        for (int i = 0; i < scorecards.length; i++) {
            assertEquals("Scorecard has wrong project", proj.getId(),
                    scorecards[i].getProject().getId());
            assertEquals("Scorecard has wrong submission", submitters[i],
                    cards[i].getSubmission().getSubmitter());
        }

        // modify and save a scorecard, then read it back
        cards[0].setScore(90.);
        cards[0].setCompleted(true);
        cards[1].setCompleted(true);

        // Really ought to test deeper modifications as well

        manager.saveScreeningScorecard(cards[0], screenerUser);
        manager.saveScreeningScorecard(cards[1], screenerUser);
        scorecards = manager.getScreeningScorecard(proj, user0);
        assertNotNull("Retrieved scorecards array was null", scorecards);
        assertEquals("Retrieved scorecards array has incorrect length", 1,
                scorecards.length);
        assertScorecardsMatch(cards[0], scorecards[0]);

        scorecards = manager.getScreeningScorecard(proj, pmUser);
        assertNotNull("Retrieved scorecards array was null", scorecards);
        assertEquals("Retrieved scorecards array has incorrect length", 2,
                scorecards.length);
        if (scorecards[0].getSubmission().getSubmitter().getId()
                == user0.getId()) {
            assertScorecardsMatch(cards[0], scorecards[0]);
            assertScorecardsMatch(cards[1], scorecards[1]);
        } else {
            assertScorecardsMatch(cards[0], scorecards[1]);
            assertScorecardsMatch(cards[1], scorecards[0]);
        }
    }

    private void answerQuestion(SubjectiveScorecardQuestion question) {
        question.setResponses(new SubjectiveResponse[]{
            new SubjectiveResponse("No comment", COMMENT_TYPE)});
        question.setEvaluation(SUBJECTIVE_EVAL);
    }

    private void answerQuestion(ScorecardQuestion question) {
        question.setEvaluation(YES_EVAL);
    }

    private void dummyScorecards(AbstractScorecard[] cards) throws Exception {
        assertNotNull("Null scorecard array", cards);
        for (int cardNum = 0; cardNum < cards.length; cardNum++) {
            ScorecardQuestion[] questions = cards[cardNum].getQuestions();

            assertNotNull("Null question array", questions);
            for (int qNum = 0; qNum < questions.length; qNum++) {
                answerQuestion(questions[qNum]);
            }
            cards[cardNum].setCompleted(true);
            cards[cardNum].setPMReviewed(true);

            if (cards[cardNum] instanceof ScreeningScorecard) {
                manager.saveScreeningScorecard(
                        (ScreeningScorecard) cards[cardNum],
                        cards[cardNum].getAuthor());
            } else if (cards[cardNum] instanceof ReviewScorecard) {
                manager.saveReviewScorecard(
                        (ReviewScorecard) cards[cardNum],
                        cards[cardNum].getAuthor());
            } else {
                fail("Unknown scorecard type");
            }
        }
    }

    public void testReviewScorecards() throws Exception {
        // test initial load and modify / save / load sequence
        ReviewScorecard[] scorecards;
        ReviewScorecard[] cards;
        User user0;
        User rev0;
        int u1Count = 0;

        setProjectPhase(PHASE_REVIEW);

        // Initially, devs should not get anything
        scorecards = manager.getReviewScorecard(proj, dev1User);
        assertNotNull("Review scorecard array was null", scorecards);
        assertEquals("Review scorecard array was not empty", 0,
                scorecards.length);

        // A reviewer's own scorecards should be created and returned the first
        // time he requests them
        scorecards = manager.getReviewScorecard(proj, rev3User);
        assertNotNull("Review scorecard array was null", scorecards);
        assertEquals("Review scorecard array has the wrong number of entries",
                2, scorecards.length);
        for (int i = 0; i < scorecards.length; i++) {
            assertEquals("Scorecard associated with wrong project", proj.getId(),
                    scorecards[i].getProject().getId());
            if (scorecards[i].getSubmission().getSubmitter().equals(dev1User)) {
                u1Count++;
            } else {
                assertEquals("Scorecard not associated with a valid developer",
                        dev2User,
                        scorecards[i].getSubmission().getSubmitter());
            }
        }
        assertEquals("Wrong number of cards per developer", 1, u1Count);

        // insert programmatically completed scorecards
        dummyScorecards(manager.getReviewScorecard(proj, screenerUser));
        dummyScorecards(manager.getReviewScorecard(proj, rev2User));

        // modify, save, and test reloading
        user0 = scorecards[0].getSubmission().getSubmitter();
        rev0 = scorecards[0].getAuthor();
        cards = scorecards;
        scorecards[0].setScore(90.0);  // really should test deeper mods as well
        dummyScorecards(scorecards);  // will save the scorecards
        scorecards = manager.getReviewScorecard(proj, pmUser);
        assertNotNull("Review scorecard array was null", scorecards);
        assertEquals("Review scorecard array has the wrong number of entries",
                6, scorecards.length);
        boolean found = false;
        u1Count = 0;
        for (int i = 0; i < scorecards.length; i++) {
            assertEquals("Scorecard associated with wrong project",
                    proj.getId(), scorecards[i].getProject().getId());
            if (scorecards[i].getSubmission().getSubmitter().equals(dev1User)) {
                u1Count++;
            } else {
                assertEquals("Scorecard not associated with a valid developer",
                        dev2User,
                        scorecards[i].getSubmission().getSubmitter());
            }
            if ((scorecards[i].getSubmission().getSubmitter().getId()
                    == user0.getId())
                    && (scorecards[i].getAuthor().getId() == rev0.getId())) {
                assertScorecardsMatch(cards[0], scorecards[i]);
                found = true;
                break;
            }
        }
        assertTrue("modified scorecard not found in data set", found);
        assertEquals("Wrong number of cards per developer", 3, u1Count);

        scorecards = manager.getReviewScorecard(proj, user0);
        assertNotNull("Review scorecard array was null", scorecards);
        assertEquals("Review scorecard array has the wrong number of entries",
                3, scorecards.length);
        for (int i = 0; i < scorecards.length; i++) {
            assertEquals("Scorecard for wrong submitter returned",
                    user0, scorecards[i].getSubmission().getSubmitter());
        }
    }

    private void dummyTestCaseReviews(TestCaseReview[] reviews)
            throws Exception {
        assertNotNull("Test case review array is null", reviews);
        for (int reviewNum = 0; reviewNum < reviews.length; reviewNum++) {
            reviews[reviewNum].setTestCaseApproval(TEST_CASE_APPROVED);
            reviews[reviewNum].setReviewText("Looks okay to me.");
            manager.saveTestCaseReview(reviews[reviewNum],
                    reviews[reviewNum].getReviewer());
        }
    }

    public void testTestCaseReview() throws Exception {
        TestCaseReview[] reviews;
        Map reviewerMap = new HashMap();
        List uidList = new ArrayList();

        uidList.add(new Long(screenerUser.getId()));
        uidList.add(new Long(rev2User.getId()));
        uidList.add(new Long(rev3User.getId()));

        // Need to go to aggregation phase?
        // setProjectPhase(PHASE_AGGREGATION);

        // Blank reviews should be generated the first time they are requested
        dummyTestCaseReviews(manager.getTestCaseReview(proj, screenerUser));
        dummyTestCaseReviews(manager.getTestCaseReview(proj, rev2User));
        dummyTestCaseReviews(manager.getTestCaseReview(proj, rev3User));

        // The project manager gets all the reviews
        reviews = manager.getTestCaseReview(proj, pmUser);
        assertNotNull("Test case review array is null", reviews);
        assertEquals("Wrong number of test case reviews", 6, reviews.length);
        for (int i = 0; i < reviews.length; i++) {
            assertEquals("TestCaseReview is for the wrong project",
                    proj.getId(), reviews[i].getProject().getId());
            Long erId = new Long(reviews[i].getReviewer().getId());
            Long eeId = new Long(reviews[i].getReviewee().getId());
            assertTrue("Test Case Reviewer and Reviewee are the same",
                    !erId.equals(eeId));
            Set s = (Set) reviewerMap.get(erId);
            if (s == null) {
                s = new HashSet();
                reviewerMap.put(erId, s);
            }
            s.add(eeId);
        }
        assertEquals("Not all reviewers represented among test case reviewers",
                uidList.size(), reviewerMap.size());
        assertTrue("Wrong reviewer among test case reviewers",
                uidList.containsAll(reviewerMap.keySet()));
        for (Iterator it = reviewerMap.values().iterator(); it.hasNext();) {
            Set s = (Set) it.next();
            assertEquals("Not enough reviewees", uidList.size() - 1, s.size());
            assertTrue("Wrong reviewee among test case reviewees",
                    uidList.containsAll(s));
        }

        // test modify / save / load
        long reviewer0 = reviews[0].getReviewer().getId();
        long reviewee0 = reviews[0].getReviewee().getId();
        reviews[0].setReviewText("Wow, those are _some_ test cases!");
        TestCaseReview saved = reviews[0];
        manager.saveTestCaseReview(reviews[0], reviews[0].getReviewer());
        reviews = manager.getTestCaseReview(proj, pmUser);
        assertNotNull("Test case review array is null", reviews);
        assertEquals("Wrong number of test case reviews", 6, reviews.length);
        boolean found = false;
        for (int i = 0; i < reviews.length; i++) {
            if ((reviews[i].getReviewer().getId() == reviewer0)
                    && (reviews[i].getReviewee().getId() == reviewee0)) {
                assertTestCaseReviewsMatch(saved, reviews[i]);
                found = true;
                break;
            }
        }
        assertTrue("The modified review is missing", found);
    }

    private void dummyAggregation(AggregationWorksheet sheet) {
        AggregationResponse[] responses = sheet.getAggregationResponses();

        assertNotNull("Aggregation responses is null", responses);
        for (int i = 0; i < responses.length; i++) {
            assertNotNull("An aggregation response is null", responses[i]);
            responses[i].setAggregationResponseStatus(AGG_RESPONSE_ACCEPTED);
        }

        sheet.setCompleted(true);
        sheet.setPMReviewed(true);
    }

    public void testAggregation() throws Exception {
        // Set the winner
        proj = tracker.getProject(proj.getId(), pmUser);
        proj.setWinner(dev1User);
        tracker.saveProject(proj, "Declared a winner", pmUser);

        setProjectPhase(PHASE_AGGREGATION);

        // The aggregation worksheet should be created the first time it is
        // requested
        AggregationWorksheet worksheet =
                manager.getAggregation(proj, pmUser);
        assertNotNull("Null aggregation worksheet returned", worksheet);
        assertEquals("Worksheet is for the wrong project", proj.getId(),
                worksheet.getProject().getId());
        assertEquals("Worksheet has wrong aggregator", screenerUser,
                worksheet.getAggregator());
        assertFalse("Worksheet is marked completed", worksheet.isCompleted());
        assertFalse("Worksheet is marked reviewed", worksheet.isPMReviewed());

        // test modify / save / load sequence
        dummyAggregation(worksheet);
        AggregationWorksheet sheet2 = worksheet;
        manager.saveAggregation(worksheet, pmUser);
        worksheet = manager.getAggregation(proj, screenerUser);
        assertAggWorksheetsMatch(sheet2, worksheet);
    }

    private void dummyAggReview(AggregationReview review) {
        review.setStatus(AGGREGATION_APPROVED);
        review.setText("Looks okay to me");
        review.setCompleted(true);
        review.setPMReviewed(true);
    }

    public void testAggregationReview() throws Exception {

        setProjectPhase(PHASE_AGG_REVIEW);

        // The aggregation review should be created upon request if it does not
        // already exist
        AggregationReview[] reviews
                = manager.getAggregationReview(proj, screenerUser);

        assertNotNull("Aggregation review array is null", reviews);
        assertTrue("No aggregation reviews returned", reviews.length > 0);
        for (int i = 0; i < reviews.length; i++) {
            assertEquals("Aggregation review is for the wrong project",
                    proj.getId(),
                    reviews[i].getAggregationWorksheet().getProject().getId());
            assertFalse("Aggregation review reviewed flag is already set",
                    reviews[i].isPMReviewed());
        }

        // test modify / save / load sequence
        dummyAggReview(reviews[0]);
        reviews[0].setText(
                "Well this is another fine mess you've gotten us into!");
        AggregationReview saved = reviews[0];
        manager.saveAggregationReview(reviews[0], screenerUser);

        reviews = manager.getAggregationReview(proj, screenerUser);
        assertAggReviewsMatch(saved, reviews[0]);

        // Dummy up the other agg reviews
        reviews = manager.getAggregationReview(proj, rev2User);
        dummyAggReview(reviews[0]);
        manager.saveAggregationReview(reviews[0], rev2User);

        reviews = manager.getAggregationReview(proj, rev3User);
        dummyAggReview(reviews[0]);
        manager.saveAggregationReview(reviews[0], rev3User);
    }

    public void testFinalFixes() throws Exception {
        // this method is similar to testInitialSubmission, owing to
        // the fact that InitialSubmissions and Final Fixes are both types of
        // submissions and both obey the same persistence rules.
        FinalFixSubmission submission;
        FinalFixSubmission sub1;
        FinalFixSubmission sub2;
        User user0;

        setProjectPhase(PHASE_FINAL_FIX);

        // No submissions exist to begin with
        submission = manager.getFinalFixes(proj, pmUser);
        assertNull("Final Fix submissions erroneously created for PM",
                submission);
        submission = manager.getFinalFixes(proj, screenerUser);
        assertNull("Final Fix submissions erroneously created for screener",
                submission);
        submission = manager.getFinalFixes(proj, rev2User);
        assertNull("Final Fix submissions erroneously created for reviewer",
                submission);

        // New final fix submissions should be created for the winning
        // developer only
        submission = manager.getFinalFixes(proj, dev2User);
        assertNull("Final Fix submission erroneously created for non-winner",
                submission);

        submission = manager.getFinalFixes(proj, dev1User);
        assertNotNull("Final Fix submission for winner is null", submission);
        assertEquals("Final Fix submission has incorrect user", dev1User,
                submission.getSubmitter());
        submission.setPMReviewMessage("What a grueling review...");
        submission.setPMScreeningMessage("");
        submission.setURL(new URL("http://localhost/submission.html"));
        sub1 = submission;
        manager.saveFinalFixSubmission(submission, dev1User);

        /*
         * After submissions are created, everyone but developers gets all
         * submissions available
         */
        submission = manager.getFinalFixes(proj, pmUser);
        assertNotNull("Final Fix submission is null", submission);
        assertSubmissionsMatch(sub1, submission);

        submission = manager.getFinalFixes(proj, screenerUser);
        assertNotNull("Final Fix submission is null", submission);
        assertSubmissionsMatch(sub1, submission);

        submission = manager.getFinalFixes(proj, rev3User);
        assertNotNull("Final Fix submission is null", submission);
        assertSubmissionsMatch(sub1, submission);

        // modify a submission, then save and reread
        submission = manager.getFinalFixes(proj, dev1User);
        submission.setPMScreeningMessage(
                submission.getPMScreeningMessage() + "!");
        sub1 = submission;
        manager.saveFinalFixSubmission(submission, dev1User);
        submission = manager.getFinalFixes(proj, dev1User);
        assertNotNull("Final Fix submissions is null", submission);
        assertSubmissionsMatch(sub1, submission);
    }

    public void testFinalReview() throws Exception {

        setProjectPhase(PHASE_FINAL_REVIEW);

        // a FinalReview object is created for the project the first time it is
        // requested
        FinalReview review = manager.getFinalReview(proj, screenerUser);

        assertNotNull("The final review is null", review);
        assertEquals("The final review is for the wrong project", proj.getId(),
                review.getAggregationWorkSheet().getProject().getId());
    }

    private void assertScorecardsMatch(AbstractScorecard card1,
                                       AbstractScorecard card2) {
        assertEquals("Completion flags don't match", card1.isCompleted(),
                card2.isCompleted());
        assertEquals("PM Review flags don't match", card1.isPMReviewed(),
                card2.isPMReviewed());
        ScorecardQuestion[] questions1 = card1.getQuestions();
        ScorecardQuestion[] questions2 = card2.getQuestions();
        assertEquals("Different numbers of questions", questions1.length,
                questions2.length);
        Comparator comp = new Comparator() {
            public int compare(Object o1, Object o2) {
                ScorecardQuestion q1 = (ScorecardQuestion) o1;
                ScorecardQuestion q2 = (ScorecardQuestion) o2;
                return q1.getSequenceLocation() - q2.getSequenceLocation();
            }
        };
        Arrays.sort(questions1, comp);
        Arrays.sort(questions2, comp);
        for (int i = 0; i < questions1.length; i++) {
            assertQuestionsMatch(questions1[i], questions2[i]);
        }

        assertEquals("Authors don't match", card1.getAuthor().getId(),
                card2.getAuthor().getId());
        assertEquals("Ids don't match", card1.getId(), card2.getId());
        assertEquals("Completion flags don't match", card1.isCompleted(),
                card2.isCompleted());
        assertEquals("PM review flags don't match", card1.isPMReviewed(),
                card2.isPMReviewed());
        assertEquals("Projects don't match", card1.getProject().getId(),
                card2.getProject().getId());
        assertSubmissionsMatch(card1.getSubmission(), card2.getSubmission());
        assertEquals("Scores don't match", card1.getScore(), card2.getScore(),
                0.001);
    }

    private void assertSubmissionsMatch(AbstractSubmission sub1,
                                        AbstractSubmission sub2) {
        assertEquals("URLs don't match", sub1.getURL(), sub2.getURL());
        assertEquals("Review messages don't match", sub1.getPMReviewMessage(),
                sub2.getPMReviewMessage());
        assertEquals("Screening messages don't match",
                sub1.getPMScreeningMessage(),
                sub2.getPMScreeningMessage());
        assertEquals("Submitters don't match", sub1.getSubmitter().getId(),
                sub2.getSubmitter().getId());
        assertEquals("Projects don't match", sub1.getProject().getId(),
                sub2.getProject().getId());
    }

    private void assertQuestionsMatch(ScorecardQuestion q1,
                                      ScorecardQuestion q2) {
        assertEquals("Question evaluations differ", q1.getEvaluation(),
                q2.getEvaluation());
        assertEquals("Question texts differ", q1.getQuestionText(),
                q2.getQuestionText());
        assertEquals("Question weights differ", q1.getWeight(), q2.getWeight());
        assertEquals("Q. Scorecard Sections differ",
                q1.getScorecardSection(),
                q2.getScorecardSection());
        assertEquals("Question locations differ", q1.getSequenceLocation(),
                q2.getSequenceLocation());
        assertEquals("Question types differ", (q1 instanceof SubjectiveScorecardQuestion),
                (q2 instanceof SubjectiveScorecardQuestion));
    }

    private void assertQuestionsMatch(SubjectiveScorecardQuestion q1,
                                      SubjectiveScorecardQuestion q2) {
        assertQuestionsMatch((ScorecardQuestion) q1, (ScorecardQuestion) q2);
        SubjectiveResponse[] resp1 = q1.getResponses();
        SubjectiveResponse[] resp2 = q2.getResponses();
        assertEquals("Different numbers of responses", resp1.length,
                resp2.length);
        for (int i = 0; i < resp1.length; i++) {
            assertSubjectiveResponsesMatch(resp1[i], resp2[i]);
        }
    }

    private void assertSubjectiveResponsesMatch(SubjectiveResponse resp1,
                                                SubjectiveResponse resp2) {
        assertEquals("Response texts differ", resp1.getResponseText(),
                resp2.getResponseText());
        assertEquals("Response types differ", resp1.getResponseType(),
                resp2.getResponseType());
    }

    private void assertTestCaseReviewsMatch(TestCaseReview rev1,
                                            TestCaseReview rev2) {
        // assertEquals("Approvals differ", rev1.getTestCaseApproval().getId(),
        //              rev2.getTestCaseApproval().getId());
        assertEquals("Review texts differ", rev1.getReviewText(),
                rev2.getReviewText());
        assertEquals("Projects differ", rev1.getProject().getId(),
                rev2.getProject().getId());
        assertEquals("Reviewers differ", rev1.getReviewer().getId(),
                rev2.getReviewer().getId());
        assertEquals("Reviewees differ", rev1.getReviewee().getId(),
                rev2.getReviewee().getId());
    }

    private void assertAggWorksheetsMatch(AggregationWorksheet sheet1,
                                          AggregationWorksheet sheet2) {
        assertEquals("Completion flags differ", sheet1.isCompleted(),
                sheet2.isCompleted());
        assertEquals("PM Review flags differ", sheet1.isPMReviewed(),
                sheet2.isPMReviewed());
        AggregationResponse[] responses1 = sheet1.getAggregationResponses();
        AggregationResponse[] responses2 = sheet2.getAggregationResponses();
        assertEquals("Numbers of responses differ", responses1.length,
                responses2.length);
        for (int i = 0; i < responses1.length; i++) {
            assertAggResponsesMatch(responses1[i], responses2[i]);
        }
        assertEquals("Projects differ", sheet1.getProject().getId(),
                sheet2.getProject().getId());
        assertEquals("Aggregators differ", sheet1.getAggregator().getId(),
                sheet2.getAggregator().getId());
    }

    private void assertAggResponsesMatch(AggregationResponse resp1,
                                         AggregationResponse resp2) {
        assertSubjectiveResponsesMatch(resp1.getSubjectiveResponse(),
                resp2.getSubjectiveResponse());
        assertEquals("Response stati differ",
                resp1.getAggregationResponseStatus(),
                resp2.getAggregationResponseStatus());
        assertQuestionsMatch(resp1.getScorecardQuestion(),
                resp2.getScorecardQuestion());
        assertEquals("Reviewers differ", resp1.getReviewer().getId(),
                resp2.getReviewer().getId());
    }

    private void assertAggReviewsMatch(AggregationReview rev1,
                                       AggregationReview rev2) {
        assertEquals("Agg stati differ", rev1.getStatus(),
                rev2.getStatus());
        assertEquals("Agg texts differ", rev1.getText(), rev2.getText());
        assertEquals("PM review flags differ", rev1.isPMReviewed(),
                rev2.isPMReviewed());
        assertAggWorksheetsMatch(rev1.getAggregationWorksheet(),
                rev2.getAggregationWorksheet());
    }

    private void assertFinalReviewsMatch(FinalReview rev1, FinalReview rev2) {
        FixItem[] items1 = rev1.getFixCheckList();
        FixItem[] items2 = rev2.getFixCheckList();
        assertEquals("Numbers of fix items differ", items1.length,
                items2.length);
        for (int i = 0; i < items1.length; i++) {
            assertFixItemsMatch(items1[i], items2[i]);
        }
        assertAggWorksheetsMatch(rev1.getAggregationWorkSheet(),
                rev2.getAggregationWorkSheet());
    }

    private void assertFixItemsMatch(FixItem item1, FixItem item2) {
        assertEquals("Fix stati differ", item1.getFinalFixStatus().getId(),
                item2.getFinalFixStatus().getId());
        assertAggResponsesMatch(item1.getAggregationResponse(),
                item2.getAggregationResponse());
    }

    public static Test suite() throws Exception {
        TestSuite suite = new TestSuite();

        /*
         * Tests added explicitly to preserve the specified order.  This order
         * matches the normal project workflow
         */
        suite.addTest(
                new DocumentManagerAccuracyTests("testInitialSubmission"));
        suite.addTest(
                new DocumentManagerAccuracyTests("testScreeningScorecards"));
        suite.addTest(new DocumentManagerAccuracyTests("testReviewScorecards"));
        suite.addTest(new DocumentManagerAccuracyTests("testTestCaseReview"));
        suite.addTest(new DocumentManagerAccuracyTests("testAggregation"));
        suite.addTest(
                new DocumentManagerAccuracyTests("testAggregationReview"));
        suite.addTest(new DocumentManagerAccuracyTests("testFinalFixes"));
        suite.addTest(new DocumentManagerAccuracyTests("testFinalReview"));

        return new Setup(suite);
    }

    private static class Setup extends TestSetup {
        private static long DEV_ROLE_ID = 1L;
        private static long SCREENER_ROLE_ID = 2L;
        private static long REVIEWER_ROLE_ID = 3L;
        private static long AGGREGATOR_ROLE_ID = 4L;
        private static long FINAL_REVIEWER_ROLE_ID = 5L;
        private static long PM_ROLE_ID = 6L;

        private static long STRESS_RESP = 1L;
        private static long FAILURE_RESP = 2L;
        private static long ACCURACY_RESP = 3L;
        private static long NO_RESP = -1L;

        private AccuracyTestUtils utils = new AccuracyTestUtils();
        private UMProxy userman;

        public Setup(Test test) throws Exception {
            super(test);
        }

        private void setUpOneUser(PTProxy tracker, Project proj, User user,
                                  long roleId, long respId)
                throws Exception {
            tracker.assignUserRole(user, new Role(roleId, ""),
                    (respId == NO_RESP)
                    ? null
                    : new ReviewerResponsibility(respId, ""),
                    proj);
        }

        private void setUpUsers(PTProxy tracker, UMProxy userman, Project proj,
                                User[] users, User requestor)
                throws Exception {
            Connection con;

            screenerUser = userman.getUser(new TCSubject(users[1].getId()));
            assertNotNull("Could not obtain designated user: "
                    + users[1].getId(), screenerUser);
            setUpOneUser(tracker, proj, screenerUser, SCREENER_ROLE_ID,
                    NO_RESP);
            setUpOneUser(tracker, proj, screenerUser, AGGREGATOR_ROLE_ID,
                    NO_RESP);
            setUpOneUser(tracker, proj, screenerUser, REVIEWER_ROLE_ID,
                    FAILURE_RESP);
            setUpOneUser(tracker, proj, screenerUser, FINAL_REVIEWER_ROLE_ID,
                    NO_RESP);

            rev2User = userman.getUser(new TCSubject(users[2].getId()));
            assertNotNull("Could not obtain designated user: "
                    + users[2].getId(), rev2User);
            setUpOneUser(tracker, proj, rev2User, REVIEWER_ROLE_ID,
                    ACCURACY_RESP);

            rev3User = userman.getUser(new TCSubject(users[3].getId()));
            assertNotNull("Could not obtain designated user: "
                    + users[3].getId(), rev3User);
            setUpOneUser(tracker, proj, rev3User, REVIEWER_ROLE_ID,
                    STRESS_RESP);

            tracker.saveProject(proj, "Assigned user roles", requestor);

            con = utils.getConnection();
            try {
                dev1User = userman.getUser(new TCSubject(users[4].getId()));
                assertNotNull("Could not obtain designated user: "
                        + users[4].getId(), dev1User);
                tracker.registerDeveloper(dev1User, proj, con);

                dev2User = userman.getUser(new TCSubject(users[5].getId()));
                assertNotNull("Could not obtain designated user: "
                        + users[5].getId(), dev2User);
                tracker.registerDeveloper(dev2User, proj, con);
            } finally {
                con.close();
            }

            observerUser = userman.getUser(new TCSubject(users[6].getId()));
            assertNotNull("Could not obtain designated user: "
                    + users[6].getId(), observerUser);

            proj = tracker.getProject(proj.getId(), pmUser);
        }

        public void setUp() throws Exception {
            super.setUp();
            User[] users = utils.getUsers(7, 32);

            userman = new Sub2UMProxy();
            pmUser = userman.getUser(new TCSubject(users[0].getId()));
            assertNotNull("Could not obtain designated user: "
                    + users[0].getId(), pmUser);

            tracker = new Sub2PTProxy();
            proj = tracker.createProject("Test Project", "1.0", pmUser);
            assertNotNull("No project created", proj);

            setUpUsers(tracker, userman, proj, users, pmUser);
        }

        public void tearDown() throws Exception {
            tracker.remove();
            userman.remove();
            super.tearDown();
        }
    }
}

