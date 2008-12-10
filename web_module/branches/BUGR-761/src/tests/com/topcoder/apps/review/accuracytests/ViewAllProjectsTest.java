/*
 * ViewAllProjectsTest.java
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
public class ViewAllProjectsTest extends AbstractAccuracyTest {

    private ViewAllProjects viewAllProjects;

    /** Creates a new instance of ViewAllProjectsTest */
    public ViewAllProjectsTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        viewAllProjects = new ViewAllProjects();
    }

    public void testViewAllProjects1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(pm);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof ProjectsRetrieval)) {
                fail("ProjectsRetrieval expected, but was ", res);
            }
            ProjectsRetrieval retr = (ProjectsRetrieval) res;
            UserProjectInfo[] infos = retr.getProjects();
            if (infos.length != 1) {
                fail("Wrong projects " + infos.length);
            }
            if (infos[0] != info) {
                fail("Wrong projects " + info + ":" + infos[0]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testViewAllProjects2() throws Exception {
        try {
            project.setCurrentPhase(phases[8]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(pm);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof ProjectsRetrieval)) {
                fail("ProjectsRetrieval expected, but was ", res);
            }
            ProjectsRetrieval retr = (ProjectsRetrieval) res;
            UserProjectInfo[] infos = retr.getProjects();
            if (infos.length != 1) {
                fail("Wrong projects " + infos.length);
            }
            if (infos[0] != info) {
                fail("Wrong projects " + info + ":" + infos[0]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewAllProjects3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(previewer);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewAllProjects4() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(reviewer);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewAllProjects5() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(submitter);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewAllProjects6() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(winner);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewAllProjects7() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(unkn);
            ResultData res = viewAllProjects.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }
}
