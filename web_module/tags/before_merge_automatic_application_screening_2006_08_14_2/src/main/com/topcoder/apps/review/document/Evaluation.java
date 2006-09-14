/*
 * Evaluation.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the various options for the evaluation by a
 * reviewer of a solution's ability to address the associated scorecard
 * question.
 *
 * @author FatClimber
 * @version 1.0
 */
public class Evaluation implements Serializable {
    public static final long ID_YES = 5;
    public static final long ID_NO = 6;

    private long id;
    private String name;
    private double value;

    /**
     * Constructor
     */
    public Evaluation(long id, String name, double value) {
        this.id = id;
        this.name = name;
        this.value = value;
    }

    /**
     * <p>
     * Return the name of evaluation.
     * </p>
     *
     * @return a String with the name of evaluation.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of this evaluation.
     * </p>
     *
     * @return the id of this evaluation.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the value of this evaluation.
     * </p>
     *
     * @return the value of this evaluation.
     */
    public double getValue() {
        return value;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof Evaluation)) {
            return false;
        }

        Evaluation evaluation = (Evaluation) o;

        return evaluation.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
