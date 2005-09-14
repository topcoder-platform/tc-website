/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationWorksheet;

/**
 * Wrapping class for the aggregation result data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AggregationData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The aggregation worksheet.
     */
    private AggregationWorksheet aggregationWorksheet = null;

    private long publicAggId = -1;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>AggregationData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param worksheet The aggregation worksheet to be set.
     */
    protected AggregationData(OnlineReviewProjectData orpd,
                              AggregationWorksheet worksheet) {
        super(orpd);
        this.aggregationWorksheet = worksheet;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped aggregation worksheet.
     * </p>
     *
     * @return the wrapped aggregation worksheet.
     */
    public AggregationWorksheet getAggregationWorksheet() {
        return aggregationWorksheet;
    } // end getAggregationWorksheet


    /**
     * @return Returns the publicAggId.
     */
    public long getPublicAggId() {
        return publicAggId;
    }

    /**
     * @param publicAggId The publicAggId to set.
     */
    public void setPublicAggId(long publicAggId) {
        this.publicAggId = publicAggId;
    }

} // end AggregationData



