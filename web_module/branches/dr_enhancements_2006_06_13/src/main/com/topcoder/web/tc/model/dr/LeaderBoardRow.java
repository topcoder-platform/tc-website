package com.topcoder.web.tc.model.dr;

import com.topcoder.web.common.model.Base;

public class LeaderBoardRow extends Base {

    private long rank;
    private long userId;
    private String userName;
    private long points;
    private boolean topThird;
    private boolean winTrip;
    private double pointsPrize;
    private double placementPrize;
    private double totalPrize;

    /**
     * Default constructor
     */
    public LeaderBoardRow() {
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
    public LeaderBoardRow(long rank, long userId, String userName, long points,
        boolean topThird, boolean winTrip, double pointsPrize,
        double placementPrize, double totalPrize) {
        super();
        this.rank = rank;
        this.userId = userId;
        this.points = points;
        this.topThird = topThird;
        this.winTrip = winTrip;
        this.pointsPrize = pointsPrize;
        this.placementPrize = placementPrize;
        this.totalPrize = totalPrize;
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
     * @return Returns the pointsPrize.
     */
    public double getPointsPrize() {
        return pointsPrize;
    }

    /**
     * @param pointsPrize The pointsPrize to set.
     */
    public void setPointsPrize(double pointsPrize) {
        this.pointsPrize = pointsPrize;
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
     * @return Returns the topThird.
     */
    public boolean isTopThird() {
        return topThird;
    }

    /**
     * @param topThird The topThird to set.
     */
    public void setTopThird(boolean topThird) {
        this.topThird = topThird;
    }

    /**
     * @return Returns the totalPrize.
     */
    public double getTotalPrize() {
        return totalPrize;
    }

    /**
     * @param totalPrize The totalPrize to set.
     */
    public void setTotalPrize(double totalPrize) {
        this.totalPrize = totalPrize;
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
