/*
 * PermissionTestCase.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.review.failuretests.mockups.*;

/**
 * <p>Extends BaseTestCase to provide testing of invalid permissions.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public abstract class PermissionTestCase extends BaseTestCase {
    /**
     * <p>Returns an array of OnlineReviewData specifying
     * users that do not have the permissions required
     * to complete the operation.</p>
     *
     * @return an array of OnlineReviewData
     */
    public abstract OnlineReviewData[] getWrongPermissions();

    /**
     * <p>Tests the start method by using OnlineReviewData
     * specifying users that do not have the permissions
     * required to complete the operation.</p>
     */
    public void testWrongPermissions() {
        Model model = getModel();
        OnlineReviewData[] data = getWrongPermissions();

        for (int i = 0; i < data.length; i++) {
            ResultData result = model.start(data[i]);
            assertFailureResult(model.getClass().getName() + " should have " +
                    " a FailureResult on wrong permissions: " + i, result);
        }
    }
}
