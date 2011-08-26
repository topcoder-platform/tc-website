/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>A base entity class table for review comment and review item comment entities.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public abstract class ReviewCommentBase extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 23234211L;

    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the author of the comment.
     */
    private Resource author;
    
    /**
     * Represents the type of the comment.
     */
    private CommentType type;
    
    /**
     * Represents the content of the comment.
     */
    private String content;
    
    /**
     * Represents the extra info of the comment.
     */
    private String extraInfo;
    
    /**
     * Represents the sort value of the comment.
     */
    private Integer sort;
    
    /**
     * Empty constructor.
     */
    public ReviewCommentBase() {
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
     * Gets the author of the comment.
     * 
     * @return the author of the comment.
     */
    public Resource getAuthor() {
        return author;
    }

    /**
     * Sets the author of the comment.
     * 
     * @param author the author of the comment.
     */
    public void setAuthor(Resource author) {
        this.author = author;
    }

    /**
     * Gets the type of the comment.
     * 
     * @return the type of the comment.
     */
    public CommentType getType() {
        return type;
    }

    /**
     * Sets the type of the comment.
     * 
     * @param type the type of the comment.
     */
    public void setType(CommentType type) {
        this.type = type;
    }

    /**
     * Gets the content of the comment.
     * 
     * @return the content of the comment.
     */
    public String getContent() {
        return content;
    }

    /**
     * Sets the content of the comment.
     * 
     * @param content the content of the comment.
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Gets the extra info of the comment.
     * 
     * @return the extra info of the comment.
     */
    public String getExtraInfo() {
        return extraInfo;
    }

    /**
     * Sets the extra info of the comment.
     * 
     * @param extraInfo the extra info of the comment.
     */
    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    /**
     * Gets the sort value of the comment.
     * 
     * @return the sort value of the comment.
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * Sets the sort value of the comment.
     * 
     * @param sort the sort value of the comment.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
