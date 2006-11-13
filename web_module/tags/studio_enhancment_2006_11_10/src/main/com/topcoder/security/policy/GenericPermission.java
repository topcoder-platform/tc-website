package com.topcoder.security.policy;

/**
 * A class representing a generic permission.  To be used for until we
 * know what types of permissions we need or for general testing.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class GenericPermission extends TCPermission {

    /**
     * Construct a GenericPermission with the given name/description
     *
     * @param name
     */
    public GenericPermission(String name) {
        super(name);
    }

    /**
     * Determine if this equals the given object.  Returns false if the object
     * is null or not a GenericPermission.  Two Generic Perimssions are equal if
     * their names are equal.
     *
     * @param o
     * @return True if this is equal to o, false otherwise
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof GenericPermission)) {
            return false;
        }
        return getName().equals(((GenericPermission) o).getName());
    }
}
