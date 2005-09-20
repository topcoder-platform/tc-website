package com.topcoder.web.common.voting;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sep 2, 2005
 */
public class Voter {
    private static final long ANONYMOUS_ID = -1;
    public static final Voter ANONYMOUS_VOTER = new Voter("Anonymous", ANONYMOUS_ID);
    private String name = null;
    private long id = ANONYMOUS_ID;

    /**
     * create a voter with the give name and id
     * @param name
     * @param id
     */
    public Voter(String name, long id) {
        this.name = name;
        this.id = id;
    }

    /**
     * create a voter with the given name
     * @param name
     */
    public Voter(String name) {
        this.name = name;
        this.id = 0;
    }

    /**
     * return the voters name
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * return the voters id
     * @return
     */
    public long getId() {
        return id;
    }

    /**
     * return true if the voter is anonymous, false otherwise
     * @return
     */
    public boolean isAnonymous() {
        return this.id == ANONYMOUS_ID;
    }

    /**
     * provide a nice view of the data encapsulated here
     * @return
     */
    public String toString() {
        if (id>0) {
            return this.name + ":" + this.id;
        } else {
            return this.name;
        }
    }
}
