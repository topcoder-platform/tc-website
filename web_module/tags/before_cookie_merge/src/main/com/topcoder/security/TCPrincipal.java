package com.topcoder.security;

import java.io.Serializable;

/**
 * The TCPrincipal is an abstract class that represents an entity. The
 * security manager supports the User, Group, and Role entities (which
 * are subclasses of TCPrincipal).
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public abstract class TCPrincipal implements Serializable {

    private long id;
    private String name;

    /**
     * Constructor for TCPrincipal that can be used by subclasses
     *
     * @param name Can not be null
     * @param id
     */
    protected TCPrincipal(String name, long id) {
        if (name == null) {
            throw new NullPointerException("name can not be null");
        }
        this.id = id;
        this.name = name;
    }

    /**
     * @return The principal's primary key id
     */
    public long getId() {
        return id;
    }

    /**
     * @return The principal's description or name
     */
    public String getName() {
        return name;
    }

    /**
     * @return a String representation of this object
     */
    public String toString() {
        return name + "<" + id + ">";
    }

    /**
     * @return a HashCode value for this object equal to its id cast to an
     *         int plus the HashCode value of its name.
     */
    public int hashCode() {
        return (int) id + name.hashCode();
    }

}
