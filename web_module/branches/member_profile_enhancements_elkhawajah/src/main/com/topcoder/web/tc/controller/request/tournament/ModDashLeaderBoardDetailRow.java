/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.sql.Timestamp;

/**
 * <p>This class is a simple bean representing a TCO Mod Dash leaderboard details row.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public class ModDashLeaderBoardDetailRow {
    /**
     * <p>A <code>String</code> representing the issue key.</p>
     */
    private String issueKey;

    /**
     * <p>A <code>Integer</code> representing the total points.</p>
     */
    private Integer points;

    /**
     * <p>A <code>Integer</code> representing the ticket's project.</p>
     */
    private Integer project;

    /**
     * <p>A <code>Timestamp</code> representing the ticket creation timestamp.</p>
     */
    private Timestamp created;
    
    /**
     * This method will construct a <code>ModDashLeaderBoardDetailRow</code> with
     * all specified parameters
     * 
     * @param issueKey the issuekey to set
     * @param points the points to set
     * @param project the project to set
     * @param created the created to set
     */
    public ModDashLeaderBoardDetailRow(String issueKey,
            Integer points, Integer project,
            Timestamp created) {
        super();
        this.issueKey = issueKey;
        this.points = points;
        this.project = project;
        this.created = created;
    }

    /**
     * Simple getter for issueKey attribute
     * 
     * @return the issueKey attribute
     */
    public String getIssueKey() {
        return issueKey;
    }

    /**
     * Simple setter for issueKey attribute
     * 
     * @param issueKey the value to set
     */
    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    /**
     * Simple getter for points attribute
     * 
     * @return the points attribute
     */
    public Integer getPoints() {
        return points;
    }

    /**
     * Simple setter for points attribute
     * 
     * @param points the value to set
     */
    public void setPoints(Integer points) {
        this.points = points;
    }

    /**
     * Simple getter for project attribute
     * 
     * @return the project attribute
     */
    public Integer getProject() {
        return project;
    }

    /**
     * Simple setter for project attribute
     * 
     * @param project the value to set
     */
    public void setProject(Integer project) {
        this.project = project;
    }

    /**
     * Simple getter for created attribute
     * 
     * @return created attribute
     */
    public Timestamp getCreated() {
        return created;
    }

    /**
     * Simple setter for created attribute
     * 
     * @param created the value to set
     */
    public void setCreated(Timestamp created) {
        this.created = created;
    }
}
