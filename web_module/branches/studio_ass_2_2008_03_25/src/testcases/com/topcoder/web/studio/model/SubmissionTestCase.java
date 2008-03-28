/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link Submission} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.3)
 */
public class SubmissionTestCase extends TestCase {

    /**
     * <p>The instance of {@link Submission} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private Submission testedInstance = null;

    /**
     * <p>Constructs new <code>SubmissionTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new Submission();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    public void tearDown() throws Exception {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link Submission#setHasPreviewImage(Boolean)} and
     * {@link Submission#getHasPreviewImage()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Submission#setHasPreviewImage(Boolean)} method and reads them back through
     * {@link Submission#getHasPreviewImage()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetHasPreviewImage() {
        Boolean[] validValues = new Boolean[] {false, true, null};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setHasPreviewImage(validValues[i]);
            Assert.assertEquals("The [hasPreviewImage] property is not set and read correctly",
                                validValues[i], this.testedInstance.getHasPreviewImage());
        }
    }
}
