package com.topcoder.web.tc.model;

/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class ReviewBoardApplication {

    private long userId = 0;
    private String handle = "";
    private boolean primary = false;

    private long projectId = 0;
    private String reviewerType = "";
    private int reviewerTypeId = 0;

    private int phaseId = 0;
    private int levelId = 0;
    private int submissionCount = 0;
    private int submissionsPassedScreening = 0;
    private SoftwareComponent component = null;

    private ReviewBoardApplication() {
    }

    public ReviewBoardApplication(int phaseId, int level, int submissionCount, int submissionsPassedScreening) {
        this.phaseId = phaseId;
        this.levelId = level;
        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;
        this.component = new SoftwareComponent(level, submissionCount, submissionsPassedScreening, phaseId);
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public boolean isPrimary() {
        return primary;
    }

    public void setPrimary(boolean primary) {
        this.primary = primary;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public String getReviewerType() {
        return reviewerType;
    }

    public void setReviewerType(String reviewerType) {
        this.reviewerType = reviewerType;
    }

    public int getPhaseId() {
        return phaseId;
    }

    public int getLevelId() {
        return levelId;
    }

    public int getSubmissionCount() {
        return submissionCount;
    }

    public int getSubmissionsPassedScreening() {
        return submissionsPassedScreening;
    }

    public int getReviewerTypeId() {
        return reviewerTypeId;
    }

    public void setReviewerTypeId(int reviewerTypeId) {
        this.reviewerTypeId = reviewerTypeId;
    }


    public boolean isSpotFilled() {
        return userId!=0;
    }

    public float getReviewPrice() {
        if (primary) {
            return component.getPrimaryReviewCost();
        } else {
            return component.getReviewCost();
        }
    }

    public float getPrice() {
        return component.getCost();
    }

}
