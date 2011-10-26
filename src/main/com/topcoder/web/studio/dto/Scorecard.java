/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.scorecard</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class Scorecard extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 17263621L;
    
    /**
     * Represents the id of the entity.
     */
    private Integer id;
    
    /**
     * Represents the name of the scorecard.
     */
    private String name;
    
    /**
     * Represents the type of the scorecard.
     */
    private ScorecardType type;
    
    /**
     * Represents the scorecard groups of the scorecard.
     */
    private Set<ScorecardGroup> groups;
    
    /**
     * Empty constructor.
     */
    public Scorecard() {
        super();
    }

    /**
     * Gets the id of the entity.
     * 
     * @return the id of the entity.
     */
    public Integer getId() {
        return id;
    }

    /**
     * Sets the id of the entity.
     * 
     * @param id the id of the entity.
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * Gets the name of the scorecard.
     * 
     * @return the name of the scorecard.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the scorecard.
     * 
     * @param name the name of the scorecard.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the type of the scorecard.
     * 
     * @return the type of the scorecard.
     */
    public ScorecardType getType() {
        return type;
    }

    /**
     * Sets the type of the scorecard.
     * 
     * @param type the type of the scorecard.
     */
    public void setType(ScorecardType type) {
        this.type = type;
    }

    /**
     * Gets the scorecard groups of the scorecard.
     * 
     * @return the scorecard groups of the scorecard.
     */
    public Set<ScorecardGroup> getGroups() {
        return groups;
    }

    /**
     * Sets the scorecard groups of the scorecard.
     * 
     * @param groups the scorecard groups of the scorecard.
     */
    public void setGroups(Set<ScorecardGroup> groups) {
        this.groups = groups;
    }
}
