/*
 * TestCaseReviewTest.java
 *
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.TestCaseReview;
import com.topcoder.security.login.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.accuracytests.ejb.*;

/**
 *
 * @author  valeriy
 */
public class TestCaseReviewTest extends AbstractAccuracyTest {

    private TestCaseReview testCaseReview;

    /** Creates a new instance of TestCaseReviewTest */
    public TestCaseReviewTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        testCaseReview = new TestCaseReview();
    }

    public void testTestCaseReview1() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            com.topcoder.apps.review.document.TestCaseReview card = new com.topcoder.apps.review.document.TestCaseReview(0, new TestCaseApproval(0, "app"), project, "mes", reviewer, previewer, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, new com.topcoder.apps.review.document.TestCaseReview[]{card});
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testTestCaseReview2() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            com.topcoder.apps.review.document.TestCaseReview card = new com.topcoder.apps.review.document.TestCaseReview(0, new TestCaseApproval(0, "app"), project, "mes", previewer, reviewer, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, new com.topcoder.apps.review.document.TestCaseReview[]{card});
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testTestCaseReview3() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            com.topcoder.apps.review.document.TestCaseReview card = new com.topcoder.apps.review.document.TestCaseReview(0, new TestCaseApproval(0, "app"), project, "mes", previewer, reviewer, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, new com.topcoder.apps.review.document.TestCaseReview[]{card});
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testTestCaseReview4() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, null);
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof TestCaseReviewRetrieval)) {
                fail("TestCaseReviewRetrieval expected, but was ", res);
            }
            TestCaseReviewRetrieval retr = (TestCaseReviewRetrieval) res;
            // Uncomment after aggregation
            /*if (retr.getTestCaseReview() != testCaseReview[0]) {
                fail("Wrong testcase");
            }*/
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testTestCaseReview5() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, null);
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof TestCaseReviewRetrieval)) {
                fail("TestCaseReviewRetrieval expected, but was ", res);
            }
            TestCaseReviewRetrieval retr = (TestCaseReviewRetrieval) res;
            // Uncomment after aggregation
            /*if (retr.getTestCaseReview() != testCaseReview[1]) {
                fail("Wrong testcase");
            }*/
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testTestCaseReview7() throws Exception {
        try {
            project.setCurrentPhase(phases[3]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            TestCaseReviewData data = ActionDataFactory.getTestCaseReviewData(orpd, null);
            ResultData res = testCaseReview.start(data);
            if (!(res instanceof TestCaseReviewRetrieval)) {
                fail("TestCaseReviewRetrieval expected, but was ", res);
            }
            TestCaseReviewRetrieval retr = (TestCaseReviewRetrieval) res;
            // Uncomment after aggregation
            /*if (retr.getTestCaseReview() != ???) {
                fail("Wrong testcase");
            }*/
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
