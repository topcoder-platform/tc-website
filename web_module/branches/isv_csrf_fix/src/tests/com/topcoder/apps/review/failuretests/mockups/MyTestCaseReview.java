/*
 * MyTestCaseReview.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.TestCaseApproval;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;

/**
 * <p>An implementation of TestCaseReview used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyTestCaseReview extends TestCaseReview {
    private User reviewer;
    private User reviewee;
    private Project project;

    public MyTestCaseReview(Project project, User reviewer, User reviewee) {
        super(0, null, project, "", reviewer, reviewee, false, 0, 0);
        this.project = project;
        this.reviewer = reviewer;
        this.reviewee = reviewee;
    }

    public TestCaseApproval getTestCaseApproval() {
        return (null);
    }

    public void setTestCaseApproval(TestCaseApproval tcReviewStatus) {
    }

    public String getReviewText() {
        return ("");
    }

    public void setReviewText(String text) {
    }

    public Project getProject() {
        return (project);
    }

    public User getReviewer() {
        return (reviewer);
    }

    public User getReviewee() {
        return (reviewee);
    }
}
