/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import junit.framework.TestCase;

/**
 * Unit tests for the RoleHelper class.
 *
 * @author adic
 * @version 1.0
 */
public class RoleHelperTestCase extends TestCase {

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
     * Test all the helper methods.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testMethods() throws Exception {
        assertTrue(RoleHelper.isProductManager(MockupData.p1userroles[0]));
        assertTrue(RoleHelper.isSubmitter(MockupData.p1userroles[1]));
        assertTrue(RoleHelper.isScreener(MockupData.p1userroles[2]));
        assertTrue(RoleHelper.isReviewer(MockupData.p1userroles[3]));
        assertTrue(RoleHelper.isReviewer(MockupData.p1userroles[4]));
        assertTrue(RoleHelper.isReviewer(MockupData.p1userroles[5]));
        assertTrue(RoleHelper.isAggregator(MockupData.p1userroles[6]));
        assertTrue(RoleHelper.isFinalReviewer(MockupData.p1userroles[7]));
    }

}

