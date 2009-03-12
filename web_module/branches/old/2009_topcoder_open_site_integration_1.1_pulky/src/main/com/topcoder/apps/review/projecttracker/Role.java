/*
 * Role.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * <p>
 * Object representation of the various options for the roles a user might be
 * assigned with respect to a project.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class Role implements Serializable {
    public static final long ID_DESIGNER_DEVELOPER = 1;
    public static final long ID_PRIMARY_SCREENER = 2;
    public static final long ID_REVIEWER = 3;
    public static final long ID_AGGREGATOR = 4;
    public static final long ID_FINAL_REVIEWER = 5;
    public static final long ID_PRODUCT_MANAGER = 6;
    public static final long ID_REMOVED = 7;

    private long id;
    private String name;

    /**
     * Creates a new Role object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     */
    public Role(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of this role.
     * </p>
     *
     * @return a String with the name of this role.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of this role.
     * </p>
     *
     * @return the id of this role.
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

        if (!(o instanceof Role)) {
            return false;
        }

        Role role = (Role) o;

        return role.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
