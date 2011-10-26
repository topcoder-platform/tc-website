package com.topcoder.web.tc.controller.request.hs;

public class RoundInfo {
    /**
     * ID of the round in DB.
     */
    private int roundId = -1;
    
    /**
     * ID of the season in DB.
     */
    private int seasonId = -1;
    
    /**
     * Name of the round
     */
    private String roundName = null;
    
    /**
     * Name of the season.
     */
    private String seasonName = null;

    /**
     * Id of the forum for the round.
     */
    private int forumId = -1;
    
    /**
     * @return Returns the roundId.
     */
    public int getRoundId() {
        return roundId;
    } 

    /**
     * @param roundId The roundId to set.
     */
    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    /**
     * @return Returns the roundName.
     */
    public String getRoundName() {
        return roundName;
    }

    /**
     * @param roundName The roundName to set.
     */
    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    /**
     * @return Returns the seasonId.
     */
    public int getSeasonId() {
        return seasonId;
    }

    /**
     * @param seasonId The seasonId to set.
     */
    public void setSeasonId(int seasonId) {
        this.seasonId = seasonId;
    }

    /**
     * @return Returns the seasonName.
     */
    public String getSeasonName() {
        return seasonName;
    }

    /**
     * @param seasonName The seasonName to set.
     */
    public void setSeasonName(String seasonName) {
        this.seasonName = seasonName;
    }
    
    /**
     * Returns whether the round id has been assigned.
     * 
     * @return whether the round id has been assigned.
     */
    public boolean hasRoundId() {
        return roundId >= 0;    
    }

    /**
     * Returns whether the season id has been assigned.
     * 
     * @return whether the season id has been assigned.
     */
    public boolean hasSeasonId() {
        return seasonId >= 0;    
    }

    /**
     * @return Returns the forumId.
     */
    public int getForumId() {
        return forumId;
    }

    /**
     * @param forumId The forumId to set.
     */
    public void setForumId(int forumId) {
        this.forumId = forumId;
    }

}
