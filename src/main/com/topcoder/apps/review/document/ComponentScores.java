/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

public class ComponentScores {

    /// 1 for design, 2 for dev
    private int type;

    /// The id for this project
    private long projectId;

    /// The id for the other type (design <=> dev) of project
    private long otherTypeProjectId;

    /// name of this component
    private String componentName;

    /// number of inquiries
    private int inquiries;

    /// array for the id's of the 3 reviewers
    private int[] reviewerID;

    /// array for the names of the 3 reviewers
    private String[] reviewerNames;

    /// links for the 3 test cases or null if they’re not present
    private String[] testCasesURL;


    /// the submissions for this component
    private SubmissionScores[] submissions;



    public ComponentScores(int type, long projectId, long otherTypeProjectId,
                           String componentName, int inquiries,
                           int[] reviewerID, String[] reviewerNames, String[] testCasesURL,
                           SubmissionScores[] submissions) {
        this.type = type;
        this.projectId = projectId;
        this.otherTypeProjectId = otherTypeProjectId;
        this.componentName = componentName;
        this.inquiries = inquiries;
        this.reviewerID = reviewerID;
        this.reviewerNames = reviewerNames;
        this.testCasesURL = testCasesURL;
        this.submissions = submissions;


    }

    public int getType() {
        return type;
    }

    public long getProjectId() {
        return projectId;
    }

    public long getOtherTypeProjectId() {
        return projectId;
    }

    public String getComponentName() {
        return componentName;
    }

    public int getInquiries() {
        return inquiries;
    }

    public int getReviewerID(int n) {
        return reviewerID[n];
    }

    public String getReviewerNames(int n) {
        return reviewerNames[n];
    }

    public String getTestCasesURL(int n) {
        return testCasesURL[n];
    }

    public SubmissionScores[] getSubmissions() {
        return submissions;
    }

    public int getSubmissionsNumber() {
        return submissions.length;
    }

    public double getSumbissionsPercent() {
        return inquiries == 0? 0 : (double) getSubmissionsNumber() / getInquiries() * 100.0;
    }

    public int getPassedNumber() {
        int n = 0;
        for(int i = 0; i < submissions.length; i++)
            if (submissions[i].getPassedReview())  n++;

        return n;
    }

    public double getPassedPercent() {
        return getSubmissionsNumber() == 0? 0 : (double) getPassedNumber() / getSubmissionsNumber();
    }

    public double getAvgInitialScore() {
        double total = 0;
        for(int i = 0; i < submissions.length; i++)
            total += submissions[i].getInitialScore();

        return submissions.length == 0? 0 : total / submissions.length;

    }

    public double getAvgFinalScore() {
        double total = 0;
        for(int i = 0; i < submissions.length; i++)
            total += submissions[i].getFinalScore();

        return submissions.length == 0? 0 : total / submissions.length;

    }

}