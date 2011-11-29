/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;

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
 * @author mekanizumu, TCSDEVELOPER, pinoydream
 * @version 1.1
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
    public List<String> getContestTypes() throws CategoriesManagerException;

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
    public List<String> getContestTypes(String category) throws CategoriesManagerException;

}
