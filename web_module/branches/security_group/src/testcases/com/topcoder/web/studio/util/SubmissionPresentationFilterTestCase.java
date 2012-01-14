/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import junit.framework.TestCase;
import junit.framework.Assert;

import java.io.File;

/**
 * <p>A unit test for {@link SubmissionPresentationFilter} class.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.11)
 */
public class SubmissionPresentationFilterTestCase extends TestCase {

    /**
     * <p>The instance of {@link SubmissionPresentationFilter} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private SubmissionPresentationFilter testedInstance = null;

    /**
     * <p>The instance of {@link SubmissionPresentationFilter} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private SubmissionPresentationFilter testedInstance2 = null;

    /**
     * <p>Constructs new <code>SubmissionPresentationFilterTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionPresentationFilterTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new SubmissionPresentationFilter("tiny", 12L);
        this.testedInstance2 = new SubmissionPresentationFilter("12_tiny");
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
     * <p>Accuracy test. Tests the {@link SubmissionPresentationFilter#accept(File, String)} method for accurate
     * behavior.</p>
     *
     * <p>Passes the filenames which match the filer and expects the filter to return <code>true</code>.</p>
     */
    public void testAccept_Matches() {
        File dir = new File(".");
        String[] names = {"12_tiny.jpg", "12_tiny.zip", "12_tiny.rar", "12_tiny.mp3", "12_tiny."};
        for (int i = 0; i < names.length; i++) {
            String name = names[i];
            Assert.assertTrue("The valid file name is not accepted", this.testedInstance.accept(dir, name));
            Assert.assertTrue("The valid file name is not accepted", this.testedInstance2.accept(dir, name));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionPresentationFilter#accept(File, String)} method for accurate
     * behavior.</p>
     *
     * <p>Passes the filenames which do not match the filer and expects the filter to return <code>false</code>.</p>
     */
    public void testAccept_NoMatches() {
        File dir = new File(".");
        String[] names = {"12_small.jpg", "121_tiny.zip", "12_ttiny.rar", "1 2_tiny.mp3", "12_full.zip", "12_medium.z",
                          "21_tiny,jpg", "2_tiny.jpg"};
        for (int i = 0; i < names.length; i++) {
            String name = names[i];
            Assert.assertFalse("The invalid file name is accepted", this.testedInstance.accept(dir, name));
            Assert.assertFalse("The invalid file name is accepted", this.testedInstance2.accept(dir, name));
        }
    }
}
