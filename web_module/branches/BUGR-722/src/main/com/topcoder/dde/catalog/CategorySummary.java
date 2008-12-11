/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.catalog;

import java.io.Serializable;

/**
 * Container for Category Summary
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Parent category attribute was added.
 * </li>
 * </ol>
 *
 * @author TCSDEVELOPER, pulky
 * @version 1.0.1
 */
public class CategorySummary implements Serializable {

    private long id;
    private String name;
    private String description;
    private ComponentSummary[] components;
    private CategorySummary[] subcategories;

    /**
     * The parent category.
     *
     * @since 1.0.1
     */
    private long parent;

    /**
     * <p>
     * Creates the instance of <code>CategorySummary</code> class.
     * </p>
     *
     * @param id The id of the category.
     * @param name The name of the category.
     * @param description The descripcion of the category.
     * @param components The components related to this category.
     * @param subcategories The subcategories related to this category.
     * @param parent The parent category.
     */
    public CategorySummary(long id, String name, String description, ComponentSummary[] components,
        CategorySummary[] subcategories, long parent) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.components = components;
        this.subcategories = subcategories;
        this.parent = parent;
    }

    public long getId() {
        return id;
    }

    /**
     * @return Returns the parent.
     *
     * @since 1.0.1
     */
    public long getParent() {
        return parent;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public ComponentSummary[] getComponents() {
        return components;
    }

    public CategorySummary[] getSubcategories() {
        return subcategories;
    }

    public boolean isEmpty() {
        if ((subcategories == null || subcategories.length == 0)
                && (components == null || components.length == 0))
            return true;
        if (components != null && components.length > 0)
            return false;
        else {
            for (int i = 0; i < subcategories.length; i++) {
                if (!subcategories[i].isEmpty()) return false;
            }
            return true;
        }
    }
}