/*
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

public class ComponentScores {

    /// 1 for design, 2 for dev
    private int type;

    /// The id for this project
    private int projectId;

    /// name of this component
    private String componentName;

    /// array for the id's of the 3 reviewers
    private int[] reviewerID;

    /// array for the names of the 3 reviewers
    private String[] reviewerNames;

    /// links for the 3 test cases or null if they’re not present
    private String[] testCasesURL;


    /// the submissions for this component
    private SubmissionScores[] submissions;



    public ComponentScores(int type, int projectId, String componentName, int[] reviewerID, String[] reviewerNames,
                            String[] testCasesURL, SubmissionScores[] submissions) {
        this.type = type;
        this.projectId = projectId;
        this.componentName = componentName;
        this.reviewerID = reviewerID;
        this.reviewerNames = reviewerNames;
        this.testCasesURL = testCasesURL;
        this.submissions = submissions;


    }

    public int getType() {
        return type;
    }

    public int getProjectId() {
        return projectId;
    }

    public String getComponentName() {
        return componentName;
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
}