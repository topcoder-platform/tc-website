/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import junit.framework.Assert;
import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link DirectProject}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class DirectProjectTest {

    /**
     * <p>
     * Commonly use instance for unit test.
     * </p>
     */
    private DirectProject instance;

    /**
     * <p>
     * Sample data for project name.
     * </p>
     */
    private static final String NAME = "name";

    /**
     * <p>
     * Set up for unit test.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new DirectProject();
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.DirectProject#DirectProject()}.
     */
    @Test
    public void testDirectProject() {
        DirectProject directProject = new DirectProject();
        Assert.assertNotNull(directProject);
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.DirectProject#getName()}.
     */
    @Test
    public void testGetName() {
        TestHelper.setProperty(instance, "name", NAME);
        Assert.assertEquals(NAME, instance.getName());
    }

    /**
     * Test method for
     * {@link com.topcoder.security.groups.model.DirectProject#setName(java.lang.String)}
     * .
     */
    @Test
    public void testSetName() {
        instance.setName(NAME);
        Assert.assertEquals(NAME,
                TestHelper.getProperty(instance, "name", String.class));
    }

}
