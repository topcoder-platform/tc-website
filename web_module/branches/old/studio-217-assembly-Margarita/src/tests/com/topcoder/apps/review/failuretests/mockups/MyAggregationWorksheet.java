/*
 * MyAggregationWorksheet.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.document.FixItem;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationWorksheet;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;

/**
 * <p>An implementation of AggregationWorksheet used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyAggregationWorksheet extends AggregationWorksheet {
    private Project project;
    private User aggregator;

    public MyAggregationWorksheet(User aggregator, Project project) {
        super(0, false, false, aggregator, null, project, 0, 0);
        this.aggregator = aggregator;
        this.project = project;
    }

    public boolean isCompleted() {
        return (false);
    }

    public void setCompleted(boolean completed) {
    }

    public boolean isPMReviewed() {
        return (false);
    }

    public void setPMReviewed(boolean pmReviewed) {
    }

    public AggregationResponse[] getAggregationResponses() {
        return (new AggregationResponse[0]);
    }

    public Project getProject() {
        return (project);
    }

    public User getAggregator() {
        return (aggregator);
    }
}
