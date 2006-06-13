package com.topcoder.web.tc.model.dr;

import com.topcoder.web.common.model.Base;

public class LeaderBoardRow extends Base {

    private long rank;
    private long userId;
    private long points;
    private boolean topThird;
    private boolean winTrip;
    private double pointsPrize;
    private double placementPrize;
    private double totalPrize;

    public LeaderBoardRow() {
        super();
    }

    public LeaderBoardRow(long rank, long userId, long points, boolean topThird, boolean winTrip, double pointsPrize, double placementPrize, double totalPrize) {
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

    public double getPointsPrize() {
        return pointsPrize;
    }

    public void setPointsPrize(double pointsPrize) {
        this.pointsPrize = pointsPrize;
    }

    public long getRank() {
        return rank;
    }

    public void setRank(long rank) {
        this.rank = rank;
    }

    public boolean isTopThird() {
        return topThird;
    }

    public void setTopThird(boolean topThird) {
        this.topThird = topThird;
    }

    public double getTotalPrize() {
        return totalPrize;
    }

    public void setTotalPrize(double totalPrize) {
        this.totalPrize = totalPrize;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public boolean isWinTrip() {
        return winTrip;
    }

    public void setWinTrip(boolean winTrip) {
        this.winTrip = winTrip;
    }
}
