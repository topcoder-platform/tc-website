/**
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.TestCase;

/**
 * Retrieval class used by the Model classes to return an array of testcases.
 *
 * @author FatClimber
 * @version 1.0
 */
public class TestCasesRetrieval extends SuccessResult {

    /**
     * The array of testcases.
     */
    private TestCase[] testcases = null;

    /**
     * Constructor.
     *
     * @param testcases the array of testcases
     */
    TestCasesRetrieval(TestCase[] testcases) {
        this.testcases = testcases;
    }

    /**
     * Get the contained array of testcases.
     *
     * @return the contained array of testcases
     */
    public TestCase[] getTestCases() {
        return testcases;
    }

}

