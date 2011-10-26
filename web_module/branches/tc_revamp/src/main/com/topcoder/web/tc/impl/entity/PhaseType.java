/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table 'phase_type_lu', so that this table can be used in
 * HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class PhaseType implements Serializable {
    /**
     * <p>
     * The phase type id. It has both getter and setter. It can be any value.
     * </p>
     */
    private long phaseTypeId;

    /**
     * <p>
     * The name. It has both getter and setter. It can be any value.
     * </p>
     */
    private String name;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public PhaseType() {
        // Empty
    }

    /**
     * <p>
     * Getter method for phaseTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return the phaseTypeId
     */
    public long getPhaseTypeId() {
        return phaseTypeId;
    }

    /**
     * <p>
     * Setter method for the phaseTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param phaseTypeId
     *            the phaseTypeId to set
     */
    public void setPhaseTypeId(long phaseTypeId) {
        this.phaseTypeId = phaseTypeId;
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
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

}
