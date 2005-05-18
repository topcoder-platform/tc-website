/*
 * ComponentRequest.java
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
 * A request for a new component. Instances of this class are passed to the
 * component catalog to convey information about the proposed component to be
 * reviewed by an administrator. This information consists of the name,
 * description, keywords, and associated categories of the proposed component.
 * In addition, the comments and technologies associated with the first version
 * of the component must also be specified (since the component and the
 * component version will be created together).
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     Category
 * @see     Technology
 */
public class ComponentRequest extends ComponentVersionRequest {


    private String name;
    private String shortDescription;
    private String description;
    private String functionalDescription;
    private String keywords;
    private Collection categories;


    /**
     * Constructs a new <code>ComponentRequest</code> object.
     *
     * @param name the name of the component
     * @param shortDescription a short description of the component
     * @param description a description of the component
     * @param functionalDescription a description of the functionality of the
     * component
     * @param keywords the keywords associated with the component, delimited by
     *  {@link ComponentInfo#KEYWORD_DELIMITER ComponentInfo.KEYWORD_DELIMITER}
     * @param comments the comments for the first version of the component
     * @param versionLabel the text label for the first version of the component
     * @param userId the primary key of the user making the request
     * @throws IllegalArgumentException if at least one of the parameters is
     * <code>null</code>
     */
    public ComponentRequest(String name, String shortDescription,
                            String description, String functionalDescription, String keywords,
                            String comments, String versionLabel, long userId) {
        super(comments, versionLabel, userId);
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for component name");
        }
        if (shortDescription == null) {
            throw new IllegalArgumentException(
                    "Null specified for short description");
        }
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for component description");
        }
        if (functionalDescription == null) {
            throw new IllegalArgumentException(
                    "Null specified for functional description");
        }
        if (keywords == null) {
            throw new IllegalArgumentException(
                    "Null specified for keywords");
        }
        this.name = name;
        this.shortDescription = shortDescription;
        this.description = description;
        this.functionalDescription = functionalDescription;
        this.keywords = keywords;
        categories = new HashSet();
    }

    /**
     * Returns the name of the requested component
     *
     * @return the name of the component
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the requested component
     *
     * @param name the new name
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>.
     */
    public void setName(String name) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for component name");
        }
        this.name = name;
    }

    /**
     * Returns a short description of the requested component.
     *
     * @return a short description of the requested component
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * Sets the short description of the requested component.
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
     * Returns a description of the requested component
     *
     * @return a description of the component
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of the requested component
     *
     * @param description the new description
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>.
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for component description");
        }
        this.description = description;
    }

    /**
     * Returns a description of the functionality of the requested component.
     *
     * @return a description of the functionality of the requested component
     */
    public String getFunctionalDescription() {
        return functionalDescription;
    }

    /**
     * Sets the description of the functionality of the requested component.
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
     * Returns the keywords associated with the requested component. The
     * keywords are concatenated into a single <code>String</code> separated by
     * <code>ComponentInfo.KEYWORD_DELIMITER</code>.
     *
     * @return a <code>String</code> containing the keywords of the component
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * Sets the keywords associated with the requested component. The keywords
     * must be delimited by <code>ComponentInfo.KEYWORD_DELIMITER</code>.
     *
     * @param keywords the <code>String</code> containing the new keywords
     * @throws IllegalArgumentException if <code>keywords</code> is
     * <code>null</code>
     */
    public void setKeywords(String keywords) {
        if (keywords == null) {
            throw new IllegalArgumentException(
                    "Null specified for keywords");
        }
        this.keywords = keywords;
    }

    /**
     * Associates a category with the requested component. Note that specifying
     * a non-existent category will not cause an exception until the request is
     * submitted to the component catalog.
     *
     * @param categoryId the primary key of the category to be associated
     */
    public void addCategory(long categoryId) {
        categories.add(new Long(categoryId));
    }

    /**
     * Disassociates a category from the requested component. Specifying a
     * non-existent category or a category that has not been associated with the
     * component will produce no effect.
     *
     * @param categoryId the primary key of the category to be disassociated
     */
    public void removeCategory(long categoryId) {
        categories.remove(new Long(categoryId));
    }

    /**
     * Clears the category associations for the component.
     */
    public void clearCategories() {
        categories.clear();
    }

    /**
     * Returns the categories associated with the component. The returned list
     * will contain no duplicates.
     *
     * @return an unmodifiable <code>Collection</code> of <code>Long</code>
     * objects representing the primary keys of the categories associated with
     * the component.
     */
    public Collection getCategories() {
        return Collections.unmodifiableCollection(categories);
    }

    /**
     * Compares the specified object with this component request for equality.
     * Two requests are considered equal if they have the same name, short
     * description, description, functional description, keywords, comments,
     * version label, requestor user id, associated catagories, and associated
     * technologies.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * request; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        ComponentRequest other = (ComponentRequest) object;
        return getName().equals(other.getName())
                && getShortDescription().equals(other.getShortDescription())
                && getDescription().equals(other.getDescription())
                && getFunctionalDescription().equals(
                        other.getFunctionalDescription())
                && getKeywords().equals(other.getKeywords())
                && getComments().equals(other.getComments())
                && getVersionLabel().equals(other.getVersionLabel())
                && getUserId() == other.getUserId()
                && categories.equals(other.categories)
                && technologies.equals(other.technologies);
    }

    /**
     * Returns the hash code value for this request. The hash code is generated
     * by performing a bitwise exclusive-or operation on the hash codes of the
     * <code>String</code> objects containing the name and description.
     *
     * @return the hash code value for this request
     */
    public int hashCode() {
        return getName().hashCode() ^ getDescription().hashCode();
    }

    public String toString() {
        return "Requested Component - " + getName()
                + " (" + getShortDescription() + ")";
    }


}