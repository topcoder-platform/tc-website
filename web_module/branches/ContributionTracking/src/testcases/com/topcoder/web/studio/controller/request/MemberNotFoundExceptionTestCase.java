/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link MemberNotFoundException} class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberNotFoundExceptionTestCase extends TestCase {

    /**
     * <p>A <code>String</code> providing the sample handle to be used for testing.</p>
     */
    public static final String HANDLE = "TCSDEVELOPER";

    /**
     * <p>The instance of {@link MemberNotFoundException} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private MemberNotFoundException testedInstance = null;

    /**
     * <p>Constructs new <code>MemberNotFoundExceptionTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public MemberNotFoundExceptionTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new MemberNotFoundException(HANDLE);
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
     * <p>Accuracy test. Tests the {@link MemberNotFoundException#MemberNotFoundException(String)} constructor for
     * accurate behavior.</p>
     *
     * <p>Verifies that the handle is set to specified value. {@link MemberNotFoundException#getHandle()} method is
     * tested indirectly.</p>
     */
    public void testConstructor() {
        Assert.assertEquals("Wrong handle set by constructor", HANDLE, this.testedInstance.getHandle());
    }
}
