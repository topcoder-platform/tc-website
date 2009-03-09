package com.topcoder.security;

/**
 * Represents a group of users (UserPrincipal).
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class GroupPrincipal extends TCPrincipal {

    /**
     * Class constructor
     *
     * @param name The group's description
     * @param id The group's group_id
     */
    public GroupPrincipal(String name, long id) {
        super(name, id);
    }

    /**
     * Determine if this GroupPrincipal is equal to another object.  They
     * are only equal if they are both instances of GroupPrincipal and their
     * ids and names are equal
     *
     * @param o
     * @return True if this is equal to o, false otherwise.
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof GroupPrincipal)) {
            return false;
        }
        GroupPrincipal up = (GroupPrincipal) o;
        return up.getName().equals(getName()) && up.getId() == getId();
    }
}
