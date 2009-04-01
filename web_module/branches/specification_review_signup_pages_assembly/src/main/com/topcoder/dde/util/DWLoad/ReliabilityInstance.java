package com.topcoder.dde.util.DWLoad;

class ReliabilityInstance {
    private long projectId = 0;
    private long userId = 0;
    private boolean reliable = false;
    private boolean afterStart = false;
    private double oldReliability = 0.0d;
    private double newReliability = 0.0d;
    private double recentOldReliability = 0.0d;
    private double recentNewReliability = 0.0d;
    private boolean first = false;
    private boolean included = false;


    public ReliabilityInstance(long projectId, long userId, boolean reliable, boolean afterStart) {
        this.projectId = projectId;
        this.userId = userId;
        this.reliable = reliable;
        this.afterStart = afterStart;
    }

    public long getProjectId() {
        return projectId;
    }

    public long getUserId() {
        return userId;
    }

    public boolean isReliable() {
        return reliable;
    }

    public boolean isAfterStart() {
        return afterStart;
    }

    public double getOldReliability() {
        return oldReliability;
    }

    public void setOldReliability(double oldReliability) {
        this.oldReliability = oldReliability;
    }

    public double getRecentNewReliability() {
        return recentNewReliability;
    }

    public void setRecentNewReliability(double recentNewReliability) {
        this.recentNewReliability = recentNewReliability;
    }

    public double getNewReliability() {
        return newReliability;
    }

    public void setNewReliability(double newReliability) {
        this.newReliability = newReliability;
    }

    public double getRecentOldReliability() {
        return recentOldReliability;
    }

    public void setRecentOldReliability(double recentOldReliability) {
        this.recentOldReliability = recentOldReliability;
    }

    public boolean isFirst() {
        return first;
    }

    public void setFirst(boolean first) {
        this.first = first;
    }

    public boolean isIncluded() {
        return included;
    }

    public void setIncluded(boolean included) {
        this.included = included;
    }

    public String toString() {
        StringBuffer buf = new StringBuffer(1000);
        buf.append(projectId);
        buf.append(" ");
        buf.append(userId);
        buf.append(" ");
        buf.append(reliable);
        buf.append(" ");
        buf.append(afterStart);
        buf.append(" ");
        buf.append(oldReliability);
        buf.append(" ");
        buf.append(newReliability);
        buf.append(" ");
        buf.append(recentOldReliability);
        buf.append(" ");
        buf.append(recentNewReliability);
        buf.append(" ");
        buf.append(first);
        buf.append(" ");
        buf.append(included);
        return buf.toString();


    }

}
