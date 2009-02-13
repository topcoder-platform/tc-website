/*
 * MyReviewScorecard.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;

/**
 * <p>An implementation of AbstractScorecard used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyReviewScorecard extends ReviewScorecard {

    private User author;
    private Project project;

    public MyReviewScorecard(User author, Project project) {
        super(0, false, false, null, author, project, null, 0.0, 0, 0);
        this.author = author;
        this.project = project;
    }

    public boolean isCompleted() {
        return (false);
    }

    public void setCompleted(boolean isCompleted) {
    }

    public boolean isPMReviewed() {
        return (false);
    }

    public void setPMReviewed(boolean isPMReviewed) {
    }

    public ScorecardQuestion[] getQuestions() {
        return (new ScorecardQuestion[0]);
    }

    public User getAuthor() {
        return (author);
    }

    public String getVersion() {
        return ("1.0");
    }

    public Project getProject() {
        return (project);
    }

    public InitialSubmission getSubmission() {
        return (null);
    }

    public double getScore() {
        return (0.0);
    }

    public void setScore(double score) {
    }
}
