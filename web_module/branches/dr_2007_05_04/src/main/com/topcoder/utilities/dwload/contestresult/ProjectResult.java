package com.topcoder.utilities.dwload.contestresult;

/**
 * Class to store a project result.
 * 
 * @author Cucu
 *
 */
public class ProjectResult {
    private long projectId;
    private int statusId;
    private long userId;
    private int placed;
    private int pointAdjustment;
    private double amount;
    private int numSubmissions;
    private boolean passedReview;
    
    
    public ProjectResult(long projectId, int statusId, long userId, int placed, int pointAdjustment, double amount, int numSubmissions, boolean passedReview) {
        super();
        this.projectId = projectId;
        this.statusId = statusId;
        this.userId = userId;
        this.placed = placed;
        this.pointAdjustment = pointAdjustment;
        this.amount = amount;
        this.numSubmissions = numSubmissions;
        this.passedReview = passedReview;
        
    }
    
    public double getAmount() {
        return amount;
    }
    public int getNumSubmissions() {
        return numSubmissions;
    }
    public int getPlaced() {
        return placed;
    }
    public int getPointAdjustment() {
        return pointAdjustment;
    }
    public long getProjectId() {
        return projectId;
    }
    public int getStatusId() {
        return statusId;
    }
    public long getUserId() {
        return userId;
    }

    public boolean isPassedReview() {
        return passedReview;
    }
    
    
    
}
