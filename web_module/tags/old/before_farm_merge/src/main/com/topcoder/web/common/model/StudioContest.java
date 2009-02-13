package com.topcoder.web.common.model;


/**
 * Simplified bean to represent a Studio contest
 * 
 * @author pulky
 */
public class StudioContest extends Base {
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
