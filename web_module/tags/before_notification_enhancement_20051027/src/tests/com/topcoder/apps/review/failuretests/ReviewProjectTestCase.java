/*
 * ReviewProjectTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the ReviewProject class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ReviewProjectTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ReviewProject.</p>
     */
    public Model getModel() {
        return (new ReviewProject());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of ReviewData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        MyUser submitter = new MyUser("submitter", "bbb");
        ReviewScorecard scorecard = new MyReviewScorecard(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(REVIEW_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        ReviewData data2 = ActionDataUtil.getReviewData(user, null,
                submitter.getId(),
                user.getId(),
                scorecard);
        ReviewData data3 = ActionDataUtil.getReviewData(null, userProject,
                submitter.getId(),
                user.getId(),
                scorecard);

        return (new ActionData[]{data2, data3});
    }

    /**
     * <p>Returns instances of ReviewData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        Project project = new MyProject("test");
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        MyUser submitter = new MyUser("submitter", "cc");
        ReviewScorecard scorecard1 = new MyReviewScorecard(usera, project);
        ReviewScorecard scorecard2 = new MyReviewScorecard(userb, project);

        project.setCurrentPhase(REVIEW_PHASE);
        usera.addPermission(new ReviewPermission(project.getId() + 1));
        userb.addPermission(new ViewProjectPermission(project.getId()));


        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        ReviewData data1 = ActionDataUtil.getReviewData(usera, userProject1,
                submitter.getId(),
                usera.getId(),
                scorecard1);
        ReviewData data2 = ActionDataUtil.getReviewData(userb, userProject2,
                submitter.getId(),
                userb.getId(),
                scorecard2);

        return (new OnlineReviewData[]{data1, data2});
    }

    /**
     * <p>Tests the start method by trying to make a submission
     * for a project that is not in the Review phase.</p>
     */
    public void testProjectWrongPhase() {
        Model model = getModel();

        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        MyUser submitter = new MyUser("submitter", "bbb");
        ReviewScorecard scorecard = new MyReviewScorecard(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(AGGREGATION_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        ReviewData data = ActionDataUtil.getReviewData(user, userProject,
                submitter.getId(),
                user.getId(),
                scorecard);
        ResultData result = model.start(data);
        assertFailureResult("Should only be able to submitt when the " +
                "project is not in the Review phase.", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(ReviewProjectTestCase.class));
    }
}
