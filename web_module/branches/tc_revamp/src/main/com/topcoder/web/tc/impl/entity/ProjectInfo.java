/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table project_info, so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ProjectInfo implements Serializable {
    /**
     * <p>
     * The project id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setProjectId(), getProjectId().
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * The project info type id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setProjectInfoTypeId(), getProjectInfoTypeId().
     * </p>
     */
    private long projectInfoTypeId;

    /**
     * <p>
     * The value. It has both getter and setter. It can be any value. It does not need to be initialized when
     * the instance is created. It is used in getValue(), setValue().
     * </p>
     */
    private String value;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ProjectInfo() {
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
     * Getter method for projectInfoTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectInfoTypeId
     */
    public long getProjectInfoTypeId() {
        return projectInfoTypeId;
    }

    /**
     * <p>
     * Setter method for the projectInfoTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectInfoTypeId
     *            the projectInfoTypeId to set
     */
    public void setProjectInfoTypeId(long projectInfoTypeId) {
        this.projectInfoTypeId = projectInfoTypeId;
    }

    /**
     * <p>
     * Getter method for value, simply return the value of the namesake field.
     * </p>
     *
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * <p>
     * Setter method for the value, simply set the value to the namesake field.
     * </p>
     *
     * @param value
     *            the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
}
