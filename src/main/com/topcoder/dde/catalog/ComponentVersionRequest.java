/*
 * ComponentVersionRequest.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;


/**
 * A request for a new component version. Instances of this class are passed to
 * the component catalog to convey information about a proposed version. This
 * information consists of the comments and technologies associated with the
 * proposed version, as well as the id of the user making the request.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManagerBean
 * @see     Technology
 */
public class ComponentVersionRequest implements java.io.Serializable {


    protected String comments;
    protected String versionLabel;
    protected long userId;
    protected Collection technologies;


    /**
     * Constructs a new <code>ComponentVersionRequest</code> object.
     *
     * @param comments the comments for the proposed version
     * @param versionLabel the text label of the proposed version
     * @param userId the primary key of the user making the request
     * @throws IllegalArgumentException if <code>comments</code> or
     * <code>versionLabel</code> is <code>null</code>, or if <code>userId</code>
     * is negative.
     */
    public ComponentVersionRequest(String comments, String versionLabel,
                                   long userId) {
        if (comments == null) {
            throw new IllegalArgumentException(
                    "Null specified for version comment");
        }
        if (versionLabel == null) {
            throw new IllegalArgumentException(
                    "Null specified for version label");
        }
        if (userId < 0) {
            throw new IllegalArgumentException(
                    "Negative number specified for user id of requestor");
        }
        this.comments = comments;
        this.versionLabel = versionLabel;
        this.userId = userId;
        technologies = new HashSet();
    }


    /**
     * Returns the comments for the proposed version.
     *
     * @return the version comments
     */
    public String getComments() {
        return comments;
    }

    /**
     * Sets the comments for the proposed version.
     *
     * @param comments the new comments
     * @throws IllegalArgumentException if <code>comments</code> is
     * <code>null</code>.
     */
    public void setComments(String comments) {
        if (comments == null) {
            throw new IllegalArgumentException(
                    "Null specified for version comment");
        }
        this.comments = comments;
    }

    /**
     * Returns the text label for the proposed version.
     *
     * @return the label for the proposed version
     */
    public String getVersionLabel() {
        return versionLabel;
    }

    /**
     * Sets the text label for the proposed version
     *
     * @param versionLabel the new label
     * @throws IllegalArgumentException if <code>versionLabel</code> is
     * <code>null</code>
     */
    public void setVersionLabel(String versionLabel) {
        if (versionLabel == null) {
            throw new IllegalArgumentException(
                    "Null specified for verion label");
        }
        this.versionLabel = versionLabel;
    }

    /**
     * Returns the primary key of the user making the request.
     *
     * @return the primary key of the user making the request
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Sets the primary key of the user making the request.
     *
     * @param userId the new user id
     * @throws IllegalArgumentException if <code>userId</code> is negative
     */
    public void setUserId(long userId) {
        if (userId < 0) {
            throw new IllegalArgumentException(
                    "Negative number specified for user id of requestor");
        }
        this.userId = userId;
    }

    /**
     * Associates a technology with the requested component version. Note that
     * specifying a non-existent technology will not cause an exception until
     * the request is submitted to the component catalog.
     *
     * @param technologyId the primary key of the technology to be associated
     */
    public void addTechnology(long technologyId) {
        technologies.add(new Long(technologyId));
    }

    /**
     * Disassociates a technology from the requested component version.
     * Specifying a non-existent technology or a technology that has not been
     * associated with the version will produce no effect.
     *
     * @param technologyId the primary key of the technology to be disassociated
     */
    public void removeTechnology(long technologyId) {
        technologies.remove(new Long(technologyId));
    }

    /**
     * Clears the technology associations with the component version.
     */
    public void clearTechnologies() {
        technologies.clear();
    }

    /**
     * Returns the technologies associated with this component version. The
     * returned collection will contain no duplicates.
     *
     * @return an unmodifiable <code>Collection</code> of <code>Long</code>
     * objects representing the primary keys of the technologies associated with
     * the component version.
     */
    public Collection getTechnologies() {
        return Collections.unmodifiableCollection(technologies);
    }

    /**
     * Compares the specified object with this version request for equality.
     * Two requests are considered equal if they have the same comments, version
     * label, requestor user id, and associated technologies.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * request; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ComponentVersionRequest other = (ComponentVersionRequest) object;
        return getComments().equals(other.getComments())
                && getVersionLabel().equals(other.getVersionLabel())
                && getUserId() == other.getUserId()
                && technologies.equals(other.technologies);
    }

    /**
     * Returns the hash code value for this request. The hash code is generated
     * by performing a bitwise exclusive-or operation on the hash codes of the
     * <code>String</code> objects containing the comments and version label.
     *
     * @return the hash code value for this request
     */
    public int hashCode() {
        return getComments().hashCode() ^ getVersionLabel().hashCode();
    }

    public String toString() {
        return "Requested Component Version - " + getComments();
    }


}