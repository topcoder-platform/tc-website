/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScreeningScorecard;

/**
 * Wrapping class for the screening scorecard data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ScreeningData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The id of submitter.
     */
    private long submitterId = -1;

    /**
     * The screening scorecard.
     */
    private ScreeningScorecard screeningScorecard = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ScreeningData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param submitterId The id of submitter.
     * @param screeningScorecard The screening scorecard to be set.
     */
    protected ScreeningData(OnlineReviewProjectData orpd, long submitterId,
                            ScreeningScorecard screeningScorecard) {
        super(orpd);
        this.submitterId = submitterId;
        this.screeningScorecard = screeningScorecard;
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
     * Return the wrapped screening scorecard.
     * </p>
     *
     * @return the wrapped screening scorecard.
     */
    public ScreeningScorecard getScreeningScorecard() {
        return screeningScorecard;
    } // end getScreeningScorecard


} // end ScreeningData



