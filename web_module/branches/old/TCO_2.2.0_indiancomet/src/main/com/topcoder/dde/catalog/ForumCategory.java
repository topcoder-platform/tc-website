/*
 * Forum.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Date;


/**
 * An object that holds the attributes of a component discussion forum category that are
 * returned by the component catalog.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 */
public class ForumCategory implements java.io.Serializable {

    /** The status constant used to indicate a forum is active */
    public static final long ACTIVE = 1;

    /** The status constant used to indicate a forum has been closed */
    public static final long CLOSED = 2;
    
    private final long id;		// represents Jive category ID
    private final Date startDate;
    private final long status;
    private final long version;
    private final String versionLabel;


    public ForumCategory(long id, Date startDate, long status, long version, String versionLabel) {
        this.id = id;

        /*
         * The Date class is not immutable.  A copy must be made to preserve the
         * immutability of ComponentForum.
         */
        this.startDate = (Date) startDate.clone();
        this.status = status;
        this.version = version;
        this.versionLabel = versionLabel;
    }


    /**
     * Returns the primary key of this component discussion forum.
     *
     * @return the primary key of this forum
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the start date of this component discussion forum.
     *
     * @return the date this forum was started
     */
    public Date getStartDate() {
        return (Date) startDate.clone();
    }

    /**
     * Returns the status of this component discussion forum.
     *
     * @return the status of this forum
     */
    public long getStatus() {
        return status;
    }

    /**
     * Returns the version number of the component associated with this forum.
     *
     * @return the version number of the component associated with this forum
     */
    public long getVersion() {
        return version;
    }

    /**
     * Returns the version label of the component associated with this forum.
     *
     * @return the version label of the component associated with this forum
     */
    public String getVersionLabel() {
        return versionLabel;
    }

    /**
     * Compares the specified object with this forum for equality. Two
     * <code>Forum</code> objects are considered equal if they
     * have the same primary key, start date, close date, status, version, and
     * version label.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * forum; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ForumCategory other = (ForumCategory) object;
        return getId() == other.getId()
                && startDate.equals(other.startDate)
                && getStatus() == other.getStatus()
                && getVersion() == other.getVersion()
                && getVersionLabel().equals(other.getVersionLabel());
    }

    /**
     * Returns the hash code value for this component discussion forum. The hash
     * code is the bitwise exclusive-or of the hash code of the start date field
     * and the lower 32 bits of the primary key of this forum.
     *
     * @return the hash code value for this forum
     */
    public int hashCode() {
        return (int) (getId() ^ startDate.hashCode());
    }

    public String toString() {
        return "Forum " + getId() + " (" + startDate.toString() + ")";
    }


}