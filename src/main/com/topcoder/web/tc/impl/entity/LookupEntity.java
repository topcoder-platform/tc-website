/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class simply has a name property for the subclasses to use. It represents a lookup entity.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public abstract class LookupEntity implements Serializable {
    /**
     * <p>
     * The name of this lookup entity. It has both getter and setter. It can be any value. It does not need to
     * be initialized when the instance is created. It is used in getName(), setName().
     * </p>
     */
    private String name;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    protected LookupEntity() {
        // Empty
    }

    /**
     * <p>
     * Getter method for name, simply return the value of the namesake field.
     * </p>
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter method for the name, simply set the value to the namesake field.
     * </p>
     *
     * @param name
     *            The name of this lookup entity to set
     */
    public void setName(String name) {
        this.name = name;
    }

}
