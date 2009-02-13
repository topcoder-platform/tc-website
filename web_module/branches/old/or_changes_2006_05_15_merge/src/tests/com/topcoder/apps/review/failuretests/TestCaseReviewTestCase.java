/*
 * TestCaseReviewTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the TestCaseReview class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class TestCaseReviewTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of TestCaseReview.</p>
     */
    public Model getModel() {
        return (new com.topcoder.apps.review.TestCaseReview());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of TestCaseReviewData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        Project project = new MyProject("test");
        MyUser user = new MyUser("reviewer", "aaa");
        MyUser submitter = new MyUser("submitter", "sss");
        TestCaseReview review = new MyTestCaseReview(project, user, submitter);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(REVIEW_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        TestCaseReviewData data2 =
                ActionDataUtil.getTestCaseReviewData(user, null, review);
        TestCaseReviewData data3 =
                ActionDataUtil.getTestCaseReviewData(null, userProject, review);

        return (new ActionData[]{data2, data3});
    }

    /**
     * <p>Returns instances of TestCaseReviewData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        Project project = new MyProject("test");
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        MyUser submitter = new MyUser("submitter", "sss");
        TestCaseReview review1 =
                new MyTestCaseReview(project, usera, submitter);
        TestCaseReview review2 =
                new MyTestCaseReview(project, userb, submitter);

        project.setCurrentPhase(REVIEW_PHASE);
        usera.addPermission(new ReviewPermission(project.getId() + 1));
        userb.addPermission(new ViewProjectPermission(project.getId()));


        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        TestCaseReviewData data1 =
                ActionDataUtil.getTestCaseReviewData(usera, userProject1, review1);
        TestCaseReviewData data2 =
                ActionDataUtil.getTestCaseReviewData(userb, userProject2, review2);

        return (new OnlineReviewData[]{data1, data2});
    }

    /**
     * <p>Tests the start method by trying to make a submission
     * for a project that is not in the Review phase.</p>
     */
    public void testProjectWrongPhase() {
        Model model = getModel();

        Project project = new MyProject("test");
        MyUser user = new MyUser("reviewer", "aaa");
        MyUser submitter = new MyUser("submitter", "sss");
        TestCaseReview review = new MyTestCaseReview(project, user, submitter);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        TestCaseReviewData data =
                ActionDataUtil.getTestCaseReviewData(user, userProject, review);
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
        return (new TestSuite(TestCaseReviewTestCase.class));
    }
}
