/*
 * FixItem.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * FixItems bear a one-to-one relationship with those AggregationResponses
 * marked as either &quot;Required&quot; or &quot;Recommended&quot; in the
 * AggregationWorksheet. Their status after submission of final fixes must
 * be evaluated by assigning them each a FinalFixStatus.
 *
 * @author FatClimber
 * @version 1.0
 */
public class FixItem implements Serializable {
    private long id;
    private FinalFixStatus finalFixStatus;
    private AggregationResponse aggregationResponse;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param finalFixStatus DOCUMENT ME!
     * @param aggregationResponse DOCUMENT ME!
     */
    public FixItem(long id, FinalFixStatus finalFixStatus,
                   AggregationResponse aggregationResponse, long versionId) {
        this.id = id;
        this.finalFixStatus = finalFixStatus;
        this.aggregationResponse = aggregationResponse;
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
     * Return the id of the fixitem.
     * </p>
     *
     * @return the id of the fixitem.
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
     * Return the status.
     * </p>
     *
     * @return a FinalFixStatus with the status.
     */
    public FinalFixStatus getFinalFixStatus() {
        return finalFixStatus;
    }

    /**
     * <p>
     * Set the status.
     * </p>
     *
     * @param finalFixStatus The status to be set.
     */
    public void setFinalFixStatus(FinalFixStatus finalFixStatus) {
        this.finalFixStatus = finalFixStatus;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the response.
     * </p>
     *
     * @return the response.
     */
    public AggregationResponse getAggregationResponse() {
        return aggregationResponse;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof FixItem)) {
            return false;
        }

        FixItem fixItem = (FixItem) o;

        return fixItem.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
