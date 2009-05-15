/*
 * AggregateProjectTest.java
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
public class AggregateProjectTest extends AbstractAccuracyTest {

    private AggregateProject aggregateProject;

    /** Creates a new instance of AggregateProjectTest */
    public AggregateProjectTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        setUpUsers();
        setUpPolicy();
        setUpProjects();
        setUpDocuments();
        aggregateProject = new AggregateProject();
    }

    public void testAggregateProject1() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            AggregationWorksheet card = new AggregationWorksheet(0, false, false, previewer, new AggregationResponse[0], project, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            AggregationData data = ActionDataFactory.getAggregationData(orpd, card);
            ResultData res = aggregateProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }

    }

    public void testAggregateProject2() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            AggregationWorksheet card = new AggregationWorksheet(0, false, false, previewer, new AggregationResponse[0], project, 0, 0);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            AggregationData data = ActionDataFactory.getAggregationData(orpd, card);
            ResultData res = aggregateProject.start(data);
            if (!(res instanceof SuccessResult)) {
                fail("SuccessResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testAggregateProject3() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(previewer, info);
            AggregationData data = ActionDataFactory.getAggregationData(orpd, null);
            ResultData res = aggregateProject.start(data);
            if (!(res instanceof AggregationWorksheetRetrieval)) {
                fail("AggregationWorksheetRetrieval expected, but was ", res);
            }
            AggregationWorksheetRetrieval retr = (AggregationWorksheetRetrieval) res;
            if (retr.getWorksheet() != aggregationWorksheet) {
                fail("Wrong worksheet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testAggregateProject4() throws Exception {
        try {
            project.setCurrentPhase(phases[4]);
            OnlineReviewProjectData orpd = ActionDataFactory.getOnlineReviewProjectData(pm, info);
            AggregationData data = ActionDataFactory.getAggregationData(orpd, null);
            ResultData res = aggregateProject.start(data);
            if (!(res instanceof AggregationWorksheetRetrieval)) {
                fail("AggregationWorksheetRetrieval expected, but was ", res);
            }
            AggregationWorksheetRetrieval retr = (AggregationWorksheetRetrieval) res;
            if (retr.getWorksheet() != aggregationWorksheet) {
                fail("Wrong worksheet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

}
