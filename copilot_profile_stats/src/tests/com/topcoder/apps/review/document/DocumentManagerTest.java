/*
 * DocumentManagerTest.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.IncorrectProjectStateException;
import com.topcoder.apps.review.projecttracker.PaymentInfo;
import com.topcoder.apps.review.projecttracker.PaymentStatus;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectStatus;
import com.topcoder.apps.review.projecttracker.ProjectTrackerTest;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.security.TCSubject;

import junit.framework.Test;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.rmi.PortableRemoteObject;

import javax.sql.DataSource;


/**
 * DOCUMENT ME!
 *
 * @author TCSDeveloper
 */
public class DocumentManagerTest extends ServletTestCase {
    private DocumentManagerLocal documentManager;
    DataSource dataSource;

    // ProjectTracker objects for testing
    private Role _role1;
    private Role _role2;
    private Phase _phase1;
    private Phase _phase2;
    private ReviewerResponsibility _revResp;
    private PaymentStatus _paymentStatus1;
    private PaymentStatus _paymentStatus2;
    private ProjectType _projectType;
    private ProjectStatus _projectStatus;
    private User _user1;
    private TCSubject _tcuser1;
    private User _user2;
    private TCSubject _tcuser2;
    private PaymentInfo _paymentInfo1;
    private PaymentInfo _paymentInfo2;
    private PhaseInstance _pi1;
    private PhaseInstance _pi2;
    private PhaseInstance[] _piArr;
    private UserRole _ur1;
    private UserRole _ur2;
    private UserRole[] _userRoleArr;
    private Project _project;

    // DocumentManager objects for testing
    private Evaluation _eval1;
    private ResponseType _rt1;
    private ScorecardSectionGroup _sectionGroup1;
    private ScorecardSection _section1;
    private AggregationResponseStatus _ars1;
    private TestCaseApproval _tca1;
    private AggregationApproval _aa1;
    private SubjectiveResponse _sr1;
    private SubjectiveResponse[] _subjRespArr;
    private SubjectiveScorecardQuestion _sq1;
    private ScorecardQuestion _sq2;
    private ScorecardQuestion[] _sqArr1;
    private SubjectiveScorecardQuestion _sq3;
    private ScorecardQuestion _sq4;
    private ScorecardQuestion[] _sqArr3;
    private InitialSubmission _sub1;
    private InitialSubmission _sub1error;
    private FinalFixSubmission _sub2;
    private ScreeningScorecard _sc1;
    private ScreeningScorecard _sc2;
    private ReviewScorecard _sc3;
    private AggregationResponse _ar1;
    private AggregationResponse[] _arArr;
    private AggregationWorksheet _worksheet1;
    private TestCaseReview _tcr1;
    private AggregationReview _arev1;

    /**
     * Constructor for DocumentManagerTest.
     *
     * @param name
     */
    public DocumentManagerTest(String name) {
        super(name);
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        //suite.addTest(new TestSuite(DocumentManagerTest.class));
        suite.addTest(new DocumentManagerTest("testGetScreeningScorecard"));
        suite.addTest(new DocumentManagerTest("testGetReviewScorecard"));
        suite.addTest(new DocumentManagerTest("testGetInitialSubmission"));
        suite.addTest(new DocumentManagerTest("testGetFinalFixes"));

        suite.addTest(new DocumentManagerTest("testGetAggregation"));
        suite.addTest(new DocumentManagerTest("testGetTestCaseReview"));
        suite.addTest(new DocumentManagerTest("testGetAggregationReview"));
        suite.addTest(new DocumentManagerTest("testGetFinalReview"));

        return suite;
    }

    /**
     * DOCUMENT ME!
     *
     * @throws Exception DOCUMENT ME!
     * @throws RuntimeException DOCUMENT ME!
     */
    protected void setUp() throws Exception {
        System.err.println("SETUP-TEST!");

        Context ctx = new InitialContext();
        DocumentManagerLocalHome home = (DocumentManagerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.document.DocumentManagerLocalHome"), DocumentManagerLocalHome.class);
        this.documentManager = home.create();

        try {
            dataSource = (DataSource) ctx.lookup("java:/InformixDS");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

        Connection conn = dataSource.getConnection();

        //
        // Create ProjectTracker-objects for testing
        //
        // CREATE CONSTANTS
        _role1 = new Role(2, "Primary Screener");
        _role2 = new Role(3, "Reviewer");
        _phase1 = new Phase(2, "Screening");
        _phase2 = new Phase(3, "Review");
        _paymentStatus1 = new PaymentStatus(1, "Not Paid");
        _paymentStatus2 = new PaymentStatus(2, "Payment Sent");
        _revResp = new ReviewerResponsibility(3, "Accuracy");
        _projectType = new ProjectType(2, "Development");
        _projectStatus = new ProjectStatus(1, "In Progress");

        // CREATE USERS
        _user1 = new User(ProjectTrackerTest.USER_ID1, ProjectTrackerTest.USER_HANDLE1,
                ProjectTrackerTest.USER_FIRST_NAME1, ProjectTrackerTest.USER_LAST_NAME1, ProjectTrackerTest.USER_EMAIL1);
        _tcuser1 = new TCSubject(_user1.getId());
        _user2 = new User(ProjectTrackerTest.USER_ID2, ProjectTrackerTest.USER_HANDLE2,
                ProjectTrackerTest.USER_FIRST_NAME2, ProjectTrackerTest.USER_LAST_NAME2, ProjectTrackerTest.USER_EMAIL2);
        _tcuser2 = new TCSubject(_user2.getId());

        // CREATE PAYMENT_INFOS
        PreparedStatement ps = conn.prepareStatement("DELETE FROM payment_info");
        ps.executeUpdate();

        ProjectTrackerTest.insertPaymentInfo(conn, 1, 1, 10, 1, ProjectTrackerTest.USER_ID1, true);
        _paymentInfo1 = new PaymentInfo(1, 10, _paymentStatus1, 1);

        ProjectTrackerTest.insertPaymentInfo(conn, 2, 2, 20, 2, ProjectTrackerTest.USER_ID1, true);
        _paymentInfo2 = new PaymentInfo(2, 20, _paymentStatus2, 2);

        /*
           Calendar c = Calendar.getInstance();
           c.set(2003, 6, 16, 0, 0, 0);
           Date startDate = c.getTime();
           c.set(2003, 6, 23);
           Date endDate = c.getTime();
           Date startDate2 = endDate;
           c.set(2003, 6, 30);
           Date endDate2 = c.getTime();
         */
        // CREATE PHASE_INSTANCES
        ps = conn.prepareStatement("DELETE FROM phase_instance");
        ps.executeUpdate();

        java.sql.Date _startDate1 = new java.sql.Date(103, 5, 16);
        java.sql.Date _endDate1 = new java.sql.Date(103, 5, 23);
        java.sql.Date _startDate2 = _endDate1;
        java.sql.Date _endDate2 = new java.sql.Date(103, 5, 30);
        ProjectTrackerTest.insertPhaseInstance(conn, 1, 1, _startDate1, _endDate1, 2, ProjectTrackerTest.COMP_VERS_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _pi1 = new PhaseInstance(1, _phase1, _startDate1, _endDate1, 1);

        ProjectTrackerTest.insertPhaseInstance(conn, 2, 2, _startDate2, _endDate2, 3, ProjectTrackerTest.COMP_VERS_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _pi2 = new PhaseInstance(2, _phase2, _startDate2, _endDate2, 2);

        _piArr = new PhaseInstance[]{_pi1, _pi2};

        // CREATE USER_ROLES
        ps = conn.prepareStatement("DELETE FROM r_user_role");
        ps.executeUpdate();
        ProjectTrackerTest.insertUserRole(conn, 1, 1, 2, ProjectTrackerTest.COMP_VERS_ID1, ProjectTrackerTest.USER_ID1,
                1, 0, ProjectTrackerTest.USER_ID1, true);
        _ur1 = new UserRole(1, _role1, _user1, _paymentInfo1, null, 1);

        ProjectTrackerTest.insertUserRole(conn, 2, 2, 3, ProjectTrackerTest.COMP_VERS_ID1, ProjectTrackerTest.USER_ID1,
                2, 3, ProjectTrackerTest.USER_ID1, true);
        _ur2 = new UserRole(2, _role2, _user1, _paymentInfo2, _revResp, 2);

        _userRoleArr = new UserRole[]{_ur1, _ur2};

        // CREATE PROJECTS
        ps = conn.prepareStatement("DELETE FROM project");
        ps.executeUpdate();

        User pm = _user1;
        User winner = _user1;
        User requestor = _user1;

        ProjectTrackerTest.insertProject(conn, 1, 1, ProjectTrackerTest.COMP_VERS_ID1, 1, ProjectTrackerTest.USER_ID1,
                "overview", "notes", 2, 1, false, ProjectTrackerTest.USER_ID1, "created", true);
        _project = new Project(1, ProjectTrackerTest.COMP_VERS_ID1, ProjectTrackerTest.PROJECT_NAME1,
                ProjectTrackerTest.PROJECT_VERSION1, pm, winner, _piArr, _piArr[0], _userRoleArr, "notes", "overview",
                _projectType, _projectStatus, false, requestor.getId(), 1);

        //
        // Create DocumentManager-objects for testing
        //
        _eval1 = new Evaluation(1, "Strongly Disagree", 1);
        _sectionGroup1 = new ScorecardSectionGroup(1, "Class", 1);
        _section1 = new ScorecardSection(1, "Design", 4, 1, _sectionGroup1);
        _rt1 = new ResponseType(1, "Required");
        _ars1 = new AggregationResponseStatus(1, "Accepted");

        _tca1 = new TestCaseApproval(1, "Approved");

        // CREATE SUBJECTIVE_RESPONSES
        ps = conn.prepareStatement("DELETE FROM subjective_resp");
        ps.executeUpdate();
        insertSubjResponse(conn, 1, 1, "subjective text", 1, 1, ProjectTrackerTest.USER_ID1, true);
        _sr1 = new SubjectiveResponse(1, "subjective text", _rt1, 1);
        _subjRespArr = new SubjectiveResponse[]{_sr1};

        // CREATE SCORECARD_QUESTIONS
        ps = conn.prepareStatement("DELETE FROM scorecard_question");
        ps.executeUpdate();
        insertQuestion(conn, 1, 1, "Properly indented", 4, 1, 1, 1, 1, 2, ProjectTrackerTest.USER_ID1, true);
        // TODO Change to proper template version id
        _sq1 = new SubjectiveScorecardQuestion(1, _eval1, "Properly indented", 4, _section1, 1, _subjRespArr, 1, 1);
        insertQuestion(conn, 2, 2, "Properly indented2", 4, 2, 1, 1, 1, 1, ProjectTrackerTest.USER_ID1, true);
        // TODO Change to proper template version id
        _sq2 = new ScorecardQuestion(2, _eval1, "Properly indented2", 4, _section1, 2, 1, 2);
        _sqArr1 = new ScorecardQuestion[]{_sq1, _sq2};

        insertQuestion(conn, 3, 3, "Properly indented", 2, 1, 1, 1, 3, 2, ProjectTrackerTest.USER_ID1, true);
        // TODO Change to proper template version id
        _sq3 = new SubjectiveScorecardQuestion(3, _eval1, "Properly indented", 2, _section1, 1, _subjRespArr, 2, 3);
        insertQuestion(conn, 4, 4, "Properly indented2", 3, 2, 1, 1, 3, 1, ProjectTrackerTest.USER_ID1, true);
        // TODO Change to proper template version id
        _sq4 = new ScorecardQuestion(4, _eval1, "Properly indented2", 3, _section1, 2, 2, 4);
        _sqArr3 = new ScorecardQuestion[]{_sq3, _sq4};

        // CREATE SUBMISSIONS
        ps = conn.prepareStatement("DELETE FROM submission");
        ps.executeUpdate();
        insertSubmission(conn, 1, 1, 1, "test.jar", "Review message", "Screening message", ProjectTrackerTest.USER_ID1,
                ProjectTrackerTest.COMP_VERS_ID1, false, ProjectTrackerTest.USER_ID1, false);
        insertSubmission(conn, 2, 1, 1, "test2.jar", "Review message", "Screening message",
                ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1, false, ProjectTrackerTest.USER_ID1, true);
        _sub1 = new InitialSubmission(1, new URL("test2.jar"), "Review message", "Screening message", _user1, _project,
                false, ProjectTrackerTest.USER_ID1, 2);
        _sub1error = new InitialSubmission(511, new URL("test2.jar"), "Review message", "Screening message", _user1,
                _project, false, ProjectTrackerTest.USER_ID1, 512);

        insertSubmission(conn, 3, 2, 2, "sub2.jar", "Rev message", "Screen message", ProjectTrackerTest.USER_ID1,
                ProjectTrackerTest.COMP_VERS_ID1, false, ProjectTrackerTest.USER_ID1, true);
        _sub2 = new FinalFixSubmission(2, new URL("sub2.jar"), "Rev message", "Screen message", _user1, _project,
                false, ProjectTrackerTest.USER_ID1, 3);

        // CREATE SCORECARDS
        ps = conn.prepareStatement("DELETE FROM scorecard");
        ps.executeUpdate();

        User _author = _user1;
        long _reqId = ProjectTrackerTest.USER_ID1;

        insertScorecard(conn, 1, 1, 1, true, false, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                1, 21, ProjectTrackerTest.USER_ID1, true);
        _sc1 = new ScreeningScorecard(1, true, false, _sqArr1, _author, _project, _sub1, 21, _reqId, 1);

        insertScorecard(conn, 2, 2, 1, false, true, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                1, 23, ProjectTrackerTest.USER_ID1, false);
        insertScorecard(conn, 3, 2, 1, true, false, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                1, 25, ProjectTrackerTest.USER_ID1, false);
        insertScorecard(conn, 4, 2, 1, false, true, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                1, 28, ProjectTrackerTest.USER_ID1, true);
        _sc2 = new ScreeningScorecard(2, false, true, _sqArr1, _author, _project, _sub1, 28, _reqId, 4);

        insertScorecard(conn, 5, 3, 2, false, true, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                1, 28, ProjectTrackerTest.USER_ID1, true);
        _sc3 = new ReviewScorecard(3, false, true, _sqArr3, _author, _project, _sub1, 28, _reqId, 5);

        // CREATE AGGREGATION_RESPONSES
        ps = conn.prepareStatement("DELETE FROM agg_response");
        ps.executeUpdate();
        insertAggResponse(conn, 1, 1, 1, 1, 1, ProjectTrackerTest.USER_ID1, true);
        _ar1 = new AggregationResponse(1, _sr1, _ars1, _sq1, _author, 1);
        _arArr = new AggregationResponse[]{_ar1};

        // CREATE AGGREGATION_WORKSHEETS
        ps = conn.prepareStatement("DELETE FROM agg_worksheet");
        ps.executeUpdate();
        insertWorksheet(conn, 1, 1, true, false, ProjectTrackerTest.USER_ID1, ProjectTrackerTest.COMP_VERS_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _worksheet1 = new AggregationWorksheet(1, true, false, _user1, _arArr, _project, _user1.getId(), 1);

        // CREATE TESTCASE_REVIEWS
        ps = conn.prepareStatement("DELETE FROM testcase_review");
        ps.executeUpdate();
        insertTestCaseReview(conn, 1, 1, 1, "Nice case", ProjectTrackerTest.COMP_VERS_ID1, ProjectTrackerTest.USER_ID1,
                ProjectTrackerTest.USER_ID1, true, ProjectTrackerTest.USER_ID1, true);
        _tcr1 = new TestCaseReview(1, _tca1, _project, "Nice case", _user1, _user1, true, ProjectTrackerTest.USER_ID1, 1);

        // CREATE AGGREGATION_REVIEWS
        ps = conn.prepareStatement("DELETE FROM agg_review");
        ps.executeUpdate();

        _aa1 = new AggregationApproval(1, "Approved");

        insertAggregationReview(conn, 1, 1, 1, "Nice review, ok", true, 1, true, ProjectTrackerTest.USER_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _arev1 = new AggregationReview(1, _aa1, "Nice review, ok", true, _worksheet1, true, _user1,
                ProjectTrackerTest.USER_ID1, 1);

        // CREATE FIX_ITEMS
        ps = conn.prepareStatement("DELETE FROM fix_item");
        ps.executeUpdate();

        // CREATE FINAL_REVIEWS
        ps = conn.prepareStatement("DELETE FROM final_review");
        ps.executeUpdate();

        conn.close();
        System.err.println("SETUP-TEST done!");
    }

    /**
     * DOCUMENT ME!
     *
     * @throws Exception DOCUMENT ME!
     */
    protected void tearDown() throws Exception {
        documentManager.remove();
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetScreeningScorecard() {
        ScreeningScorecard[] scorecard = documentManager.getScreeningScorecard(_project, _tcuser1);
        assertNotNull(scorecard);
        assertEquals("scorecard.length equals", 2, scorecard.length);
        checkScorecard("testGetScreeningScorecard():", _sc1, scorecard[0]);

        scorecard[0].setScore(100);
        _sc1.setScore(100);
        scorecard[0].setCompleted(false);
        _sc1.setCompleted(false);
        scorecard[0].setPMReviewed(true);
        _sc1.setPMReviewed(true);

        try {
            documentManager.saveScreeningScorecard(scorecard[0], _tcuser1);
        } catch (Exception e) {
            fail("Exception: " + e);
        }
        scorecard = documentManager.getScreeningScorecard(_project, _tcuser1);
        assertNotNull(scorecard);
        assertEquals("scorecard.length equals", 2, scorecard.length);
        checkScorecard("testGetScreeningScorecard2():", _sc1, scorecard[0]);

        //      scorecard[0].getQuestions()[0].setEvaluation(
        //          new EvaluationImpl(2, "Disagree"));
        SubjectiveScorecardQuestion ssq = (SubjectiveScorecardQuestion) scorecard[0].getQuestions()[0];
        ResponseType c_rt = new ResponseType(1, "Recommended");

        //        SubjectiveResponse srNew = new SubjectiveResponseImpl(-1, "new response", rt, 0);
        SubjectiveResponse sr = ssq.getResponses()[0];
        sr.setResponseText("Changed text");
        sr.setResponseType(c_rt);

        SubjectiveScorecardQuestion _ssq = (SubjectiveScorecardQuestion) _sc1.getQuestions()[0];
        SubjectiveResponse c_sr = _ssq.getResponses()[0];
        c_sr.setResponseText("Changed text");
        c_sr.setResponseType(c_rt);

        //        SubjectiveResponse[] srArr = new SubjectiveResponse[1];
        //        srArr[0] = sr;
        //        srArr[1] = srNew;
        //        ssq.setResponses(srArr);
        //documentManager.saveScreeningScorecard(scorecard[0]);
        ScreeningScorecard[] scorecard2 = documentManager.getScreeningScorecard(_project, _tcuser1);
        checkScorecard("testGetScreeningScorecard3:", _sc1, scorecard2[0]);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetReviewScorecard() {
        ReviewScorecard[] scorecard = documentManager.getReviewScorecard(_project, _tcuser1);
        assertNotNull(scorecard);
        assertEquals("scorecard.length equals", 1, scorecard.length);
        checkScorecard("testGetReviewScorecard():", _sc3, scorecard[0]);

        scorecard[0].setCompleted(true);
        _sc3.setCompleted(true);
        scorecard[0].setPMReviewed(false);
        _sc3.setPMReviewed(false);
        scorecard[0].setScore(45);
        _sc3.setScore(45);
        try {
            documentManager.saveReviewScorecard(scorecard[0], _tcuser1);
        } catch (Exception e) {
            fail("Exception: " + e);
        }
        scorecard = documentManager.getReviewScorecard(_project, _tcuser1);
        assertNotNull(scorecard);
        assertEquals("scorecard.length equals", 1, scorecard.length);
        checkScorecard("testGetReviewScorecard:", _sc3, scorecard[0]);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetInitialSubmission() {
        InitialSubmission[] sub = documentManager.getInitialSubmissions(_project, _tcuser1);
        assertNotNull("testGetInitialSubmission().sub!null", sub);
        assertEquals("testGetInitialSubmission().sub.length.equals", 1, sub.length);
        checkSubmission("testGetInitialSubmission():", _sub1, sub[0]);

        _sub1.setPMReviewMessage("Bad review");
        sub[0].setPMReviewMessage("Bad review");
        _sub1.setPMScreeningMessage("Bad screening");
        sub[0].setPMScreeningMessage("Bad screening");
        try {
            _sub1.setURL(new URL("new url"));
            sub[0].setURL(new URL("new url"));
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            documentManager.saveInitialSubmission(sub[0], _tcuser1);
        } catch (Exception e) {
            fail("Exception: " + e);
        }
        sub = documentManager.getInitialSubmissions(_project, _tcuser1);
        assertNotNull("testGetInitialSubmission().sub!null", sub);
        assertEquals("testGetInitialSubmission().sub.length.equals", 1, sub.length);
        checkSubmission("testGetInitialSubmission():", _sub1, sub[0]);

        try {
            documentManager.saveInitialSubmission(sub[0], _tcuser1);
        } catch (Exception e) {
            fail("Exception: " + e);
        }

        sub = documentManager.getInitialSubmissions(_project, _tcuser1);
        assertNotNull("testGetInitialSubmission().sub!null", sub);
        assertEquals("testGetInitialSubmission().sub.length.equals", 1, sub.length);
        checkSubmission("testGetInitialSubmission():", _sub1, sub[0]);

        /*
           try {
              _sub1error.setPMReviewMessage("New Review message");
              documentManager.saveSubmission(_sub1error);
              fail("testGetInitialSubmission().savesub did not throw exception.");
           } catch (IncorrectProjectStateException e) {
               System.err.println("IncorrectProjectState:" + e);
           } catch (InvalidEditException e) {
               System.err.println("InvalidEdit:" + e);
           }
         */
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetFinalFixes() {
        FinalFixSubmission sub = documentManager.getFinalFixSubmission(_project, _tcuser1);
        checkSubmission("testGetFinalFixes():", _sub2, sub);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetAggregation() {
        try {
            AggregationWorksheet worksheet = documentManager.getAggregation(_project, _tcuser1);
            checkWorksheet("testGetAggregationWorksheet():", _worksheet1, worksheet);

            _worksheet1.setCompleted(false);
            worksheet.setCompleted(false);
            documentManager.saveAggregation(worksheet, _tcuser1);
            worksheet = documentManager.getAggregation(_project, _tcuser1);
            checkWorksheet("testGetAggregationWorksheet().save:", _worksheet1, worksheet);

            _worksheet1.setCompleted(true);
            worksheet.setCompleted(true);
            documentManager.saveAggregation(worksheet, _tcuser1);
            worksheet = documentManager.getAggregation(_project, _tcuser1);
            checkWorksheet("testGetAggregationWorksheet().save2:", _worksheet1, worksheet);

            _worksheet1.setPMReviewed(true);
            worksheet.setPMReviewed(true);

            AggregationResponseStatus _ars2 = new AggregationResponseStatus(2, "Rejected");
            _worksheet1.getAggregationResponses()[0].setAggregationResponseStatus(_ars2);
            worksheet.getAggregationResponses()[0].setAggregationResponseStatus(_ars2);

            documentManager.saveAggregation(worksheet, _tcuser1);
            worksheet = documentManager.getAggregation(_project, _tcuser1);
            checkWorksheet("testGetAggregationWorksheet().save2:", _worksheet1, worksheet);
        } catch (Exception e) {
            fail("Exception: " + e);
        }
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetAggregationReview() {
        // TODO Fixme, change getAggRev to return array
        AggregationReview[] aggReview = documentManager.getAggregationReview(_project, _tcuser1);
        //checkAggregationReview("testGetAggregationReview():", _arev1, aggReview);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetFinalReview() {
        FinalReview fr = documentManager.getFinalReview(_project, _tcuser1);

        //checkFinalReview("testGetFinalReview():", _fr, fr);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetTestCaseReview() {
        TestCaseReview[] tcr = documentManager.getTestCaseReview(_project, _tcuser1);
        assertNotNull("testGetTestCaseReview().tcr!null", tcr);
        assertEquals("testGetInitialSubmission().tcr.length.equals", 1, tcr.length);
        checkTestCaseReview("testGetInitialSubmission():", _tcr1, tcr[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param sc1 DOCUMENT ME!
     * @param sc2 DOCUMENT ME!
     */
    public static void checkScorecard(String s, AbstractScorecard sc1, AbstractScorecard sc2) {
        assertNotNull(s + "scorecard(setup)", sc1);
        assertNotNull(s + "scorecard", sc2);
        assertEquals(s + "scorecard.id", sc1.getId(), sc2.getId());
        assertEquals(s + "scorecard.isCompleted", sc1.isCompleted(), sc2.isCompleted());
        assertEquals(s + "scorecard.isPMReviewed", sc1.isPMReviewed(), sc2.isPMReviewed());

        assertNotNull(s + "scorecard(setup).questions", sc1.getQuestions());
        assertNotNull(s + "scorecard.questions", sc2.getQuestions());
        assertEquals(s + "scorecard.questions.length", sc1.getQuestions().length, sc2.getQuestions().length);

        for (int i = 0; i < sc1.getQuestions().length; i++) {
            checkQuestion(s + "scorecard.question[" + i + "]:", sc1.getQuestions()[i], sc2.getQuestions()[i]);
        }

        assertNotNull(s + "scorecard(setup).author", sc1.getAuthor());
        ProjectTrackerTest.checkUser(s + "scorecard.author:", sc1.getAuthor(), sc2.getAuthor());
        ProjectTrackerTest.checkProject(s + "scorecard.project:", sc1.getProject(), sc2.getProject());
        checkSubmission(s + "scorecard.submission:", sc1.getSubmission(), sc2.getSubmission());
        assertEquals(s + "scorecard.score", sc1.getScore(), sc2.getScore(), 0.000001);
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param s1 DOCUMENT ME!
     * @param s2 DOCUMENT ME!
     */
    public static void checkSubmission(String s, AbstractSubmission s1, AbstractSubmission s2) {
        assertNotNull(s + "submission(setup)!null", s1);
        assertNotNull(s + "submission!null", s2);
        assertEquals(s + "submission.id", s1.getId(), s2.getId());
        assertEquals(s + "submission.url", s1.getURL(), s2.getURL());
        assertEquals(s + "submission.pmreviewmessage", s1.getPMReviewMessage(), s2.getPMReviewMessage());
        assertEquals(s + "submission.pmscreeningmessage", s1.getPMScreeningMessage(), s2.getPMScreeningMessage());
        ProjectTrackerTest.checkUser(s + "submission.submitter:", s1.getSubmitter(), s2.getSubmitter());
        ProjectTrackerTest.checkProject(s + "submission.project:", s1.getProject(), s2.getProject());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param a1 DOCUMENT ME!
     * @param a2 DOCUMENT ME!
     */
    public static void checkWorksheet(String s, AggregationWorksheet a1, AggregationWorksheet a2) {
        assertNotNull(s + "worksheet(setup)", a1);
        assertNotNull(s + "worksheet", a2);
        assertEquals(s + "worksheet.id", a1.getId(), a2.getId());
        assertEquals(s + "worksheet.iscompleted", a1.isCompleted(), a2.isCompleted());
        assertEquals(s + "worksheet.ispmreviewed", a1.isPMReviewed(), a2.isPMReviewed());

        assertNotNull(s + "worksheet(setup).aggresponses!null", a1.getAggregationResponses());
        assertNotNull(s + "worksheet.aggresponses!null", a2.getAggregationResponses());
        assertEquals(s + "worksheet.aggresponses.length", a1.getAggregationResponses().length,
                a2.getAggregationResponses().length);

        for (int i = 0; i < a1.getAggregationResponses().length; i++) {
            checkAggregationResponse(s + "worksheet.aggresponses[" + i + "]:", a1.getAggregationResponses()[i],
                    a2.getAggregationResponses()[i]);
        }

        ProjectTrackerTest.checkProject(s + "worksheet.project:", a1.getProject(), a2.getProject());
        ProjectTrackerTest.checkUser(s + "worksheet.user.", a1.getAggregator(), a2.getAggregator());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param a1 DOCUMENT ME!
     * @param a2 DOCUMENT ME!
     */
    public static void checkAggregationResponse(String s, AggregationResponse a1, AggregationResponse a2) {
        assertNotNull(s + "aggresponse(setup)!null", a1);
        assertNotNull(s + "aggresponse!null", a2);
        assertEquals(s + "aggresponse.id", a1.getId(), a2.getId());
        checkSubjectiveResponse(s + "aggresponse.subjresponse", a1.getSubjectiveResponse(), a2.getSubjectiveResponse());
        checkAggregationResponseStatus(s + "aggresponse.aggresponsestatus", a1.getAggregationResponseStatus(),
                a2.getAggregationResponseStatus());

        // TODO fix subjective check
        //checkSubjectiveScorecardQuestion(s + "aggresponse.subjscorecardquestion", a1.getSubjectiveScorecardQuestion(), a2.getSubjectiveScorecardQuestion());
        checkQuestion(s + "aggresponse.subjscorecardquestion", a1.getScorecardQuestion(),
                a2.getScorecardQuestion());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param s1 DOCUMENT ME!
     * @param s2 DOCUMENT ME!
     */
    public static void checkSubjectiveResponse(String s, SubjectiveResponse s1, SubjectiveResponse s2) {
        assertNotNull(s + "subjresponse(setup)!null", s1);
        assertNotNull(s + "subjresponse!null", s2);
        assertEquals(s + "subjresponse.id", s1.getId(), s2.getId());
        assertEquals(s + "subjresponse.responsetext", s1.getResponseText(), s2.getResponseText());
        checkResponseType(s + "subjresponse.responsetype:", s1.getResponseType(), s2.getResponseType());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param f1 DOCUMENT ME!
     * @param f2 DOCUMENT ME!
     */
    public static void checkFixItem(String s, FixItem f1, FixItem f2) {
        assertNotNull(s + "fixitem(setup)!null", f1);
        assertNotNull(s + "fixitem!null", f2);
        assertEquals(s + "fixitem.id", f1.getId(), f2.getId());
        checkFinalFixStatus(s + "fixitem.finalfixstatus:", f1.getFinalFixStatus(), f2.getFinalFixStatus());
        checkAggregationResponse(s + "fixitem.aggresponse:", f1.getAggregationResponse(), f2.getAggregationResponse());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param s1 DOCUMENT ME!
     * @param s2 DOCUMENT ME!
     */
    public static void checkQuestion(String s, ScorecardQuestion s1, ScorecardQuestion s2) {
        assertNotNull(s + "scorecardquestion(setup)!null", s1);
        assertNotNull(s + "scorecardquestion!null", s2);
        assertEquals(s + "scorecardquestion.id", s1.getId(), s2.getId());
        checkEvaluation(s + "scorecardquestion.evaluation", s1.getEvaluation(), s2.getEvaluation());
        assertEquals(s + "scorecardquestion.questiontext", s1.getQuestionText(), s2.getQuestionText());
        assertEquals(s + "scorecardquestion.weight", s1.getWeight(), s2.getWeight());
        checkScorecardSection(s + "scorecardquestion.scorecardsection:", s1.getScorecardSection(),
                s2.getScorecardSection());
        assertEquals(s + "scorecardquestion.sequencelocation", s1.getSequenceLocation(), s2.getSequenceLocation());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param t1 DOCUMENT ME!
     * @param t2 DOCUMENT ME!
     */
    public static void checkTestCaseReview(String s, TestCaseReview t1, TestCaseReview t2) {
        assertNotNull(s + "testcasereview(setup)!null", t1);
        assertNotNull(s + "testcasereview!null", t2);
        assertEquals(s + "testcasereview.id", t1.getId(), t2.getId());
        checkTestCaseApproval(s + "testcasereview.testcaseapproval:", t1.getTestCaseApproval(), t2.getTestCaseApproval());
        assertEquals(s + "testcasereview.reviewtext", t1.getReviewText(), t2.getReviewText());
        ProjectTrackerTest.checkProject(s + "testcasereview.project:", t1.getProject(), t2.getProject());
        ProjectTrackerTest.checkUser(s + "testcasereview.reviewer:", t1.getReviewer(), t2.getReviewer());
        ProjectTrackerTest.checkUser(s + "testcasereview.reviewee:", t1.getReviewee(), t2.getReviewee());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param a1 DOCUMENT ME!
     * @param a2 DOCUMENT ME!
     */
    public static void checkAggregationReview(String s, AggregationReview a1, AggregationReview a2) {
        assertNotNull(s + "aggregationreview(setup)!null", a1);
        assertNotNull(s + "aggregationreview!null", a2);
        assertEquals(s + "aggregationreview.id", a1.getId(), a2.getId());
        checkAggregationApproval(s + "aggregationreview.aggregationapproval:", a1.getStatus(), a2.getStatus());
        assertEquals(s + "aggregationreview.text", a1.getText(), a2.getText());
        assertEquals(s + "aggregationreview.isPMReviewed", a1.isPMReviewed(), a2.isPMReviewed());
        checkWorksheet(s + "aggregationreview.worksheet:", a1.getAggregationWorksheet(), a2.getAggregationWorksheet());
        ProjectTrackerTest.checkUser(s + "aggregationreview.reviewer:", a1.getReviewer(), a2.getReviewer());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param a1 DOCUMENT ME!
     * @param a2 DOCUMENT ME!
     */
    public static void checkAggregationApproval(String s, AggregationApproval a1, AggregationApproval a2) {
        assertNotNull(s + "aggapproval(setup)!null", a1);
        assertNotNull(s + "aggapproval!null", a2);
        assertEquals(s + "aggapproval.id", a1.getId(), a2.getId());
        assertEquals(s + "aggapproval.name", a1.getName(), a2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param a1 DOCUMENT ME!
     * @param a2 DOCUMENT ME!
     */
    public static void checkAggregationResponseStatus(String s, AggregationResponseStatus a1,
                                                      AggregationResponseStatus a2) {
        assertNotNull(s + "aggrespstat(setup)!null", a1);
        assertNotNull(s + "aggrespstat!null", a2);
        assertEquals(s + "aggrespstat.id", a1.getId(), a2.getId());
        assertEquals(s + "aggrespstat.name", a1.getName(), a2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param e1 DOCUMENT ME!
     * @param e2 DOCUMENT ME!
     */
    public static void checkEvaluation(String s, Evaluation e1, Evaluation e2) {
        assertNotNull(s + "evaluation(setup)", e1);
        assertNotNull(s + "evaluation", e2);
        assertEquals(s + "evaluation.id", e1.getId(), e2.getId());
        assertEquals(s + "evaluation.name", e1.getName(), e2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param f1 DOCUMENT ME!
     * @param f2 DOCUMENT ME!
     */
    public static void checkFinalFixStatus(String s, FinalFixStatus f1, FinalFixStatus f2) {
        assertNotNull(s + "finalfixstatus(setup)", f1);
        assertNotNull(s + "finalfixstatus", f2);
        assertEquals(s + "finalfixstatus.id", f1.getId(), f2.getId());
        assertEquals(s + "finalfixstatus.name", f1.getName(), f2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param r1 DOCUMENT ME!
     * @param r2 DOCUMENT ME!
     */
    public static void checkResponseType(String s, ResponseType r1, ResponseType r2) {
        assertNotNull(s + "responsetype(setup)!null", r1);
        assertNotNull(s + "responsetype!null", r2);
        assertEquals(s + "responsetype.id", r1.getId(), r2.getId());
        assertEquals(s + "responsetype.name", r1.getName(), r2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param s1 DOCUMENT ME!
     * @param s2 DOCUMENT ME!
     */
    public static void checkScorecardSection(String s, ScorecardSection s1, ScorecardSection s2) {
        assertNotNull(s + "scorecardsection(setup)", s1);
        assertNotNull(s + "scorecardsection", s2);
        assertEquals(s + "scorecardsection.id", s1.getId(), s2.getId());
        assertEquals(s + "scorecardsection.name", s1.getName(), s2.getName());
        assertEquals(s + "scorecardsection.weight", s1.getWeight(), s2.getWeight());
        assertEquals(s + "scorecardsection.sequencelocation", s1.getSequenceLocation(), s2.getSequenceLocation());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param t1 DOCUMENT ME!
     * @param t2 DOCUMENT ME!
     */
    public static void checkTestCaseApproval(String s, TestCaseApproval t1, TestCaseApproval t2) {
        assertNotNull(s + "testcaseapproval(setup)!null", t1);
        assertNotNull(s + "testcaseapproval!null", t2);
        assertEquals(s + "testcaseapproval.id", t1.getId(), t2.getId());
        assertEquals(s + "testcaseapproval.name", t1.getName(), t2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param sc_v_id DOCUMENT ME!
     * @param sc_id DOCUMENT ME!
     * @param sc_type DOCUMENT ME!
     * @param isComp DOCUMENT ME!
     * @param isPMR DOCUMENT ME!
     * @param authorId DOCUMENT ME!
     * @param version DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param subId DOCUMENT ME!
     * @param score DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertScorecard(Connection conn, long sc_v_id, long sc_id, int sc_type, boolean isComp,
                                       boolean isPMR, long authorId, long projectId, long subId, double score, long modUserId,
                                       boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO scorecard VALUES (" +
                    "?,?,?,?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, sc_v_id);
            ps.setLong(2, sc_id);
            ps.setInt(3, sc_type);
            ps.setBoolean(4, isComp);
            ps.setBoolean(5, isPMR);
            ps.setLong(6, authorId);
            ps.setLong(7, projectId);
            ps.setLong(8, subId);
            ps.setDouble(9, score);
            ps.setLong(10, modUserId);
            ps.setBoolean(11, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param sub_v_id DOCUMENT ME!
     * @param sub_id DOCUMENT ME!
     * @param sub_type DOCUMENT ME!
     * @param sub_url DOCUMENT ME!
     * @param sub_pm_review_msg DOCUMENT ME!
     * @param sub_pm_screen_msg DOCUMENT ME!
     * @param submitterId DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertSubmission(Connection conn, long sub_v_id, long sub_id, int sub_type, String sub_url,
                                        String sub_pm_review_msg, String sub_pm_screen_msg, long submitterId, long projectId, boolean isRemoved,
                                        long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO submission VALUES (" +
                    "?,?,?,?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, sub_v_id);
            ps.setLong(2, sub_id);
            ps.setInt(3, sub_type);
            ps.setString(4, sub_url);
            ps.setString(5, sub_pm_review_msg);
            ps.setString(6, sub_pm_screen_msg);
            ps.setLong(7, submitterId);
            ps.setLong(8, projectId);
            ps.setBoolean(9, isRemoved);
            ps.setLong(10, modUserId);
            ps.setBoolean(11, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param q_v_id DOCUMENT ME!
     * @param q_id DOCUMENT ME!
     * @param qText DOCUMENT ME!
     * @param qWeight DOCUMENT ME!
     * @param qSeqLoc DOCUMENT ME!
     * @param evalId DOCUMENT ME!
     * @param sectionId DOCUMENT ME!
     * @param scorecardId DOCUMENT ME!
     * @param qType DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertQuestion(Connection conn, long q_v_id, long q_id, String qText, int qWeight, int qSeqLoc,
                                      long evalId, long sectionId, long scorecardId, int qType, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO scorecard_question VALUES (" +
                    "?,?,?,?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, q_v_id);
            ps.setLong(2, q_id);
            ps.setString(3, qText);
            ps.setInt(4, qWeight);
            ps.setInt(5, qSeqLoc);
            ps.setLong(6, evalId);
            ps.setLong(7, sectionId);
            ps.setLong(8, scorecardId);
            ps.setInt(9, qType);
            ps.setLong(10, modUserId);
            ps.setBoolean(11, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param subj_r_v_id DOCUMENT ME!
     * @param subj_resp_id DOCUMENT ME!
     * @param respText DOCUMENT ME!
     * @param respTypeId DOCUMENT ME!
     * @param questionId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertSubjResponse(Connection conn, long subj_r_v_id, long subj_resp_id, String respText,
                                          long respTypeId, long questionId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO subjective_resp VALUES (" +
                    "?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, subj_r_v_id);
            ps.setLong(2, subj_resp_id);
            ps.setString(3, respText);
            ps.setLong(4, respTypeId);
            ps.setLong(5, questionId);
            ps.setLong(6, modUserId);
            ps.setBoolean(7, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param agg_resp_v_id DOCUMENT ME!
     * @param agg_resp_id DOCUMENT ME!
     * @param subjRespId DOCUMENT ME!
     * @param aggRespStatId DOCUMENT ME!
     * @param worksheetId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertAggResponse(Connection conn, long agg_resp_v_id, long agg_resp_id, long subjRespId,
                                         long aggRespStatId, long worksheetId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO agg_response VALUES (" +
                    "?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, agg_resp_v_id);
            ps.setLong(2, agg_resp_id);
            ps.setLong(3, subjRespId);
            ps.setLong(4, aggRespStatId);
            ps.setLong(5, worksheetId);
            ps.setLong(6, modUserId);
            ps.setBoolean(7, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param worksheet_v_id DOCUMENT ME!
     * @param worksheet_id DOCUMENT ME!
     * @param isCompleted DOCUMENT ME!
     * @param isPMReviewed DOCUMENT ME!
     * @param aggregatorId DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertWorksheet(Connection conn, long worksheet_v_id, long worksheet_id, boolean isCompleted,
                                       boolean isPMReviewed, long aggregatorId, long projectId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO agg_worksheet VALUES (" +
                    "?,?,?,?,?,?, current year to fraction(3),?,?)");
            ps.setLong(1, worksheet_v_id);
            ps.setLong(2, worksheet_id);
            ps.setBoolean(3, isCompleted);
            ps.setBoolean(4, isPMReviewed);
            ps.setLong(5, aggregatorId);
            ps.setLong(6, projectId);
            ps.setLong(7, modUserId);
            ps.setBoolean(8, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param review_v_id DOCUMENT ME!
     * @param review_id DOCUMENT ME!
     * @param testcaseAppId DOCUMENT ME!
     * @param reviewText DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param reviewerId DOCUMENT ME!
     * @param revieweeId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertTestCaseReview(Connection conn, long review_v_id, long review_id, long testcaseAppId,
                                            String reviewText, long projectId, long reviewerId, long revieweeId, boolean isCompleted,
                                            long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO testcase_review VALUES (" +
                    "?,?,?,?,?,?,?,?, current year to fraction(3),?,?)");
            ps.setLong(1, review_v_id);
            ps.setLong(2, review_id);
            ps.setLong(3, testcaseAppId);
            ps.setString(4, reviewText);
            ps.setLong(5, projectId);
            ps.setLong(6, reviewerId);
            ps.setLong(7, revieweeId);
            ps.setBoolean(8, isCompleted);
            ps.setLong(9, modUserId);
            ps.setBoolean(10, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param agg_review_v_id DOCUMENT ME!
     * @param agg_review_id DOCUMENT ME!
     * @param aggApprovalId DOCUMENT ME!
     * @param aggReviewText DOCUMENT ME!
     * @param isPMReviewed DOCUMENT ME!
     * @param worksheetId DOCUMENT ME!
     * @param reviewerId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertAggregationReview(Connection conn, long agg_review_v_id, long agg_review_id,
                                               long aggApprovalId, String aggReviewText, boolean isPMReviewed, long worksheetId, boolean isCompleted,
                                               long reviewerId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO agg_review VALUES (" +
                    "?,?,?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, agg_review_v_id);
            ps.setLong(2, agg_review_id);
            ps.setLong(3, aggApprovalId);
            ps.setString(4, aggReviewText);
            ps.setBoolean(5, isPMReviewed);
            ps.setLong(6, worksheetId);
            ps.setBoolean(7, isCompleted);
            ps.setLong(8, reviewerId);
            ps.setLong(9, modUserId);
            ps.setBoolean(10, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param fix_item_v_id DOCUMENT ME!
     * @param fix_item_id DOCUMENT ME!
     * @param finalFixStatId DOCUMENT ME!
     * @param aggRespId DOCUMENT ME!
     * @param finalReviewId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertFixItem(Connection conn, long fix_item_v_id, long fix_item_id, long finalFixStatId,
                                     long aggRespId, long finalReviewId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO fix_item VALUES (" +
                    "?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, fix_item_v_id);
            ps.setLong(2, fix_item_id);
            ps.setLong(3, finalFixStatId);
            ps.setLong(4, aggRespId);
            ps.setLong(5, finalReviewId);
            ps.setLong(6, modUserId);
            ps.setBoolean(7, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param final_review_v_id DOCUMENT ME!
     * @param final_review_id DOCUMENT ME!
     * @param worksheetId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertFinalReview(Connection conn, long final_review_v_id, long final_review_id,
                                         long worksheetId, boolean isComplete, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO final_review VALUES (" +
                    "?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, final_review_v_id);
            ps.setLong(2, final_review_id);
            ps.setLong(3, worksheetId);
            ps.setBoolean(4, isComplete);
            ps.setLong(5, modUserId);
            ps.setBoolean(6, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
