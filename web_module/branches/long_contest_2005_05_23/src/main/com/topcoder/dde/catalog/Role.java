/*
 * Role.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.io.Serializable;


/**
 * An object that represents a development role for a component. Instances of
 * this class can either be created by the component catalog to return
 * information to the client, or by the client to pass information to the
 * component catalog. In the former case, the instance will contain information
 * about the role's primary key in the database. In the latter case, the
 * instance will have a dummy id of -1.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     ComponentManager
 */
public class Role implements Serializable {

    /** The status constant used to indicate a role has been deleted */
    public static final long DELETED = 0;

    /** The status constant used to indicate a role is active */
    public static final long ACTIVE = 1;

    private long id;
    private String name;
    private String description;


    Role(long id, String name, String description) {
        this(name, description);
        this.id = id;
    }

    /**
     * Constructs a new <code>Role</code> object.
     *
     * @param name the name of the role
     * @param description a description of the role
     * @throws IllegalArgumentException if <code>name</code> or
     * <code>description</code> are <code>null</code>.
     */
    public Role(String name, String description) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for role name");
        }
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for role description");
        }
        this.name = name;
        this.description = description;
        id = -1;
    }

    /**
     * Returns the primary key of this role.
     *
     * @return the primary key of this role, or -1 if the role was constructed
     * by the client (instead of returned by the component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the name of this role.
     *
     * @return the name of this role
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of this role.
     *
     * @param name the new name
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>
     */
    public void setName(String name) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for role name");
        }
        this.name = name;
    }

    /**
     * Returns a description of this role.
     *
     * @return a description of this role
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of this role.
     *
     * @param description the new description
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for role description");
        }
        this.description = description;
    }

    /**
     * Compares the specified object with this role for equality. Two
     * roles are considered equal if they have the same name and
     * description. The primary key is <em>not</em> tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * role; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        Role other = (Role) object;
        return getName().equals(other.getName())
                && getDescription().equals(other.getDescription());
    }

    /**
     * Returns the hash code value for this role. The hash code is generated
     * by performing a bitwise exclusive-or operation on the hash codes of the
     * <code>String</code> objects containing the name and description.
     *
     * @return the hash code value for this role
     */
    public int hashCode() {
        return getName().hashCode() ^ getDescription().hashCode();
    }

    public String toString() {
        return "Role " + getId() + " - " + getName()
                + " (" + getDescription() + ")";
    }


}