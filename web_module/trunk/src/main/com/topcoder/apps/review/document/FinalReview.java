/*
 * FinalReview.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * <p>
 * The FinalReview interface represents a collection of FixItems which bear a
 * one-to-one relationship with those AggregationResponses marked as either
 * &quot;Required&quot; or &quot;Recommended&quot; in the AggregationWorksheet.
 * Their status after submission of final fixes must be evaluated by
 * assigning them each a FinalFixStatus.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class FinalReview implements Serializable {
    private long id;
    private FixItem[] fixItem;
    private AggregationWorksheet aggregationWorksheet;
    private boolean isCompleted;
    private boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param fixItem DOCUMENT ME!
     * @param aggWorksheet DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public FinalReview(long id, FixItem[] fixItem, AggregationWorksheet aggWorksheet,
                       boolean isCompleted, long requestorId, long versionId) {
        this.id = id;
        this.fixItem = fixItem;
        this.aggregationWorksheet = aggWorksheet;
        this.isCompleted = isCompleted;
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
     * Return the id of the final review.
     * </p>
     *
     * @return the id of the final review.
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
     * Return the list of final fixes.
     * </p>
     *
     * @return a FixItem[] with the list of final fixes.
     */
    public FixItem[] getFixCheckList() {
        return fixItem;
    }

    /**
     * <p>
     * Set the list of final fixes.
     * </p>
     *
     * @param items The list of final fixes to be set.
     */
    public void setFixCheckList(FixItem[] item) {
        this.fixItem = item;
    }

    /**
     * <p>
     * Return the aggregation worksheet related to this final review.
     * </p>
     *
     * @return a AggregationWorksheet with the aggregation worksheet
     * related to this final review.
     */
    public AggregationWorksheet getAggregationWorkSheet() {
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


    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof FinalReview)) {
            return false;
        }

        FinalReview finalReview = (FinalReview) o;

        return finalReview.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
