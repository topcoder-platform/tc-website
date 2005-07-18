/*
 * TestCaseReview.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;


/**
 * The TestCaseReview represents one reviewer's review of another's
 * fulfillment of their testing responsibities.
 *
 * @author FatClimber
 * @version 1.0
 */
public class TestCaseReview implements Serializable {
    private long id;
    private TestCaseApproval testCaseApproval;
    private Project project;
    private String reviewText;
    private User reviewer;
    private User reviewee;
    private boolean isCompleted;
    private boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param testCaseApproval DOCUMENT ME!
     * @param project DOCUMENT ME!
     * @param reviewText DOCUMENT ME!
     * @param reviewer DOCUMENT ME!
     * @param reviewee DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public TestCaseReview(long id, TestCaseApproval testCaseApproval, Project project, String reviewText,
                          User reviewer, User reviewee, boolean isCompleted, long requestorId, long versionId) {
        this.id = id;
        this.testCaseApproval = testCaseApproval;
        this.project = project;
        this.reviewText = reviewText;
        this.reviewer = reviewer;
        this.reviewee = reviewee;
        this.requestorId = requestorId;
        this.versionId = versionId;
        if (id == -1) {
            this.dirtyFlag = true;
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getRequestorId() {
        return requestorId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * @param id
     */
    protected void setDirty(boolean dirtyFlag) {
        this.dirtyFlag = dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * @param vid
     */
    protected void setVersionId(long vid) {
        this.versionId = vid;
    }

    /**
     * <p>
     * Return the id of the testcase review.
     * </p>
     *
     * @return the id of the testcase review.
     */
    public long getId() {
        return id;
    }

    /**
     * @param id
     */
    protected void setId(long id) {
        this.id = id;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the status of test case review.
     * </p>
     *
     * @return a TestCaseApproval with the status of test case review.
     */
    public TestCaseApproval getTestCaseApproval() {
        return testCaseApproval;
    }

    /**
     * <p>
     * Set the status of test case review.
     * </p>
     *
     * @param tcReviewStatus The status of test case review to be set.
     */
    public void setTestCaseApproval(TestCaseApproval tcReviewStatus) {
        this.testCaseApproval = tcReviewStatus;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the response of the reviewer.
     * </p>
     *
     * @return a String with the response of the reviewer.
     */
    public String getReviewText() {
        return reviewText;
    }

    /**
     * <p>
     * Set the response of the reviewer.
     * </p>
     *
     * @param text The response text to be set.
     */
    public void setReviewText(String text) {
        this.reviewText = text;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the project related to this review.
     * </p>
     *
     * @return a Project with the project related to this review.
     */
    public Project getProject() {
        return project;
    }

    /**
     * <p>
     * Return the reviewer of this review.
     * </p>
     *
     * @return a User with the reviewer of this review.
     */
    public User getReviewer() {
        return reviewer;
    }

    /**
     * <p>
     * Return the reviewee of this review.
     * </p>
     *
     * @return a User with the reviewee of this review.
     */
    public User getReviewee() {
        return reviewee;
    }

    /**
     * <p>
     * Return whether this review is completed.
     * </p>
     *
     * @return true if the review is completed, otherwise false.
     */
    public boolean isCompleted() {
        return isCompleted;
    }

    /**
     * <p>
     * Set whether this review is completed.
     * </p>
     *
     * @param isCompleted Whether this review is completed.
     */
    public void setCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
        this.dirtyFlag = true;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof TestCaseReview)) {
            return false;
        }

        TestCaseReview review = (TestCaseReview) o;

        return review.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
