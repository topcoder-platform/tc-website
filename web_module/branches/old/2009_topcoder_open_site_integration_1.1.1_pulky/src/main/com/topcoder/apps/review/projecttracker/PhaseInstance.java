/*
 * PhaseInstance.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;

import java.io.Serializable;
import java.util.Date;

/**
 * The PhaseInstance represents a phase as regards a specific project.
 *
 * @author FatClimber
 * @version 1.0
 */
public class PhaseInstance implements Serializable {
    private long id;
    private Phase phase;
    private java.util.Date startDate;
    private java.util.Date endDate;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param phase DOCUMENT ME!
     * @param startDate DOCUMENT ME!
     * @param endDate DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public PhaseInstance(long id, Phase phase, Date startDate, Date endDate, long versionId) {
        this.id = id;
        this.phase = phase;
        this.startDate = startDate;
        this.endDate = endDate;
        this.versionId = versionId;
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
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * <p>
     * Return the (database) id.
     * </p>
     *
     * @return long the id.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the phase.
     * </p>
     *
     * @return the phase.
     */
    public Phase getPhase() {
        return phase;
    }

    /**
     * <p>
     * Return the start date.
     * </p>
     *
     * @return a Date with the start date.
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * <p>
     * Set the start date.
     * </p>
     *
     * @param startDate The start date.
     */
    public void setStartDate(Date newStartDate) {
        if (!Common.equals(this.startDate, newStartDate)) {
            this.startDate = newStartDate;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the end date.
     * </p>
     *
     * @return a Date with the end date.
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * <p>
     * Set the end date.
     * </p>
     *
     * @param endDate The end date.
     */
    public void setEndDate(Date newEndDate) {
        if (!Common.equals(this.endDate, newEndDate)) {
            this.endDate = newEndDate;
            this.dirtyFlag = true;
        }
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof PaymentInfo)) {
            return false;
        }

        PhaseInstance phaseInstance = (PhaseInstance) o;

        return phaseInstance.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
