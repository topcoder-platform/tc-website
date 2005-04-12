/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.TestCaseApproval;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.UserRole;

/**
 * <p>
 * Java bean for the test case review.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class TestCaseReviewBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The test case review.
     */
    private TestCaseReview testCaseReview = null;

    /**
     * The possible test case approvals.
     */
    private TestCaseApproval[] testCaseApprovals = null;

    /**
     * The possible test case approval strings.
     */
    private String[] approvalAnswers = null;

    /**
     * Whether the input of this test case review is valid.
     */
    private boolean isValid = true;

    /**
     * The test case name.
     */
    private String testCaseName = null;

    // --------------------------------------------------------- Constructors

    /**
     * Creates the <code>TestCaseReviewBean</code> instance from the
     * TestCaseReview.
     *
     * @param testCaseReview The TestCaseReview.
     */
    protected TestCaseReviewBean(TestCaseReview testCaseReview) {
        BusinessDelegate businessDelegate = new BusinessDelegate();
        int userNum = testCaseReview.getProject().getParticipants().length;
        long revieweeId = testCaseReview.getReviewee().getId();

        this.testCaseReview = testCaseReview;
        this.testCaseApprovals = businessDelegate.getTestCaseApprovals();

        approvalAnswers = new String[testCaseApprovals.length];
        for (int i = 0; i < testCaseApprovals.length; i++) {
            approvalAnswers[i] = testCaseApprovals[i].getName();
        }

        for (int i = 0; i < userNum; i++) {
            UserRole userRole =
                    testCaseReview.getProject().getParticipants()[i];
            if (userRole.getRole().getId() == Role.ID_REVIEWER &&
                    userRole.getUser().getId() == revieweeId) {
                testCaseName = userRole.getReviewerResponsibility().getName();
            }
        }
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Return the test case name.
     *
     * @return the test case name.
     */
    public String getTestCaseName() {
        return testCaseName;
    }

    /**
     * Return the review text.
     *
     * @return the review text.
     */
    public String getReviewText() {
        return testCaseReview.getReviewText();
    }

    /**
     * Set the review text.
     *
     * @param text The review text.
     */
    public void setReviewText(String text) {
        testCaseReview.setReviewText(text.trim());
    }

    /**
     * Get the reviewer.
     *
     * @return the reviewer.
     */
    public String getReviewer() {
        return testCaseReview.getReviewer().getHandle();
    }

    /**
     * Return the review status.
     *
     * @return the review status.
     */
    public String getTestCaseReviewStatus() {
        if (testCaseReview.getTestCaseApproval() != null) {
            return testCaseReview.getTestCaseApproval().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the review status.
     *
     * @param text The review status.
     */
    public void setTestCaseReviewStatus(String status) {
        for (int i = 0; i < testCaseApprovals.length; i++) {
            if (testCaseApprovals[i].getName().equals(status)) {
                testCaseReview.setTestCaseApproval(testCaseApprovals[i]);
            }
        }
    }

    /**
     * Return the possible test case approval strings.
     *
     * @return the possible test case approval strings.
     */
    public String[] getApprovalAnswers() {
        return approvalAnswers;
    }

    /**
     * Set whether the input of this test case review is valid.
     *
     * @param isValid Whether the input of this test case review is valid.
     */
    protected void setValid(boolean isValid) {
        this.isValid = isValid;
    }

    /**
     * Return whether the input of this test case review is valid.
     *
     * @return whether the input of this test case review is valid.
     */
    public boolean getValid() {
        return isValid;
    }
}