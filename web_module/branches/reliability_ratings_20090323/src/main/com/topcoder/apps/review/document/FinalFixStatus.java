/*
 * FinalFixStatus.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the various options for the state of a FinalFix.
 *
 * @author FatClimber
 * @version 1.0
 */
public class FinalFixStatus implements Serializable {
    private long id;
    private String name;

    /**
     *
     */
    public FinalFixStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of the final fix status.
     * </p>
     *
     * @return a String with the name of the final fix status.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of the final fix status.
     * </p>
     *
     * @return the id of the final fix status.
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

        if (!(o instanceof FinalFixStatus)) {
            return false;
        }

        FinalFixStatus fixStatus = (FinalFixStatus) o;

        return fixStatus.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
