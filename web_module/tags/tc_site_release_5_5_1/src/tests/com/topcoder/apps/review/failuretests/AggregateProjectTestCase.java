/*
 * AggregateProjectTestCase.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import java.io.*;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the AggregateProject class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class AggregateProjectTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of AggregateProject.</p>
     */
    public Model getModel() {
        return (new AggregateProject());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of AggregationData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        AggregationWorksheet worksheet =
                new MyAggregationWorksheet(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(AGGREGATION_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new AggregationPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        AggregationData data2 =
                ActionDataUtil.getAggregationData(user, null, worksheet);
        AggregationData data3 =
                ActionDataUtil.getAggregationData(null, userProject, worksheet);

        return (new ActionData[]{data2, data3});
    }

    /**
     * <p>Returns instances of AggregationData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        Project project = new MyProject("test");
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        AggregationWorksheet worksheet1 =
                new MyAggregationWorksheet(usera, project);
        AggregationWorksheet worksheet2 =
                new MyAggregationWorksheet(userb, project);

        project.setCurrentPhase(REVIEW_PHASE);
        usera.addPermission(new ReviewPermission(project.getId() + 1));
        userb.addPermission(new ViewProjectPermission(project.getId()));

        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        AggregationData data1 =
                ActionDataUtil.getAggregationData(usera, userProject1, worksheet1);
        AggregationData data2 =
                ActionDataUtil.getAggregationData(userb, userProject2, worksheet2);

        return (new OnlineReviewData[]{data1, data2});
    }

    /**
     * <p>Tests the start method by trying to make a submission
     * for a project that is not in the Aggregation phase.</p>
     */
    public void testProjectWrongPhase() {
        Model model = getModel();

        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        AggregationWorksheet worksheet = new MyAggregationWorksheet(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new AggregationPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        AggregationData data =
                ActionDataUtil.getAggregationData(user, userProject, worksheet);
        ResultData result = model.start(data);
        assertFailureResult("Should only be able to submitt when the " +
                "project is not in the Aggregation phase.", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(AggregateProjectTestCase.class));
    }
}
