/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScreeningScorecard;

/**
 * Retrieval class used by the Model classes to return an array of screening scorecards.
 *
 * @author adic
 * @version 1.0
 */
public class ScreeningScorecardsRetrieval extends SuccessResult {

    /**
     * The array of screening scorecards.
     */
    private ScreeningScorecard[] scorecards = null;

    /**
     * Constructor.
     *
     * @param scorecards the array of screening scorecards
     */
    ScreeningScorecardsRetrieval(ScreeningScorecard[] scorecards) {
        this.scorecards = scorecards;
    }

    /**
     * Get the contained array of screening scorecards.
     *
     * @return the contained array of screening scorecards
     */
    public ScreeningScorecard[] getScorecards() {
        return scorecards;
    }

}

