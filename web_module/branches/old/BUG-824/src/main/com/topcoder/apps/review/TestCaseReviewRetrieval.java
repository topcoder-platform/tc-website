/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.TestCaseReview;

/**
 * Retrieval class used by the Model classes to return a test case review.
 *
 * @author adic
 * @version 1.0
 */
public class TestCaseReviewRetrieval extends SuccessResult {

    /**
     * The test case review.
     */
    private TestCaseReview[] testCaseReviews = null;

    /**
     * Constructor.
     *
     * @param testCaseReviews the test case review
     */
    TestCaseReviewRetrieval(TestCaseReview[] testCaseReviews) {
        this.testCaseReviews = testCaseReviews;
    }

    /**
     * Get the contained test case review.
     *
     * @return the contained test case review
     */
    public TestCaseReview[] getTestCaseReviews() {
        return testCaseReviews;
    }

}

