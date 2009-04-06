/*
 * SubmitSolutionTest.java
 *
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.*;
import com.topcoder.security.login.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.accuracytests.ejb.*;

/**
 *
 * @author  valeriy
 */
public class SubmitSolutionTest extends AbstractAccuracyTest {

    private SubmitSolution submitSolution;

    /** Creates a new instance of SubmitSolutionTest */
    public SubmitSolutionTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        submitSolution = new SubmitSolution();
    }

    public void testSubmitSolution1() throws Exception {
        try {
            project.setCurrentPhase(phases[0]);
            AbstractSubmission subm = new InitialSubmission(0, submURL, "mes", "mes", submitter, project, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            SolutionData data = ActionDataFactory.getSolutionData(orpd, subm, new java.io.File(submURL.getPath()));
            ResultData res = submitSolution.start(data);
            //System.out.println("-----------------"+project.getCurrentPhase().getId());
            //System.out.println(info.getPhase().getPhase().getId());
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testSubmitSolution2() throws Exception {
        try {
            project.setCurrentPhase(phases[0]);
            AbstractSubmission subm = new InitialSubmission(0, submURL, "mes", "mes", winner, project, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            SolutionData data = ActionDataFactory.getSolutionData(orpd, subm, new java.io.File(submURL.getPath()));
            ResultData res = submitSolution.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testSubmitSolution3() throws Exception {
        try {
            project.setCurrentPhase(phases[0]);
            AbstractSubmission subm = new InitialSubmission(0, submURL, "mes", "mes", unkn, project, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(unkn, info);
            SolutionData data = ActionDataFactory.getSolutionData(orpd, subm, new java.io.File(submURL.getPath()));
            ResultData res = submitSolution.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }
}
