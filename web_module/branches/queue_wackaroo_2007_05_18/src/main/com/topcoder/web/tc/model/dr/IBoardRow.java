/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

/**
 * <strong>Purpose</strong>:
 * Interface for the board's row beans.
 *
 * @author pulky
 * @version 1.0.1
 */
public interface IBoardRow {

    /**
     * @return Returns the phase.
     */
    public abstract long getPhase();

    /**
     * @param phase The phase to set.
     */
    public abstract void setPhase(long phase);

    /**
     * @return Returns the period.
     */
    public abstract long getPeriod();

    /**
     * @param period The period to set.
     */
    public abstract void setPeriod(long period);

    /**
     * @return Returns the userName.
     */
    public abstract String getUserName();

    /**
     * @param userName The userName to set.
     */
    public abstract void setUserName(String userName);

    /**
     * @return Returns the placementPrize.
     */
    public abstract double getPlacementPrize();

    /**
     * @param placementPrize The placementPrize to set.
     */
    public abstract void setPlacementPrize(double placementPrize);

    /**
     * @return Returns the points.
     */
    public abstract long getPoints();

    /**
     * @param points The points to set.
     */
    public abstract void setPoints(long points);

    /**
     * @return Returns the rank.
     */
    public abstract long getRank();

    /**
     * @param rank The rank to set.
     */
    public abstract void setRank(long rank);

    /**
     * @return Returns the userId.
     */
    public abstract long getUserId();

    /**
     * @param userId The userId to set.
     */
    public abstract void setUserId(long userId);

    /**
     * @return true if the coder will win a trip.
     */
    public abstract boolean isWinTrip();

    /**
     * @return Returns the outstandingPoints.
     */
    public long getOutstandingPoints();

    /**
     * @param outstandingPoints The outstandingPoints to set.
     */
    public void setOutstandingPoints(long outstandingPoints);

    /**
     * @return Returns the total points.
     */
    public long getTotalPoints();
}