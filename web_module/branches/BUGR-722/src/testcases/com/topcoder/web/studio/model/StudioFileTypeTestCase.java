/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link StudioFileType} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.6)
 */
public class StudioFileTypeTestCase extends TestCase {

    /**
     * <p>The instance of {@link StudioFileType} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private StudioFileType testedInstance = null;

    /**
     * <p>Constructs new <code>StudioFileTypeTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public StudioFileTypeTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new StudioFileType();
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
     * <p>Accuracy test. Tests the {@link StudioFileType} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code>.</p>
     */
    public void testConstructor() {
        Assert.assertNull("The studio file type ID is not set to NULL", this.testedInstance.getId());
        Assert.assertNull("The studio file type description is not set to NULL", this.testedInstance.getDescription());
        Assert.assertNull("The studio file type extension is not set to NULL", this.testedInstance.getExtension());
        Assert.assertNull("The studio file type bundled flag is not set to NULL", this.testedInstance.getBundledFile());
        Assert.assertNull("The studio file type image flag is not set to NULL", this.testedInstance.getImageFile());
        Assert.assertNotNull("The studio file type mime types is not set to empty set",
                             this.testedInstance.getMimeTypes());
        Assert.assertNull("The studio file type sort is not set to NULL", this.testedInstance.getSort());
    }

    /**
     * <p>Accuracy test. Tests the {@link StudioFileType#setBundledFile(Boolean)},
     * {@link StudioFileType#getBundledFile()} and {@link StudioFileType#isBundledFile()} methods for accurate behavior.
     * </p>
     *
     * <p>Passses the valid values to {@link StudioFileType#setBundledFile(Boolean)} method and reads them back
     * through {@link StudioFileType#getBundledFile()} and {@link StudioFileType#isBundledFile()}methods and verifies
     * that the read value is matching the set value.</p>
     */
    public void testSetGetBundledFile() {
        Boolean[] validValues = new Boolean[] {null, Boolean.TRUE, Boolean.FALSE};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setBundledFile(validValues[i]);
            Assert.assertEquals("The [bundledFile] property is not set and read correctly",
                                validValues[i], this.testedInstance.getBundledFile());
            Assert.assertEquals("The [bundledFile] property is not set and read correctly",
                                validValues[i], this.testedInstance.isBundledFile());
        }
    }
}
