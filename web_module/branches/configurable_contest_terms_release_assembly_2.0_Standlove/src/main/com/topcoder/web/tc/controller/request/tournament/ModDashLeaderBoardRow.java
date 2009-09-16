/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.sql.Timestamp;

/**
 * <p>This class is a simple bean representing a TCO Mod Dash leaderboard row.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public class ModDashLeaderBoardRow {
    /**
     * <p>A <code>String</code> representing the handle.</p>
     */
    private String handle;

    /**
     * <p>A <code>Integer</code> representing the total points.</p>
     */
    private Integer points;
    
    /**
     * <p>A <code>Integer</code> representing the number of competitions.</p>
     */
    private Integer numCompetitions;
    
    /**
     * <p>A <code>Timestamp</code> representing the last competition timestamp.</p>
     */
    private Timestamp lastCompetition;
    
    /**
     * This method will construct a <code>ModDashLeaderBoardRow</code> with
     * all specified parameters
     * 
     * @param handle the handle to set
     * @param points the points to set
     * @param numCompetitions the numCompetitions to set
     * @param lastCompetition the lastCompetition to set
     */
    public ModDashLeaderBoardRow(String handle,
            Integer points, Integer numCompetitions,
            Timestamp lastCompetition) {
        super();
        this.handle = handle;
        this.points = points;
        this.numCompetitions = numCompetitions;
        this.lastCompetition = lastCompetition;
    }
    
    /**
     * Simple getter for handle attribute
     * 
     * @return the handle attribute
     */
    public String getHandle() {
        return handle;
    }

    /**
     * Simple setter for handle attribute
     * 
     * @param handle the value to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
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
     * Simple getter for lastCompetition attribute
     * 
     * @return the lastCompetition attribute
     */
    public Timestamp getLastCompetition() {
        return lastCompetition;
    }

    /**
     * Simple setter for lastCompetition attribute
     * 
     * @param lastCompetition the value to set
     */
    public void setLastCompetition(Timestamp lastCompetition) {
        this.lastCompetition = lastCompetition;
    }

    /**
     * Simple getter for numCompetitions attribute
     * 
     * @return the numCompetitions attribute
     */
    public Integer getNumCompetitions() {
        return numCompetitions;
    }

    /**
     * Simple setter for numCompetitions attribute
     * 
     * @param numCompetitions the value to set
     */
    public void setNumCompetitions(Integer numCompetitions) {
        this.numCompetitions = numCompetitions;
    }
}
