/*
 * FinalReviewTest.java 1.0 7/1/2003
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
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the FinalReview class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class FinalReviewTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ScreenProject.</p>
     */
    public Model getModel() {
        return (new com.topcoder.apps.review.FinalReview());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of FinalReviewData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        MyUser submitter = new MyUser("submitter", "bbb");
        FinalReview finalReview = new MyFinalReview();
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(FINAL_REVIEW_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new FinalReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        FinalReviewData data2 =
                ActionDataUtil.getFinalReviewData(user, null, finalReview);
        FinalReviewData data3 =
                ActionDataUtil.getFinalReviewData(null, userProject, finalReview);

        return (new ActionData[]{data2, data3});
    }

    /**
     * <p>Returns instances of FinalReviewData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        Project project = new MyProject("test");
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        MyUser submitter = new MyUser("submitter", "cc");
        FinalReview finalReview1 = new MyFinalReview();
        FinalReview finalReview2 = new MyFinalReview();

        project.setCurrentPhase(FINAL_REVIEW_PHASE);
        usera.addPermission(new FinalReviewPermission(project.getId() + 1));
        userb.addPermission(new ViewProjectPermission(project.getId()));

        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        FinalReviewData data1 =
                ActionDataUtil.getFinalReviewData(usera, userProject1, finalReview1);
        FinalReviewData data2 =
                ActionDataUtil.getFinalReviewData(userb, userProject2, finalReview2);

        return (new OnlineReviewData[]{data1, data2});
    }

    /**
     * <p>Tests the start method by trying to make a submission
     * for a project that is not in the Final Review phase.</p>
     */
    public void testProjectWrongPhase() {
        Model model = getModel();

        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        MyUser submitter = new MyUser("submitter", "bbb");
        FinalReview finalReview = new MyFinalReview();
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new FinalReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        FinalReviewData data =
                ActionDataUtil.getFinalReviewData(user, userProject, finalReview);
        ResultData result = model.start(data);
        assertFailureResult("Should only be able to submitt when the " +
                "project is not in the Final Review phase.", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(FinalReviewTestCase.class));
    }
}
