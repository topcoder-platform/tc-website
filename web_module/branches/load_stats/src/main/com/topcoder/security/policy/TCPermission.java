package com.topcoder.security.policy;

import java.io.Serializable;

/**
 * An abstract class representing a permission.  All classes
 * representing specific types of permissions should extend
 * this class.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public abstract class TCPermission implements Serializable {

    private String name;

    /**
     * Construct a TCPermission with the given name/description
     *
     * @param name
     */
    protected TCPermission(String name) {
        this.name = name;
    }

    /**
     * @return Returns the name (or description) of the Permission
     */
    public String getName() {
        return name;
    }

    /**
     * @return a hashCode value for this object equal to name.hashCode()
     */
    public int hashCode() {
        return name.hashCode();
    }

    /**
     * Basic default equals.  Returns true if this and the given object are of the
     * same type and their name fields are equal.
     *
     * @param obj
     * @return True if this equals obj, false otherwise
     */
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj != null && getClass() == obj.getClass()) {
            if (name.equals(((TCPermission) obj).getName())) {
                return true;
            }
        }
        return false;
    }
}
