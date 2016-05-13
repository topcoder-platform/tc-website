/*
 * DocumentManagerTest.java
 *
 * Created on June 30, 2003, 7:08 PM
 */

package com.topcoder.apps.review.stresstests;

import junit.framework.*;
import com.topcoder.security.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

/**
 * Tests DocumentManager performance.
 *
 * @author  valeriy
 * @version 1.0
 */
public class DocumentManagerTest extends AbstractStressTest {

    public static final long USERID = 2059064;
    public static final long PROJECTID = 1;

    private TCSubject user;
    private Project project;

    /** Creates a new instance of DocumentManagerTest */
    public DocumentManagerTest(String name) {
        super(name);
    }

    protected void setUp() throws Exception {
        super.setUp();
        user = /*userManager.getUser(*/new TCSubject(USERID);
        if (user == null) {
            System.out.println("User " + USERID + " not found. You may need to adjust USERID variable.");
        }
        project = projectTracker.getProjectById(PROJECTID, user);
        if (project == null) {
            System.out.println("Project " + PROJECTID + " not found. You may need to adjust PROJECTID variable.");
        }
    }

    /** Tests getScreeningScorecard(Project, TCSubject) method
     *  in single thread
     */
    public void testGetScreeningScorecard1_10() throws Exception {
        run(1, 10, 0, new Object[]{project, user});
    }

    /** Tests getScreeningScorecard(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetScreeningScorecard10_10() throws Exception {
        run(10, 10, 0, new Object[]{project, user});
    }

    /** Tests saveScreeningScorecard(ScreeningScorecard) method
     *  in single thread
     */
    public void testSaveScreeningScorecard1_10() throws Exception {
        run(1, 10, 1, new Object[]{project, user});
    }

    /** Tests getReviewScorecard(Project, TCSubject) method
     *  in single thread
     */
    public void testGetReviewScorecard1_10() throws Exception {
        run(1, 10, 2, new Object[]{project, user});
    }

    /** Tests getReviewScorecard(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetReviewScorecard10_10() throws Exception {
        run(10, 10, 2, new Object[]{project, user});
    }

    /** Tests saveReviewScorecard(ReviewScorecard) method
     *  in single thread
     */
    public void testSaveReviewScorecard1_10() throws Exception {
        run(1, 10, 3, new Object[]{project, user});
    }

    /** Tests getTestCaseReview(Project, TCSubject) method
     *  in single thread
     */
    public void testGetTestCaseReview1_10() throws Exception {
        run(1, 10, 4, new Object[]{project, user});
    }

    /** Tests getTestCaseReview(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetTestCaseReview10_10() throws Exception {
        run(10, 10, 4, new Object[]{project, user});
    }

    /** Tests saveTestCaseReview(TestCaseReview) method
     *  in single thread
     */
    public void testSaveTestCaseReview1_10() throws Exception {
        run(1, 10, 5, new Object[]{project, user});
    }

    /** Tests getInitialSubmissions(Project, TCSubject) method
     *  in single thread
     */
    public void testGetInitialSubmissions1_10() throws Exception {
        run(1, 10, 6, new Object[]{project, user});
    }

    /** Tests getInitialSubmissions(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetInitialSubmissions10_10() throws Exception {
        run(10, 10, 6, new Object[]{project, user});
    }

    /** Tests saveInitialSubmission(InitialSubmission) method
     *  in single thread
     */
    public void testSaveInitialSubmission1_10() throws Exception {
        run(1, 10, 7, new Object[]{project, user});
    }

    /** Tests getAggregation(Project, TCSubject) method
     *  in single thread
     */
    public void testGetAggregation1_10() throws Exception {
        run(1, 10, 8, new Object[]{project, user});
    }

    /** Tests getAggregation(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetAggregation10_10() throws Exception {
        run(10, 10, 8, new Object[]{project, user});
    }

    /** Tests saveAggregation(AggregationWorksheet) method
     *  in single thread
     */
    public void testSaveAggregation1_10() throws Exception {
        run(1, 10, 9, new Object[]{project, user});
    }

    /** Tests getFinalFixSubmission(Project, TCSubject) method
     *  in single thread
     */
    public void testGetFinalFixSubmission1_10() throws Exception {
        run(1, 10, 10, new Object[]{project, user});
    }

    /** Tests getFinalFixSubmission(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetFinalFixSubmission10_10() throws Exception {
        run(10, 10, 10, new Object[]{project, user});
    }

    /** Tests saveFinalFixSubmission(FinalFixSubmission) method
     *  in single thread
     */
    public void testSaveFinalFixSubmission1_10() throws Exception {
        run(1, 10, 11, new Object[]{project, user});
    }

    /** Tests getAggregationReview(Project, TCSubject) method
     *  in single thread
     */
    public void testGetAggregationReview1_10() throws Exception {
        run(1, 10, 12, new Object[]{project, user});
    }

    /** Tests getAggregationReview(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetAggregationReview10_10() throws Exception {
        run(10, 10, 12, new Object[]{project, user});
    }

    /** Tests saveAggregationReview(AggregationReview) method
     *  in single thread
     */
    public void testSaveAggregationReview1_10() throws Exception {
        run(1, 10, 13, new Object[]{project, user});
    }

    /** Tests getFinalReview(Project, TCSubject) method
     *  in single thread
     */
    public void testGeFinalReview1_10() throws Exception {
        run(1, 10, 14, new Object[]{project, user});
    }

    /** Tests getFinalReview(Project, TCSubject) method
     *  in 10 threads
     */
    public void testGetFinalReview10_10() throws Exception {
        run(10, 10, 14, new Object[]{project, user});
    }

    /** Tests saveFinalReview(AggregationReview) method
     *  in single thread
     */
    public void testSaveFinalReview1_10() throws Exception {
        run(1, 10, 15, new Object[]{project, user});
    }


    Worker getWorker(int count, int type, Object[] params) {
        switch (type) {
            case 0:
                return new DocumentWorker1(count, params);
            case 1:
                return new DocumentWorker2(count, params);
            case 2:
                return new DocumentWorker3(count, params);
            case 3:
                return new DocumentWorker4(count, params);
            case 4:
                return new DocumentWorker5(count, params);
            case 5:
                return new DocumentWorker6(count, params);
            case 6:
                return new DocumentWorker7(count, params);
            case 7:
                return new DocumentWorker8(count, params);
            case 8:
                return new DocumentWorker9(count, params);
            case 9:
                return new DocumentWorker10(count, params);
            case 10:
                return new DocumentWorker11(count, params);
            case 11:
                return new DocumentWorker12(count, params);
            case 12:
                return new DocumentWorker13(count, params);
            case 13:
                return new DocumentWorker14(count, params);
            case 14:
                return new DocumentWorker15(count, params);
            case 15:
                return new DocumentWorker16(count, params);
        }
        return null;
    }

    class DocumentWorker1 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker1(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            ScreeningScorecard[] cards = documentManager.getScreeningScorecard(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("ScreeningScorecards for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker2 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker2(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            ScreeningScorecard[] cards = documentManager.getScreeningScorecard(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("ScreeningScorecards for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                cards[0].setPMReviewed(true);
                documentManager.saveScreeningScorecard(cards[0], user);
            }
        }
    }

    class DocumentWorker3 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker3(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            ReviewScorecard[] cards = documentManager.getReviewScorecard(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("ReviewScorecards for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker4 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker4(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            ReviewScorecard[] cards = documentManager.getReviewScorecard(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("ReviewScorecards for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                cards[0].setPMReviewed(true);
                documentManager.saveReviewScorecard(cards[0], user);
            }
        }
    }

    class DocumentWorker5 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker5(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            TestCaseReview[] cards = documentManager.getTestCaseReview(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("TestCaseReviews for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker6 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker6(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            TestCaseReview[] cards = documentManager.getTestCaseReview(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("TestCaseReviews for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                cards[0].setReviewText("test");
                documentManager.saveTestCaseReview(cards[0], user);
            }
        }
    }

    class DocumentWorker7 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker7(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            InitialSubmission[] cards = documentManager.getInitialSubmissions(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("InitialSubmissions for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker8 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker8(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            InitialSubmission[] cards = documentManager.getInitialSubmissions(project, user);
            if (cards == null || cards.length == 0) {
                System.out.println("InitialSubmissions for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                cards[0].setPMScreeningMessage("test");
                documentManager.saveInitialSubmission(cards[0], user);
            }
        }
    }

    class DocumentWorker9 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker9(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            AggregationWorksheet sheet = documentManager.getAggregation(project, user);
            if (sheet == null) {
                System.out.println("AggregationWorksheet for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker10 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker10(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            AggregationWorksheet sheet = documentManager.getAggregation(project, user);
            if (sheet == null) {
                System.out.println("AggregationWorksheet for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                sheet.setPMReviewed(true);
                documentManager.saveAggregation(sheet, user);
            }
        }
    }

    class DocumentWorker11 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker11(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            FinalFixSubmission fixes = documentManager.getFinalFixSubmission(project, user);
            if (fixes == null) {
                System.out.println("FinalFixSubmission for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker12 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker12(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            FinalFixSubmission fixes = documentManager.getFinalFixSubmission(project, user);
            if (fixes == null) {
                System.out.println("FinalFixSubmission for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                fixes.setPMReviewMessage("test");
                documentManager.saveFinalFixSubmission(fixes, user);
            }
        }
    }

    class DocumentWorker13 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker13(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            AggregationReview[] review = documentManager.getAggregationReview(project, user);
            if (review == null) {
                System.out.println("AggregationReview for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker14 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker14(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            AggregationReview[] review = documentManager.getAggregationReview(project, user);
            if (review == null || review.length == 0) {
                System.out.println("AggregationReview for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                review[0].setPMReviewed(true);
                documentManager.saveAggregationReview(review[0], user);
            }
        }
    }

    class DocumentWorker15 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker15(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            FinalReview review = documentManager.getFinalReview(project, user);
            if (review == null) {
                System.out.println("FinalReview for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class DocumentWorker16 extends Worker {

        Project project;
        TCSubject user;

        DocumentWorker16(int count, Object[] params) {
            super(count, params);
            project = (Project) params[0];
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            FinalReview review = documentManager.getFinalReview(project, user);
            if (review == null) {
                System.out.println("FinalReview for " + project.getId() + " not found. You may need to adjust PROJECTID variable.");
            } else {
                review.setFixCheckList(review.getFixCheckList());
                documentManager.saveFinalReview(review, user);
            }
        }
    }


    public static Test suite() {
        return new TestSuite(DocumentManagerTest.class);
    }
}
