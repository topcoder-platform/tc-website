package com.topcoder.dde.catalog;

import java.io.Serializable;

/**
 */
public class CategorySummary implements Serializable {

    private long id;
    private String name;
    private String description;
    private ComponentSummary[] components;
    private CategorySummary[] subcategories;

    public CategorySummary(long id, String name, String description, ComponentSummary[] components, CategorySummary[] subcategories) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.components = components;
        this.subcategories = subcategories;
    }

    public long getId() {
        return id;
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