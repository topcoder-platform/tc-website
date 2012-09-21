/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This is the base class for all entities that have an identification number.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public abstract class IdentifiableEntity {
    /**
     * <p>
     * Represents the primary identifier of the entity. It is managed with a
     * getter and setter, thus fully mutable. It may have any value.
     * </p>
     */
    private long id;

    /**
     * <p>
     * Default empty constructor.
     * </p>
     */
    protected IdentifiableEntity() {
    }

    /**
     * <p>
     * Determines whether the specified Object is equal to the current Object.
     * </p>
     * 
     * @param obj
     *            The Object to compare with the current Object.
     * @return true if the specified Object is equal to the current Object;
     *         otherwise, false.
     */
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }

        if (null != obj && obj instanceof IdentifiableEntity) {
            IdentifiableEntity objIE = (IdentifiableEntity) obj;
            if (objIE.getId() == id) {
                return true;
            }
        }

        return false;
    }

    /**
     * <p>
     * Serves as a hash function for a particular type.
     * </p>
     * 
     * @return hash code for the current Object.
     */
    public int hashCode() {
        return (int) (id ^ (this.id >>> 32));
    }

    /**
     * <p>
     * Getter of the id field.
     * </p>
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Setter of the id field.
     * </p>
     * 
     * @param id
     *            the id to set
     */
    public void setId(long id) {
        this.id = id;
    }
}
