/*
 * FinalReviewTest.java
 *
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.FinalReview;
import com.topcoder.security.login.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.accuracytests.ejb.*;

/**
 *
 * @author  valeriy
 */
public class FinalReviewTest extends AbstractAccuracyTest {

    private FinalReview finalReviewModel;

    /** Creates a new instance of FinalReviewTest */
    public FinalReviewTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        finalReviewModel = new FinalReview();
    }

    public void testFinalReview1() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            com.topcoder.apps.review.document.FinalReview card = new com.topcoder.apps.review.document.FinalReview(0, new FixItem[0], aggregationWorksheet, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            FinalReviewData data = ActionDataFactory.getFinalReviewData(orpd, card);
            ResultData res = finalReviewModel.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testFinalReview2() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            com.topcoder.apps.review.document.FinalReview card = new com.topcoder.apps.review.document.FinalReview(0, new FixItem[0], aggregationWorksheet, false, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            FinalReviewData data = ActionDataFactory.getFinalReviewData(orpd, card);
            ResultData res = finalReviewModel.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testFinalReview3() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            FinalReviewData data = ActionDataFactory.getFinalReviewData(orpd, null);
            ResultData res = finalReviewModel.start(data);
            if (!(res instanceof FinalReviewRetrieval)) {
                fail("FinalReviewRetrieval expected, but was ", res);
            }
            FinalReviewRetrieval retr = (FinalReviewRetrieval) res;
            if (retr.getFinalReview() != finalReview) {
                fail("Wrong review " + retr.getFinalReview() + ":" + finalReview);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testFinalReview4() throws Exception {
        try {
            project.setCurrentPhase(phases[7]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            FinalReviewData data = ActionDataFactory.getFinalReviewData(orpd, null);
            ResultData res = finalReviewModel.start(data);
            if (!(res instanceof FinalReviewRetrieval)) {
                fail("FinalReviewRetrieval expected, but was ", res);
            }
            FinalReviewRetrieval retr = (FinalReviewRetrieval) res;
            if (retr.getFinalReview() != finalReview) {
                fail("Wrong review " + retr.getFinalReview() + ":" + finalReview);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
