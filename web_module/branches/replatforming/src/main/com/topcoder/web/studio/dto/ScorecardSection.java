/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.scorecard_section</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ScorecardSection extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 195823012L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the section name.
     */
    private String name;
    
    /**
     * Represents the section weight.
     */
    private Double weight;
    
    /**
     * Represents the sort value of the section.
     */
    private Integer sort;
    
    /**
     * Represents the scorecard question of the section.
     */
    private Set<ScorecardQuestion> questions;
    
    /**
     * Empty constructor.
     */
    public ScorecardSection() {
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
     * Gets the section name.
     * 
     * @return the section name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the section name.
     * 
     * @param name the section name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the section weight.
     * 
     * @return the section weight.
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * Sets the section weight.
     * 
     * @param weight the section weight.
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * Gets the sort value of the section.
     * 
     * @return the sort value of the section.
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * Sets the sort value of the section.
     * 
     * @param sort the sort value of the section.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * Gets the scorecard question of the section.
     * 
     * @return the scorecard question of the section.
     */
    public Set<ScorecardQuestion> getQuestions() {
        return questions;
    }

    /**
     * Sets the scorecard question of the section.
     * 
     * @param questions the scorecard question of the section.
     */
    public void setQuestions(Set<ScorecardQuestion> questions) {
        this.questions = questions;
    }    
}
