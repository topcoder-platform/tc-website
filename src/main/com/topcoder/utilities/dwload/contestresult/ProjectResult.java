package com.topcoder.utilities.dwload.contestresult;

import java.util.Comparator;

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
    private double finalScore;
    
    public ProjectResult(long projectId, int statusId, long userId, double finalScore, int placed, int pointAdjustment, double amount, int numSubmissions, boolean passedReview) {
        super();
        this.projectId = projectId;
        this.statusId = statusId;
        this.userId = userId;
        this.finalScore = finalScore;
        this.placed = placed;
        this.pointAdjustment = pointAdjustment;
        this.amount = amount;
        this.numSubmissions = numSubmissions;
        this.passedReview = passedReview;
        
    }
    
    public ProjectResult(double finalScore, int placed) {
        super();
        this.finalScore = finalScore;
        this.placed = placed;
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
    
    public double getFinalScore() {
        return finalScore;
    }
    
    public static class PlaceComparator implements Comparator<ProjectResult> {

        public int compare(ProjectResult o1, ProjectResult o2) {
           if (o1.getPlaced() < o2.getPlaced()) return -1;
           if (o1.getPlaced() > o2.getPlaced()) return 1;
           return 0;
        }
        
    }

    public static class ScoreComparator implements Comparator<ProjectResult> {

        public int compare(ProjectResult o1, ProjectResult o2) {
           if (o1.getFinalScore() < o2.getFinalScore()) return 1;
           if (o1.getFinalScore() > o2.getFinalScore()) return -1;
           return 0;
        }
        
    }

    
}
