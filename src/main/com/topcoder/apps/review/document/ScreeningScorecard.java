/*
 * ScreeningScorecard.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;


/**
 * This implementation of a screening scorecard is instantiable (as a concrete
 * class) and is provided to allow for current implementation differences
 * between the different scorecard types (including persistence layer
 * implementation) and to allow for future differentiation between screening
 * and other scorecards.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ScreeningScorecard extends AbstractScorecard implements Serializable {
    /** SCORECARD_TYPE */
    public static final int SCORECARD_TYPE = 1;

    private boolean passed;

    /**
     * DOCUMENT ME!
     *
     * @param id
     * @param isCompleted
     * @param isPMReviewed
     * @param scorecardQuestion
     * @param author
     * @param version
     * @param project
     * @param submission
     * @param score
     * @param requestorId
     * @param versionId
     */
    public ScreeningScorecard(long id, boolean isCompleted, boolean isPMReviewed,
                              ScorecardQuestion[] scorecardQuestion, User author, Project project,
                              InitialSubmission submission, double score, long requestorId, long versionId, double raw_score, java.sql.Timestamp pm_review_timestamp) {
        super(id, isCompleted, isPMReviewed, scorecardQuestion, author, project, submission, score,
                requestorId, versionId, raw_score, pm_review_timestamp);
    }

    /**
     * @return Returns the passed.
     */
    public boolean getPassed() {
        return passed;
    }

    /**
     * @param passed The passed to set.
     */
    public void setPassed(boolean passed) {
        this.passed = passed;
    }

}
