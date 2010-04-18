/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

/**
 * Wrapping class to retrieve the review scorecard for a project.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ReviewScorecardsData extends OnlineReviewProjectData {

    private boolean retrieveQuestions = false;
    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ReviewScorecardsData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     */
    protected ReviewScorecardsData(OnlineReviewProjectData orpd) {
        super(orpd);
        this.retrieveQuestions = false;
    }

    /**
     * @return Returns the retrieveQuestions.
     */
    public boolean getRetrieveQuestions() {
        return retrieveQuestions;
    }

    /**
     * @param retrieveQuestions The retrieveQuestions to set.
     */
    public void setRetrieveQuestions(boolean retrieveQuestions) {
        this.retrieveQuestions = retrieveQuestions;
    }

} // end ReviewScorecardsData



