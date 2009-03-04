/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScreeningScorecard;

/**
 * Retrieval class used by the Model classes to return a screening scorecard.
 *
 * @author adic
 * @version 1.0
 */
public class ScreeningScorecardRetrieval extends SuccessResult {

    /**
     * The screening scorecard.
     */
    private ScreeningScorecard scorecard = null;

    /**
     * Constructor.
     *
     * @param scorecard the screening scorecard
     */
    ScreeningScorecardRetrieval(ScreeningScorecard scorecard) {
        this.scorecard = scorecard;
    }

    /**
     * Get the contained screening scorecard.
     *
     * @return the contained screening scorecard
     */
    public ScreeningScorecard getScoreCard() {
        return scorecard;
    }

}

