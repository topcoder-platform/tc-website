/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This class is a simple container class that contains the information of the category.
 * </p>
 *
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author bugbuka
 * @version 1.0
 */
public class CategoryDTO {
    /**
     * Represents the category id.
     */
    private long categoryId;

    /**
     * Represents the category name.
     */
    private String categoryName;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public CategoryDTO() {
        // Empty
    }

    /**
     * Gets the category id.
     *
     * @return the category id.
     */
    public long getCategoryId() {
        return categoryId;
    }

    /**
     * Sets the category id.
     *
     * @param categoryId the category id.
     */
    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * Gets the category name.
     *
     * @return the category name.
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * Sets the category name.
     *
     * @param categoryName the category name.
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
