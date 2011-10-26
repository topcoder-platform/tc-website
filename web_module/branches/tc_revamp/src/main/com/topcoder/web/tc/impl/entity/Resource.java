/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table 'resource', so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class Resource implements Serializable {
    /**
     * <p>
     * The resource id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setResourceId(), getResourceId().
     * </p>
     */
    private long resourceId;

    /**
     * <p>
     * The project id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setProjectId(), getProjectId().
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * The project phase id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setProjectPhaseId(), getProjectPhaseId().
     * </p>
     */
    private long projectPhaseId;

    /**
     * <p>
     * The resource role id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setResourceRoleId(), getResourceRoleId().
     * </p>
     */
    private long resourceRoleId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public Resource() {
        // Empty
    }

    /**
     * <p>
     * Getter method for resourceId, simply return the value of the namesake field.
     * </p>
     *
     * @return the resourceId
     */
    public long getResourceId() {
        return resourceId;
    }

    /**
     * <p>
     * Setter method for the resourceId, simply set the value to the namesake field.
     * </p>
     *
     * @param resourceId
     *            the resourceId to set
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
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
     * Getter method for projectPhaseId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectPhaseId
     */
    public long getProjectPhaseId() {
        return projectPhaseId;
    }

    /**
     * <p>
     * Setter method for the projectPhaseId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectPhaseId
     *            the projectPhaseId to set
     */
    public void setProjectPhaseId(long projectPhaseId) {
        this.projectPhaseId = projectPhaseId;
    }

    /**
     * <p>
     * Getter method for resourceRoleId, simply return the value of the namesake field.
     * </p>
     *
     * @return the resourceRoleId
     */
    public long getResourceRoleId() {
        return resourceRoleId;
    }

    /**
     * <p>
     * Setter method for the resourceRoleId, simply set the value to the namesake field.
     * </p>
     *
     * @param resourceRoleId
     *            the resourceRoleId to set
     */
    public void setResourceRoleId(long resourceRoleId) {
        this.resourceRoleId = resourceRoleId;
    }

}
