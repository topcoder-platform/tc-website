/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.FinalReview;

/**
 * Retrieval class used by the Model classes to return a final review.
 *
 * @author adic
 * @version 1.0
 */
public class FinalReviewRetrieval extends SuccessResult {

    /**
     * The final review.
     */
    private FinalReview finalReview = null;

    /**
     * Constructor.
     *
     * @param finalReview the final review
     */
    FinalReviewRetrieval(FinalReview finalReview) {
        this.finalReview = finalReview;
    }

    /**
     * Get the contained final review.
     *
     * @return the contained final review
     */
    public FinalReview getFinalReview() {
        return finalReview;
    }

}

