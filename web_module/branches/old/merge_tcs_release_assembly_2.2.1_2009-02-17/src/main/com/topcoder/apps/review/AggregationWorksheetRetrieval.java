/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationWorksheet;

/**
 * Retrieval class used by the Model classes to return an aggregation worksheet.
 *
 * @author adic
 * @version 1.0
 */
public class AggregationWorksheetRetrieval extends SuccessResult {

    /**
     * The aggregation worksheet.
     */
    private AggregationWorksheet worksheet = null;

    /**
     * Constructor.
     *
     * @param worksheet the aggregation worksheet
     */
    AggregationWorksheetRetrieval(AggregationWorksheet worksheet) {
        this.worksheet = worksheet;
    }

    /**
     * Get the contained aggregation worksheet.
     *
     * @return the contained aggregation worksheet
     */
    public AggregationWorksheet getWorksheet() {
        return worksheet;
    }

}

