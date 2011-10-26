/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.scorecard_group</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ScorecardGroup extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 13829124L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the group name.
     */
    private String name;
    
    /**
     * Represents the group weight.
     */
    private Double weight;
    
    /**
     * Represents the sort value of the group.
     */
    private Integer sort;
    
    /**
     * Represents the scorecard sections of the group.
     */
    private Set<ScorecardSection> sections;
    
    /**
     * Empty constructor.
     */
    public ScorecardGroup() {
        super();
    }

    /**
     * Gets the id of the entity.
     * 
     * @return the id of the entity.
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the id of the entity.
     * 
     * @param id the id of the entity.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the group name.
     * 
     * @return the group name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the group name.
     * 
     * @param name the group name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the group weight.
     * 
     * @return the group weight.
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * Sets the group weight.
     * 
     * @param weight the group weight.
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * Gets the sort value of the group.
     * 
     * @return the sort value of the group.
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * Sets the sort value of the group.
     * 
     * @param sort the sort value of the group.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * Gets the scorecard sections of the group.
     * 
     * @return the scorecard sections of the group.
     */
    public Set<ScorecardSection> getSections() {
        return sections;
    }

    /**
     * Sets the scorecard sections of the group.
     * 
     * @param sections the scorecard sections of the group.
     */
    public void setSections(Set<ScorecardSection> sections) {
        this.sections = sections;
    }    
}
