/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table 'project', so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class Project implements Serializable {
    /**
     * <p>
     * The project id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setProjectId(), getProjectId().
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * The project category id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setProjectCategoryId(), getProjectCategoryId().
     * </p>
     */
    private long projectCategoryId;

    /**
     * <p>
     * The project status id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setProjectStatusId(), getProjectStatusId().
     * </p>
     */
    private long projectStatusId;
    
    /**
     * The TC direct project id. It has both getter and setter.
     * LegalValue:
     * It can be any value.
     * Initialization and Mutability:
     * It does not need to be initialized when the instance is created. 
     * Usage:
     * It is used in setTcDirectProjectId(), getTcDirectProjectId().
     */
    private long tcDirectProjectId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public Project() {
        // Empty
    }

    /**
     * <p>
     * Getter method for projectId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectId
     */
    public long getProjectId() {
        return projectId;
    }

    /**
     * <p>
     * Setter method for the projectId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectId
     *            the projectId to set
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>
     * Getter method for projectCategoryId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectCategoryId
     */
    public long getProjectCategoryId() {
        return projectCategoryId;
    }

    /**
     * <p>
     * Setter method for the projectCategoryId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectCategoryId
     *            the projectCategoryId to set
     */
    public void setProjectCategoryId(long projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }

    /**
     * <p>
     * Getter method for projectStatusId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectStatusId
     */
    public long getProjectStatusId() {
        return projectStatusId;
    }

    /**
     * <p>
     * Setter method for the projectStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectStatusId
     *            the projectStatusId to set
     */
    public void setProjectStatusId(long projectStatusId) {
        this.projectStatusId = projectStatusId;
    }

    /**
     * Getter for the namesake instance variable. 
     * Simply return the namesake instance variable.
     * @return 
     */
    public long getTcDirectProjectId() {
        return tcDirectProjectId;
    }

    /**
     * Setter for the namesake instance variable. 
     * Simply assign the value to the instance variable.
     * 
     * Parameters:
     * tcDirectProjectId - The TC direct project id. 
     * @param tcDirectProjectId 
     */
    public void setTcDirectProjectId(long tcDirectProjectId) {
        this.tcDirectProjectId = tcDirectProjectId;
    }
}
