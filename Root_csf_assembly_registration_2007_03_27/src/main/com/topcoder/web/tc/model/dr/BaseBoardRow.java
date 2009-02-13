/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

/**
 * <strong>Purpose</strong>:
 * Base implementation for the board rows.
 *
 * @author pulky
 * @version 1.0.1
 */
public abstract class BaseBoardRow implements IBoardRow {

    /**
     * Property containing the phase
     */
    protected long phase;

    /**
     * Property containing the period
     */
    protected long period;

    /**
     * Property containing the rank
     */
    protected long rank;

    /**
     * Property containing the userId
     */
    protected long userId;

    /**
     * DProperty containing the userName
     */
    protected String userName;

    /**
     * Property containing the points
     */
    protected long points;

    /**
     * Property containing the placementPrize
     */
    protected double placementPrize;

    /**
     * Property to store the outstanding points
     */
    protected long outstandingPoints;

    /**
     * Default constructor
     */
    public BaseBoardRow() {
        super();
    }

    /**
     * @return Returns the period.
     */
    public long getPeriod() {
        return period;
    }

    /**
     * @param period The period to set.
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
     * @return Returns the outstandingPoints.
     */
    public long getOutstandingPoints() {
        return outstandingPoints;
    }

    /**
     * @param outstandingPoints The outstandingPoints to set.
     */
    public void setOutstandingPoints(long outstandingPoints) {
        this.outstandingPoints = outstandingPoints;
    }

    /**
     * @return Returns the total points.
     */
    public long getTotalPoints() {
        return this.points + this.outstandingPoints;
    }
}
