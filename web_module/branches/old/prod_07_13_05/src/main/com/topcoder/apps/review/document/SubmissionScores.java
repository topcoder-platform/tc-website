/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

public class SubmissionScores {

    private String handle;

    private int userID;

    private String handleURL;       // URL that points to the handle profile

    private String submissionURL;   // link for downloading the submission

    private double screeningScore;

    private String screeningURL;    // URL that points to the details of the screening

    private double []reviewScore;   // array with the 3 scores obtained in the reviews

    private String []reviewURL;     // URL pointing to the details of the 3 reviews

    private String appealsURL;   // FIX va??

    //Appeal []appeals;


    public SubmissionScores() {
        handle="arylio";
        userID = 7489235;

        submissionURL="x";
        screeningScore=92.7;
        screeningURL = "y";
        reviewScore = new double [3];
        reviewScore[0]= 90;
        reviewScore[1]= 93;
        reviewScore[2]= 96;


    }

    public String getHandle() {
        return handle;
    }

    public int  getUserID() {
        return userID;
    }

    public String getSubmissionURL() {
        return submissionURL;
    }

    public double getScreeningScore() {
        return screeningScore;
    }

    public String getScreeningURL() {
        return screeningURL;
    }

    public double getReviewScore(int n) {
         return reviewScore[n];
    }

    public String getReviewURL(int n) {
         return reviewURL[n];
    }

}