package com.topcoder.web.common.voting;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 31, 2005
 */
public class Candidate implements Comparable {

    private String name = null;
    private long id = 0;

    public Candidate(String name) {
        this.name = name;
    }

    public Candidate(String name, long id) {
        this.name = name;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public long getId() {
        return id;
    }

    public boolean equals(Object o) {
        try {
            Candidate other = (Candidate)o;
            if (this.getId()<1 || other.getId()<1) {
                return this.getName().equals(other.getName());
            } else {
                return this.getId()==other.getId() && this.getName().equals(other.getName());
            }

        } catch (ClassCastException e) {
            return false;
        }
    }

    public int compareTo(Object o) {
        if (this.equals(o)) {
            return 0;
        } else {
            if (this.getId()>0&&((Candidate)o).getId()>0) {
                return new Long(this.getId()).compareTo(new Long(((Candidate)o).getId()));
            } else {
                return this.getName().compareTo(((Candidate)o).getName());
            }
        }
    }

    public String toString() {
        if (id>0) {
            return this.name + ":" + this.id;
        } else {
            return this.name;
        }
    }

    public int hashCode() {
        return this.name.hashCode();
    }

}
