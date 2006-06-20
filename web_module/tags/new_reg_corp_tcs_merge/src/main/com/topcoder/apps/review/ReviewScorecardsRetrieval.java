/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ReviewScorecard;

/**
 * Retrieval class used by the Model classes to return an array of review scorecards.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewScorecardsRetrieval extends SuccessResult {

    /**
     * The array of review scorecards.
     */
    private ReviewScorecard[] scorecards = null;

    /**
     * Constructor.
     *
     * @param scorecards the array of review scorecards
     */
    ReviewScorecardsRetrieval(ReviewScorecard[] scorecards) {
        this.scorecards = scorecards;
    }

    /**
     * Get the contained array of review scorecards.
     *
     * @return the contained array of review scorecards
     */
    public ReviewScorecard[] getScorecards() {
        return scorecards;
    }

}

