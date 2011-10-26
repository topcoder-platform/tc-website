/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * This entity represents comments for a specific question in the spec review.
 * </p>
 * 
 * <strong>Thread-safety:</strong>
 * <p>
 * mutable and not thread-safe.
 * </p>
 * 
 * @author Shorty
 * @version 1.0
 */
public class ForumsSpecReviewComment implements Serializable {

    /**
     * Represents the question id.
     * It has getter & setter.
     * It can be any value.
     */
    private long questionId;

    /**
     * Represents the list of comments for the question.
     * It has getter & setter.
     * It can be any value.
     */
    private List<ForumsUserComment> comments;

    /**
     * Empty constructor.
     */
    public ForumsSpecReviewComment() {
    }

    /**
     * Retrieve the questionId field.
     * 
     * @return the questionId
     */
    public long getQuestionId() {
        return questionId;
    }

    /**
     * Set the questionId field.
     * 
     * @param questionId
     *            the questionId to set
     */
    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    /**
     * Retrieve the comments field.
     * 
     * @return the comments
     */
    public List<ForumsUserComment> getComments() {
        return comments;
    }

    /**
     * Set the comments field.
     * 
     * @param comments
     *            the comments to set
     */
    public void setComments(List<ForumsUserComment> comments) {
        this.comments = comments;
    }
}
