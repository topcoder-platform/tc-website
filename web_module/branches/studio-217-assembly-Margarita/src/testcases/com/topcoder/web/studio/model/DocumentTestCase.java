/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link Document} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
 */
public class DocumentTestCase extends TestCase {

    /**
     * <p>The instance of {@link Document} which is tested. This instance is initialized in {@link #setUp()} method and
     * released in {@link #tearDown()} method.</p>
     */
    private Document testedInstance = null;

    /**
     * <p>Constructs new <code>DocumentTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public DocumentTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new Document();
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
     * <p>Accuracy test. Tests the {@link Document#setDescription(String)} and {@link Document#getDescription()} methods
     * for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Document#setDescription(String)} method and reads them back through
     * {@link Document#getDescription()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDirectProjectId() {
        String[] validValues = new String[] {null, "", "       ", "Desci", "    qerqrfqwreqwerqwerqwrqwrqw"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDescription(validValues[i]);
            Assert.assertEquals("The [description] property is not set and read correctly",
                                validValues[i], this.testedInstance.getDescription());
        }
    }
}
