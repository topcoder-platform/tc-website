/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.util.Date;


public class SubmissionScores {

    private String handle;

    private int userID;

    private int submissionID;

    private Date dateInquired;

    private Date dateSubmitted;

    private int placement;

    private boolean passedScreening;

    private boolean passedReview;

    private double screeningScore;

    private double[] reviewScore;   // array with the 3 scores obtained in the reviews

    private double initialScore;

    private double finalScore;

    //Appeal []appeals;


    public SubmissionScores(String handle, int userID, int submissionID,
                            Date dateInquired, Date dateSubmitted,
                            int placement,
                            boolean passedScreening, boolean passedReview,
                            double screeningScore, double[] reviewScore,
                            double initialScore, double finalScore) {

        this.handle = handle;
        this.userID = userID;
        this.dateInquired = dateInquired;
        this.dateSubmitted = dateSubmitted;
        this.submissionID = submissionID;
        this.placement = placement;
        this.passedScreening = passedScreening;
        this.passedReview = passedReview;
        this.screeningScore = screeningScore;
        this.reviewScore = reviewScore;
        this.initialScore = initialScore;
        this.finalScore = finalScore;
    }

    public String getHandle() {
        return handle;
    }

    public int getUserID() {
        return userID;
    }

    public Date getDateInquired() {
        return dateInquired;
    }

    public Date getDateSubmitted() {
        return dateSubmitted;
    }

    public int getSubmissionID() {
        return userID;
    }

    public int getPlacement() {
        return placement;
    }

    public boolean getPassedScreening() {
        return passedScreening;
    }

    public boolean getPassedReview() {
        return passedReview;
    }

    public double getScreeningScore() {
        return screeningScore;
    }

    public double getReviewScore(int n) {
         return reviewScore[n];
    }

    public double getInitialScore() {
         return finalScore;
    }

    public double getFinalScore() {
         return finalScore;
    }


}