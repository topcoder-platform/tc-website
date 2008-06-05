/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationReview;

/**
 * Retrieval class used by the Model classes to return aggregation reviews.
 *
 * @author adic
 * @version 1.0
 */
public class AggregationReviewRetrieval extends SuccessResult {

    /**
     * The aggregation reviews.
     */
    private AggregationReview[] aggregationReviews = null;

    /**
     * Constructor.
     *
     * @param aggregationReviews the aggregation reviews
     */
    public AggregationReviewRetrieval(AggregationReview[] aggregationReviews) {
        this.aggregationReviews = aggregationReviews;
    }

    /**
     * Return the aggregation reviews.
     *
     * @return the aggregation reviews.
     */
    public AggregationReview[] getAggregationReviews() {
        return aggregationReviews;
    }

}

