/*
 * AggregationReview.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;


/**
 * AggregationReviews are simple binary agree/disagree responses with a textual
 * reason to support any disagree responses.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AggregationReview implements Serializable {
    private long id;
    private AggregationApproval status;
    private String text;
    private boolean isPMReviewed;
    private AggregationWorksheet aggregationWorksheet;
    private boolean isCompleted;
    private User reviewer;
    private boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param status DOCUMENT ME!
     * @param text DOCUMENT ME!
     * @param isPMReviewed DOCUMENT ME!
     * @param aggWorksheet DOCUMENT ME!
     * @param reviewer DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public AggregationReview(long id, AggregationApproval status, String text, boolean isPMReviewed,
                             AggregationWorksheet aggWorksheet, boolean isCompleted, User reviewer, long requestorId, long versionId) {
        this.id = id;
        this.status = status;
        this.text = text;
        this.isPMReviewed = isPMReviewed;
        this.aggregationWorksheet = aggWorksheet;
        this.isCompleted = isCompleted;
        this.reviewer = reviewer;
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
     * Return the id of the aggregation review.
     * </p>
     *
     * @return the id of the aggregation review.
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
     * Return the status of aggregation approval.
     * </p>
     *
     * @return a AggregationApproval with the status of aggregation approval.
     */
    public AggregationApproval getStatus() {
        return status;
    }

    /**
     * <p>
     * Set the status of aggregation approval.
     * </p>
     *
     * @param aggApp The status of aggregation approval.
     */
    public void setStatus(AggregationApproval aggApp) {
        this.status = aggApp;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the review text.
     * </p>
     *
     * @return a String with the review text.
     */
    public String getText() {
        return text;
    }

    /**
     * <p>
     * Set the review text.
     * </p>
     *
     * @param reviewText The review text.
     */
    public void setText(String reviewText) {
        this.text = reviewText;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return whether the project manager has reviewed it.
     * </p>
     *
     * @return whether the project manager has reviewed it.
     */
    public boolean isPMReviewed() {
        return isPMReviewed;
    }

    /**
     * <p>
     * Set whether the project manager has reviewed it.
     * </p>
     *
     * @param isPMReviewed Whether the project manager has reviewed it.
     */
    public void setPMReviewed(boolean isPMReviewed) {
        this.isPMReviewed = isPMReviewed;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the aggregation worksheet.
     * </p>
     *
     * @return the aggregation worksheet.
     */
    public AggregationWorksheet getAggregationWorksheet() {
        return aggregationWorksheet;
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

    /**
     * <p>
     * Return the reviewer.
     * </p>
     *
     * @return User the reviewer.
     */
    public User getReviewer() {
        return reviewer;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof AggregationReview)) {
            return false;
        }

        AggregationReview aggReview = (AggregationReview) o;

        return aggReview.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
