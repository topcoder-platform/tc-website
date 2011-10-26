/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

/**
 * <strong>Purpose</strong>:
 * A simple bean for the leader board.
 *
 * @author pulky
 * @version 1.0.1
 */
public class LeaderBoardRow extends BaseBoardRow implements IBoardRow {

    /**
     * Property to store the points prize
     */
    private double pointsPrize;

    /**
     * Default constructor
     */
    public LeaderBoardRow() {
        super();
    }

    /**
     * Constructor setting properties.
     *
     * @param period         The period to set.
     * @param projectTypeId          The project type to set.
     * @param rank           The rank to set.
     * @param userId         The userId to set.
     * @param userName       The userName to set.
     * @param points         The points to set.
     * @param topPerformer   The topPerformer to set.
     * @param winTrip        The winTrip to set.
     * @param pointsPrize    The pointsPrize to set.
     * @param placementPrize The placementPrize to set.
     * @param totalPrize     The totalPrize to set.
     * @param outstandingPoints     The outstandingPoints to set.
     * @param winTrip        The winTrip flag to set.
     */
    public LeaderBoardRow(long period, long projectTypeId, long rank, long userId, String userName, double points, double potentialPoints,
                          double pointsPrize, double placementPrize, boolean winTrip) {
        super();
        this.period = period;
        this.projectTypeId = projectTypeId;
        this.rank = rank;
        this.userId = userId;
        this.userName = userName;
        this.points = points;
        this.pointsPrize = pointsPrize;
        this.placementPrize = placementPrize;
        this.potentialPoints = potentialPoints;
        this.winTrip = winTrip;
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
     * @return Returns the topPerformer.
     */
    public boolean isTopPerformer() {
        return pointsPrize > 0;
    }

    /**
     * @return Returns the totalPrize.
     */
    public double getTotalPrize() {        
        return placementPrize + pointsPrize;
    }

}
