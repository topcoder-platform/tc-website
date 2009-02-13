/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link ContestChannel} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.2)
 */
public class ContestChannelTestCase extends TestCase {

    /**
     * <p>The instance of {@link ContestChannel} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ContestChannel testedInstance = null;

    /**
     * <p>Constructs new <code>ContestChannelTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestChannelTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new ContestChannel();
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
     * <p>Accuracy test. Tests the {@link ContestChannel#ContestChannel()} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code>.</p>
     */
    public void testConstructor() {
        Assert.assertNull("The contest channel ID is not set to NULL", this.testedInstance.getId());
        Assert.assertNull("The contest channel description is not set to NULL", this.testedInstance.getDescription());
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannel#setId(Integer)} and {@link ContestChannel#getId()} methods for
     * accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestChannel#setId(Integer)} method and reads them back through
     * {@link ContestChannel#getId()} methods and verifies that the read value is matching the set value.</p>
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
     * <p>Accuracy test. Tests the {@link ContestChannel#setDescription(String)} and
     * {@link ContestChannel#getDescription()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestChannel#setDescription(String)} method and reads them back through
     * {@link ContestChannel#getDescription()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDescription() {
        String[] validValues = new String[] {null, "", "Description", "Contest Channel #1"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDescription(validValues[i]);
            Assert.assertEquals("The [description] property is not set and read correctly",
                                validValues[i], this.testedInstance.getDescription());
        }
    }
}
