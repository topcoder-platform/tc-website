/*
 * ComponentInfo.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;


/**
 * An object that holds the attributes of a component that are returned by the
 * component catalog. The client may modify the attributes using the appropriate
 * <code>set</code> methods and commit these modifications to the database by
 * calling the <code>updateComponentInfo</code> method of
 * <code>ComponentManager</code>.
 *
 * @version    1.0, 26 August 2002
 * @author     Albert Mao
 * @see        ComponentManager
 */
public class ComponentInfo implements java.io.Serializable {


    /** The status constant used to indicate a component has been deleted */
    public static final long DELETED = 0;

    /** The status constant used to indicate a component has been requested */
    public static final long REQUESTED = 101;

    /** The status constant used to indicate a component has been approved */
    public static final long APPROVED = 102;

    /**
     * The status constant used to indicate a component has been declined
     * because it is a duplicate of another existing component
     */
    public static final long DUPLICATE = 103;

    /** The status constant used to indicate a component has been declined */
    public static final long DECLINED = 104;

    /** The delimiter used to separate keywords */
    public static final String KEYWORD_DELIMITER = " ";

    private long id;
    private long currentVersion;
    private String name;
    private String shortDescription;
    private String description;
    private String functionalDescription;
    private String keywords;
    private long status;


    ComponentInfo(long id, long currentVersion, String name,
                  String shortDescription, String description,
                  String functionalDescription, String keywords,
                  long status) {
        this.id = id;
        this.currentVersion = currentVersion;
        this.name = name;
        this.shortDescription = shortDescription;
        this.description = description;
        this.functionalDescription = functionalDescription;
        this.keywords = keywords;
        this.status = status;
    }

    /**
     * Returns the primary key of this component.
     *
     * @return the primary key of this component
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the current version of this component.
     *
     * @return the current version of this component
     */
    public long getCurrentVersion() {
        return currentVersion;
    }

    /**
     * Returns the name of this component.
     *
     * @return the name of this component
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of this component.
     *
     * @param name the new name
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>
     */
    public void setName(String name) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for component name");
        }
        this.name = name;
    }

    /**
     * Returns a short description of this component.
     *
     * @return a short description of this component
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * Sets the short description of this component.
     *
     * @param shortDescription the new short description
     * @throws IllegalArgumentException if <code>shortDescription</code> is
     * <code>null</code>
     */
    public void setShortDescription(String shortDescription) {
        if (shortDescription == null) {
            throw new IllegalArgumentException(
                    "Null specified for short description");
        }
        this.shortDescription = shortDescription;
    }

    /**
     * Returns the full description of this component.
     *
     * @return the full description of this component
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the full description of this component.
     *
     * @param description the new full description
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for component description");
        }
        this.description = description;
    }

    /**
     * Returns a description of the functionality of this component.
     *
     * @return a description of the functionality of this component
     */
    public String getFunctionalDescription() {
        return functionalDescription;
    }

    /**
     * Sets the description of the functionality of this component.
     *
     * @param functionalDescription the new functional description
     * @throws IllegalArgumentException if <code>functionalDescription</code> is
     * <code>null</code>
     */
    public void setFunctionalDescription(String functionalDescription) {
        if (functionalDescription == null) {
            throw new IllegalArgumentException(
                    "Null specified for functional description");
        }
        this.functionalDescription = functionalDescription;
    }

    /**
     * Returns the keywords associated with this component. The keywords are
     * concatenated into a single <code>String</code> separated by
     * <code>KEYWORD_DELIMITER</code>.
     *
     * @return a <code>String</code> containing the keywords of this component
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * Sets the keywords associated with this component. The keywords must be
     * delimited by <code>KEYWORD_DELIMITER</code>.
     *
     * @param keywords the <code>String</code> containing the new keywords
     * @throws IllegalArgumentException if <code>keywords</code> is
     * <code>null</code>
     */
    public void setKeywords(String keywords) {
        if (keywords == null) {
            throw new IllegalArgumentException(
                    "Null specified for component keywords");
        }
        this.keywords = keywords;
    }

    /**
     * Returns the status of this component.
     *
     * @return the status of this component
     */
    public long getStatus() {
        return status;
    }

    /**
     * Sets the status of this component.
     *
     * @param status the new status
     * @throws IllegalArgumentException if <code>status</code> is not one of the
     * constant status fields of <code>ComponentInfo</code>
     */
    public void setStatus(long status) {
        if (status == DELETED || status == REQUESTED || status == APPROVED
                || status == DUPLICATE || status == DECLINED)
            this.status = status;
        else
            throw new IllegalArgumentException(
                    "Invalid value specified for component status");
    }

    /**
     * Compares the specified object with this component for equality. Two
     * <code>ComponentInfo</code> objects are considered equal if they have the
     * same primary key, name, short description, description, functional
     * description, current version, keywords, and status.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * component; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ComponentInfo other = (ComponentInfo) object;
        return getId() == other.getId() && getName().equals(other.getName())
                && getShortDescription().equals(other.getShortDescription())
                && getDescription().equals(other.getDescription())
                && getFunctionalDescription().equals(
                        other.getFunctionalDescription())
                && getCurrentVersion() == other.getCurrentVersion()
                && getKeywords().equals(other.getKeywords())
                && getStatus() == other.getStatus();
    }

    /**
     * Returns the hash code value for this component. The hash code is the
     * bitwise exclusive-or of the upper and lower 32 bits of the primary key of
     * the component.
     *
     * @return the hash code value for this component
     */
    public int hashCode() {
        return (int) (id ^ (id >> 32));
    }

    public String toString() {
        return "Component " + getId() + " - " + getName()
                + " (" + getShortDescription() + ")";
    }


}

