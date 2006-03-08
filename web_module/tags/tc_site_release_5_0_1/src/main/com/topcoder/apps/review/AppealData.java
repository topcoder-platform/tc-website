/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;


/**
 * Wrapping class for the appeal data.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AppealData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The wrapped Appeals.
     */
    private Appeal[] appeals = null;

    private long appealerId;
    private long questionId;
    // ------------------------------------------------------------ Constructor


    /**
     * <p>
     * Creates the instance of <code>AppealData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param appeals The appeals to be saved, null to retrieve appeals.
     */
    protected AppealData(OnlineReviewProjectData orpd, Appeal[] appeals, long appealerId, long questionId) {
        super(orpd);
        this.appeals = appeals;
        this.appealerId = appealerId;
        this.questionId = questionId;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped appeals.
     * </p>
     *
     * @return Appeal[] the array with appeals.
     */
    public Appeal[] getAppeals() {
        return appeals;
    } // end getAppeals

    /**
     * @return Returns the appealerId.
     */
    public long getAppealerId() {
        return appealerId;
    }

    /**
     * @return Returns the questionId.
     */
    public long getQuestionId() {
        return questionId;
    }


} // end AppealData



