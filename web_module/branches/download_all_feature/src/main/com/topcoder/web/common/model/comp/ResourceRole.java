/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model.comp;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents a Resource Role entity.</p>
 *
 * <p>
 *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Contest - Terms of use - role relationship.
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Configurable Contest Terms-Studio Release Assembly v1.0
 */
public class ResourceRole extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>An <code>Integer</code> referencing the resource role id corresponding to a submitter.</p>
     */
    public static final Integer SUBMITTER_RESOURCE_ROLE_ID = 1;

    /**
     * The resource role id.
     */
    private Integer id;

    /**
     * The resource role phase type.
     */
    private PhaseType phaseType;

    /**
     * The resource role name.
     */
    private String name;

    /**
     * The resource role description
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
     * Gets the phase type
     *
     * @return the phase type
     */
    public PhaseType getPhaseType() {
        return phaseType;
    }

    /**
     * Sets the phase type
     *
     * @param phaseType the phase type to set
     */
    public void setPhaseType(PhaseType phaseType) {
        this.phaseType = phaseType;
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
        if (obj == null || id == null || !(obj instanceof ResourceRole)) {
            return false;
        } else {
            ResourceRole other = (ResourceRole) obj;
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
