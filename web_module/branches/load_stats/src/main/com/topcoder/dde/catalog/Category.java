/*
 * Category.java
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
import java.util.Set;


/**
 * An object that represents a component category. Instances of this class can
 * either be created by the component catalog to return information to the
 * client, or by the client to pass information to the component catalog. In the
 * former case, the instance will contain information about the category's
 * primary key in the database and its subcategories. In the latter case, the
 * instance will have a dummy id of -1 and an empty <code>Collection</code> for
 * its subcategories.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     ComponentManager
 */
public class Category implements java.io.Serializable {

    /** The status constant used to indicate a category has been deleted */
    public static final long DELETED = 0;

    /** The status constant used to indicate a category is active */
    public static final long ACTIVE = 1;

    private long id;
    private String name;
    private String description;
    private Collection subcategories;


    Category(long id, String name, String description,
             Collection subcategories) {
        this(name, description);
        this.id = id;
        this.subcategories = (subcategories == null)
                ? Collections.EMPTY_LIST
                : subcategories;
    }

    /**
     * Constructs a new <code>Category</code> object.
     *
     * @param name the name of the category
     * @param description a description of the category
     * @throws IllegalArgumentException if <code>name</code> or
     * <code>description</code> are <code>null</code>.
     */
    public Category(String name, String description) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for category name");
        }
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for category description");
        }
        id = -1;
        this.name = name;
        this.description = description;
        subcategories = Collections.EMPTY_LIST;
    }

    /**
     * Returns the primary key of this component category.
     *
     * @return the primary key of this category, or -1 if this category was
     * constructed by the client (instead of returned by the component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the name of this component category.
     *
     * @return the name of this category
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of this component category.
     *
     * @param name the new name
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>
     */
    public void setName(String name) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for category name");
        }
        this.name = name;
    }

    /**
     * Returns a description of this component category.
     *
     * @return a description of this category
     */
    public String getDescription() {
        return description;
    }


    /**
     * Sets the description of this component category.
     *
     * @param description the new description
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for category description");
        }
        this.description = description;
    }

    public Set findForTree(long categoryId) {
        return findForTree(categoryId, new HashSet());
    }

    private Set findForTree(long categoryId, Set s) {
        Set set = new HashSet();
        set.addAll(s);
        set.add(new Long(this.id));
        if (this.id == categoryId) return set;
        if (this.subcategories != null) {
            Category[] cats = (Category[]) this.subcategories.toArray(new Category[0]);
            for (int i = 0; i < cats.length; i++) {
                Set rv = cats[i].findForTree(categoryId, set);
                if (rv != null) return rv;
            }
        }
        return null;
    }

    /**
     * Returns an unmodifiable <code>Collection</code> of the subcategories of
     * this category. If this category was created by the client, instead of
     * returned from the component catalog, the returned collection will always
     * be empty.
     *
     * @return a <code>Collection</code> of the subcategories of this category
     */
    public Collection getSubcategories() {
        return Collections.unmodifiableCollection(subcategories);
    }

    /**
     * Compares the specified object with this category for equality. Two
     * categories are considered equal if they have the same name and
     * description. The primary key and subcategory information are <em>not</em>
     * tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * category; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        Category other = (Category) object;
        return getName().equals(other.getName())
                && getDescription().equals(other.getDescription());
    }

    /**
     * Returns the hash code value for this category. The hash code is generated
     * by performing a bitwise exclusive-or operation on the hash codes of the
     * <code>String</code> objects containing the name and description.
     *
     * @return the hash code value for this category
     */
    public int hashCode() {
        return getName().hashCode() ^ getDescription().hashCode();
    }

    public String toString() {
        return "Category " + getId() + " - " + getName()
                + " (" + getDescription() + ")";
    }


}


