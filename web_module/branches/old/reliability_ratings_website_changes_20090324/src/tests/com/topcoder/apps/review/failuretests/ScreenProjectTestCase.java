/*
 * ScreenProjectTestCase.java 1.0 7/1/2003
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
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Test cases for the ScreenProject class.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ScreenProjectTestCase extends PermissionTestCase {
    /**
     * <p>Returns an instance of ScreenProject.</p>
     */
    public Model getModel() {
        return (new ScreenProject());
    }

    /**
     * <p>Returns an instance of OnlineReviewData.</p>
     */
    public ActionData getWrongActionData() {
        MyUser user = new MyUser("temp", "aaa");
        return (ActionDataUtil.getOnlineReviewData(user));
    }

    /**
     * <p>Returns instances of ScreeningData with required
     * parameters set to null.</p>
     */
    public ActionData[] getNullParams() {
        Project project = new MyProject("test");
        MyUser user = new MyUser("screener", "aaa");
        MyUser submitter = new MyUser("submitter", "bbb");
        ScreeningScorecard scorecard = new MyScreeningScorecard(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SCREENING_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ScreenPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        ScreeningData data2 = ActionDataUtil.getScreeningData(user, null,
                submitter.getId(),
                scorecard);
        ScreeningData data3 = ActionDataUtil.getScreeningData(null,
                userProject,
                submitter.getId(),
                scorecard);

        return (new ActionData[]{data2, data3});
    }

    /**
     * <p>Returns instances of OnlineReviewData with users
     * that do not have the required permissions.</p>
     */
    public OnlineReviewData[] getWrongPermissions() {
        Project project = new MyProject("test");
        MyUser usera = new MyUser("a", "aaa");
        MyUser userb = new MyUser("b", "bbb");
        MyUser submitter = new MyUser("submitter", "cc");
        ScreeningScorecard scorecard1 = new MyScreeningScorecard(usera, project);
        ScreeningScorecard scorecard2 = new MyScreeningScorecard(userb, project);

        project.setCurrentPhase(SCREENING_PHASE);
        usera.addPermission(new ScreenPermission(project.getId() + 1));
        userb.addPermission(new ViewProjectPermission(project.getId()));

        UserProjectInfo userProject1 = new MyUserProjectInfo(usera, project);
        UserProjectInfo userProject2 = new MyUserProjectInfo(userb, project);

        ScreeningData data1 = ActionDataUtil.getScreeningData(usera,
                userProject1,
                submitter.getId(),
                scorecard1);

        ScreeningData data2 = ActionDataUtil.getScreeningData(userb,
                userProject2,
                submitter.getId(),
                scorecard2);

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
        ScreeningScorecard scorecard = new MyScreeningScorecard(user, project);
        UserProjectInfo userProject = new MyUserProjectInfo(user, project);

        project.setCurrentPhase(SUBMIT_PHASE);
        user.addPermission(new ReviewPermission(project.getId()));
        user.addPermission(new ScreenPermission(project.getId()));
        user.addPermission(new ViewProjectPermission(project.getId()));

        ScreeningData data =
                ActionDataUtil.getScreeningData(user, userProject,
                        submitter.getId(), scorecard);
        ResultData result = model.start(data);
        assertFailureResult("Should only be able to submitt when the " +
                "project is in the Screening phase.", result);
    }

    /**
     * <p>Returns the TestSuite for this TestCase.</p>
     *
     * @return the TestSuite for this TestCase
     */
    public static Test suite() {
        return (new TestSuite(ScreenProjectTestCase.class));
    }
}
