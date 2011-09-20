/*
 * BaseTestCase.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>This test case overides the setUp and tearDown methods
 * to configure the mock objects and set up the enviornment.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public abstract class BaseTestCase extends TestCase {
    /**
     * <p>User Roles.</p>
     */
    protected static final Role SUBMITTER_ROLE =
            new MyRole("Submitter", 0);
    protected static final Role SCREENER_ROLE =
            new MyRole("Reviewer", 1);
    protected static final Role REVIEWER_ROLE =
            new MyRole("Reviewer", 2);
    protected static final Role AGGREGATOR_ROLE =
            new MyRole("Administrator", 3);
    protected static final Role FINALREVIEWER_ROLE =
            new MyRole("Administrator", 4);
    protected static final Role ADMIN_ROLE =
            new MyRole("Administrator", 5);
    protected static final Role PRODUCT_MANAGER_ROLE =
            new MyRole("Project Manager", 6);

    /**
     * <p>Project phases.</p>
     */
    protected static final Phase SUBMIT_PHASE =
            new MyPhase("Submit", 0);
    protected static final Phase SCREENING_PHASE =
            new MyPhase("Screening", 1);
    protected static final Phase REVIEW_PHASE =
            new MyPhase("Review", 2);
    protected static final Phase TESTCASEREVIEW_PHASE =
            new MyPhase("Aggregation", 3);
    protected static final Phase AGGREGATION_PHASE =
            new MyPhase("Aggregation", 4);
    protected static final Phase AGGREGATION_REVIEW_PHASE =
            new MyPhase("Aggregation Review", 5);
    protected static final Phase FINAL_FIX_PHASE =
            new MyPhase("Final Fix", 6);
    protected static final Phase FINAL_REVIEW_PHASE =
            new MyPhase("Final Review", 7);
    protected static final Phase COMPLETE_PHASE =
            new MyPhase("Complete", 8);

    /**
     * <p>Resets the mockup implementations of UserManager,
     * Policy, Login, ProjectTracker, and DocumentManager.</p>
     *
     * @param none
     * @return none
     */
    public void setUp() {
        MyLoginImpl.clearLogins();
        MyPolicyImpl.clearPermissions();
        MyUserManager.clearUsers();
        MyProjectTracker.clearProjects();
    }

    /**
     * <p>Resets the mockup implementations of UserManager,
     * Policy, Login, ProjectTracker, and DocumentManager.</p>
     *
     * @param none
     * @return none
     */
    public void tearDown() {
        MyLoginImpl.clearLogins();
        MyPolicyImpl.clearPermissions();
        MyUserManager.clearUsers();
        MyProjectTracker.clearProjects();
    }

    /**
     * <p>Returns an instance of the model being tested.</p>
     *
     * @param none
     * @return an instance of being tested
     */
    public abstract Model getModel();

    /**
     * <p>Returns an instance of ActionData that is
     * wrong for the model instance being tested.</p>
     *
     * @param none
     * @return the model being tested
     */
    public abstract ActionData getWrongActionData();

    /**
     * <p>Returns an instance of ActionData that is
     * expected by the model instance being tested
     * but having required parameters set to null.</p>
     *
     * @param none
     * @return the model being tested
     */
    public abstract ActionData[] getNullParams();

    /**
     * <p>Tests the start method with null ActionData.</p>
     */
    public void testNullData() {
        Model model = getModel();
        ActionData nullData = null;

        ResultData result = model.start(nullData);
        assertFailureResult(model.getClass().getName() + " should have " +
                "thrown an IllegalArgumentException on null ActionData.", result);
    }

    /**
     * <p>Tests the start method with the wrong subclass of
     * ActionData.</p>
     */
    public void testBadData() {
        Model model = getModel();
        ActionData badData = getWrongActionData();

        ResultData result = model.start(badData);
        assertFailureResult(model.getClass().getName() + " should have " +
                "thrown an IllegalArgumentException on wrong subclass " +
                "of ActionData", result);
    }

    /**
     * <p>Tests the start method with null paramaters.
     * This test case was removed since these checks were
     * moved to the ActionData Subclasses themselves.</p>
     */
    /*
    public void testNullParams() {
        Model model = getModel();
        ActionData[] data = getNullParams();

        for(int i = 0;i < data.length;i ++) {
            ResultData result = model.start(data[i]);
            assertFailureResult(model.getClass().getName() + " should have " +
                 "thrown an IllegalArgumentException with required param set " +
                 "to null : " + i, result);
        }
    }
    */

    /**
     * <p>Utility function used to test if the ResultData
     * is an instance of FailureResult.</p>
     *
     * @param message the message to fail with if data is
     * not an instance of FailureResult
     * @param data the ResultData to check
     * @return none
     */
    protected void assertFailureResult(String message, ResultData data) {
        assertTrue(message, data instanceof FailureResult);
    }
}
