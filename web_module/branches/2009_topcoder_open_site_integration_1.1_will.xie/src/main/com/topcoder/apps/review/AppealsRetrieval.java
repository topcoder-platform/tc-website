/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;

/**
 * Retrieval class used by the Model classes to return an array of appeals.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AppealsRetrieval extends SuccessResult {

    /**
     * The array of appeals.
     */
    private Appeal[] appeals = null;

    /**
     * Constructor.
     *
     * @param appeals the array of appeals
     */
    AppealsRetrieval(Appeal[] appeals) {
        this.appeals = appeals;
    }

    /**
     * Get the contained array of appeals.
     *
     * @return the contained array of appeals
     */
    public Appeal[] getAppeals() {
        return appeals;
    }

}

