/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.scorecard_question</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ScorecardQuestion extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 1219382L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the id of the question type.
     */
    private Integer type;
    
    /**
     * Represents the question description.
     */
    private String description;
    
    /**
     * Represents the question guideline.
     */
    private String guideline;
    
    /**
     * Represents the question weight.
     */
    private Double weight;
    
    /**
     * Represents the sort value of the question.
     */
    private Integer sort;
    
    /**
     * A flag indicates whether we can upload document to the question.
     */
    private Boolean uploadDocument;
    
    /**
     * A flag indicates whether we must upload document to the question.
     */
    private Boolean uploadDocumentRequired;
    
    /**
     * Empty constructor.
     */
    public ScorecardQuestion() {
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
     * Gets the id of the question type.
     * 
     * @return the id of the question type.
     */
    public Integer getType() {
        return type;
    }

    /**
     * Sets the id of the question type.
     * 
     * @param type the id of the question type.
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * Gets the question description.
     * 
     * @return the question description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the question description.
     * 
     * @param description the question description.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Gets the question guideline.
     * 
     * @return the question guideline.
     */
    public String getGuideline() {
        return guideline;
    }

    /**
     * Sets the question guideline.
     * 
     * @param guideline the question guideline.
     */
    public void setGuideline(String guideline) {
        this.guideline = guideline;
    }

    /**
     * Gets the question weight.
     * 
     * @return the question weight.
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * Sets the question weight.
     * 
     * @param weight the question weight.
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * Gets the sort value of the question.
     * 
     * @return the sort value of the question.
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * Sets the sort value of the question.
     * 
     * @param sort the sort value of the question.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * Gets the flag indicates whether we can upload document to the question.
     * 
     * @return the flag indicates whether we can upload document to the question.
     */
    public Boolean getUploadDocument() {
        return uploadDocument;
    }

    /**
     * Sets the flag indicates whether we can upload document to the question.
     * 
     * @param uploadDocument the flag indicates whether we can upload document to the question.
     */
    public void setUploadDocument(Boolean uploadDocument) {
        this.uploadDocument = uploadDocument;
    }

    /**
     * Gets the flag indicates whether we must upload document to the question.
     * 
     * @return the flag indicates whether we must upload document to the question.
     */
    public Boolean getUploadDocumentRequired() {
        return uploadDocumentRequired;
    }

    /**
     * Sets flag indicates whether we must upload document to the question.
     * 
     * @param uploadDocumentRequired the flag indicates whether we must upload document to the question.
     */
    public void setUploadDocumentRequired(Boolean uploadDocumentRequired) {
        this.uploadDocumentRequired = uploadDocumentRequired;
    }
}
