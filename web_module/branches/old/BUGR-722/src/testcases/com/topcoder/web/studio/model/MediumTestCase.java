/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link Medium} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
 */
public class MediumTestCase extends TestCase {

    /**
     * <p>The instance of {@link Medium} which is tested. This instance is initialized in {@link #setUp()} method and
     * released in {@link #tearDown()} method.</p>
     */
    private Medium testedInstance = null;

    /**
     * <p>Constructs new <code>MediumTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public MediumTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new Medium();
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
     * <p>Accuracy test. Tests the {@link Medium#Medium()} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code>.</p>
     */
    public void testConstructor() {
        Assert.assertNull("The contest type ID is not set to NULL", this.testedInstance.getId());
        Assert.assertNull("The contest type description is not set to NULL", this.testedInstance.getDescription());
    }

    /**
     * <p>Accuracy test. Tests the {@link Medium#setId(Integer)} and {@link Medium#getId()} methods for accurate
     * behavior.</p>
     *
     * <p>Passses the valid values to {@link Medium#setId(Integer)} method and reads them back through
     * {@link Medium#getId()} methods and verifies that the read value is matching the set value.</p>
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
     * <p>Accuracy test. Tests the {@link Medium#setDescription(String)} and {@link Medium#getDescription()} methods for
     * accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Medium#setDescription(String)} method and reads them back through
     * {@link Medium#getDescription()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDescription() {
        String[] validValues = new String[] {null, "", "Description", "Contest Type #1"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDescription(validValues[i]);
            Assert.assertEquals("The [description] property is not set and read correctly",
                                validValues[i], this.testedInstance.getDescription());
        }
    }
}
