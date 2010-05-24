/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>This class represents a Specification Review Status entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Specification Review Status entity.
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class SpecReviewStatus extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constant to store "passed" Specification Review Status id
     */
    public static final Integer PASSED = 1;

    /**
     * Constant to store "failed" Specification Review Status id
     */
    public static final Integer FAILED = 2;

    /**
     * Constant to store "pending" Specification Review Status id
     */
    public static final Integer PENDING = 3;

    /**
     * Constant to store "ready" Specification Review Status id
     */
    public static final Integer READY = 4;

    /**
     * Constant to store "reviewer assigned" Specification Review Status id
     */
    public static final Integer REVIEWER_ASSIGNED = 5;

    /**
     * Constant to store "not ready" Specification Review Status id
     */
    public static final Integer NOT_READY = 6;

    /**
     * The spec review status id.
     */
    private Integer id;

    /**
     * The spec review status name.
     */
    private String name;

    /**
     * Default empty Constructor
     */
    public SpecReviewStatus() {
    }

    /**
     * Constructor using Specification Review Status Id
     *
     * @param id the Specification Review Status Id
     */
    public SpecReviewStatus(Integer id) {
        this.id = id;
    }

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Integer getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * Gets the spec review status name.
     *
     * @return the spec review status name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the spec review status name.
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Equals implementation for this class.
     *
     * @param obj the object to compare
     * @return true if the two objects are equal (identifiers are equal)
     *
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj) {
        if (obj == null || id == null || !(obj instanceof SpecReviewStatus)) {
            return false;
        } else {
            SpecReviewStatus other = (SpecReviewStatus) obj;
            return id.equals(other.getId());
        }
    }

    /**
     * Hashcode implementation for this class.
     *
     * @return an <code>int</code> with the hashcode (identifier hashcode)
     *
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (id != null ? id.hashCode() : 0);
    }
}
