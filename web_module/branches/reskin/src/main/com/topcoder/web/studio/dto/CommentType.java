/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.comment_type_lu</code> table.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class CommentType extends Base {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = 23412343L;
    
    /**
     * Represents the id of the entity.
     */
    private Long id;
    
    /**
     * Represents the name of the comment type.
     */
    private String name;
    
    /**
     * Represents the description of the comment type.
     */
    private String description;
    
    /**
     * Empty constructor.
     */
    public CommentType() {
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
     * Gets the name of the comment type.
     * 
     * @return the name of the comment type.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the comment type.
     * 
     * @param name the name of the comment type.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the description of the comment type.
     * 
     * @return the description of the comment type.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of the comment type.
     * 
     * @param description the description of the comment type.
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
