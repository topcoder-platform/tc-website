/*
 * ScorecardSection.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the sections of each scorecard incuding the weight
 * they are given in the overarching whole of the scorecard.
 *
 * @author FatClimber
 * @version 1.0
 */
public class ScorecardSection implements Serializable {
    private long id;
    private String name;
    private int weight;
    private int sequenceLocation;
    private ScorecardSectionGroup sectionGroup;

    /**
     *
     */
    public ScorecardSection(long id, String name, int weight, int sequenceLocation,
                            ScorecardSectionGroup sectionGroup) {
        this.id = id;
        this.name = name;
        this.weight = weight;
        this.sequenceLocation = sequenceLocation;
        this.sectionGroup = sectionGroup;
    }

    /**
     * <p>
     * Return the weight of this section.
     * </p>
     *
     * @return the weight of this section.
     */
    public int getWeight() {
        return weight;
    }

    /**
     * <p>
     * Return the location of this section.
     * </p>
     *
     * @return the location of this section.
     */
    public int getSequenceLocation() {
        return sequenceLocation;
    }

    /**
     * <p>
     * Return the id of this scorecard section.
     * </p>
     *
     * @return the id of this scorecard section.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the name of scorecard section.
     * </p>
     *
     * @return a String with the name of scorecard section.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the SectionGroup of this scorecard section.
     * </p>
     *
     * @return the SectionGroup of this scorecard section.
     */
    public ScorecardSectionGroup getSectionGroup() {
        return sectionGroup;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof ScorecardSection)) {
            return false;
        }

        ScorecardSection section = (ScorecardSection) o;

        return section.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
