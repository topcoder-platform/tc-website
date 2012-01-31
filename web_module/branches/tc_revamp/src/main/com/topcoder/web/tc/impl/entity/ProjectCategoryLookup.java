/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

/**
 * <p>
 * This class is simply the Java mapped class for table project_category_lu, so that this table can be used in
 * HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ProjectCategoryLookup extends LookupEntity {
    /**
     * <p>
     * The project category id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getProjectCategoryId(), setProjectCategoryId().
     * </p>
     */
    private long projectCategoryId;

	/**
     * <p>
     * The project category id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getProjectCategoryId(), setProjectCategoryId().
     * </p>
     */
    private long projectTypeId;

    /**
     * <p>
     * The project group category id. It has both getter and setter. It can be any value. It does not need to
     * be initialized when the instance is created. It is used in getProjectCatalogId(),
     * setProjectCatalogId().
     * </p>
     */
    private long projectCatalogId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ProjectCategoryLookup() {
        // Empty
    }

    /**
     * <p>
     * Getter method for projectCategoryId, simply return the value of the namesake field.
     * </p>
     *
     * @return The project category id
     */
    public long getProjectCategoryId() {
        return projectCategoryId;
    }

    /**
     * <p>
     * Getter method for projectTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return The project type id
     */
    public long getProjectTypeId() {
        return projectTypeId;
    }

    /**
     * <p>
     * Setter method for the projectTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectTypeId
     *            The project type id to set
     */
    public void setProjectTypeId(long projectTypeId) {
        this.projectTypeId = projectTypeId;
    }

    /**
     * <p>
     * Setter method for the projectCategoryId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectCategoryId
     *            The project category id to set
     */
    public void setProjectCategoryId(long projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }

    /**
     * <p>
     * Getter method for projectCatalogId, simply return the value of the namesake field.
     * </p>
     *
     * @return The project catalog id
     */
    public long getProjectCatalogId() {
        return projectCatalogId;
    }

    /**
     * <p>
     * Setter method for the projectCatalogId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectCatalogId
     *            The project catalog id to set
     */
    public void setProjectCatalogId(long projectCatalogId) {
        this.projectCatalogId = projectCatalogId;
    }
}
