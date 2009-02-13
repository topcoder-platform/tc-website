package com.topcoder.web.ejb.pacts.assignmentdocuments;

import java.io.Serializable;

/**
 * Simplified bean to represent a Studio contest
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 */
public class StudioContest implements Serializable, Cloneable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private Long id;
    private String name;

    public StudioContest() {
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }
}
