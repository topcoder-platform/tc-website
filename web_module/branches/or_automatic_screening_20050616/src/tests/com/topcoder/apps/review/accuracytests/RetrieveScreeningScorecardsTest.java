/*
 * RetrieveScreeningScorecardsTest.java
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
public class RetrieveScreeningScorecardsTest extends AbstractAccuracyTest {

    private RetrieveScreeningScorecards retrieveScreeningScorecards;

    /** Creates a new instance of RetrieveScreeningScorecardsTest */
    public RetrieveScreeningScorecardsTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        retrieveScreeningScorecards = new RetrieveScreeningScorecards();
    }

    public void testRetrieveScreeningScorecards1() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            ScreeningScorecardsData data = ActionDataFactory.getScreeningScorecardsData(orpd);
            ResultData res = retrieveScreeningScorecards.start(data);
            if (!(res instanceof ScreeningScorecardsRetrieval)) {
                fail("ScreeningScorecardsRetrieval expected, but was ", res);
            }
            ScreeningScorecardsRetrieval retr = (ScreeningScorecardsRetrieval) res;
            ScreeningScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (screeningScorecards[0] != cards[0] || screeningScorecards[1] != cards[1]) {
                fail("Wrong scorecards " + screeningScorecards[0] + ":" + cards[0] + " " + screeningScorecards[1] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testRetrieveScreeningScorecards2() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(reviewer, info);
            ScreeningScorecardsData data = ActionDataFactory.getScreeningScorecardsData(orpd);
            ResultData res = retrieveScreeningScorecards.start(data);
            if (!(res instanceof ScreeningScorecardsRetrieval)) {
                fail("ScreeningScorecardsRetrieval expected, but was ", res);
            }
            ScreeningScorecardsRetrieval retr = (ScreeningScorecardsRetrieval) res;
            ScreeningScorecard[] cards = retr.getScorecards();
            if (cards.length != 0) {
                fail("Wrong scorecards " + cards.length);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveScreeningScorecards3() throws Exception {
        try {
            project.setCurrentPhase(phases[2]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            ScreeningScorecardsData data = ActionDataFactory.getScreeningScorecardsData(orpd);
            ResultData res = retrieveScreeningScorecards.start(data);
            if (!(res instanceof ScreeningScorecardsRetrieval)) {
                fail("ScreeningScorecardsRetrieval expected, but was ", res);
            }
            ScreeningScorecardsRetrieval retr = (ScreeningScorecardsRetrieval) res;
            ScreeningScorecard[] cards = retr.getScorecards();
            if (cards.length != 2) {
                fail("Wrong scorecards " + cards.length);
            }
            if (screeningScorecards[0] != cards[0] || screeningScorecards[1] != cards[1]) {
                fail("Wrong scorecards " + screeningScorecards[0] + ":" + cards[0] + " " + screeningScorecards[1] + ":" + cards[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveScreeningScorecards4() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            screeningScorecards[0].setCompleted(true);
            screeningScorecards[1].setCompleted(true);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(submitter, info);
            ScreeningScorecardsData data = ActionDataFactory.getScreeningScorecardsData(orpd);
            ResultData res = retrieveScreeningScorecards.start(data);
            if (!(res instanceof ScreeningScorecardsRetrieval)) {
                fail("ScreeningScorecardsRetrieval expected, but was ", res);
            }
            ScreeningScorecardsRetrieval retr = (ScreeningScorecardsRetrieval) res;
            ScreeningScorecard[] cards = retr.getScorecards();
            if (cards.length != 1) {
                fail("Wrong scorecards " + cards.length);
            }
            if (screeningScorecards[0] != cards[0]) {
                fail("Wrong scorecards " + screeningScorecards[0] + ":" + cards[0]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testRetrieveScreeningScorecards5() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            screeningScorecards[0].setCompleted(true);
            screeningScorecards[1].setCompleted(true);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(winner, info);
            ScreeningScorecardsData data = ActionDataFactory.getScreeningScorecardsData(orpd);
            ResultData res = retrieveScreeningScorecards.start(data);
            if (!(res instanceof ScreeningScorecardsRetrieval)) {
                fail("ScreeningScorecardsRetrieval expected, but was ", res);
            }
            ScreeningScorecardsRetrieval retr = (ScreeningScorecardsRetrieval) res;
            ScreeningScorecard[] cards = retr.getScorecards();
            if (cards.length != 1) {
                fail("Wrong scorecards " + cards.length);
            }
            if (screeningScorecards[1] != cards[0]) {
                fail("Wrong scorecards " + screeningScorecards[1] + ":" + cards[0]);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
