/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;

/**
 * The DTO class which represents a JIRA issue.
 * 
 * @author flexme
 * @version 1.0
 */
public class JIRAIssue implements Serializable {
    /**
     * Represents the key of the issue.
     */
    private String key;
    
    /**
     * Represents the summary of the issue.
     */
    private String summary;
    
    /**
     * Represents the first place payment of the issue.
     */
    private double prize;
    
    /**
     * Empty constructor.
     */
    public JIRAIssue() {
        
    }

    /**
     * Gets the key of the issue.
     * 
     * @return the key of the issue.
     */
    public String getKey() {
        return key;
    }

    /**
     * Sets the key of the issue.
     * 
     * @param key the key of the issue.
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * Gets the summary of the issue.
     * 
     * @return the summary of the issue
     */
    public String getSummary() {
        return summary;
    }

    /**
     * Sets the summary of the issue.
     * 
     * @param summary the summary of the issue.
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }

    /**
     * Gets the first place payment of the issue.
     * 
     * @return the first place payment of the issue.
     */
    public double getPrize() {
        return prize;
    }

    /**
     * Sets the first place payment of the issue.
     * 
     * @param prize the first place payment of the issue.
     */
    public void setPrize(double prize) {
        this.prize = prize;
    }
}
