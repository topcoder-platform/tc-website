/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.review</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class Review extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 12348392L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the author of the review.
     */
    private Resource author;
    
    /**
     * Represents the submission associated with the review.
     */
    private Submission submission;
    
    /**
     * Represents the scorecard associated with the review.
     */
    private Scorecard scorecard;
    
    /**
     * A flag indicates whether the review has been committed.
     */
    private Boolean committed;
    
    /**
     * Represents the score of the review.
     */
    private Double score;
    
    /**
     * Represents the initial score of the review.
     */
    private Double initialScore;
    
    /**
     * Represents the comments of the review.
     */
    private Set<ReviewComment> comments;
    
    /**
     * Represents the review items of the review.
     */
    private Set<ReviewItem> items;

    /**
     * Empty constructor.
     */
    public Review() {
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
     * Gets  the author of the review.
     * @return the author of the review.
     */
    public Resource getAuthor() {
        return author;
    }

    /**
     * Sets the author of the review.
     * 
     * @param author the author of the review.
     */
    public void setAuthor(Resource author) {
        this.author = author;
    }

    /**
     * Gets the submission associated with the review.
     * 
     * @return the submission associated with the review.
     */
    public Submission getSubmission() {
        return submission;
    }

    /**
     * Sets the submission associated with the review.
     * 
     * @param submission the submission associated with the review.
     */
    public void setSubmission(Submission submission) {
        this.submission = submission;
    }

    /**
     * Gets the scorecard associated with the review.
     * 
     * @return the scorecard associated with the review.
     */
    public Scorecard getScorecard() {
        return scorecard;
    }

    /**
     * Sets the scorecard associated with the review.
     * 
     * @param scorecard the scorecard associated with the review.
     */
    public void setScorecard(Scorecard scorecard) {
        this.scorecard = scorecard;
    }

    /**
     * Gets the flag indicates whether the review has been committed.
     * 
     * @return true if the review has been committed, false otherwise.
     */
    public Boolean getCommitted() {
        return committed;
    }

    /**
     * Sets the flag indicates whether the review has been committed.
     * 
     * @param committed true if the review has been committed, false otherwise.
     */
    public void setCommitted(Boolean committed) {
        this.committed = committed;
    }

    /**
     * Gets the score of the review.
     * 
     * @return the score of the review.
     */
    public Double getScore() {
        return score;
    }

    /**
     * Sets the score of the review.
     * 
     * @param score the score of the review.
     */
    public void setScore(Double score) {
        this.score = score;
    }

    /**
     * Gets the initial score of the review.
     * 
     * @return the initial score of the review.
     */
    public Double getInitialScore() {
        return initialScore;
    }

    /**
     * Sets the initial score of the review.
     * 
     * @param initialScore the initial score of the review.
     */
    public void setInitialScore(Double initialScore) {
        this.initialScore = initialScore;
    }

    /**
     * Gets the comments of the review.
     * 
     * @return the comments of the review.
     */
    public Set<ReviewComment> getComments() {
        return comments;
    }

    /**
     * Sets the comments of the review.
     * 
     * @param comments the comments of the review.
     */
    public void setComments(Set<ReviewComment> comments) {
        this.comments = comments;
    }

    /**
     * Gets the review items of the review.
     * 
     * @return the review items of the review.
     */
    public Set<ReviewItem> getItems() {
        return items;
    }

    /**
     * Sets the review items of the review.
     * 
     * @param items the review items of the review.
     */
    public void setItems(Set<ReviewItem> items) {
        this.items = items;
    }
}
