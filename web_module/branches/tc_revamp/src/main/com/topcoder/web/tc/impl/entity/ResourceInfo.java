/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table resource_info, so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ResourceInfo implements Serializable {
    /**
     * <p>
     * The resource id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setResourceId(), getResourceId().
     * </p>
     */
    private long resourceId;

    /**
     * <p>
     * The resource info type id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setResourceInfoTypeId(),
     * getResourceInfoTypeId().
     * </p>
     */
    private long resourceInfoTypeId;

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
    public ResourceInfo() {
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
     * Getter method for resourceInfoTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return the resourceInfoTypeId
     */
    public long getResourceInfoTypeId() {
        return resourceInfoTypeId;
    }

    /**
     * <p>
     * Setter method for the resourceInfoTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param resourceInfoTypeId
     *            the resourceInfoTypeId to set
     */
    public void setResourceInfoTypeId(long resourceInfoTypeId) {
        this.resourceInfoTypeId = resourceInfoTypeId;
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
