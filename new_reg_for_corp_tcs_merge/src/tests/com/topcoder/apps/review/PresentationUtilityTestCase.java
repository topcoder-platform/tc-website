/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationResponseStatus;
import com.topcoder.apps.review.document.Evaluation;
import com.topcoder.apps.review.document.FinalFixStatus;
import com.topcoder.apps.review.document.ScorecardSection;
import com.topcoder.apps.review.document.TestCaseApproval;
import com.topcoder.apps.review.mockup.MockupData;
import com.topcoder.apps.review.projecttracker.PaymentStatus;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.User;
import junit.framework.TestCase;
import com.topcoder.apps.review.document.ResponseType;
import com.topcoder.apps.review.projecttracker.ProjectStatus;

/**
 * Unit tests for the PresentationUtility class.
 *
 * @author adic
 * @version 1.0
 */
public class PresentationUtilityTestCase extends TestCase {

    /**
     * The presentation utility instance.
     */
    private PresentationUtility instance = null;

    /**
     * Method setUp.
     */
    public void setUp() {
        EJBHelper.setTestMode(true);
        instance = new PresentationUtility() {
            public Evaluation[] getSubjectiveEvaluations() {
                return new Evaluation[3];
            }

            public Evaluation[] getObjectiveEvaluations() {
                return new Evaluation[3];
            }

            public ScorecardSection[] getScorecardSections() {
                return new ScorecardSection[3];
            }

            public AggregationResponseStatus[] getAggregationResponseStatuses() {
                return new AggregationResponseStatus[3];
            }

            public TestCaseApproval[] getTestCaseApprovals() {
                return new TestCaseApproval[3];
            }

            public FinalFixStatus[] getFinalFixStatuses() {
                return new FinalFixStatus[3];
            }

            public AggregationApproval[] getAggregationApproval() {
                return new AggregationApproval[3];
            }

            public Phase[] getPhases() {
                return new Phase[3];
            }

            public PaymentStatus[] getPaymentStatuses() {
                return new PaymentStatus[3];
            }

            public ReviewerResponsibility[] getReviewerResponsibilities() {
                return new ReviewerResponsibility[3];
            }

            public ProjectType[] getProjectTypes() {
                return new ProjectType[3];
            }

            public ResponseType[] getResponseTypes() {
                return new ResponseType[3];
            }

            public ProjectStatus[] getProjectStatuses() {
                return new ProjectStatus[3];
            }
        };
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
        EJBHelper.setTestMode(false);
    }

    /**
     * Test getSubjectiveEvaluations.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetSubjectiveEvaluations() throws Exception {
        Evaluation[] result = instance.getSubjectiveEvaluations();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getObjectiveEvaluations.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetObjectiveEvaluations() throws Exception {
        Evaluation[] result = instance.getObjectiveEvaluations();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getScorecardSections.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetScorecardSections() throws Exception {
        ScorecardSection[] result = instance.getScorecardSections();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getAggregationResponseStatuses.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetAggregationResponseStatuses() throws Exception {
        AggregationResponseStatus[] result = instance.getAggregationResponseStatuses();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getTestCaseApprovals.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetTestCaseApprovals() throws Exception {
        TestCaseApproval[] result = instance.getTestCaseApprovals();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getFinalFixStatuses.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetFinalFixStatuses() throws Exception {
        FinalFixStatus[] result = instance.getFinalFixStatuses();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getAggregationApproval.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetAggregationApproval() throws Exception {
        AggregationApproval[] result = instance.getAggregationApproval();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getPhases.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetPhases() throws Exception {
        Phase[] result = instance.getPhases();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getPaymentStatuses.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetPaymentStatuses() throws Exception {
        PaymentStatus[] result = instance.getPaymentStatuses();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getReviewerResponsibilities.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetReviewerResponsibilities() throws Exception {
        ReviewerResponsibility[] result = instance.getReviewerResponsibilities();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getProjectTypes.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetProjectTypes() throws Exception {
        ProjectType[] result = instance.getProjectTypes();
        assertNotNull(result);
        assertTrue(result.length >= 2);
        for (int i = 0; i < result.length; i++) {
            assertNull(result[i]);
        }
    }

    /**
     * Test getUser.
     *
     * @throws Exception propagate exceptions to JUnit
     */
    public void testGetUser() throws Exception {
        User user = instance.getUser("user1");
        assertTrue(user == MockupData.user1);
        user = instance.getUser("marc");
        assertTrue(user == MockupData.admin1);
    }

}

