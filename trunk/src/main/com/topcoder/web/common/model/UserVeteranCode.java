/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * This is an entity class representing the veteran Svc Occ Code.
 * 
 * @author TCSASSEMBER
 * @version 1.0
 */
public class UserVeteranCode extends Base {
    /**
     * Represents the primary id.
     */
    private Long id;
    /**
     * Represents the user which this Svc Occ Code belongs to.
     */
    private User user;
    /**
     * Represents the Svc Occ Code.
     */
    private String svcOccCode;
    
    /**
     * Default constructor.
     */
    public UserVeteranCode() {
        
    }

    /**
     * Gets the primary id.
     * 
     * @return the primary id.
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the primary id.
     * 
     * @param id the primary id.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the user which this Svc Occ Code belongs to.
     * 
     * @return the user which this Svc Occ Code belongs to.
     */
    public User getUser() {
        return user;
    }

    /**
     * Sets the user which this Svc Occ Code belongs to.
     * 
     * @param user the user which this Svc Occ Code belongs to.
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Gets the Svc Occ Code.
     * 
     * @return the Svc Occ Code.
     */
    public String getSvcOccCode() {
        return svcOccCode;
    }

    /**
     * Sets the Svc Occ Code.
     * 
     * @param svcOccCode the Svc Occ Code.
     */
    public void setSvcOccCode(String svcOccCode) {
        this.svcOccCode = svcOccCode;
    }
}
