/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model.comp;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents a Phase Type entity.</p>
 *
 * <p>
 *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new role entity.
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Configurable Contest Terms-Studio Release Assembly v1.0
 */
public class PhaseType extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The phase type id.
     */
    private Integer id;

    /**
     * The phase type name.
     */
    private String name;

    /**
     * The phase type description
     */
    private String description;

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
     * Gets the name
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the description
     *
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description
     *
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
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
        if (obj == null || id == null || !(obj instanceof PhaseType)) {
            return false;
        } else {
            PhaseType other = (PhaseType) obj;
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
        return id.hashCode();
    }
}
