/*
 * ComponentVersionInfo.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Date;

/**
 * An object that holds the attributes of a component version that are returned
 * by the component catalog. The client may modify the attributes using the
 * appropriate <code>set</code> methods and commit these modifications to the
 * database by calling the <code>updateVersionInfo</code> method of
 * <code>ComponentManager</code>.
 *
 * @version 26 August 2002, 1.0
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class ComponentVersionInfo implements java.io.Serializable {


    /** The constant used to indicate a version is in the collaboration phase */
    public static final long COLLABORATION = 111;

    /** The constant used to indicate a version is in the specification phase */
    public static final long SPECIFICATION = 112;

    /** The constant used to indicate a version is in the development phase */
    public static final long DEVELOPMENT = 113;

    /** The constant used to indicate a version is complete */
    public static final long COMPLETED = 114;

    private long versionId;
    private long version;
    private String versionLabel;
    private String comments;
    private long phase;
    private Date phaseDate;
    private double price;
    private boolean publicForum = false;


    ComponentVersionInfo(long versionId, long version, String versionLabel,
                         String comments, long phase, Date phaseDate, double price) {
        this.versionId = versionId;
        this.version = version;
        this.versionLabel = versionLabel;
        this.comments = comments;
        this.phase = phase;
        this.phaseDate = (Date) phaseDate.clone();
        this.price = price;
    }

    public boolean getPublicForum() {
        return publicForum;
    }

    public void setPublicForum(boolean publicForum) {
        this.publicForum = publicForum;
    }

    /**
     * Returns the primary key of this version.
     *
     * @return the primary key of this version
     */
    public long getVersionId() {
        return versionId;
    }

    /**
     * Returns the version number of this version.
     *
     * @return the version number of this version
     */
    public long getVersion() {
        return version;
    }

    /**
     * Returns the text label of this version.
     *
     * @return the label of this version
     */
    public String getVersionLabel() {
        return versionLabel;
    }

    /**
     * Sets the text label of this version.
     *
     * @param versionLabel the new label
     * @throws IllegalArgumentException if <code>versionLabel</code> is
     * <code>null</code>
     */
    public void setVersionLabel(String versionLabel) {
        if (versionLabel == null) {
            throw new IllegalArgumentException(
                    "Null specified for version label");
        }
        this.versionLabel = versionLabel;
    }

    /**
     * Returns the comments for this version.
     *
     * @return the comments for this version
     */
    public String getComments() {
        return comments;
    }

    /**
     * Sets the comments for this version.
     *
     * @param comments the new comments
     * @throws IllegalArgumentException if <code>comments</code> is
     * <code>null</code>
     */
    public void setComments(String comments) {
        if (comments == null) {
            throw new IllegalArgumentException(
                    "Null specified for component version comment");
        }
        this.comments = comments;
    }

    /**
     * Returns the development phase of this version is currently in.
     *
     * @return the phase of this version
     */
    public long getPhase() {
        return phase;
    }

    /**
     * Sets the development phase of this version.
     *
     * @param phase the new phase
     * @throws IllegalArgumentException if <code>phase</code> is not one of the
     * constant phase fields of <code>ComponentVersionInfo</code>.
     */
    public void setPhase(long phase) {
        if (phase == COLLABORATION || phase == SPECIFICATION
                || phase == DEVELOPMENT || phase == COMPLETED)
            this.phase = phase;
        else
            throw new IllegalArgumentException(
                    "Invalid value specified for component version phase");
    }

    /**
     * Returns the date at which the current phase began.
     *
     * @return a <code>Date</code> object containing the exact date the latest
     * phase was started
     */
    public Date getPhaseDate() {
        return (Date) phaseDate.clone();
    }

    /**
     * Sets the date at which the current phase was started
     *
     * @param phaseDate the new date
     * @throws IllegalArgumentException if <code>phaseDate</code> is
     * <code>null</code>.
     */
    public void setPhaseDate(Date phaseDate) {
        if (phaseDate == null) {
            throw new IllegalArgumentException(
                    "Null specified for phase date");
        }
        this.phaseDate = (Date) phaseDate.clone();
    }

    /**
     * Returns the price of this version.
     *
     * @return the price of this version
     */
    public double getPrice() {
        return price;
    }

    /**
     * Sets the price of this version.
     *
     * @param price the new price
     * @throws IllegalArgumentException if <code>price</code> is negative or
     * non-finite.
     */
    public void setPrice(double price) {
        if (price < 0.0) {
            throw new IllegalArgumentException(
                    "Negative number specified for price");
        }
        if (Double.isInfinite(price) || Double.isNaN(price)) {
            throw new IllegalArgumentException(
                    "Non-finite number specified for price");
        }
        this.price = price;
    }

    /**
     * Compares the specified object with this version for equality. Two
     * <code>ComponentVersionInfo</code> objects are considered equal if they
     * have the same version id, version number, version label, comments, phase,
     * phase date, and price.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * version; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ComponentVersionInfo other = (ComponentVersionInfo) object;
        return getVersionId() == other.getVersionId()
                && getVersion() == other.getVersion()
                && getVersionLabel().equals(other.getVersionLabel())
                && getComments().equals(other.getComments())
                && getPhase() == other.getPhase()
                && phaseDate.equals(other.phaseDate)
                && getPrice() == other.getPrice();
    }

    /**
     * Returns the hash code value for this version. The hash code is the
     * bitwise exclusive-or of the hash code of the phase date field and the
     * lower 32 bits of the primary key of this version.
     *
     * @return the hash code value for this version
     */
    public int hashCode() {
        return (int) (versionId ^ phaseDate.hashCode());
    }

    public String toString() {
        return "Version " + getVersion() + " (" + getComments() + ")";
    }

    public static String getPhaseName(long phaseId) {
        if (phaseId == ComponentVersionInfo.COLLABORATION) {
            return "Collaboration";
        } else if (phaseId == ComponentVersionInfo.COMPLETED) {
            return "Completed";
        } else if (phaseId == ComponentVersionInfo.DEVELOPMENT) {
            return "Development";
        } else if (phaseId == ComponentVersionInfo.SPECIFICATION) {
            return "Specification";
        } else {
            return "Unknown Phase";
        }
    }
}