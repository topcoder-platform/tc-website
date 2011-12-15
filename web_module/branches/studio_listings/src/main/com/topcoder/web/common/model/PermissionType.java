/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>This class represents a Permission Type entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Permission Type entity.
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class PermissionType extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constant to store "project_read" Permission Type id
     */
    public static final Integer PROJECT_READ = 1;

    /**
     * Constant to store "project_write" Permission Type id
     */
    public static final Integer PROJECT_WRITE = 2;

    /**
     * Constant to store "project_full" Permission Type id
     */
    public static final Integer PROJECT_FULL = 3;

    /**
     * Constant to store "contest_read" Permission Type id
     */
    public static final Integer CONTEST_READ = 4;

    /**
     * Constant to store "contest_write" Permission Type id
     */
    public static final Integer CONTEST_WRITE = 5;

    /**
     * Constant to store "contest_full" Permission Type id
     */
    public static final Integer CONTEST_FULL = 6;

    /**
     * The permission type id.
     */
    private Integer id;

    /**
     * The permission type name.
     */
    private String name;

    /**
     * Default empty Constructor
     */
    public PermissionType() {
    }

    /**
     * Constructor using Permission Type Id
     *
     * @param id the Permission Type Id
     */
    public PermissionType(Integer id) {
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
     * Gets the permission type name.
     *
     * @return the permission type name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the permission type name.
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
        if (obj == null || id == null || !(obj instanceof PermissionType)) {
            return false;
        } else {
            PermissionType other = (PermissionType) obj;
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
