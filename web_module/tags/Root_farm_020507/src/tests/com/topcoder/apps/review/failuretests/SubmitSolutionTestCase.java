/*
 * SubmitSolutionTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the SubmitSolution class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class SubmitSolutionTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of SubmitSolution.</p>
     */
    public Model getModel() {
        return (new SubmitSolution());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of SolutionData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        MyUser user = new MyUser("temp", "aaa");
        Project project = new MyProject("test");
        AbstractSubmission submission = new MySubmission(user, project);
        File file = new File("test_files/failure", "TestSubmission.txt");
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        user.addPermission(new SubmitPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        SolutionData data1 =
                ActionDataUtil.getSolutionData(user, null, submission, file);
        SolutionData data2 =
                ActionDataUtil.getSolutionData(null, userProject, submission, file);

        return (new ActionData[]{data1, data2});
    }

    /**
     * <p>Returns instances of OnlineReviewData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        Project project = new MyProject("test");
        File file = new File("test_files/failure", "TestSubmission.txt");
        AbstractSubmission submission1 = new MySubmission(usera, project);
        AbstractSubmission submission2 = new MySubmission(userb, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        usera.addPermission(new ViewProjectPermission(project.getId()));
        userb.addPermission(new SubmitPermission(project.getId()));

        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        SolutionData data1 =
                ActionDataUtil.getSolutionData(usera, userProject1, submission1, file);
        SolutionData data2 =
                ActionDataUtil.getSolutionData(userb, userProject2, submission2, file);

        return (new OnlineReviewData[]{data1, data2});
    }

    /**
     * <p>Tests the start method by trying to make a submission
     * for a project that is not in the Submit phase.</p>
     */
    public void testProjectWrongPhase() {
        Model model = getModel();

        MyUser user = new MyUser("temp", "aaa");
        Project project = new MyProject("test");
        AbstractSubmission submission = new MySubmission(user, project);
        File file = new File("test_files/failure", "TestSubmission.txt");
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(REVIEW_PHASE);
        user.addPermission(new SubmitPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        SolutionData data =
                ActionDataUtil.getSolutionData(user, userProject, submission, file);
        ResultData result = model.start(data);
        assertFailureResult("Should only be able to submitt when the " +
                "project is not in the submit phase.", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(SubmitSolutionTestCase.class));
    }
}
