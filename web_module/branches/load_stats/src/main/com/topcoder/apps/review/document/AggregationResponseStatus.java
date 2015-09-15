/*
 * AggregationResponseStatus.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the various options for the state of an
 * AggregationResponse with respect to its being accepted, rejected
 * or marked as a duplicate.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AggregationResponseStatus implements Serializable {
    public static final long ID_ACCEPTED = 1;
    public static final long ID_REJECTED = 1;
    public static final long ID_DUPLICATE = 1;

    private long id;
    private String name;

    /**
     *
     */
    public AggregationResponseStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of the aggregation response status.
     * </p>
     *
     * @return a String with the name of the aggregation response status.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of the aggregation response status.
     * </p>
     *
     * @return the id of the aggregation response status.
     */
    public long getId() {
        return id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof AggregationResponseStatus)) {
            return false;
        }

        AggregationResponseStatus aggRespStat = (AggregationResponseStatus) o;

        return aggRespStat.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
