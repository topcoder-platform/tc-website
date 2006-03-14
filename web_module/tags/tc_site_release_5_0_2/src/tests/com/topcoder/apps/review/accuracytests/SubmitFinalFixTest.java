/*
 * SubmitFinalFixTest.java
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
public class SubmitFinalFixTest extends AbstractAccuracyTest {

    private SubmitFinalFix submitFinalFix;

    /** Creates a new instance of SubmitFinalFixTest */
    public SubmitFinalFixTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        submitFinalFix = new SubmitFinalFix();
    }

    public void testSubmitFinalFix1() throws Exception {
        try {
            project.setCurrentPhase(phases[6]);
            AbstractSubmission subm = new FinalFixSubmission(0, submURL, "mes", "mes", winner, project, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            SolutionData data = ActionDataFactory.getSolutionData(orpd, subm, new java.io.File(submURL.getPath()));
            ResultData res = submitFinalFix.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testSubmitFinalFix2() throws Exception {
        try {
            project.setCurrentPhase(phases[6]);
            AbstractSubmission subm = new FinalFixSubmission(0, submURL, "mes", "mes", submitter, project, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            SolutionData data = ActionDataFactory.getSolutionData(orpd, subm, new java.io.File(submURL.getPath()));
            ResultData res = submitFinalFix.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
