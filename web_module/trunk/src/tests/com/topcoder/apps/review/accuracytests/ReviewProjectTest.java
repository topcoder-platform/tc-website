/*
 * ReviewProjectTest.java
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
public class ReviewProjectTest extends AbstractAccuracyTest {

    private ReviewProject reviewProject;

    /** Creates a new instance of ReviewProjectTest */
    public ReviewProjectTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        reviewProject = new ReviewProject();
    }

    public void testReviewProject1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            ReviewScorecard card = new ReviewScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[0], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) submitter.getId(), (int) previewer.getId(), card);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testReviewProject2() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            ReviewScorecard card = new ReviewScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[1], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) winner.getId(), (int) previewer.getId(), card);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            ReviewScorecard card = new ReviewScorecard(0, false, false, new ScorecardQuestion[0], reviewer, project, initialSubmission[0], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) submitter.getId(), (int) reviewer.getId(), card);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject4() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            ReviewScorecard card = new ReviewScorecard(0, false, false, new ScorecardQuestion[0], reviewer, project, initialSubmission[0], 0, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) submitter.getId(), (int) reviewer.getId(), card);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject5() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) submitter.getId(), (int) previewer.getId(), null);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof ReviewScorecardRetrieval)) {
                fail("ReviewScorecardRetrieval expected, but was ", res);
            }
            ReviewScorecardRetrieval retr = (ReviewScorecardRetrieval) res;
            if (retr.getScoreCard() != reviewScorecards[0]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject6() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) winner.getId(), (int) previewer.getId(), null);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof ReviewScorecardRetrieval)) {
                fail("ReviewScorecardRetrieval expected, but was ", res);
            }
            ReviewScorecardRetrieval retr = (ReviewScorecardRetrieval) res;
            if (retr.getScoreCard() != reviewScorecards[1]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject7() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) winner.getId(), (int) reviewer.getId(), null);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof ReviewScorecardRetrieval)) {
                fail("ReviewScorecardRetrieval expected, but was ", res);
            }
            ReviewScorecardRetrieval retr = (ReviewScorecardRetrieval) res;
            if (retr.getScoreCard() != reviewScorecards[3]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testReviewProject8() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ReviewData data = ActionDataFactory.getReviewData(orpd, (int) submitter.getId(), (int) reviewer.getId(), null);
            ResultData res = reviewProject.start(data);
            if (!(res instanceof ReviewScorecardRetrieval)) {
                fail("ReviewScorecardRetrieval expected, but was ", res);
            }
            ReviewScorecardRetrieval retr = (ReviewScorecardRetrieval) res;
            if (retr.getScoreCard() != reviewScorecards[2]) {
                fail("Wrong scorecard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }
}
