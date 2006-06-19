package com.topcoder.web.tc.model.dr;

import com.topcoder.web.common.model.Base;

public class RookieBoardRow extends Base {

    private long season;
    private long phase;
    private long rank;
    private long userId;
    private String userName;
    private long points;
    private boolean winTrip;
    private double placementPrize;

    /**
     * Default constructor
     */
    public RookieBoardRow() {
        super();
    }

    /**
     * Constructor setting properties.
     *
     * @param rank The rank to set.
     * @param userId The userId to set.
     * @param userName The userName to set.
     * @param points The points to set.
     * @param topThird The topThird to set.
     * @param winTrip The winTrip to set.
     * @param pointsPrize The pointsPrize to set.
     * @param placementPrize The placementPrize to set.
     * @param totalPrize The totalPrize to set.
     */
    public RookieBoardRow(long season, long phase, long rank, long userId, String userName, long points,
        boolean winTrip, double placementPrize) {
        super();
        this.season = season;
        this.phase = phase;
        this.rank = rank;
        this.userId = userId;
        this.userName = userName;
        this.points = points;
        this.winTrip = winTrip;
        this.placementPrize = placementPrize;
    }

    /**
     * @return Returns the phase.
     */
    public long getPhase() {
        return phase;
    }

    /**
     * @param phase The phase to set.
     */
    public void setPhase(long phase) {
        this.phase = phase;
    }

    /**
     * @return Returns the season.
     */
    public long getSeason() {
        return season;
    }

    /**
     * @param season The season to set.
     */
    public void setSeason(long season) {
        this.season = season;
    }

    /**
     * @return Returns the userName.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName The userName to set.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return Returns the placementPrize.
     */
    public double getPlacementPrize() {
        return placementPrize;
    }

    /**
     * @param placementPrize The placementPrize to set.
     */
    public void setPlacementPrize(double placementPrize) {
        this.placementPrize = placementPrize;
    }

    /**
     * @return Returns the points.
     */
    public long getPoints() {
        return points;
    }

    /**
     * @param points The points to set.
     */
    public void setPoints(long points) {
        this.points = points;
    }

    /**
     * @return Returns the rank.
     */
    public long getRank() {
        return rank;
    }

    /**
     * @param rank The rank to set.
     */
    public void setRank(long rank) {
        this.rank = rank;
    }

    /**
     * @return Returns the userId.
     */
    public long getUserId() {
        return userId;
    }

    /**
     * @param userId The userId to set.
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * @return Returns the winTrip.
     */
    public boolean isWinTrip() {
        return winTrip;
    }

    /**
     * @param winTrip The winTrip to set.
     */
    public void setWinTrip(boolean winTrip) {
        this.winTrip = winTrip;
    }
}
