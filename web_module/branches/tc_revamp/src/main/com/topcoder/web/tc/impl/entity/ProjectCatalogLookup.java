/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

/**
 * <p>
 * This class is simply the Java mapped class for table project_catalog_lu, so that this table can be used in
 * HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ProjectCatalogLookup extends LookupEntity {
    /**
     * <p>
     * The project catalog id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getProjectCatalogId(), setProjectCatalogId().
     * </p>
     */
    private long projectCatalogId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ProjectCatalogLookup() {
        // Empty
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
