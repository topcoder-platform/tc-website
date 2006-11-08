/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationReview;

/**
 * Wrapping class for the aggregation review data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AggregationReviewData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The aggregation review.
     */
    private AggregationReview aggregationReview = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>AggregationReviewData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param aggregationReview The aggregation review to be set.
     */
    protected AggregationReviewData(OnlineReviewProjectData orpd,
                                    AggregationReview aggregationReview) {
        super(orpd);
        this.aggregationReview = aggregationReview;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped aggregation worksheet.
     * </p>
     *
     * @return the wrapped aggregation worksheet.
     */
    public AggregationReview getAggregationReview() {
        return aggregationReview;
    } // end getAggregationReview

} // end AggregationReviewData



