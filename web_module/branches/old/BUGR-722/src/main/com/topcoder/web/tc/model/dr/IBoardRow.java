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
     * @return Returns the project type.
     */
    long getProjectTypeId();

    /**
     * @param projectTypeId The project type to set.
     */
    void setProjectTypeId(long projectTypeId);

    /**
     * @return Returns the period.
     */
    long getPeriod();

    /**
     * @param period The period to set.
     */
    void setPeriod(long period);

    /**
     * @return Returns the userName.
     */
    String getUserName();

    /**
     * @param userName The userName to set.
     */
    void setUserName(String userName);

    /**
     * @return Returns the placementPrize.
     */
    double getPlacementPrize();

    /**
     * @param placementPrize The placementPrize to set.
     */
    void setPlacementPrize(double placementPrize);

    /**
     * @return Returns the points.
     */
    double getPoints();

    /**
     * @param points The points to set.
     */
    void setPoints(double points);

    /**
     * @return Returns the rank.
     */
    long getRank();

    /**
     * @param rank The rank to set.
     */
    void setRank(long rank);

    /**
     * @return Returns the userId.
     */
    long getUserId();

    /**
     * @param userId The userId to set.
     */
    void setUserId(long userId);

    /**
     * @return true if the coder will win a trip.
     */
    boolean isWinTrip();

    /**
     * @param winTrip true if the coder will win a trip.
     */
    boolean setWinTrip(boolean winTrip);

    /**
     * @return Returns the potential Points.
     */
    double getPotentialPoints();

    /**
     * @param potential Points The potential Points to set.
     */
    void setPotentialPoints(double potentialPoints);

    /**
     * @return Returns the total points.
     */
    double getTotalPoints();
}