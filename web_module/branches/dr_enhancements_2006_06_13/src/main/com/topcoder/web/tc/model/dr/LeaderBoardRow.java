package com.topcoder.web.tc.model.dr;

import com.topcoder.web.common.model.Base;

public class LeaderBoardRow extends Base implements IBoardRow {

    private long stage;
    private long phase;
    private long rank;
    private long userId;
    private String userName;
    private long points;
    private boolean topThird;
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
    public LeaderBoardRow(long stage, long phase, long rank, long userId, String userName, long points,
        boolean topThird, boolean winTrip, double pointsPrize,
        double placementPrize, double totalPrize) {
        super();
        this.stage = stage;
        this.phase = phase;
        this.rank = rank;
        this.userId = userId;
        this.userName = userName;
        this.points = points;
        this.topThird = topThird;
        this.pointsPrize = pointsPrize;
        this.placementPrize = placementPrize;
        this.totalPrize = totalPrize;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getPhase()
     */
    public long getPhase() {
        return phase;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setPhase(long)
     */
    public void setPhase(long phase) {
        this.phase = phase;
    }

    /**
     * @return Returns the stage.
     */
    public long getPeriod() {
        return stage;
    }

    /**
     * @param stage The stage to set.
     */
    public void setPeriod(long stage) {
        this.stage = stage;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getUserName()
     */
    public String getUserName() {
        return userName;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setUserName(java.lang.String)
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getPlacementPrize()
     */
    public double getPlacementPrize() {
        return placementPrize;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setPlacementPrize(double)
     */
    public void setPlacementPrize(double placementPrize) {
        this.placementPrize = placementPrize;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getPoints()
     */
    public long getPoints() {
        return points;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setPoints(long)
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

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getRank()
     */
    public long getRank() {
        return rank;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setRank(long)
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

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#getUserId()
     */
    public long getUserId() {
        return userId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#setUserId(long)
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.model.dr.IBoardRow#isWinTrip()
     */
    public boolean isWinTrip() {
        return (this.placementPrize > 0);
    }
}
