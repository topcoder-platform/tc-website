/*
 * ReviewScorecard.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * This implementation of a review scorecard is instantiable (as a concrete
 * class) and is provided to allow for current implementation differences
 * between the different scorecard types (including persistence layer
 * implementation) and to allow for future differentiation between review
 * and other scorecards.
 *
 * @author FatClimber
 * @version 1.0
 */
public class ReviewScorecard extends AbstractScorecard implements Serializable {
    /** SCORECARD_TYPE */
    public static final int SCORECARD_TYPE = 2;

    /**
     * DOCUMENT ME!
     *
     * @param id DOCUMENT ME!
     * @param isCompleted
     * @param isPMReviewed
     * @param scorecardQuestion
     * @param author
     * @param version
     * @param project
     * @param submission
     * @param score
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public ReviewScorecard(long id, boolean isCompleted, boolean isPMReviewed,
                           ScorecardQuestion[] scorecardQuestion, User author, Project project,
                           InitialSubmission submission, double score, long requestorId, long versionId, double raw_score, Timestamp pm_review_timestamp) {
        super(id, isCompleted, isPMReviewed, scorecardQuestion, author, project, submission, score,
                requestorId, versionId, raw_score, pm_review_timestamp);
    }
}
