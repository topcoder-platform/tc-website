/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

public class ComponentScores {

    /// 1 for design, 2 for dev
    private int type;

    /// array for the names of the 3 reviewers
    private String [] reviewerNames;

    /// links for the 3 test cases or null if they’re not present
    private String [] testCasesURL;

    /// name of this component
    private String componentName;

    /// the submissions for this component
    private SubmissionScores[] submissions;



    public ComponentScores() {
        type = 1;
        reviewerNames = new String[3];
        reviewerNames [0]="cucu";
        reviewerNames [1]="Wishingbone";
        reviewerNames [2]="garyk";

        testCasesURL = new String[3];
        testCasesURL [0]="url0";
        testCasesURL [1]="url1";
        testCasesURL [2]="url2";

        componentName = "test component";
        submissions = new SubmissionScores[2];
        submissions[0]= new SubmissionScores();
        submissions[1]= new SubmissionScores();

    }

    public int getType() {
        return type;
    }

    public String getReviewerName(int n) {
        return reviewerNames[n];
    }

    public String getTestCasesURL(int n) {
        return testCasesURL[n];
    }

    public String getComponentName() {
        return componentName;
    }


    public SubmissionScores[] getSubmissions() {
        return submissions;
    }
}