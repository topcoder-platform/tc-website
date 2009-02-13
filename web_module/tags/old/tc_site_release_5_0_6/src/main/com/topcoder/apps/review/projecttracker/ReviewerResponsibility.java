/*
 * ReviewerResponsibility.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * <p>
 * Object representation of the various options for a reviewer's
 * responsibilities with respect to their role on a project.
 * This might include the type of test cases assigned to them.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class ReviewerResponsibility implements Serializable {

    public static final long ID_STRESS = 1;
    public static final long ID_FAILURE = 2;
    public static final long ID_ACCURACY = 3;

    private long id;
    private String name;

    /**
     * Creates a new ReviewerResponsibility object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     */
    public ReviewerResponsibility(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of responsibility.
     * </p>
     *
     * @return a String with the name of responsibility;
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of responsibility.
     * </p>
     *
     * @return the id of responsibility.
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

        if (!(o instanceof ReviewerResponsibility)) {
            return false;
        }

        ReviewerResponsibility revResp = (ReviewerResponsibility) o;

        return revResp.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
