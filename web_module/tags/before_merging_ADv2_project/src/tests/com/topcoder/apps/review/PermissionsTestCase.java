/**
 * PermissionsTestCase.java
 /**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.apps.review.security.AggregationPermission;
import com.topcoder.apps.review.security.FinalReviewPermission;
import com.topcoder.apps.review.security.ReviewPermission;
import com.topcoder.apps.review.security.ScreenPermission;
import com.topcoder.apps.review.security.SubmitFinalFixPermission;
import com.topcoder.apps.review.security.SubmitPermission;
import com.topcoder.apps.review.security.ViewProjectPermission;
import junit.framework.TestCase;

/**
 * Unit tests for the permission classes.
 *
 * @author adic
 * @version 1.0
 */
public class PermissionsTestCase extends TestCase {

    /**
     * Method setUp.
     */
    public void setUp() {
        EJBHelper.setTestMode(true);
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
        EJBHelper.setTestMode(false);
    }

    /**
     * Test for AdminPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testAdminPermission() throws Exception {
        AdminPermission perm = new AdminPermission();
        assertTrue(perm.getName().equals(AdminPermission.class.getName()));
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testAggregationPermission() throws Exception {
        AggregationPermission perm = new AggregationPermission(10);
        assertTrue(perm.getName().equals(AggregationPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testFinalReviewPermission() throws Exception {
        FinalReviewPermission perm = new FinalReviewPermission(10);
        assertTrue(perm.getName().equals(FinalReviewPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testReviewPermission() throws Exception {
        ReviewPermission perm = new ReviewPermission(10);
        assertTrue(perm.getName().equals(ReviewPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testScreenPermission() throws Exception {
        ScreenPermission perm = new ScreenPermission(10);
        assertTrue(perm.getName().equals(ScreenPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSubmitFinalFixPermission() throws Exception {
        SubmitFinalFixPermission perm = new SubmitFinalFixPermission(10);
        assertTrue(perm.getName().equals(SubmitFinalFixPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testSubmitPermission() throws Exception {
        SubmitPermission perm = new SubmitPermission(10);
        assertTrue(perm.getName().equals(SubmitPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

    /**
     * Test for AggregationPermission.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testViewProjectPermission() throws Exception {
        ViewProjectPermission perm = new ViewProjectPermission(10);
        assertTrue(perm.getName().equals(ViewProjectPermission.class.getName() + " 10"));
        assertEquals(perm.getProjectId(), 10);
    }

}

