package com.topcoder.security;

/**
 * Represents permission based roles. The roles are the only entity that
 * permissions are assigned to.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class RolePrincipal extends TCPrincipal {

    /**
     * Class constructor
     *
     * @param name The role's description
     * @param id The role's role_id
     */
    public RolePrincipal(String name, long id) {
        super(name, id);
    }

    /**
     * Determine if this RolePrincipal is equal to another object.  They
     * are only equal if they are both instances of RolePrincipal and their
     * ids and names are equal
     *
     * @param o
     * @return True if this is equal to o, false otherwise.
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof RolePrincipal)) {
            return false;
        }
        RolePrincipal up = (RolePrincipal) o;
        return up.getName().equals(getName()) && up.getId() == getId();
    }
}
