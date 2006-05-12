/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ReviewScorecard;

/**
 * Wrapping class for the review scorecard data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ReviewData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The id of submitter.
     */
    private long submitterId = -1;

    /**
     * The id of reviewer.
     */
    private long reviewerId = -1;

    /**
     * The review scorecard.
     */
    private ReviewScorecard reviewScorecard = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ReviewData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param submitterId The id of submitter.
     * @param reviewerId The id of reviewer.
     * @param reviewScorecard The review scorecard to be set.
     */
    protected ReviewData(OnlineReviewProjectData orpd,
                         long submitterId, long reviewerId,
                         ReviewScorecard reviewScorecard) {
        super(orpd);
        this.submitterId = submitterId;
        this.reviewerId = reviewerId;
        this.reviewScorecard = reviewScorecard;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the id of submitter.
     * </p>
     *
     * @return the id of submitter.
     */
    public long getSubmitterId() {
        return submitterId;
    }

    /**
     * <p>
     * Return the id of reviewer.
     * </p>
     *
     * @return the id of reviewer.
     */
    public long getReviewerId() {
        return reviewerId;
    }

    /**
     * <p>
     * Return the wrapped review scorecard.
     * </p>
     *
     * @return the wrapped review scorecard.
     */
    public ReviewScorecard getReviewScorecard() {
        return reviewScorecard;
    } // end getReviewScorecard

} // end ReviewData



