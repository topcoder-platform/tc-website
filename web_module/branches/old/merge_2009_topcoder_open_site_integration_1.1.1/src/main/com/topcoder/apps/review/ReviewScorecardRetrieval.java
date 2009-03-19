/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ReviewScorecard;

/**
 * Retrieval class used by the Model classes to return a review scorecard.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewScorecardRetrieval extends SuccessResult {

    /**
     * The review scorecard.
     */
    private ReviewScorecard scorecard = null;

    /**
     * Constructor.
     *
     * @param scorecard the review scorecard
     */
    ReviewScorecardRetrieval(ReviewScorecard scorecard) {
        this.scorecard = scorecard;
    }

    /**
     * Get the contained review scorecard.
     *
     * @return the contained review scorecard
     */
    public ReviewScorecard getScoreCard() {
        return scorecard;
    }

}

