/*
 * ProjectDetailTest.java
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
public class ProjectDetailTest extends AbstractAccuracyTest {

    private ProjectDetail projectDetail;

    /** Creates a new instance of ProjectDetailTest */
    public ProjectDetailTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        projectDetail = new ProjectDetail();
    }

    public void testProjectDetail1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData data = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ResultData res = projectDetail.start(data);
            if (!(res instanceof ProjectRetrieval)) {
                fail("ProjectRetrieval expected, but was ", res);
            }
            ProjectRetrieval retr = (ProjectRetrieval) res;
            if (project != retr.getProject()) {
                fail("Wrong project " + project + ":" + retr.getProject());
            }
            AbstractScorecard[] cards = retr.getScorecards();
            if (cards.length != 4) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testProjectDetail2() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData data = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ResultData res = projectDetail.start(data);
            if (!(res instanceof ProjectRetrieval)) {
                fail("ProjectRetrieval expected, but was ", res);
            }
            ProjectRetrieval retr = (ProjectRetrieval) res;
            if (project != retr.getProject()) {
                fail("Wrong project " + project + ":" + retr.getProject());
            }
            AbstractScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectDetail3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData data = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ResultData res = projectDetail.start(data);
            if (!(res instanceof ProjectRetrieval)) {
                fail("ProjectRetrieval expected, but was ", res);
            }
            ProjectRetrieval retr = (ProjectRetrieval) res;
            if (project != retr.getProject()) {
                fail("Wrong project " + project + ":" + retr.getProject());
            }
            AbstractScorecard[] cards = retr.getScorecards();
            if (cards.length != 6) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectDetail4() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            reviewScorecards[0].setCompleted(true);
            reviewScorecards[2].setCompleted(true);
            reviewScorecards[1].setCompleted(true);
            reviewScorecards[3].setCompleted(true);
            screeningScorecards[0].setCompleted(true);
            screeningScorecards[1].setCompleted(true);
            OnlineReviewProjectData data = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            ResultData res = projectDetail.start(data);
            if (!(res instanceof ProjectRetrieval)) {
                fail("ProjectRetrieval expected, but was ", res);
            }
            ProjectRetrieval retr = (ProjectRetrieval) res;
            if (project != retr.getProject()) {
                fail("Wrong project " + project + ":" + retr.getProject());
            }
            AbstractScorecard[] cards = retr.getScorecards();
            if (cards.length != 3) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testProjectDetail5() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            reviewScorecards[0].setCompleted(true);
            reviewScorecards[2].setCompleted(true);
            reviewScorecards[1].setCompleted(true);
            reviewScorecards[3].setCompleted(true);
            screeningScorecards[0].setCompleted(true);
            screeningScorecards[1].setCompleted(true);
            OnlineReviewProjectData data = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            ResultData res = projectDetail.start(data);
            if (!(res instanceof ProjectRetrieval)) {
                fail("ProjectRetrieval expected, but was ", res);
            }
            ProjectRetrieval retr = (ProjectRetrieval) res;
            if (project != retr.getProject()) {
                fail("Wrong project " + project + ":" + retr.getProject());
            }
            AbstractScorecard[] cards = retr.getScorecards();
            if (cards.length != 3) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
