/*
 * ComponentSummary.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Date;

/**
 * A summary of a component version. The information returned by the component
 * catalog in instances of this class can be used to generate a brief synopsis
 * of the component as well as query the catalog for more specific information.
 * Note that components and component versions are logically distinct entities.
 * Some of the attributes of <code>ComponentSummary</code> (component id, name,
 * descriptions, and status) pertain to the component, while others (version id,
 * version, version label, comments, phase, phase date, and price) pertain to a
 * particular version of the component.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     ComponentManager
 */
public class ComponentSummary implements java.io.Serializable {


    private long componentId;
    private long versionId;
    private long version;
    private String name;
    private String versionLabel;
    private String comments;
    private String shortDescription;
    private String description;
    private long phase;
    private Date phaseDate;
    private double price;
    private long status;

    public long getRootCategory() {
        return rootCategory;
    }

    private long rootCategory;


    ComponentSummary(long compId, long verId, long ver, String name,
                     String versionLabel, String comments, String shortDescription,
                     String description, long phase, Date phaseDate, double price,
                     long status, long rootCategory) {
        componentId = compId;
        versionId = verId;
        version = ver;
        this.name = name;
        this.versionLabel = versionLabel;
        this.comments = comments;
        this.shortDescription = shortDescription;
        this.description = description;
        this.phase = phase;
        this.phaseDate = (Date) phaseDate.clone();
        this.price = price;
        this.status = status;
        this.rootCategory = rootCategory;
    }


    /**
     * Returns the primary key of the component.
     *
     * @return the primary key of the component
     */
    public long getComponentId() {
        return componentId;
    }

    /**
     * Returns the primary key of the component version.
     *
     * @return the primary key of the component version
     */
    public long getVersionId() {
        return versionId;
    }

    /**
     * Returns the version number of the component version.
     *
     * @return the version number of the component version
     */
    public long getVersion() {
        return version;
    }

    /**
     * Returns the name of the component.
     *
     * @return the name of the component
     */
    public String getName() {
        return name;
    }

    /**
     * Returns the label of the component version.
     *
     * @return the label of the component version
     */
    public String getVersionLabel() {
        return versionLabel;
    }

    /**
     * Returns the comments of the component version.
     *
     * @return the comments of the component version
     */
    public String getComments() {
        return comments;
    }

    /**
     * Returns a short description of the component.
     *
     * @return a short description of the component
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * Returns a description of the component.
     *
     * @return a description of the component
     */
    public String getDescription() {
        return description;
    }

    /**
     * Returns the phase of the component version. The constant values for the
     * phases are defined in {@link ComponentVersionInfo ComponentVersionInfo}.
     *
     * @return the phase of the component version
     */
    public long getPhase() {
        return phase;
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
     * Returns the price of the component version.
     *
     * @return the price of the component version
     */
    public double getPrice() {
        return price;
    }

    /**
     * Returns the status of the component. The constant values for the stati
     *
     * @return the status of the component
     */
    public long getStatus() {
        return status;
    }

    /**
     * Compares the specified object with this summary for equality. Two
     * summaries are considered equal if they have exactly the same attributes.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * summary; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ComponentSummary other = (ComponentSummary) object;
        return getComponentId() == other.getComponentId()
                && getVersionId() == other.getVersionId()
                && getVersion() == other.getVersion()
                && getName().equals(other.getName())
                && getVersionLabel().equals(other.getVersionLabel())
                && getShortDescription().equals(other.getShortDescription())
                && getDescription().equals(other.getDescription())
                && getComments().equals(other.getComments())
                && getPhase() == other.getPhase()
                && phaseDate.equals(other.phaseDate)
                && getPrice() == other.getPrice()
                && getStatus() == other.getStatus()
                && getRootCategory() == other.getRootCategory();
    }

    /**
     * Returns the hash code value for this summary. The hash code is generated
     * by performing a bitwise exclusive-or operation on the primary key of the
     * component and the primary key of the component version.
     *
     * @return the hash code value for this summary
     */
    public int hashCode() {
        return (int) (componentId ^ versionId);
    }

    public String toString() {
        return "Component " + getName() + " (" + getShortDescription()
                + ") Version " + getVersion() + " (" + getComments() + ")";
    }


}





