/*
* StudioLeaderBoardRow
*
* Created Aug 2, 2007
*/
package com.topcoder.web.tc.controller.request.tournament;

import java.sql.Timestamp;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ModDashLeaderBoardRow {
    private String handle;
    private Integer points;
    private Integer numCompetitions;
    private Timestamp lastCompetition;
    
    /**
     * @param rank
     * @param handle
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
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }
    /**
     * @param handle the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * @param points the points to set
     */
    public void setPoints(Integer points) {
        this.points = points;
    }

    /**
     * @return the points
     */
    public Integer getPoints() {
        return points;
    }

    /**
     * @param lastCompetition the lastCompetition to set
     */
    public void setLastCompetition(Timestamp lastCompetition) {
        this.lastCompetition = lastCompetition;
    }

    /**
     * @return the lastCompetition
     */
    public Timestamp getLastCompetition() {
        return lastCompetition;
    }

    /**
     * @param numCompetitions the numCompetitions to set
     */
    public void setNumCompetitions(Integer numCompetitions) {
        this.numCompetitions = numCompetitions;
    }

    /**
     * @return the numCompetitions
     */
    public Integer getNumCompetitions() {
        return numCompetitions;
    }
}
