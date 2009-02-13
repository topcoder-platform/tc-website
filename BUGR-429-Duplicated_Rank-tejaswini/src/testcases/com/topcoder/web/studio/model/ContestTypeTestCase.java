/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link ContestType} class.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.1)
 */
public class ContestTypeTestCase extends TestCase {

    /**
     * <p>The instance of {@link ContestType} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private ContestType testedInstance = null;

    /**
     * <p>Constructs new <code>ContestTypeTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestTypeTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new ContestType();
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
     * <p>Accuracy test. Tests the {@link ContestType#ContestType()} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code>.</p>
     */
    public void testConstructor() {
        Assert.assertNull("The contest type ID is not set to NULL", this.testedInstance.getId());
        Assert.assertNull("The contest type description is not set to NULL", this.testedInstance.getDescription());
        Assert.assertNull("The contest type image preview flag is not set to NULL",
                          this.testedInstance.getPreviewImageRequired());
        Assert.assertNull("The contest type file preview flag is not set to NULL",
                          this.testedInstance.getPreviewFileRequired());
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestType#setId(Integer)} and {@link ContestType#getId()} methods for
     * accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link ContestType#setId(Integer)} method and reads them back through
     * {@link ContestType#getId()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetId() {
        Integer[] validValues = new Integer[] {null, 1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setId(validValues[i]);
            Assert.assertEquals("The [id] property is not set and read correctly",
                                validValues[i], this.testedInstance.getId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestType#setDescription(String)} and {@link ContestType#getDescription()}
     * methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link ContestType#setDescription(String)} method and reads them back through
     * {@link ContestType#getDescription()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDescription() {
        String[] validValues = new String[] {null, "", "Description", "Contest Type #1"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDescription(validValues[i]);
            Assert.assertEquals("The [description] property is not set and read correctly",
                                validValues[i], this.testedInstance.getDescription());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestType#setPreviewImageRequired(Boolean)} and
     * {@link ContestType#getPreviewImageRequired()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link ContestType#setPreviewImageRequired(Boolean)} method and reads them back
     * through {@link ContestType#getPreviewImageRequired()} methods and verifies that the read value is matching the
     * set value.</p>
     */
    public void testSetGetImagePreviewRequired() {
        Boolean[] validValues = new Boolean[] {null, Boolean.TRUE, Boolean.FALSE};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setPreviewImageRequired(validValues[i]);
            Assert.assertEquals("The [imagePreviewRequired] property is not set and read correctly",
                                validValues[i], this.testedInstance.getPreviewImageRequired());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestType#setPreviewFileRequired(Boolean)} and
     * {@link ContestType#getPreviewFileRequired()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link ContestType# setPreviewFileRequired(Boolean)} method and reads them back
     * through {@link ContestType#getPreviewFileRequired()} methods and verifies that the read value is matching the
     * set value.</p>
     */
    public void testSetGetFilePreviewRequired() {
        Boolean[] validValues = new Boolean[] {null, Boolean.TRUE, Boolean.FALSE};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setPreviewFileRequired(validValues[i]);
            Assert.assertEquals("The [filePreviewRequired] property is not set and read correctly",
                                validValues[i], this.testedInstance.getPreviewFileRequired());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestType#setIncludeGallery(Boolean)} and
     * {@link ContestType#getIncludeGallery()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link ContestType#setIncludeGallery(Boolean)}(Boolean)} method and reads them
     * back through {@link ContestType#getIncludeGallery()} methods and verifies that the read value is matching the
     * set value.</p>
     * @since Studio Submission Slideshow
     */
    public void testSetGetIncludeGallery() {
        Boolean[] validValues = new Boolean[] {null, Boolean.TRUE, Boolean.FALSE};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setIncludeGallery(validValues[i]);
            Assert.assertEquals("The [includeGallery] property is not set and read correctly",
                                validValues[i], this.testedInstance.getIncludeGallery());
        }
    }
}
