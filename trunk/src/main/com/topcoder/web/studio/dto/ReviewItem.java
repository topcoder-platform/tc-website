/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.review_item</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ReviewItem extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 92812341L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the scorecard question id associated with this review item.
     */
    private Long questionId;
    
    /**
     * Represents the answer of the review item.
     */
    private String answer;
    
    /**
     * Represents the sort value of the review item.
     */
    private Integer sort;
    
    /**
     * Represents the comments of the review item.
     */
    private Set<ReviewItemComment> comments;
    
    /**
     * Empty constructor.
     */
    public ReviewItem() {
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
     * Gets the scorecard question id associated with this review item.
     * 
     * @return the scorecard question id associated with this review item.
     */
    public Long getQuestionId() {
        return questionId;
    }

    /**
     * Sets the scorecard question id associated with this review item.
     * 
     * @param questionId the scorecard question id associated with this review item.
     */
    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    /**
     * Gets the answer of the review item.
     * 
     * @return the answer of the review item.
     */
    public String getAnswer() {
        return answer;
    }

    /**
     * Sets the answer of the review item.
     * 
     * @param answer the answer of the review item.
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * Gets the sort value of the review item.
     * 
     * @return the sort value of the review item.
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * Sets the sort value of the review item.
     * 
     * @param sort the sort value of the review item.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * Gets the comments of the review item.
     * 
     * @return the comments of the review item.
     */
    public Set<ReviewItemComment> getComments() {
        return comments;
    }

    /**
     * Sets the comments of the review item.
     * 
     * @param comments the comments of the review item.
     */
    public void setComments(Set<ReviewItemComment> comments) {
        this.comments = comments;
    }
}
