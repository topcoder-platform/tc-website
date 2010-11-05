package com.topcoder.security.policy;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * An object that holds a collection of permissions.  Use to represent
 * all of a user's permissions.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class PermissionCollection implements Serializable {

    private Set permissions;

    public PermissionCollection() {
        this.permissions = new HashSet();
    }

    /**
     * Add a permission to the collection.
     *
     * @param permission
     */
    public synchronized void addPermission(TCPermission permission) {
        if (permission == null) {
            throw new IllegalArgumentException("can not add a null permission");
        }
        permissions.add(permission);
    }

    /**
     * Remove the given permission from the collection
     *
     * @param permission
     */
    public synchronized void removePermission(TCPermission permission) {
        if (permission == null) {
            throw new IllegalArgumentException("can not remove a null permission");
        }
        permissions.remove(permission);
    }

    /**
     * get the colletion of permissions
     *
     * @return Collection
     */
    public synchronized Collection getPermissions() {
        Set copy = new HashSet();
        Iterator iterator = permissions.iterator();
        while (iterator.hasNext()) {
            copy.add(iterator.next());
        }
        return copy;
    }

}
