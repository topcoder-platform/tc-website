package com.topcoder.web.tc.model.dr;

public abstract class BaseBoardRow implements IBoardRow {

    protected long phase;
    protected long period;
    protected long rank;
    protected long userId;
    protected String userName;
    protected long points;
    protected double placementPrize;

    /**
     * Default constructor
     */
    public BaseBoardRow() {
        super();
    }

    /**
     * @return Returns the phase.
     */
    public long getPeriod() {
        return period;
    }

    /**
     * @param phase The phase to set.
     */
    public void setPeriod(long period) {
        this.period = period;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getPlacementPrize() {
        return placementPrize;
    }

    public void setPlacementPrize(double placementPrize) {
        this.placementPrize = placementPrize;
    }

    public long getPoints() {
        return points;
    }

    public void setPoints(long points) {
        this.points = points;
    }

    public long getRank() {
        return rank;
    }

    public void setRank(long rank) {
        this.rank = rank;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }
}
