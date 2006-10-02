/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.FinalReview;

/**
 * Wrapping class for the final review data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class FinalReviewData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The final review.
     */
    private FinalReview finalReview = null;

    /**
     * Flag to indicate full retrieval.
     */
    private boolean retrieveFull = true;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>FinalReviewData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param finalReview The final review to be set.
     */
    protected FinalReviewData(OnlineReviewProjectData orpd,
                              FinalReview finalReview) {
        super(orpd);
        this.finalReview = finalReview;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped final review.
     * </p>
     *
     * @return the wrapped final review.
     */
    public FinalReview getFinalReview() {
        return finalReview;
    } // end getFinalReview

    /**
     * @return Returns the retrieveFull.
     */
    public boolean getRetrieveFull() {
        return retrieveFull;
    }

    /**
     * @param retrieveFull The retrieveFull to set.
     */
    public void setRetrieveFull(boolean retrieveFull) {
        this.retrieveFull = retrieveFull;
    }

} // end FinalReviewData



