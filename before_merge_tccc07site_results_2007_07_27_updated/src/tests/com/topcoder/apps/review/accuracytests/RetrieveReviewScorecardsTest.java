/*
 * RetrieveReviewScorecardsTest.java
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
public class RetrieveReviewScorecardsTest extends AbstractAccuracyTest {

    private RetrieveReviewScorecards retrieveReviewScorecards;

    /** Creates a new instance of RetrieveReviewScorecardsTest */
    public RetrieveReviewScorecardsTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        retrieveReviewScorecards = new RetrieveReviewScorecards();
    }

    public void testRetrieveReviewScorecards1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ReviewScorecardsData data = ActionDataFactory.getReviewScorecardsData(orpd);
            ResultData res = retrieveReviewScorecards.start(data);
            if (!(res instanceof ReviewScorecardsRetrieval)) {
                fail("ReviewScorecardsRetrieval expected, but was ", res);
            }
            ReviewScorecardsRetrieval retr = (ReviewScorecardsRetrieval) res;
            ReviewScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (reviewScorecards[0] != cards[0] || reviewScorecards[1] != cards[1]) {
                fail("Wrong scorecards " + reviewScorecards[0] + ":" + cards[0] + " " + reviewScorecards[1] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testRetrieveReviewScorecards2() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ReviewScorecardsData data = ActionDataFactory.getReviewScorecardsData(orpd);
            ResultData res = retrieveReviewScorecards.start(data);
            if (!(res instanceof ReviewScorecardsRetrieval)) {
                fail("ReviewScorecardsRetrieval expected, but was ", res);
            }
            ReviewScorecardsRetrieval retr = (ReviewScorecardsRetrieval) res;
            ReviewScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (reviewScorecards[2] != cards[0] || reviewScorecards[3] != cards[1]) {
                fail("Wrong scorecards " + reviewScorecards[2] + ":" + cards[0] + " " + reviewScorecards[3] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveReviewScorecards3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ReviewScorecardsData data = ActionDataFactory.getReviewScorecardsData(orpd);
            ResultData res = retrieveReviewScorecards.start(data);
            if (!(res instanceof ReviewScorecardsRetrieval)) {
                fail("ReviewScorecardsRetrieval expected, but was ", res);
            }
            ReviewScorecardsRetrieval retr = (ReviewScorecardsRetrieval) res;
            ReviewScorecard[] cards = retr.getScorecards();
            if (cards.length != 4) {
                fail("Wrong scorecards " + cards.length);
            }
            if (reviewScorecards[0] != cards[0] || reviewScorecards[1] != cards[1] ||
                    reviewScorecards[2] != cards[2] || reviewScorecards[3] != cards[3]) {
                fail("Wrong scorecards " + reviewScorecards[0] + ":" + cards[0] + " " + reviewScorecards[1] + ":" + cards[1] +
                        " " + reviewScorecards[2] + ":" + cards[2] + " " + reviewScorecards[3] + ":" + cards[3]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveReviewScorecards4() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            reviewScorecards[0].setCompleted(true);
            reviewScorecards[2].setCompleted(true);
            reviewScorecards[1].setCompleted(true);
            reviewScorecards[3].setCompleted(true);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            ReviewScorecardsData data = ActionDataFactory.getReviewScorecardsData(orpd);
            ResultData res = retrieveReviewScorecards.start(data);
            if (!(res instanceof ReviewScorecardsRetrieval)) {
                fail("ReviewScorecardsRetrieval expected, but was ", res);
            }
            ReviewScorecardsRetrieval retr = (ReviewScorecardsRetrieval) res;
            ReviewScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (reviewScorecards[0] != cards[0] || reviewScorecards[2] != cards[1]) {
                fail("Wrong scorecards " + reviewScorecards[0] + ":" + cards[0] + " " + reviewScorecards[2] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveReviewScorecards5() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            reviewScorecards[0].setCompleted(true);
            reviewScorecards[2].setCompleted(true);
            reviewScorecards[1].setCompleted(true);
            reviewScorecards[3].setCompleted(true);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            ReviewScorecardsData data = ActionDataFactory.getReviewScorecardsData(orpd);
            ResultData res = retrieveReviewScorecards.start(data);
            if (!(res instanceof ReviewScorecardsRetrieval)) {
                fail("ReviewScorecardsRetrieval expected, but was ", res);
            }
            ReviewScorecardsRetrieval retr = (ReviewScorecardsRetrieval) res;
            ReviewScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (reviewScorecards[1] != cards[0] || reviewScorecards[3] != cards[1]) {
                fail("Wrong scorecards " + reviewScorecards[1] + ":" + cards[0] + " " + reviewScorecards[3] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
