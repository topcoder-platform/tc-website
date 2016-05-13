/*
 * ScreenProjectTest.java
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
public class ScreenProjectTest extends AbstractAccuracyTest {

    private ScreenProject screenProject;

    /** Creates a new instance of ScreenProjectTest */
    public ScreenProjectTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        screenProject = new ScreenProject();
    }

    public void testScreenProject1() throws Exception {
        try {
            project.setCurrentPhase(phases[1]);
            ScreeningScorecard card = new ScreeningScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[0], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ScreeningData data = ActionDataFactory.getScreeningData(orpd, submitter.getId(), card);
            ResultData res = screenProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testScreenProject2() throws Exception {
        try {
            project.setCurrentPhase(phases[1]);
            ScreeningScorecard card = new ScreeningScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[1], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ScreeningData data = ActionDataFactory.getScreeningData(orpd, winner.getId(), card);
            ResultData res = screenProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testScreenProject3() throws Exception {
        try {
            project.setCurrentPhase(phases[1]);
            ScreeningScorecard card = new ScreeningScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[0], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ScreeningData data = ActionDataFactory.getScreeningData(orpd, submitter.getId(), card);
            ResultData res = screenProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testScreenProject4() throws Exception {
        try {
            project.setCurrentPhase(phases[1]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ScreeningData data = ActionDataFactory.getScreeningData(orpd, submitter.getId(), null);
            ResultData res = screenProject.start(data);
            if (!(res instanceof ScreeningScorecardRetrieval)) {
                fail("ScreeningScorecardRetrieval expected, but was ", res);
            }
            ScreeningScorecardRetrieval retr = (ScreeningScorecardRetrieval) res;
            if (retr.getScoreCard() != screeningScorecards[0]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testScreenProject5() throws Exception {
        try {
            project.setCurrentPhase(phases[1]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ScreeningData data = ActionDataFactory.getScreeningData(orpd, submitter.getId(), null);
            ResultData res = screenProject.start(data);
            if (!(res instanceof ScreeningScorecardRetrieval)) {
                fail("ScreeningScorecardRetrieval expected, but was ", res);
            }
            ScreeningScorecardRetrieval retr = (ScreeningScorecardRetrieval) res;
            if (retr.getScoreCard() != screeningScorecards[0]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
