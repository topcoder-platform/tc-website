/*
 * ScorecardSectionGroup.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the sectiongroups of each scorecard.
 *
 * @author FatClimber
 * @version 1.0
 */
public class ScorecardSectionGroup implements Serializable {
    private long id;
    private String name;
    private int sequenceLocation;

    /**
     *
     */
    public ScorecardSectionGroup(long id, String name, int sequenceLocation) {
        this.id = id;
        this.name = name;
        this.sequenceLocation = sequenceLocation;
    }

    /**
     * <p>
     * Return the location of this section group.
     * </p>
     *
     * @return the location of this section group.
     */
    public int getSequenceLocation() {
        return sequenceLocation;
    }

    /**
     * <p>
     * Return the id of this scorecard section group.
     * </p>
     *
     * @return the id of this scorecard section group.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the name of scorecard section group.
     * </p>
     *
     * @return a String with the name of scorecard section group.
     */
    public String getName() {
        return name;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof ScorecardSectionGroup)) {
            return false;
        }

        ScorecardSectionGroup sectionGroup = (ScorecardSectionGroup) o;

        return sectionGroup.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
