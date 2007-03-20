package com.topcoder.web.common.model;


/**
 * Simplified bean to represent a component project
 * 
 * @author pulky
 */
public class ComponentProject extends Base {
    private Long id;
    private String description;
    
    public ComponentProject() {
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
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
