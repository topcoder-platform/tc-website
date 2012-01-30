/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;

import com.topcoder.web.tc.dto.CategoryDTO;

/**
 * <p>
 * This interface defines the contract for getting lookup values of contest type, sub-types, and catalogs.
 * </p>
 * <p>
 * Thread Safety: The implementation of this interface must be thread-safe after configuration and assuming
 * that the passed in parameters are not changed by other threads at the same time.
 * </p>
 *
 * <p>
 * Changes in 1.1: Removed getContestSubTypes method since it is unused.
 * </p>
 *
 * <p>
 * Changes in 1.2 : 1, Add method {@link #getCategoryName(Long)} to get category name by category id. 2, Using 
 * CategoryDTO instead of String to represent the returned category
 * </p>
 * 
 * @author mekanizumu, TCSDEVELOPER, pinoydream, bugbuka
 * @version 1.2
 */
public interface CategoriesManager {
    /**
     * <p>
     * Get all contest catalogs.
     * </p>
     *
     * @return all catalogs. It won't be null but could be empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    public List<String> getCatalogs() throws CategoriesManagerException;

    /**
     * <p>
     * Get all contest types.
     * </p>
     *
     * @return all contest types. It won't be null but could be empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    public List<CategoryDTO> getContestTypes() throws CategoriesManagerException;

    /**
     * <p>
     * Get all contest types of a category.
     * </p>
     *
     * @param category
     *            the category under which the contest types are returned.
     * @return all contest types of the given category. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if category is null or empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    public List<CategoryDTO> getContestTypes(String category) throws CategoriesManagerException;
    
    /**
     * <p>
     * Get the category name specified by the category id.
     * </p>
     * @param categoryId 
     *            the specified category id
     * @return category name. if there is no corresponding category name, returns null.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    public String getCategoryName(Long categoryId) throws CategoriesManagerException;
}
