/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for details on submission by this member profile to a single contest.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberProfileSubmission extends MemberProfileRegistration implements Serializable {

    /**
     * <p>A <code>Integer</code> providing the placement for submission.</p>
     */
    private Integer placement;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if submission failed to pass review.</p>
     */
    private boolean failed;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether submission is pending review.</p>
     */
    private boolean pendingReview;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether submission has passed reveiw.</p>
     */
    private boolean passedReview;

    /**
     * <p>A <code>Date</code> providing the time of submission creation.</p>
     */
    private Date submissionTime;

    /**
     * <p>A <code>Date</code> providing the time of review commitment.</p>
     */
    private Date reviewTime;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the submissions are locked or not.</p>
     */
    private boolean locked;

    /**
     * <p>A <code>long</code> providing the ID of a submission.</p>
     */
    private long submissionId;

    /**
     * <p>An <code>int</code> providing the prize placement.</p>
     */
    private int prizePlace;
    
    /**
     * <p>Constructs new <code>MemberProfileSubmission</code> instance. This implementation does nothing.</p>
     */
    public MemberProfileSubmission() {
    }

    /**
     * <p>Gets the flag indicating whether the submissions are locked or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the submissions are locked or not.
     */
    public boolean getLocked() {
        return this.locked;
    }

    /**
     * <p>Sets the flag indicating whether the submissions are locked or not.</p>
     *
     * @param locked a <code>boolean</code> providing the flag indicating whether the submissions are locked or not.
     */
    public void setLocked(boolean locked) {
        this.locked = locked;
    }

    /**
     * <p>Gets the time of review commitment.</p>
     *
     * @return a <code>Date</code> providing the time of review commitment.
     */
    public Date getReviewTime() {
        return this.reviewTime;
    }

    /**
     * <p>Sets the time of review commitment.</p>
     *
     * @param reviewTime a <code>Date</code> providing the time of review commitment.
     */
    public void setReviewTime(Date reviewTime) {
        this.reviewTime = reviewTime;
    }

    /**
     * <p>Gets the time of submission creation.</p>
     *
     * @return a <code>Date</code> providing the time of submission creation.
     */
    public Date getSubmissionTime() {
        return this.submissionTime;
    }

    /**
     * <p>Sets the time of submission creation.</p>
     *
     * @param submissionTime a <code>Date</code> providing the time of submission creation.
     */
    public void setSubmissionTime(Date submissionTime) {
        this.submissionTime = submissionTime;
    }

    /**
     * <p>Gets the flag indicating whether submission has passed reveiw.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether submission has passed reveiw.
     */
    public boolean getPassedReview() {
        return this.passedReview;
    }

    /**
     * <p>Sets the flag indicating whether submission has passed reveiw.</p>
     *
     * @param passedReview a <code>boolean</code> providing the flag indicating whether submission has passed reveiw.
     */
    public void setPassedReview(boolean passedReview) {
        this.passedReview = passedReview;
    }

    /**
     * <p>Gets the flag indicating whether submission is pending review.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether submission is pending review.
     */
    public boolean getPendingReview() {
        return this.pendingReview;
    }

    /**
     * <p>Sets the flag indicating whether submission is pending review.</p>
     *
     * @param pendingReview a <code>boolean</code> providing the flag indicating whether submission is pending review.
     */
    public void setPendingReview(boolean pendingReview) {
        this.pendingReview = pendingReview;
    }

    /**
     * <p>Gets the flag indicating if submission failed to pass review.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if submission failed to pass review.
     */
    public boolean getFailed() {
        return this.failed;
    }

    /**
     * <p>Sets the flag indicating if submission failed to pass review.</p>
     *
     * @param failed a <code>boolean</code> providing the flag indicating if submission failed to pass review.
     */
    public void setFailed(boolean failed) {
        this.failed = failed;
    }

    /**
     * <p>Gets the placement for submission.</p>
     *
     * @return a <code>Integer</code> providing the placement for submission.
     */
    public Integer getPlacement() {
        return this.placement;
    }

    /**
     * <p>Sets the placement for submission.</p>
     *
     * @param placement a <code>Integer</code> providing the placement for submission.
     */
    public void setPlacement(Integer placement) {
        this.placement = placement;
    }

    /**
     * <p>Gets the ID of a submission.</p>
     *
     * @return a <code>long</code> providing the ID of a submission.
     */
    public long getSubmissionId() {
        return this.submissionId;
    }

    /**
     * <p>Sets the ID of a submission.</p>
     *
     * @param submissionId a <code>long</code> providing the ID of a submission.
     */
    public void setSubmissionId(long submissionId) {
        this.submissionId = submissionId;
    }
    
    /**
     * <p>Gets the prize placement.</p>
     *
     * @return an <code>int</code> providing the prize placement.
     */
    public int getPrizePlace() {
        return this.prizePlace;
    }
    
    /**
     * <p>Sets the prize placement.</p>
     *
     * @param prizePlace an <code>int</code> providing the prize placement.
     */
    public void setPrizePlace(int prizePlace) {
        this.prizePlace = prizePlace;
    }
}
