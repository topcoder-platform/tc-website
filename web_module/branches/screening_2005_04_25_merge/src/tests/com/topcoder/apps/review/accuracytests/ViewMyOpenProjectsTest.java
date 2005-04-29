/*
 * ViewMyOpenProjectsTest.java
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
public class ViewMyOpenProjectsTest extends AbstractAccuracyTest {

    private ViewMyOpenProjects viewMyOpenProjects;

    /** Creates a new instance of ViewMyOpenProjectsTest */
    public ViewMyOpenProjectsTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        viewMyOpenProjects = new ViewMyOpenProjects();
    }

    public void testViewMyOpenProjects1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(previewer);
            ResultData res = viewMyOpenProjects.start(data);
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

    public void testViewMyOpenProjects2() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(reviewer);
            ResultData res = viewMyOpenProjects.start(data);
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

    public void testViewMyOpenProjects3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(pm);
            ResultData res = viewMyOpenProjects.start(data);
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

    public void testViewMyOpenProjects4() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(submitter);
            ResultData res = viewMyOpenProjects.start(data);
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

    public void testViewMyOpenProjects5() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(winner);
            ResultData res = viewMyOpenProjects.start(data);
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

    public void testViewMyOpenProjects6() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            getProjectTester().setUserProjectInfos(new UserProjectInfo[]{new UserProjectInfo(PROJECT_ID, "name", "vers", roles, phi[0],
                    new ProjectType(0, "test"), winner, new ProjectStatus(ProjectStatus.ID_TERMINATED, "started"))});

            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(reviewer);
            ResultData res = viewMyOpenProjects.start(data);
            getProjectTester().setUserProjectInfos(new UserProjectInfo[]{info});
            if (!(res instanceof ProjectsRetrieval)) {
                fail("ProjectsRetrieval expected, but was ", res);
            }
            ProjectsRetrieval retr = (ProjectsRetrieval) res;
            UserProjectInfo[] infos = retr.getProjects();
            if (infos.length != 0) {
                fail("Wrong projects " + infos.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testViewMyOpenProjects7() throws Exception {
        try {
            project.setCurrentPhase(phases[8]);
            getProjectTester().setUserProjectInfos(new UserProjectInfo[]{new UserProjectInfo(PROJECT_ID, "name", "vers", roles, phi[0],
                    new ProjectType(0, "test"), winner, new ProjectStatus(ProjectStatus.ID_TERMINATED, "started"))});
            OnlineReviewData data = ActionDataFactory.getOnlineReviewData(pm);
            ResultData res = viewMyOpenProjects.start(data);
            getProjectTester().setUserProjectInfos(new UserProjectInfo[]{info});
            if (!(res instanceof ProjectsRetrieval)) {
                fail("ProjectsRetrieval expected, but was ", res);
            }
            ProjectsRetrieval retr = (ProjectsRetrieval) res;
            UserProjectInfo[] infos = retr.getProjects();
            if (infos.length != 0) {
                fail("Wrong projects " + infos.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }
}
