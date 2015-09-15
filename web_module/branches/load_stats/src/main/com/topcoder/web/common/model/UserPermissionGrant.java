/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>This class represents a User Permission entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new User Permission entity.
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class UserPermissionGrant extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constant to store is_studio flag TRUE value
     */
    public static final Integer TRUE = 1;

    /**
     * The User Permission Grant id.
     */
    private Long id;

    /**
     * The associated User.
     */
    private User user;

    /**
     * The associated resource id.
     */
    private Long resourceId;

    /**
     * The associated permission type
     */
    private PermissionType permissionType;

    /**
     * The associated "is studio" flag.
     */
    private Integer isStudio;

    /**
     * Default empty Constructor
     */
    public UserPermissionGrant() {
    }

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the associated User
     *
     * @return the associated User
     */
    public User getUser() {
        return user;
    }

    /**
     * Sets the associated User
     *
     * @param user the associated User to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Gets the associated Resource Id
     *
     * @return the associated Resource Id
     */
    public Long getResourceId() {
        return resourceId;
    }

    /**
     * Sets the associated Resource Id
     *
     * @param resourceId the associated Resource Id to set
     */
    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * Gets the associated Permission Type
     *
     * @return the associated Permission Type
     */
    public PermissionType getPermissionType() {
        return permissionType;
    }

    /**
     * Sets the associated Permission Type
     *
     * @param permissionType the associated Permission Type to set
     */
    public void setPermissionType(PermissionType permissionType) {
        this.permissionType = permissionType;
    }

    /**
     * Gets the associated "is_studio" flag
     *
     * @return the associated "is_studio" flag
     */
    public Integer getIsStudio() {
        return isStudio;
    }

    /**
     * Sets the associated "is_studio" flag
     *
     * @param isStudio the associated "is_studio" flag to set
     */
    public void setIsStudio(Integer isStudio) {
        this.isStudio = isStudio;
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
        if (obj == null || id == null || !(obj instanceof UserPermissionGrant)) {
            return false;
        } else {
            UserPermissionGrant other = (UserPermissionGrant) obj;
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
