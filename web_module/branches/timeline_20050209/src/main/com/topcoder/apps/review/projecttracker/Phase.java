/*
 * Phase.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * Object representation of the various options for a project's phases.
 *
 * @author FatClimber
 * @version 1.0
 */
public class Phase implements Serializable {
    public static final long ID_SUBMISSION = 1;
    public static final long ID_SCREENING = 2;
    public static final long ID_REVIEW = 3;
    public static final long ID_AGGREGATION = 4;
    public static final long ID_AGGREGATION_REVIEW = 5;
    public static final long ID_FINAL_FIXES = 6;
    public static final long ID_FINAL_REVIEW = 7;
    public static final long ID_COMPONENT_PREPARATION = 8;
    public static final long ID_APPEALS = 9;
    public static final long ID_APPEALS_RESPONSE = 10;

    private String name;
    private long id;
    private int order;
    private int defaultDuration;

    /**
     * Creates a new Phase object.
     *
     * @param id DOCUMENT ME!
     * @param order DOCUMENT ME!
     * @param name DOCUMENT ME!
     */
    public Phase(long id, int order, int defaultDuration, String name) {
        this.id = id;
        this.order = order;
        this.name = name;
        this.defaultDuration = defaultDuration;
    }

    /**
     * <p>
     * Return the name of this phase.
     * </p>
     *
     * @return a String with the name of this phase.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of this phase.
     * </p>
     *
     * @return the id of this phase.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the order of this phase.
     * </p>
     *
     * @return the order of this phase.
     */
    public long getOrder() {
        return order;
    }

    /**
     * <p>
     * Return the default duration of this phase.
     * </p>
     *
     * @return the default duration  of this phase.
     */
    public int getDefaultDuration() {
        return defaultDuration;
    }


    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof Phase)) {
            return false;
        }

        Phase phase = (Phase) o;

        return phase.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
