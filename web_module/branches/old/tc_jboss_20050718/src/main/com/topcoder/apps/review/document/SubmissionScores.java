/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

public class SubmissionScores {

    private String handle;

    private int userID;

    private int submissionID;

    private int placement;

    private double screeningScore;

    private double[] reviewScore;   // array with the 3 scores obtained in the reviews

    private double finalScore;

    //Appeal []appeals;


    public SubmissionScores(String handle, int userID, int submissionID, int placement,
                            double screeningScore, double[] reviewScore, double finalScore) {

        this.handle = handle;
        this.userID = userID;
        this.submissionID = submissionID;
        this.placement = placement;
        this.screeningScore = screeningScore;
        this.reviewScore = reviewScore;
        this.finalScore = finalScore;


    }

    public String getHandle() {
        return handle;
    }

    public int getUserID() {
        return userID;
    }

    public int getSubmissionID() {
        return userID;
    }

    public int getPlacement() {
        return placement;
    }

    public double getScreeningScore() {
        return screeningScore;
    }

    public double getReviewScore(int n) {
         return reviewScore[n];
    }

    public double getFinalScore() {
         return finalScore;
    }


}