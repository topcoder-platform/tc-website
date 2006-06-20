package com.topcoder.web.tc.model.dr;

public class RookieBoardRow extends BaseBoardRow implements IBoardRow {

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
     * @return Returns the winTrip.
     */
    public boolean isWinTrip() {
        return (this.rank == 1);
    }
}
