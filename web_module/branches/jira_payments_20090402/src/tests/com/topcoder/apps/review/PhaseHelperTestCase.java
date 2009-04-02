/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import junit.framework.TestCase;

/**
 * Unit tests for the PhaseHelper class.
 *
 * @author adic
 * @version 1.0
 */
public class PhaseHelperTestCase extends TestCase {

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
        UserProjectInfo proj = MockupData.projinfo1;
        Project project = MockupData.proj1;
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[0]);
        assertTrue(PhaseHelper.canSubmit(project));
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[1]);
        assertTrue(PhaseHelper.canScreen(project));
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[2]);
        assertTrue(PhaseHelper.canReview(project));
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[3]);
        assertTrue(PhaseHelper.canAggregate(project));
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[4]);
        assertTrue(PhaseHelper.canSubmitFinalFix(project));
        ScreenProjectTestCase.setPhase(proj, MockupData.phases[5]);
        assertTrue(PhaseHelper.canFinalReview(project));
        assertFalse(PhaseHelper.isClosed(proj));
    }

}

