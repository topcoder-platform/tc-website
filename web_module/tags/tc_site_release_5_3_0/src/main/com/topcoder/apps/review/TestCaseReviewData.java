/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.TestCaseReview;

/**
 * Wrapping class for the test case review data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class TestCaseReviewData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The test case review.
     */
    private TestCaseReview[] testCaseReviews = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>TestCaseReviewData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param testCaseReviews The test case review to be set.
     */
    protected TestCaseReviewData(OnlineReviewProjectData orpd,
                                 TestCaseReview[] testCaseReviews) {
        super(orpd);
        this.testCaseReviews = testCaseReviews;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped test case review data.
     * </p>
     *
     * @return the wrapped test case review data.
     */
    public TestCaseReview[] getTestCaseReviews() {
        return testCaseReviews;
    } // end getTestCaseReview


} // end TestCaseReviewData



