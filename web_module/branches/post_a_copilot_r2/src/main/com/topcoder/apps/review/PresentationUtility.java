/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.*;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * The presentation utility class provides access to the enumeration classes instances from the persistance layer
 * (the manager classes).
 *
 * @author adic
 * @version 1.0
 */
public class PresentationUtility {

    /**
     * The evaluation manager instance.
     */
    private EvaluationManager evaluationManager = null;

    /**
     * The scorecard section manager instance.
     */
    private ScorecardSectionManager scorecardSectionManager = null;

    /**
     * The aggregation response status manager instance.
     */
    private AggregationResponseStatusManager aggregationResponseStatusManager = null;

    /**
     * The test case approval manager instance.
     */
    private TestCaseApprovalManager testCaseApprovalManager = null;

    /**
     * The final fix status manager instance.
     */
    private FinalFixStatusManager finalFixStatusManager = null;

    /**
     * The aggregation approval manager instance.
     */
    private AggregationApprovalManager aggregationApprovalManager = null;

    /**
     * The phase manager instance.
     */
    private PhaseManager phaseManager = null;

    /**
     * The payment status manager instance.
     */
    private PaymentStatusManager paymentStatusManager = null;

    /**
     * The reviewer responsibility manager instance.
     */
    private ReviewerResponsibilityManager reviewerResponsibilityManager = null;

    /**
     * The project type manager instance.
     */
    private ProjectTypeManager projectTypeManager = null;

    /**
     * The response type manager instance.
     */
    private ResponseTypeManager responseTypeManager = null;

    /**
     * The project status manager instance.
     */
    private ProjectStatusManager projectStatusManager = null;

    /**
     * Constructor. Look into the refresh manager and locate the instances of the manager classes from the
     * persistance layer.
     */
    public PresentationUtility() {
        if (!EJBHelper.isTestMode()) {
            evaluationManager = (EvaluationManager) Common.getFromCache("EvaluationManager");
            scorecardSectionManager = (ScorecardSectionManager) Common.getFromCache("ScorecardSectionManager");
            aggregationResponseStatusManager = (AggregationResponseStatusManager) Common.getFromCache("AggregationResponseStatusManager");
            testCaseApprovalManager = (TestCaseApprovalManager) Common.getFromCache("TestCaseApprovalManager");
            finalFixStatusManager = (FinalFixStatusManager) Common.getFromCache("FinalFixStatusManager");
            aggregationApprovalManager = (AggregationApprovalManager) Common.getFromCache("AggregationApprovalManager");
            phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
            paymentStatusManager = (PaymentStatusManager) Common.getFromCache("PaymentStatusManager");
            reviewerResponsibilityManager = (ReviewerResponsibilityManager) Common.getFromCache("ReviewerResponsibilityManager");
            projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");
            responseTypeManager = (ResponseTypeManager) Common.getFromCache("ResponseTypeManager");
            projectStatusManager = (ProjectStatusManager) Common.getFromCache("ProjectStatusManager");
        }
    }

    /**
     * Get the subjective evaluations.
     *
     * @return the subjective evaluatations
     */
    public Evaluation[] getSubjectiveEvaluations(int answerType) {
        if (evaluationManager == null) {
            return new Evaluation[0];
        } else {
            return evaluationManager.getSubjectiveEvaluations(answerType);
        }
    }

    /**
     * Get the objective evaluations.
     *
     * @return the objective evaluatations
     */
    public Evaluation[] getObjectiveEvaluations() {
        if (evaluationManager == null) {
            return new Evaluation[0];
        } else {
            return evaluationManager.getObjectiveEvaluations();
        }
    }

    /**
     * Get the scorecard sections.
     *
     * @return the scorecard sections
     */
    public ScorecardSection[] getScorecardSections() {
        if (scorecardSectionManager == null) {
            return new ScorecardSection[0];
        } else {
            return scorecardSectionManager.getScorecardSections();
        }
    }

    /**
     * Get the aggregation response statuses.
     *
     * @return the aggregation response statuses
     */
    public AggregationResponseStatus[] getAggregationResponseStatuses() {
        if (aggregationResponseStatusManager == null) {
            return new AggregationResponseStatus[0];
        } else {
            return aggregationResponseStatusManager.getAggregationResponseStatuses();
        }
    }

    /**
     * Get the test case approvals.
     *
     * @return the test case approvals
     */
    public TestCaseApproval[] getTestCaseApprovals() {
        if (testCaseApprovalManager == null) {
            return new TestCaseApproval[0];
        } else {
            return testCaseApprovalManager.getTestCaseApprovals();
        }
    }

    /**
     * Get the final fix statuses.
     *
     * @return the final fix statuses
     */
    public FinalFixStatus[] getFinalFixStatuses() {
        if (finalFixStatusManager == null) {
            return new FinalFixStatus[0];
        } else {
            return finalFixStatusManager.getFinalFixStatuses();
        }
    }

    /**
     * Get the aggregation approvals.
     *
     * @return the aggregation approvals
     */
    public AggregationApproval[] getAggregationApproval() {
        if (aggregationApprovalManager == null) {
            return new AggregationApproval[0];
        } else {
            return aggregationApprovalManager.getAggregationApprovals();
        }
    }

    /**
     * Get the phases.
     *
     * @return the phases
     */
    public Phase[] getPhases() {
        if (phaseManager == null) {
            return new Phase[0];
        } else {
            return phaseManager.getPhases();
        }
    }

    /**
     * Get the payment statuses.
     *
     * @return the payment statuses
     */
    public PaymentStatus[] getPaymentStatuses() {
        if (paymentStatusManager == null) {
            return new PaymentStatus[0];
        } else {
            return paymentStatusManager.getPaymentStatuses();
        }
    }

    /**
     * Get the reviewer responsibilities.
     *
     * @return the reviewer responsibilities
     */
    public ReviewerResponsibility[] getReviewerResponsibilities() {
        if (reviewerResponsibilityManager == null) {
            return new ReviewerResponsibility[0];
        } else {
            return reviewerResponsibilityManager.getResponsibilities();
        }
    }

    /**
     * Get the project types.
     *
     * @return the project types
     */
    public ProjectType[] getProjectTypes() {
        if (projectTypeManager == null) {
            return new ProjectType[0];
        } else {
            return projectTypeManager.getProjectTypes();
        }
    }

    /**
     * Get the response types.
     *
     * @return the project types
     */
    public ResponseType[] getResponseTypes() {
        if (responseTypeManager == null) {
            return new ResponseType[0];
        } else {
            return responseTypeManager.getResponseTypes();
        }
    }

    /**
     * Get the project statuses.
     *
     * @return the project types
     */
    public ProjectStatus[] getProjectStatuses() {
        if (projectStatusManager == null) {
            return new ProjectStatus[0];
        } else {
            return projectStatusManager.getProjectsStatuses();
        }
    }

    public ScorecardTemplate[] getScorecardTemplates() {
        try {
            return EJBHelper.getDocumentManager().getScorecardTemplates();
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CreateException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Get a user by handle.
     *
     * @param handle the user handle
     *
     * @return the user with the given handle, or null if no such handle exists
     *
     * @exception SystemError wraps any remoting or EJB exceptions that occur
     */
    public User getUser(String handle) throws SystemError {
        try {
            return EJBHelper.getUserManager().getUser(handle);
        } catch (RemoteException e) {
            throw new SystemError(e);
        } catch (CreateException e) {
            throw new SystemError(e);
        } catch (NamingException e) {
            throw new SystemError(e);
        }
    }

}

