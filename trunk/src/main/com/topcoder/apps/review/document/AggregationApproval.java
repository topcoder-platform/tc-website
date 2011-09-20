/*
 * AggregationApproval.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the various options for the state of an
 * AggregationReview with respect to its approval.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AggregationApproval implements Serializable {

    public static long ID_APPROVED = 1;
    public static long ID_REJECTED = 2;

    private long id;
    private String name;

    /**
     *
     */
    public AggregationApproval(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of the aggregation approval.
     * </p>
     *
     * @return a String with the name of the aggregation approval.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of the aggregation approval.
     * </p>
     *
     * @return the id of the aggregation approval.
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

        if (!(o instanceof AggregationApproval)) {
            return false;
        }

        AggregationApproval aggApproval = (AggregationApproval) o;

        return aggApproval.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
