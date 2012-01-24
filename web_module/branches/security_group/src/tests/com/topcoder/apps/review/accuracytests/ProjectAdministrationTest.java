/*
 * ProjectAdministrationTest.java
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
public class ProjectAdministrationTest extends AbstractAccuracyTest {

    private ProjectAdministration projectAdministration;

    /** Creates a new instance of ProjectAdministrationTest */
    public ProjectAdministrationTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        projectAdministration = new ProjectAdministration();
    }

    public void testProjectAdministration1() throws Exception {
        try {
            project.setCurrentPhase(phases[5]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testProjectAdministration2() throws Exception {
        try {
            project.setCurrentPhase(phases[8]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectAdministration3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectAdministration4() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectAdministration5() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectAdministration6() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectAdministration7() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(unkn, info);
            ProjectData data = ActionDataFactory.getProjectData(orpd, project, "reason", null);
            ResultData res = projectAdministration.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }
}
