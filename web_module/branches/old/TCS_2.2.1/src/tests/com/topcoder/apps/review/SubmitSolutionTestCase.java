/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.io.File;

import junit.framework.TestCase;

/**
 * Unit tests for the SubmitSolution class.
 *
 * @author adic
 * @version 1.0
 */
public class SubmitSolutionTestCase extends TestCase {

    /**
     * Method setUp.
     */
    public void setUp() {
        EJBHelper.setTestMode(true);
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
        EJBHelper.setTestMode(false);
    }

    /**
     * Test save document (submit solution).
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSaveDocument() throws Exception {
        SecurityEnabledUser user = ((LoginResult) new Login().start(new LoginData("user3", "secret"))).getUser();
        ProjectsRetrieval projectsRetrieval =
                (ProjectsRetrieval) new ViewMyOpenProjects().start(new OnlineReviewData(user));
        assertTrue(projectsRetrieval.getProjects().length == 1);
        UserProjectInfo proj = projectsRetrieval.getProjects()[0];

        ScreenProjectTestCase.setPhase(proj, MockupData.phases[0]);
        ResultData result = new SubmitSolution().start(new SolutionData(new OnlineReviewProjectData(user, proj), null, //sol.getSolutions()[0],
                new File("test_files/test.jar")));
        assertTrue(result instanceof SuccessResult);

        user = ((LoginResult) new Login().start(new LoginData("marc", "secret"))).getUser();
        projectsRetrieval = (ProjectsRetrieval) new ViewAllProjects().start(new OnlineReviewData(user));
        ProjectRetrieval projectRetrieval = (ProjectRetrieval) new ProjectDetail().start(
                new OnlineReviewProjectData(user, proj));
        AbstractSubmission[] submissions = projectRetrieval.getSubmissions();

        SubmissionDownloadRetrieval sdr = (SubmissionDownloadRetrieval)
                new SubmissionDownload().start(new SubmissionDownloadData(user, proj, submissions[0].getId()));
        assertEquals(sdr.getUserFilename(), "Submitter_3_component1.jar");
        assertEquals(sdr.getSubmissionInputStream().available(), 4);
        sdr.getSubmissionInputStream().close();
    }

}

