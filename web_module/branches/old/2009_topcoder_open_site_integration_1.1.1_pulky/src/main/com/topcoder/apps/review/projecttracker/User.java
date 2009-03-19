/*
 * User.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * This User object provides access to the relevant attributes of a user.
 *
 * @author FatClimber
 * @version 1.0
 */
public class User implements Serializable {
    private long id;
    private String handle;
    private String firstName;
    private String lastName;
    private String email;

    /**
     * Creates a new User object.
     *
     * @param id DOCUMENT ME!
     * @param handle DOCUMENT ME!
     * @param firstName DOCUMENT ME!
     * @param lastName DOCUMENT ME!
     * @param email DOCUMENT ME!
     */
    public User(long id, String handle, String firstName, String lastName, String email) {
        this.id = id;
        this.handle = handle;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    /**
     * <p>
     * Return the Id of this user.
     * </p>
     *
     * @return the Id of this user.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the handle of this user.
     * </p>
     *
     * @return a String with the handle of this user.
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Return the first name of this user.
     * </p>
     *
     * @return a String with the first name of this user.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * <p>
     * Return the last name of this user.
     * </p>
     *
     * @return a String with the last name of this user.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * <p>
     * Return the email of this user.
     * </p>
     *
     * @return a String with the email of this user.
     */
    public String getEmail() {
        return email;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof User)) {
            return false;
        }

        User user = (User) o;

        return user.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
