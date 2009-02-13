/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

/**
 * <strong>Purpose</strong>:
 * A simple bean for the rookie board.
 *
 * @author pulky
 * @version 1.0
 */
public class RookieBoardRow extends BaseBoardRow implements IBoardRow {

    /**
     * Property indicating if a rookie is potential (not confirmed)
     */
    private boolean potential;

    /**
     * Default constructor
     */
    public RookieBoardRow() {
        super();
    }

    /**
     * Constructor setting properties.
     *
     * @param period         The period to set.
     * @param phase          The phase to set.
     * @param rank           The rank to set.
     * @param userId         The userId to set.
     * @param userName       The userName to set.
     * @param points         The points to set.
     * @param winTrip        The winTrip to set.
     * @param placementPrize The placementPrize to set.
     */
    public RookieBoardRow(long period, long phase, long rank, long userId, String userName, long points,
                          boolean winTrip, double placementPrize, boolean potential) {
        super();
        this.period = period;
        this.phase = phase;
        this.rank = rank;
        this.userId = userId;
        this.userName = userName;
        this.points = points;
        this.placementPrize = placementPrize;
        this.potential = potential;
    }

    /**
     * @return Returns the potential.
     */
    public boolean isPotential() {
        return potential;
    }

    /**
     * @param potential The potential to set.
     */
    public void setPotential(boolean potential) {
        this.potential = potential;
    }

    /**
     * @return true if the coder will win a trip.
     */
    public boolean isWinTrip() {
        return (this.rank == 1);
    }
}
