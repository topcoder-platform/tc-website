/*
 * ProjectType.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * The type of a project.
 *
 * @author FatClimber
 * @version 1.0
 */
public class ProjectType implements Serializable {
    public static final long ID_DESIGN = 1;
    public static final long ID_DEVELOPMENT = 2;

    private long id;
    private String name;

    /**
     * Creates a new ProjectType object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     */
    public ProjectType(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of this project type.
     * </p>
     *
     * @return a String with the name of this project type.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of this project type.
     * </p>
     *
     * @return the id of this project type.
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

        if (!(o instanceof ProjectType)) {
            return false;
        }

        ProjectType projectType = (ProjectType) o;

        return projectType.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
