package com.topcoder.security;

/**
 * The UserPrincipal represents a user of the system.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class UserPrincipal extends TCPrincipal {

    /**
     * Class constructor
     *
     * @param name The user's username
     * @param id The user's login_id
     */
    public UserPrincipal(String name, long id) {
        super(name, id);
    }

    /**
     * Determine if this UserPrincipal is equal to another object.  They
     * are only equal if they are both instances of UserPrincipal and their
     * ids and names are equal
     *
     * @param o
     * @return True if this is equal to o, false otherwise.
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof UserPrincipal)) {
            return false;
        }
        UserPrincipal up = (UserPrincipal) o;
        return up.getName().equals(getName()) && up.getId() == getId();
    }
}
